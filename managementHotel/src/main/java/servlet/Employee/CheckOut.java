package servlet.Employee;

import DAO.*;
import DTO.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

public class CheckOut extends WebServletEmployee {

    @Override
    protected void process(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        try {
            HttpSession session=request.getSession();
            EmployeeTO employeeTO=(EmployeeTO)session.getAttribute("mem_sid") ;
            if(employeeTO!=null){
                RegionDA regionDA=new RegionDA();
                RegionTO regionTO=regionDA.retrieveAllRegion(employeeTO.getRegion_id());
                request.setAttribute("regionTO",regionTO);
            }
            String roomId = request.getParameter("roomId") != null ? (String) request.getParameter("roomId") : "0";
            String type = request.getParameter("type") != null ? (String) request.getParameter("type") : "";
            int roomIdInt;
            try {
                roomIdInt = Integer.parseInt(roomId);
            } catch (NumberFormatException e) {
                roomIdInt = 0;
            }
            RoomOfALLDA roomOfALLDA = new RoomOfALLDA();
            TransportDA transportDA = new TransportDA();
            ArrayList<TransportTO> listTax = transportDA.retreiveAllFeesOther();
            request.setAttribute("listTax", listTax);
            BookingDA bookingDA = new BookingDA();
            RoomTO roomTO = roomOfALLDA.searchRoomById(roomIdInt);
            request.setAttribute("roomTO", roomTO);
            if (roomTO != null) {
                PriceRoomTO priceRoomTO = roomOfALLDA.retrievePriceById(roomTO.getPrice_id());
                if (priceRoomTO != null) {
                    request.setAttribute("priceRoomTO", priceRoomTO);
                }

            }
            BookingTO bookingTO = bookingDA.retrieveBookingByRoomId(roomIdInt);
            // tính số ngày
            String checkIn=bookingTO.getCheck_in_date();
            String checkOut=bookingTO.getCheck_out_date();
            DateFormat dateformat=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            Date checkInDate,checkOutDate;
            try {
                checkInDate=dateformat.parse(checkIn);
                checkOutDate=dateformat.parse(checkOut);
            } catch (ParseException e) {
                checkInDate=null;
                checkOutDate=null;
            }
            int songay=1;
            if(checkInDate!=null&&checkOutDate!=null){
                long timeLong=checkOutDate.getTime()-checkInDate.getTime();
                timeLong=timeLong/(24*60*60*1000);
               String timeStr=String.valueOf(timeLong);
                songay=Integer.parseInt(timeStr);
//                    System.out.println("songay:"+songay);
                request.setAttribute("songay",String.valueOf(songay));
            }
            request.setAttribute("songay",String.valueOf(songay));
            request.setAttribute("bookingTO", bookingTO);
            // các sản phẩm  tồn tại trước đó
            if (bookingTO != null) {
                Product product = new Product();
                ArrayList<ProductTO> listProduct=new ArrayList<>();
                if(type.equals("")) {
                    listProduct= product.retrieveBookingProduct(bookingTO.getBooking_id());
                }else{
                    listProduct= product.retrieveBookingProductCheckOut(bookingTO.getBooking_id());
                }
                CustomerTO customer = bookingDA.retrieveCustomer(bookingTO.getCustomer_id());
                request.setAttribute("customer", customer);
                request.setAttribute("listProduct", listProduct);
            }
            boolean checkSucess = false;
            if (type.equals("")) {


                if (roomTO.getStatus().equals(StaticTO.ACTIVE_STATUS)) {
                    forward("/DetailsRoom?roomId=" + roomIdInt, request, response);
                } else {
                    forward("/EMPLOYEE/checkOut.jsp", request, response);
                }
            } else {
                String bookingId = request.getParameter("bookingId") != null ? (String) request.getParameter("bookingId") : "0";
                String customerId = request.getParameter("customerId") != null ? (String) request.getParameter("customerId") : "0";
                String tongtiensanpham = request.getParameter("tongtiensanpham") != null ? (String) request.getParameter("tongtiensanpham") : "0";
                String tong = request.getParameter("tong") != null ? (String) request.getParameter("tong") : "0";
                String tongtienthue = request.getParameter("tongtienthue") != null ? (String) request.getParameter("tongtienthue") : "0";
                long bookingIdLong, customerIdLong, tongtiensanphamLong, tongLong, tongthueLong;
                bookingIdLong = Long.parseLong(bookingId);
                customerIdLong = Long.parseLong(customerId);
                tongtiensanphamLong = Long.parseLong(tongtiensanpham);
                tongLong = Long.parseLong(tong);
                if (bookingTO != null) {
                    bookingTO.setStatus(StaticTO.REMOVE_STATUS);
                    bookingDA.updateBooking(bookingTO);
                    // update room
                    RoomTO roomTO1 = roomOfALLDA.searchRoomById(roomIdInt);
                    if (roomTO1 != null) {
                        roomTO1.setStatus("Active");
                        roomOfALLDA.updateRoom(roomTO1);
                    }
                    //insert vào invoice
                    String taxes = "";
                    if (listTax != null) {
                        for (int i = 0; i < listTax.size(); i++) {
                            if (listTax.size() - 1 == i) {

                            } else {
                                // other fees mà gồm chung với transport
                                taxes += listTax.get(i).getTransport_id() + ",";
                            }
                        }
                    }
                    InvoiceTO invoiceTO = new InvoiceTO(0, bookingIdLong, customerIdLong, roomIdInt, tongtiensanphamLong, tongLong, "listTax:" + taxes + ",tongthue:" + tongtienthue);
                    InvoiceDA invoiceDA = new InvoiceDA();
                    checkSucess = invoiceDA.addInvoice(invoiceTO);
                    request.setAttribute("checkOutSuccess", String.valueOf(checkSucess));
                }

                forward("/EMPLOYEE/checkOut.jsp", request, response);
            }
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
