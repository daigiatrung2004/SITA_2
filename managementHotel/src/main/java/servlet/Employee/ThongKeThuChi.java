package servlet.Employee;

import DAO.*;
import DTO.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

public class ThongKeThuChi extends WebServletEmployee {

    @Override
    protected void process(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        try {
            String quy = request.getParameter("quy") != null ? (String) request.getParameter("quy") : "0";
            String year = request.getParameter("year") != null ? (String) request.getParameter("year") : "0";
            int quyInt, yearInt;
            try {
                quyInt = Integer.parseInt(quy);
            } catch (NumberFormatException e) {
                quyInt = 0;
            }
            try {
                yearInt = Integer.parseInt(year);
            } catch (NumberFormatException e) {
                yearInt = 0;
            }
            BookingDA bookingDA = new BookingDA();
            ArrayList<BookingTO> listBookingAll = new ArrayList<>();


            if (yearInt > 0 && quyInt == 0) {
                listBookingAll = bookingDA.retrieveAllBookingByYear(yearInt);
            } else if (yearInt == 0 && quyInt > 0) {
                int monthstart = 3 * (quyInt - 1);
                int monthend = 3 * (quyInt);
                listBookingAll = bookingDA.retrieveAllBookingByMonth(monthstart, monthend);
            } else if (yearInt > 0 && quyInt > 0) {
                int monthstart = 3 * (quyInt - 1);
                int monthend = 3 * (quyInt);
                String startDate = yearInt + "-" + "-" + monthstart + "-01 00:00:00";
                String endDate = yearInt + "-" + monthend + "-31 23:59:00";
                listBookingAll = bookingDA.retrieveAllBookingByTime(startDate, endDate);
            } else {
                listBookingAll = bookingDA.retrieveAllBooking();
            }
            RegionDA regionDA = new RegionDA();
            Product product = new Product();
            RoomOfALLDA roomOfALLDA = new RoomOfALLDA();
            ArrayList<RoomTO> listRoomTO = new ArrayList<>();
            ArrayList<RegionTO> listRegionTO = new ArrayList<>();
            // tính booking theo từng khu vực
            ArrayList<RegionTO> listRegion = regionDA.retrieveAllRegion();
            request.setAttribute("listRegion", listRegion);
            Map<Integer, Long> listTongBooking = new HashMap<Integer, Long>();
            for (int i = 0; i < listRegion.size(); i++) {
                listTongBooking.put(listRegion.get(i).getRegion_id(), Long.parseLong("0"));
            }
            // tính toán tổng số booking  trên toàn bộ sản phẩm (Tính giá trị thu) tất tả các khu vực
            long tongThuTatCaRegion = 0;
            if (listBookingAll != null) {
                for (int i = 0; i < listBookingAll.size(); i++) {
                    RoomTO roomTO = roomOfALLDA.searchRoomById(listBookingAll.get(i).getRoom_id());
                    RegionTO regionTO1 = regionDA.retrieveAllRegion(listBookingAll.get(i).getRegion_id());
                    listRoomTO.add(roomTO);
                    listRegionTO.add(regionTO1);
                    long tongtienphong = 0, tongtienservice = 0, tongtiendichvu = 0;
                    DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                    Date checkoutDate = null;
                    Date checkinDate = null;
                    try {
                        checkoutDate = dateFormat.parse(listBookingAll.get(i).getCheck_out_date());
                        checkinDate = dateFormat.parse(listBookingAll.get(i).getCheck_in_date());
                    } catch (ParseException e) {
                        checkoutDate = null;
                        checkinDate = null;
                    }
                    if (roomTO != null) {
                        PriceRoomTO priceRoomTO = roomOfALLDA.retrievePriceById(roomTO.getPrice_id());
                        //
                        if (checkinDate != null) {
                            long time = (checkoutDate.getTime() - checkinDate.getTime()) / StaticTO.ONE_DAY;
                            String timeStr = String.valueOf(time);
                            int tongngay = 1;
                            try {
                                tongngay = Integer.parseInt(timeStr);
                            } catch (NumberFormatException e) {
                                tongngay = 1;
                            }
                            if (tongngay > 0) {
                                tongtienphong = tongngay * priceRoomTO.getPrice_1_night();
                                ArrayList<ProductTO> listProduct = product.retrieveBookingProduct(listBookingAll.get(i).getBooking_id());
                                if (listProduct != null) {
                                    for (int j = 0; j < listProduct.size(); j++) {
                                        if (listProduct.get(j).getID() == StaticTO.PRODUCT_ID_MEAL) {
                                            tongtiendichvu += listProduct.get(j).getPay();

                                        } else {
                                            tongtienservice += listProduct.get(j).getPay();
                                        }
                                    }

                                }
                            }

                        }

                    }
                    // add vào từng booking
                    listBookingAll.get(i).setTienphong(tongtienphong);
                    listBookingAll.get(i).setTongtiendichvu(tongtiendichvu);
                    listBookingAll.get(i).setTongtienservice(tongtienservice);
                    if (listTongBooking.containsKey(listBookingAll.get(i).getRegion_id())) {
                        long tongtheoregion = listTongBooking.get(listBookingAll.get(i).getRegion_id()).longValue();
                        tongtheoregion += tongtienphong + tongtiendichvu + tongtienservice;
                        listTongBooking.put(listBookingAll.get(i).getRegion_id(), tongtheoregion);
                    }
                    //tính tổng tiền tất cả booking
                    tongThuTatCaRegion += tongtienphong + tongtiendichvu + tongtienservice;

                }
                request.setAttribute("listTongBooking", listTongBooking);
                request.setAttribute("tongThuTatCaRegion", String.valueOf(tongThuTatCaRegion));
                request.setAttribute("listRegionTO", listRegionTO);
                request.setAttribute("listRoomTO", listRoomTO);
                request.setAttribute("listBookingAll", listBookingAll);
            }

            forward("/EMPLOYEE/thongkethuchi.jsp", request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
