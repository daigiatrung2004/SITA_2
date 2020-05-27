package servlet.Admin;

import DAO.RoomOfALLDA;
import DTO.KindRoomTO;
import DTO.PriceRoomTO;
import DTO.RoomTO;
import DTO.StaticTO;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

public class ListingKindRoom extends WebServletAdmin {

    @Override
    protected void process(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        String type = request.getParameter("type") != null ? (String) request.getParameter("type") : "";
        String id = request.getParameter("id") != null ? (String) request.getParameter("id") : "0";
        int idInt;
        try {
            idInt = Integer.parseInt(id);
        } catch (NumberFormatException e) {
            idInt = 0;
        }
        RoomOfALLDA roomOfALLDA = new RoomOfALLDA();

        if (type.equals("delete")) {


            KindRoomTO kindRoomTO = roomOfALLDA.retrieveKindRoomById(idInt);
            kindRoomTO.setStatus(StaticTO.REMOVE_STATUS);
            boolean checkSuccess = roomOfALLDA.updateKindRoom(kindRoomTO);
            try {
                response.getWriter().print("{\"success\":" + checkSuccess + "}");
            } catch (IOException e) {
                e.printStackTrace();
            }

        } else if (type.equals("delete-price")) {

            PriceRoomTO priceRoomTO = roomOfALLDA.retrievePriceById(idInt);
            priceRoomTO.setStatus(StaticTO.REMOVE_STATUS);
            boolean checkSuccess = roomOfALLDA.updatePriceRoom(priceRoomTO);
            try {
                response.getWriter().print("{\"success\":" + checkSuccess + "}");
            } catch (IOException e) {
                e.printStackTrace();
            }
        }else if(type.equals("edited-price")){
            String type_vi = request.getParameter("type_vi") != null ? (String) request.getParameter("type_vi") : "";
            String type_en = request.getParameter("type_en") != null ? (String) request.getParameter("type_en") : "";
            String price = request.getParameter("price") != null ? (String) request.getParameter("price") : "0";
            long priceLong;
            try {
                priceLong=Long.parseLong(price);
            } catch (NumberFormatException e) {
                priceLong=0;
            }

            PriceRoomTO priceRoomTO=roomOfALLDA.retrievePriceById(idInt);
            priceRoomTO.setType_price_room_vi(type_vi);
            priceRoomTO.setType_price_room_en(type_en);
            priceRoomTO.setPrice_1_night(priceLong);
            boolean checkSuccess=roomOfALLDA.updatePriceRoom(priceRoomTO);
            try {
                response.sendRedirect("ListingHotelManager?checkSuccess=" + checkSuccess);
            } catch (IOException e) {
                e.printStackTrace();
            }

        }
        else if(type.equals("price-edit")){
            PriceRoomTO priceRoomTO = roomOfALLDA.retrievePriceById(idInt);
            request.setAttribute("priceRoomTO",priceRoomTO);
            ArrayList<KindRoomTO> listKindRoomTO=roomOfALLDA.retrieveALLKindRoom();
            request.setAttribute("listKindRoomTO",listKindRoomTO);
            try {
                forward("Admin/edit-price.jsp",request,response);
            } catch (ServletException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        else if (type.equals("edit")) {
            KindRoomTO kindRoomTO = roomOfALLDA.retrieveKindRoomById(idInt);
            String vi_name = request.getParameter("vi_name") != null ? (String) request.getParameter("vi_name") : "";
            String en_name = request.getParameter("en_name") != null ? (String) request.getParameter("en_name") : "";
            String remarks = request.getParameter("remarks") != null ? (String) request.getParameter("remarks") : "";
            kindRoomTO.setName_vi(vi_name);
            kindRoomTO.setName_en(en_name);
            kindRoomTO.setRemark(remarks);
            boolean checkSuccess = roomOfALLDA.updateKindRoom(kindRoomTO);
            try {
                response.sendRedirect("ListingHotelManager?checkSuccess=" + checkSuccess);
            } catch (IOException e) {
                e.printStackTrace();
            }
        } else {
            try {
                KindRoomTO kindRoomTO = roomOfALLDA.retrieveKindRoomById(idInt);
                request.setAttribute("kindRoomTO", kindRoomTO);
                forward("Admin/edit-kindroom.jsp", request, response);
            } catch (ServletException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }

        }
    }
}
