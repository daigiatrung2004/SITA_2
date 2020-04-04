package servlet.Employee;

import DAO.BookingDA;
import DAO.RoomOfALLDA;
import DTO.BookingTO;
import DTO.CustomerTO;
import DTO.RoomTO;
import DTO.StaticTO;
import Utils.EncryptDecryptPassword;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

public class BookingDirection extends WebServletEmployee {

    @Override
    protected void process(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        try {
            String roomId = request.getParameter("roomId") != null ? (String) request.getParameter("roomId") : "0";
            String firstname = request.getParameter("firstname") != null ? (String) request.getParameter("firstname") : "";
            String lastname = request.getParameter("lastname") != null ? (String) request.getParameter("lastname") : "";
            String CMND = request.getParameter("CMND") != null ? (String) request.getParameter("CMND") : "";
            String phone = request.getParameter("phone") != null ? (String) request.getParameter("phone") : "";
            String email = request.getParameter("email") != null ? (String) request.getParameter("email") : "";
            String checkout = request.getParameter("checkout") != null ? (String) request.getParameter("checkout") : "";
            if (!checkout.equals("")) {
                String[] splitCheckOut = checkout.split("/");
                checkout = splitCheckOut[2] + "-" + splitCheckOut[0] + "-" + splitCheckOut[1] + " 14:00:00";
            }
            Date date=new Date();
            DateFormat dateformat=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            String now=dateformat.format(date);
            BookingDA bookingDA = new BookingDA();
            Random rn = new Random();
            String sankey = String.valueOf(rn.nextInt(StaticTO.numOfRandom));
            String pass = "customer" + String.valueOf(rn.nextInt(StaticTO.numOfRandom));
            EncryptDecryptPassword encryptDecryptPassword = new EncryptDecryptPassword(sankey);
            String encryptpass = encryptDecryptPassword.encrypt(pass);
            CustomerTO customer = new CustomerTO(0, email, sankey, encryptpass, now, phone, CMND, StaticTO.ACTIVE_STATUS, "", firstname, lastname);
            boolean checkCustomer = bookingDA.addCustomer(customer);
            int roomIdInt;
            try {
                roomIdInt = Integer.parseInt(roomId);
            } catch (NumberFormatException e) {
                roomIdInt = 0;
            }
            RoomOfALLDA roomOfALLDA = new RoomOfALLDA();
            RoomTO roomTO = roomOfALLDA.searchRoomById(roomIdInt);
            if (checkCustomer) {
                CustomerTO customerTO = bookingDA.retreiveCustomerLatest();
                if (customerTO != null) {
                    if (!checkout.equals("") && roomTO != null) {
                        BookingTO bookingTO = new BookingTO(0, customerTO.getCustomer_id(), now, now, checkout, roomTO.getKind_room_id(), roomTO.getRegion_id(), roomTO.getRoom_id(), StaticTO.ACTIVE_STATUS, "", pass);
                        checkCustomer = bookingDA.addBooking(bookingTO);
                        if (checkCustomer) {
                            roomTO.setStatus(StaticTO.BOOKED_STATUS);
                            checkCustomer = roomOfALLDA.updateRoom(roomTO);
                            if (checkCustomer) {

                                forward("ListingRoom", request, response);

                            } else {
                                response.sendRedirect("DetailsRoom?roomId="+roomId);
                            }

                        }
                    }
                }
            }
            response.sendRedirect("DetailsRoom?roomId="+roomId);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

}
