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
            Map<Integer, Long> listServiceMap = new HashMap<>();
            Map<Integer, Long> listdichvuMap = new HashMap<>();
            long tongtatcachiluong=0,tongtatcachidichvu=0,tongtatcachiservice=0;
            for (int i = 0; i < listRegion.size(); i++) {
                listTongBooking.put(listRegion.get(i).getRegion_id(), Long.parseLong("0"));
                listServiceMap.put(listRegion.get(i).getRegion_id(), Long.parseLong("0"));
                listdichvuMap.put(listRegion.get(i).getRegion_id(), Long.parseLong("0"));
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
                                ArrayList<ProductTO> listProduct = product.retrieveBookingProductThongke(listBookingAll.get(i).getBooking_id());
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
                    // tính tổng tiền thiết bị hư hại theo từng khu vực
                    if (listServiceMap.containsKey(listBookingAll.get(i).getRegion_id())) {
                        long tongtheoregion = listServiceMap.get(listBookingAll.get(i).getRegion_id()).longValue();
                        tongtheoregion += tongtienservice;
                        tongtatcachiservice+=tongtienservice;
                        listServiceMap.put(listBookingAll.get(i).getRegion_id(), tongtheoregion);
                    }


                    // tính tổng tiền dịch vu sài theo từng khu vực
//                    if (listdichvuMap.containsKey(listBookingAll.get(i).getRegion_id())) {
//                        long tongtheoregion = listdichvuMap.get(listBookingAll.get(i).getRegion_id()).longValue();
//                        tongtheoregion += tongtiendichvu;
//                        listdichvuMap.put(listBookingAll.get(i).getRegion_id(), tongtheoregion);
//                    }
                    //tính tổng tiền tất cả booking
                    tongThuTatCaRegion += tongtienphong + tongtiendichvu + tongtienservice;

                }
                request.setAttribute("tongtatcachiservice",String.valueOf(tongtatcachiservice));

                //tính các khoản chi về lương nhân viên trong tất cả các khu vực
                EmployeeDA employeeDA = new EmployeeDA();
                ArrayList<EmployeeTO> listEmployee = employeeDA.retrieveALLEmployee();
                ArrayList<EmployeeTO> listEmployeeNew = new ArrayList<EmployeeTO>();
                ArrayList<Integer> listNumofMonth = new ArrayList<Integer>();
                ArrayList<Long> listTongLuong = new ArrayList<>();

                long tongtienluong = 0;
                Date date = new Date();
                DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                long currentdate = date.getTime();
                int currentyear = date.getYear();
                int currentmonth = date.getMonth();
                if (listEmployee != null) {
                    for (int i = 0; i < listEmployee.size(); i++) {
                        if (listEmployee.get(i).equals(StaticTO.ADMINID)) {
                            continue;
                        }
                        EmployeeTO employeeTO = listEmployee.get(i);
                        // Danh sách tổng lương cho nhân viên
                        int tongsothang = 0;
                        if (employeeTO.getStatus().equals(StaticTO.ACTIVE_STATUS)) {
                            String dateStr = employeeTO.getStart_date();
                            Date start_date;
                            try {
                                start_date = dateFormat.parse(dateStr);
                            } catch (ParseException e) {
                                start_date = null;
                            }

                            if (start_date != null) {
                                int yearstart = start_date.getYear();
                                int monthstart = start_date.getMonth();
                                if (yearstart == currentyear) {
                                    tongsothang = currentmonth - monthstart;
                                } else {
                                    tongsothang = ((currentyear - yearstart) - 1) * 12 + (12 - monthstart) + currentmonth;
                                }

                            }
                        } else {
                            // thực hiện cho nhân viên nghỉ làm
                            String remarks = employeeTO.getRemark();
                            String dateStr = "";
                            String[] remarksSplit = remarks.split(";");
                            if (remarksSplit.length > 0) {
                                for (int j = 0; j < remarksSplit.length; j++) {
                                    if (remarksSplit[j].indexOf("END_DATE") > -1) {
                                        String[] splitEndDate = remarksSplit[j].split("/");
                                        if (splitEndDate.length > 0) {
                                            dateStr = splitEndDate[1];
                                            Date start_date = null;
                                            try {
                                                start_date = dateFormat.parse(dateStr);
                                            } catch (ParseException e) {
                                                start_date = null;
                                            }

                                            if (start_date != null) {
                                                int yearend = start_date.getYear();
                                                int monthend = start_date.getMonth();
                                                String startdateStr = employeeTO.getStart_date();
                                                Date dateStart = null;
                                                try {
                                                    dateStart = dateFormat.parse(startdateStr);
                                                } catch (ParseException e) {
                                                    dateStart = null;
                                                }
                                                int yearstart = dateStart.getYear();
                                                int monthstart = dateStart.getMonth();
                                                if (yearend == yearstart) {
                                                    tongsothang = monthend - monthstart;
                                                } else {
                                                    int tinhyear = ((yearend - yearstart) - 1) * 12;

                                                    tongsothang = tinhyear + (12 - monthstart) + monthend;
                                                }

                                            }

                                        }
                                    }

                                }
                            }

                        }
                        listNumofMonth.add(tongsothang);
                        listTongLuong.add(tongsothang * listEmployee.get(i).getSalary());
                        tongtienluong += tongsothang * listEmployee.get(i).getSalary();
                        listEmployeeNew.add(listEmployee.get(i));

                    }
                }

                ArrayList<RegionTO> listRegionOrigin = regionDA.retrieveAllRegion();
                // tong doanh chi
                WarsehouseDA warsehouseDA = new WarsehouseDA();
                if (listRegionOrigin != null) {

                    for (int i = 0; i < listRegionOrigin.size(); i++) {
                        ArrayList<Map<Integer, Long>> list=null;
                        if(quyInt>0&&yearInt==0){
                            int start_month=0;
                            int end_month=0;
                            switch (quyInt){
                                case 1:
                                    start_month=1;
                                    end_month=3;
                                    break;
                                case 2:
                                    start_month=4;
                                            end_month=6;
                                            break;
                                case 3:
                                    start_month=7;
                                    end_month=9;
                                case 4:
                                    start_month=10;
                                    end_month=12;
                            }
                            list = warsehouseDA.retrieveAllWarsehouse(start_month,end_month,StaticTO.IMPORT_WARSEHOUSE,listRegionOrigin.get(i).getRegion_id());
                        }else if(quyInt==0&&yearInt>0){
                            list = warsehouseDA.retrieveAllWarsehouse(yearInt,StaticTO.IMPORT_WARSEHOUSE,listRegionOrigin.get(i).getRegion_id());
                        }else if(quyInt>0&&yearInt>0){
                            int start_month=0;
                            int end_month=0;
                            switch (quyInt){
                                case 1:
                                    start_month=1;
                                    end_month=3;
                                    break;
                                case 2:
                                    start_month=4;
                                    end_month=6;
                                    break;
                                case 3:
                                    start_month=7;
                                    end_month=9;
                                case 4:
                                    start_month=10;
                                    end_month=12;
                            }
                            list = warsehouseDA.retrieveAllWarsehouseYear(yearInt,start_month,end_month,StaticTO.IMPORT_WARSEHOUSE,listRegionOrigin.get(i).getRegion_id());
                        }else {
                            list = warsehouseDA.retrieveAllWarsehouse(StaticTO.IMPORT_WARSEHOUSE, listRegionOrigin.get(i).getRegion_id());
                        }
                        if (list != null) {
                            for (int j = 0; j < list.size(); j++) {
                                Map<Integer, Long> mapdichvu = list.get(j);
                                long tiendichvu=0;
                                for (Map.Entry<Integer,Long> entry : mapdichvu.entrySet()) {
                                    tiendichvu+=entry.getValue();

                                }
                                if (listdichvuMap.containsKey(listBookingAll.get(i).getRegion_id())) {
                                    long tongtheoregion = listdichvuMap.get(listBookingAll.get(i).getRegion_id()).longValue();
                                    tongtheoregion += tiendichvu;
                                    tongtatcachidichvu+=tiendichvu;
                                    listdichvuMap.put(listBookingAll.get(i).getRegion_id(), tongtheoregion);
                                }
                            }
                        }
                    }

                }

                // request cho doanh muc chi
                request.setAttribute("tongtatcachidichvu",String.valueOf(tongtatcachidichvu));
                request.setAttribute("listRegionOrigin", listRegionOrigin);
                request.setAttribute("listEmployeeNew", listEmployeeNew);
                request.setAttribute("tongtienluong", String.valueOf(tongtienluong));
                request.setAttribute("listTongLuong", listTongLuong);
                request.setAttribute("listNumofMonth", listNumofMonth);
                request.setAttribute("listServiceMap", listServiceMap);
                request.setAttribute("listdichvuMap", listdichvuMap);


                // request cho doanh muc thu
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
