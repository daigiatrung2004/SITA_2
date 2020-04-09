package servlet.Ajax;

import DAO.*;
import DTO.*;
import servlet.WebServlet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

public class AjaxPaymentEndPoint extends WebServlet {
    @Override
    protected void process(HttpServletRequest request, HttpServletResponse response) {
        try {
            String price = request.getParameter("price") != null ? (String) request.getParameter("price") : "0";
            String kind_room_id = request.getParameter("kind_room_id") != null ? (String) request.getParameter("kind_room_id") : "0";
            String region_id = request.getParameter("region_id") != null ? (String) request.getParameter("region_id") : "0";
            String price_id = request.getParameter("price_id") != null ? (String) request.getParameter("price_id") : "0";
            String numberOfPeo = request.getParameter("numberOfPeo") != null ? (String) request.getParameter("numberOfPeo") : "";
            String checkin = request.getParameter("checkin") != null ? (String) request.getParameter("checkin") : "";
            String checkout = request.getParameter("checkout") != null ? (String) request.getParameter("checkout") : "";
            String room_id = request.getParameter("room_id") != null ? (String) request.getParameter("room_id") : "";

            String arraySelectAddition = request.getParameter("arraySelectAddition") != null ? (String) request.getParameter("arraySelectAddition") : "";

            String[] arraySelectAdditionSplit = arraySelectAddition.split(",");
            // check in ,out,pee
            request.setAttribute("checkin", checkin);
            request.setAttribute("checkout", checkout);
            request.setAttribute("numberOfPeo", numberOfPeo);
            // region
            RegionDA regionDA=new RegionDA();
            RegionTO regionTO=regionDA.retrieveAllRegion(Integer.parseInt(region_id));
            request.setAttribute("regionTO",regionTO);
            // get room
            RoomOfALLDA roomOfALLDA = new RoomOfALLDA();
            RoomTO roomTO = roomOfALLDA.searchRoomById(Integer.parseInt(room_id));
            request.setAttribute("roomTO", roomTO);
            //get type price
            PriceRoomTO priceRoomTO = roomOfALLDA.retrievePriceById(Integer.parseInt(price_id));
            request.setAttribute("priceRoomTO", priceRoomTO);
            //get kind room
            KindRoomTO kindRoomTO = roomOfALLDA.retrieveKindRoomById(Integer.parseInt(kind_room_id));
            request.setAttribute("kindRoomTO", kindRoomTO);
            // get fees other
            TransportDA transportDA = new TransportDA();
            ArrayList<TransportTO> listFeesOther = transportDA.retreiveAllFeesOther();
            request.setAttribute("listFeesOther", listFeesOther);
            request.setAttribute("price", price);
            // tính total
            long priceLong = 0;
            try {
                priceLong = Long.parseLong(price.replaceAll(",", ""));
            } catch (NumberFormatException e) {
                priceLong = 0;
            }
            long total = 0;
            total += priceLong;
            // công thêm cho các dịch vụ khác
            for (int i = 0; i < listFeesOther.size(); i++) {
                total += listFeesOther.get(i).getPrice();
            }
            // nếu có lựa chọn bổ sung
            ArrayList<TransportTO> listTransport = new ArrayList<TransportTO>();
            if (!arraySelectAddition.equals("")&&arraySelectAdditionSplit.length > 0) {
                for (int i = 0; i < arraySelectAdditionSplit.length; i++) {
                    TransportTO transportTO = transportDA.retreiveAllTransById(Integer.parseInt(arraySelectAdditionSplit[i]));
                    listTransport.add(transportTO);
                    total += transportTO.getPrice();
                }
            }
            request.setAttribute("total", String.valueOf(total));
            // dich vụ theo price
            ServiceDA serviceDA = new ServiceDA();
            ArrayList<ServiceTO> listServiceTO = serviceDA.retrieveServiceByPrice(Integer.parseInt(price_id));
            request.setAttribute("listServiceTO", listServiceTO);
            // promote
            PaymentOrderDA paymentOrderDA=new PaymentOrderDA();
            int countPayment=paymentOrderDA.countPayment()+1;
            request.setAttribute("countPayment",String.valueOf(countPayment));
            BookingDA bookingDA=new BookingDA();
            int countBooking=bookingDA.countBooking();
            request.setAttribute("countBooking",String.valueOf(countBooking));
            forward("paymentEndPoint.jsp", request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


}
