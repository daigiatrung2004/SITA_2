package servlet.Ajax;

import DAO.BookingDA;
import DAO.Product;
import DAO.RoomOfALLDA;
import DTO.*;
import servlet.Employee.WebServletEmployee;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

public class AjaxCheckOut extends WebServletEmployee {


    @Override
    protected void process(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        try {
            String type = request.getParameter("type") != null ? (String) request.getParameter("type") : "";
            String roomId = request.getParameter("roomId") != null ? (String) request.getParameter("roomId") : "0";
            BookingDA bookingDA = new BookingDA();
            RoomOfALLDA roomOfALLDA=new RoomOfALLDA();
            Product product=new Product();
            int roomIdInt;
            try {
                roomIdInt = Integer.parseInt(roomId);
            } catch (NumberFormatException e) {
                roomIdInt = 0;
            }
            boolean checkSuccess = false;
            if (type.equals("")) {

                response.getWriter().print("{\"success\":false}");

            } else if (type.equals("cancelBooking")) {
                BookingTO bookingTO=bookingDA.retrieveBookingByRoomId(roomIdInt);
                if(bookingTO!=null) {

                    CustomerTO customerTO = bookingDA.retrieveCustomer(bookingTO.getCustomer_id());
                    bookingTO.setStatus(StaticTO.REMOVE_STATUS);
                    bookingDA.updateBooking(bookingTO);
                    if (customerTO!=null){
                        customerTO.setStatus(StaticTO.REMOVE_STATUS);
                        bookingDA.updateCustomer(customerTO);
                    }
                    RoomTO roomTO=roomOfALLDA.searchRoomById(roomIdInt);
                    if(roomTO!=null){
                        roomTO.setStatus(StaticTO.ACTIVE_STATUS);
                        checkSuccess=roomOfALLDA.updateRoom(roomTO);
                    }
                }
                response.getWriter().print("{\"success\":" + checkSuccess + "}");

            } else if (type.equals("checkout")) {
                response.getWriter().print("{\"success\":false}");
            } else if(type.equals("save")){
                String bookindId = request.getParameter("bookindId") != null ? (String) request.getParameter("bookindId") : "0";
                String listProduct = request.getParameter("listProduct") != null ? (String) request.getParameter("listProduct") : "";
                String listsoluong = request.getParameter("listsoluong") != null ? (String) request.getParameter("listsoluong") : "";
                String []splitProductId=listProduct.split(",");
                String []splitSoLuong=listsoluong.split(",");
                long bookingIdLong;
                try {
                    bookingIdLong=Long.parseLong(bookindId);
                } catch (NumberFormatException e) {
                    bookingIdLong=0;
                }


                if((splitProductId!=null&&splitProductId.length>0)&&(splitSoLuong!=null&&splitSoLuong.length>0)) {
                    ArrayList<BookingTO> listBooking=bookingDA.retrievekBookingProductByBookingId(bookingIdLong);
                    if(listBooking!=null&&listBooking.size()>0){
                        // co lưu rồi nhưng chưa chỉnh sửa
                        boolean check=bookingDA.deleteBookingProduct(bookingIdLong);
                        if(check){
                            checkSuccess=addBookingProduct(splitProductId,splitSoLuong,bookingIdLong);
                        }
                    }else {
                        // chưa có lưu trong database
                        checkSuccess=addBookingProduct(splitProductId,splitSoLuong,bookingIdLong);
                    }
                }
                response.getWriter().print("{\"success\": "+checkSuccess+" }");
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    public boolean addBookingProduct(String [] splitProductId,String []splitSoLuong,long bookingIdLong){
        BookingDA bookingDA = new BookingDA();
        Product product=new Product();
        for (int i = 0; i < splitProductId.length; i++) {
            int productIdInt, soluongInt;
            try {
                productIdInt = Integer.parseInt(splitProductId[i]);
            } catch (NumberFormatException e) {
                productIdInt = 0;
            }

            try {
                soluongInt = Integer.parseInt(splitSoLuong[i]);
            } catch (NumberFormatException e) {
                soluongInt = 0;
            }
            ProductTO productTO = product.retrieveProductById(productIdInt);
            long pay = soluongInt * productTO.getPRICE();

            BookingTO bookingTO = new BookingTO(bookingIdLong, StaticTO.ACTIVE_STATUS, productIdInt, soluongInt, pay);
             bookingDA.addBookingProduct(bookingTO);


        }
        return true;
    }
}
