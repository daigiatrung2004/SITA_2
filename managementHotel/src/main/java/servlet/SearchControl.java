package servlet;

import DAO.BookingDA;
import DAO.RegionDA;
import DAO.SearchDA;
import DAO.UploadResourceDA;
import DTO.RegionTO;
import DTO.SearchTO;
import DTO.StaticTO;
import DTO.UploadResourceTO;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

public class SearchControl extends WebServlet {

    @Override
    protected void process(HttpServletRequest request, HttpServletResponse response) {

        try {
            // lấy dữ liệu từ get,post của search
            String location = request.getParameter("location") != null ? (String) request.getParameter("location") : "";
            String checkIn = request.getParameter("checkIn") != null ? (String) request.getParameter("checkIn") : "";
            String checkOut = request.getParameter("checkOut") != null ? (String) request.getParameter("checkOut") : "";
            String numOfPeo = request.getParameter("numOfPeo") != null ? (String) request.getParameter("numOfPeo") : "0";
            String promote = request.getParameter("promote") != null ? (String) request.getParameter("promote") : "";
            String type = request.getParameter("type") != null ? (String) request.getParameter("type") : "";
            RegionDA regionDA = new RegionDA();
            SearchDA searchDA = new SearchDA();
            int locationInt, numOfPeoInt;
            try {
                locationInt = Integer.parseInt(location);
            } catch (NumberFormatException e) {
                locationInt = 0;
            }
            try {
                numOfPeoInt = Integer.parseInt(numOfPeo);
            } catch (NumberFormatException e) {
                numOfPeoInt = 0;
            }
            String customCheckIn = "";
            if (!checkIn.equals("")) {
                String[] splitCheckIn = checkIn.split("/");
                if (splitCheckIn.length > 0) {
                    customCheckIn = splitCheckIn[2] + "-" + splitCheckIn[1] + "-" + splitCheckIn[0] + " 00:00:00";
                }

            }
            // chekc xem có chọn ngày khả dụng hay kh
            if (!type.equals("")) {
                ArrayList<RegionTO> listRegion = regionDA.retrieveAllRegion();
                ArrayList<Integer> listCheckRoom = new ArrayList<Integer>();
                int locationInList=0;
                for (int i = 0; i < listRegion.size(); i++) {

                    try {
                        locationInList = listRegion.get(i).getRegion_id();
                    } catch (Exception e) {
                        locationInList = 0;
                    }

                    ArrayList<SearchTO> listSearchTO = searchDA.searchBooking(locationInList, numOfPeoInt, customCheckIn);
                    if (listSearchTO != null && listSearchTO.size() > 0) {
                        listCheckRoom.add(1);
                    } else {
                        listCheckRoom.add(0);
                    }

                }
                request.setAttribute("listRegion", listRegion);
                request.setAttribute("listCheckRoom", listCheckRoom);
                forward("select-region-other.jsp", request, response);
            } else {
                // check có chọn tất cả hay k
                if (location.equals("0")) {
                    ArrayList<RegionTO> listRegion = regionDA.retrieveAllRegion();
                    ArrayList<Integer> listCheckRoom = new ArrayList<Integer>();
                    for (int i = 0; i < listRegion.size(); i++) {
                        try {
                            locationInt = listRegion.get(i).getRegion_id();
                        } catch (Exception e) {
                            locationInt = 0;
                        }

                        ArrayList<SearchTO> listSearchTO = searchDA.searchBooking(locationInt, numOfPeoInt, customCheckIn);
                        if (listSearchTO != null && listSearchTO.size() > 0) {
                            listCheckRoom.add(1);
                        } else {
                            listCheckRoom.add(0);
                        }

                    }
                    request.setAttribute("listRegion", listRegion);
                    request.setAttribute("listCheckRoom", listCheckRoom);
                    forward("listSearchAll.jsp", request, response);
                    // LIST DANH TẤT CẢ CÁC KHU VỰC
                } else {
                    // tìm kiếm dữ liệu cho việc search ở trang index customer

                    ArrayList<SearchTO> listSearchTO = searchDA.searchBooking(locationInt, numOfPeoInt, customCheckIn);

                    // lọc tìm kiếm và thêm dữ liệu ảnh(upload resource)  tránh đụng độ check in
                    ArrayList<SearchTO> listSearchNew = new ArrayList<SearchTO>();
                    UploadResourceDA uploadResourceDA = new UploadResourceDA();
                    BookingDA bookingDA = new BookingDA();
                    if (listSearchTO != null && listSearchTO.size() > 0) {
                        for (SearchTO searchTO : listSearchTO) {
//                    if (!bookingDA.checkBooking(searchTO.getKindRoomTO().getKindroom_id(), searchTO.getRegionTO().getRegion_id(), checkOut)) {
                            UploadResourceTO uploadResourceTO = uploadResourceDA.retrieveImgGalery(String.valueOf(StaticTO.DB_KIND_ROOM_NAME + "_" + searchTO.getKindRoomTO().getKindroom_id()));
                            if (uploadResourceTO != null) {
                                SearchTO searchTO1 = new SearchTO(uploadResourceTO, searchTO.getKindRoomTO(), searchTO.getRegionTO());
                                listSearchNew.add(searchTO1);
//                        }
                            }
                        }
                        request.setAttribute("numOfPeo", numOfPeo);
                        request.setAttribute("listSearchNew", listSearchNew);
                        forward("/PaymentLoadView", request, response);
                    } else {
                        forward("notProduct.jsp", request, response);
                    }
                }
            }
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }
}
