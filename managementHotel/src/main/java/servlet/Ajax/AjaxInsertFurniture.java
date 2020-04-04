package servlet.Ajax;

import DAO.RoomOfALLDA;
import DTO.FurnitureTO;
import DTO.StaticTO;
import servlet.Admin.WebServletAdmin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

public class AjaxInsertFurniture extends WebServletAdmin {

    @Override
    protected void process(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        String name_furniture_vi = request.getParameter("name_furniture_vi") != null ? (String) request.getParameter("name_furniture_vi") : "";
        String name_furniture_en = request.getParameter("name_furniture_en") != null ? (String) request.getParameter("name_furniture_en") : "";
        String details = request.getParameter("details") != null ? (String) request.getParameter("details") : "";
        String type_furniture_vi = request.getParameter("type_furniture") != null ? (String) request.getParameter("type_furniture") : "";
        String type_furniture_en = request.getParameter("type_furniture_en") != null ? (String) request.getParameter("type_furniture_en") : "";
        String price_furniture = request.getParameter("price_furniture") != null ? (String) request.getParameter("price_furniture") : "0";
        String type = request.getParameter("type") != null ? (String) request.getParameter("type") : "";
        boolean checkSucccess = false;
        RoomOfALLDA roomOfALLDA = new RoomOfALLDA();
        try {
            if (type.equals("")) {
                // insert du lieu furniture
                long priceLong;
                try {
                    priceLong = Long.parseLong(price_furniture);
                } catch (NumberFormatException e) {
                    priceLong = 0;
                }
                FurnitureTO furnitureTO = new FurnitureTO(0, name_furniture_vi, name_furniture_en, type_furniture_vi, priceLong, details, StaticTO.ACTIVE_STATUS, "", type_furniture_en);

                checkSucccess = roomOfALLDA.addfurniture(furnitureTO);
            } else {
                String furniture_select = request.getParameter("furniture_select") != null ? (String) request.getParameter("furniture_select") : "0";
                String kind_room = request.getParameter("kind_room") != null ? (String) request.getParameter("kind_room") : "0";
                int furniture_selectInt,kind_roomInt;
                String []splitFurniture=furniture_select.split(",");
                for (int i = 0; i <splitFurniture.length ; i++) {


                try {
                    furniture_selectInt=Integer.parseInt(splitFurniture[i]);
                } catch (NumberFormatException e) {
                    furniture_selectInt=0;
                }
                try {
                    kind_roomInt=Integer.parseInt(kind_room);
                } catch (NumberFormatException e) {
                    kind_roomInt=0;
                }
                FurnitureTO furnitureTO=new FurnitureTO(furniture_selectInt,StaticTO.ACTIVE_STATUS,0,kind_roomInt);
                checkSucccess=roomOfALLDA.addfurnitureKindRoom(furnitureTO);
                }
            }
            response.getWriter().print("{\"success\":" + checkSucccess + "}");

        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
