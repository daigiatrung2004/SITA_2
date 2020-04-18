package servlet;

import DAO.BookingDA;
import DAO.PaymentOrderDA;
import DAO.RoomOfALLDA;
import DTO.*;
import Utils.EncryptDecryptPassword;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

public class PaymentAutoReturn extends WebServlet {

    @Override
    protected void process(HttpServletRequest request, HttpServletResponse response) {


        try {
            String email = request.getParameter("email") != null ? (String) request.getParameter("email") : "";
            String verify_person = request.getParameter("verify_person") != null ? (String) request.getParameter("verify_person") : "";
            String type_payment = request.getParameter("type_payment") != null ? (String) request.getParameter("type_payment") : "cash";
            String buyer_phone = request.getParameter("buyer-phone") != null ? (String) request.getParameter("buyer-phone") : "";
            String checkin = request.getParameter("checkin") != null ? (String) request.getParameter("checkin") : "";
            String checkout = request.getParameter("checkout") != null ? (String) request.getParameter("checkout") : "";
            String kind_room_id = request.getParameter("kind_room_id") != null ? (String) request.getParameter("kind_room_id") : "0";
            String region_id = request.getParameter("region_id") != null ? (String) request.getParameter("region_id") : "0";
            String room_id = request.getParameter("room_id") != null ? (String) request.getParameter("room_id") : "0";
            String listTrans = request.getParameter("listTrans") != null ? (String) request.getParameter("listTrans") : "";
            String firstname = request.getParameter("buyer-family-name") != null ? (String) request.getParameter("buyer-family-name") : "";
            String lastname = request.getParameter("buyer-given-name") != null ? (String) request.getParameter("buyer-given-name") : "";
            String total = request.getParameter("total") != null ? (String) request.getParameter("total") : "";
            String price_id = request.getParameter("price_id") != null ? (String) request.getParameter("price_id") : "";
            String codeValue = request.getParameter("codeValue") != null ? (String) request.getParameter("codeValue") : "0";

            String[] checkoutSplit = checkout.split("/");
            String[] listTransSplit = listTrans.split(",");
            String[] checkinSplit = checkin.split("/");
            int codeValueInt;
            try {
                codeValueInt=Integer.parseInt(codeValue);
            } catch (NumberFormatException e) {
                codeValueInt=0;
            }
            long totalLong;
            try {
                totalLong=Long.parseLong(total);
            } catch (NumberFormatException e) {
                totalLong=0;
            }
            if (!checkin.equals("") && !checkout.equals("")) {
                checkin = checkinSplit[2] + "-" + checkinSplit[1] + "-" + checkinSplit[0] + " 14:00:00";

                checkout = checkoutSplit[2] + "-" + checkoutSplit[1] + "-" + checkoutSplit[0] + " 12:00:00";
            }

            Random rnd = new Random();
            int password = rnd.nextInt(StaticTO.numOfRandom);
            int sankey = rnd.nextInt(StaticTO.numOfRandom);
            Date now = new Date();
            DateFormat dateFormat = new SimpleDateFormat("yyyy-M-dd");
            String nowStr = dateFormat.format(now);
            EncryptDecryptPassword encryptDecryptPassword = new EncryptDecryptPassword(String.valueOf(sankey));
            String pass = encryptDecryptPassword.encrypt(String.valueOf(password));
            CustomerTO customerTO = new CustomerTO(0, email, String.valueOf(sankey), pass, nowStr, buyer_phone, verify_person, StaticTO.ACTIVE_STATUS, "", firstname, lastname);
            BookingDA bookingDA = new BookingDA();
            bookingDA.addCustomer(customerTO);
            CustomerTO customer = bookingDA.retreiveCustomerLatest();

            BookingTO bookingTO = new BookingTO(0, customer.getCustomer_id(), nowStr, checkin, checkout, Integer.parseInt(kind_room_id), Integer.parseInt(region_id), Integer.parseInt(room_id), StaticTO.ACTIVE_STATUS,codeValueInt>0?"codeValue:"+codeValueInt:"", pass);
            bookingDA.addBooking(bookingTO);
            BookingTO bookingTO1 = bookingDA.retrieveBookingLatest();
            if (!listTrans.equals("") && listTransSplit.length > 0) {
                for (int i = 0; i < listTransSplit.length; i++) {
                    BookingTO bookingTO2 = new BookingTO(bookingTO1.getBooking_id(), Long.parseLong(listTransSplit[i]), 0);
                    bookingDA.addBookingTrans(bookingTO2);
                }
            }
            PaymentOrderDA paymentOrderDA=new PaymentOrderDA();
            Date date=new Date();
            DateFormat dateFormat1=new SimpleDateFormat("yyyy-M-dd hh:mm:ss");
            String dateStr=dateFormat1.format(date);
            System.out.println(dateStr);
            if (type_payment.equals("paypal")) {
               PaymentOrderTO paymentOrderTO=new PaymentOrderTO(0,customerTO.getCustomer_id(),"","","",dateStr,0,totalLong,"VNĐ","","","","","","","","","",StaticTO.PAYPAL_METHOD);
               paymentOrderDA.addPaymentOrder(paymentOrderTO);
            }
            request.setAttribute("name", firstname + " " + lastname);
            request.setAttribute("contact_person", buyer_phone);
            request.setAttribute("verify_person", verify_person);

            // get info room
            RoomOfALLDA roomOfALLDA = new RoomOfALLDA();
            RoomTO roomTO = roomOfALLDA.searchRoomById(Integer.parseInt(room_id));
            if (roomTO != null) {
                if (type_payment.equals("paypal")) {
                    roomTO.setStatus(StaticTO.COMPLETE_STATUS);
                } else {
                    roomTO.setStatus(StaticTO.BOOKED_STATUS);
                }
                roomOfALLDA.updateRoom(roomTO);
            }
            request.setAttribute("roomTO", roomTO);
            // hinh thuc thanh toan
            PriceRoomTO priceRoomTO = roomOfALLDA.retrievePriceById(Integer.parseInt(price_id));
            request.setAttribute("priceRoomTO", priceRoomTO);
            //loai phong
            KindRoomTO kindRoomTO = roomOfALLDA.retrieveKindRoomById(Integer.parseInt(kind_room_id));
            request.setAttribute("kindRoomTO", kindRoomTO);
            //code nhận phong
            request.setAttribute("code_receive", pass);
            request.setAttribute("total", total);
            forward("ReceiptPayment.jsp", request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }
}
