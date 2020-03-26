package servlet.Ajax;

import DAO.BookingDA;
import DAO.RoomOfALLDA;
import DAO.TransportDA;
import DTO.PriceRoomTO;
import DTO.RoomTO;
import DTO.TransportTO;
import Utils.TextCustomizeFormat;
import servlet.WebServlet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

public class AjaxPaymentContinue extends WebServlet {
    @Override
    protected void process(HttpServletRequest request, HttpServletResponse response) {
        try {
            String price = request.getParameter("price") != null ? (String) request.getParameter("price") : "0";
            String kind_room_id = request.getParameter("kind_room_id") != null ? (String) request.getParameter("kind_room_id") : "0";
            String region_id = request.getParameter("region_id") != null ? (String) request.getParameter("region_id") : "0";
            String price_id = request.getParameter("price_id") != null ? (String) request.getParameter("price_id") : "0";
            String numberOfPeo = request.getParameter("numberOfPeo") != null ? (String) request.getParameter("numberOfPeo") : "0";
            String checkin = request.getParameter("checkin") != null ? (String) request.getParameter("checkin") : "";
            String checkout = request.getParameter("checkout") != null ? (String) request.getParameter("checkout") : "";
            RoomOfALLDA roomOfALLDA = new RoomOfALLDA();
            BookingDA bookingDA = new BookingDA();
            ArrayList<RoomTO> listRoom = roomOfALLDA.searchRoom(Integer.parseInt(region_id), Integer.parseInt(numberOfPeo));
            TransportDA transportDA = new TransportDA();
            // phí dịch vụ
            ArrayList<TransportTO> listFeeOther = transportDA.retreiveAllFeesOther();
            request.setAttribute("listFeeOther",listFeeOther);
            // lấy ra danh sách các transport bởi id
            ArrayList<TransportTO> listTrans = transportDA.retreiveAllTransByRegionId(Integer.parseInt(region_id));
            request.setAttribute("listTrans",listTrans);
            // tự động chọn phòng cho khách

            RoomTO roomSelected = null;
            for (RoomTO roomTO : listRoom) {
                if (!bookingDA.checkBookingByRoom(Integer.parseInt(kind_room_id), Integer.parseInt(region_id), checkout, roomTO.getRoom_id())) {
                    roomSelected = roomTO;
                    // chưa làm kiểm tra đụng độ khi có nhieu nguoi vao

                    break;
                }

            }
            // lấy loại thanh toán
            PriceRoomTO priceRoomTO=roomOfALLDA.retrievePriceById(Integer.parseInt(price_id));
            // tính tổng tiền tạm thời chưa bao gồm lựa chọn bổ
            long priceLong=Long.parseLong(price.replaceAll(",",""));
            long totalTemp=priceLong;
            for (int i = 0; i <listFeeOther.size() ; i++) {
                totalTemp+=listFeeOther.get(i).getPrice();
            }
            String totalTempStr= TextCustomizeFormat.currency_format(totalTemp);
            request.setAttribute("totalTemp",totalTempStr);
            request.setAttribute("totalTempLong",String.valueOf(totalTemp));
            request.setAttribute("priceRoomTO", priceRoomTO);
            request.setAttribute("roomSelected", roomSelected);
            forward("paymentViewContinue.jsp", request, response);


        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


}
