package servlet.Ajax;

import DAO.RoomOfALLDA;
import DTO.FurnitureTO;
import servlet.Admin.WebServletAdmin;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

public class AjaxListingFurniture extends WebServletAdmin {

    @Override
    protected void process(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        String kindroom=request.getParameter("kindroom")!=null?(String)request.getParameter("kindroom"):"0";
        String type=request.getParameter("type")!=null?(String)request.getParameter("type"):"";
        RoomOfALLDA roomOfALLDA = new RoomOfALLDA();
        if(type.equals("")) {
            int kindroomInt;
            try {
                kindroomInt = Integer.parseInt(kindroom);
            } catch (NumberFormatException e) {
                kindroomInt = 0;
            }

            request.setAttribute("kindroomInt", String.valueOf(kindroomInt));
            ArrayList<FurnitureTO> listFurnitureTO = roomOfALLDA.retrieveFurnitureAllByKRId(kindroomInt);
            request.setAttribute("listFurnitureTO", listFurnitureTO);
            try {
                forward("Admin/listFurniture.jsp", request, response);
            } catch (ServletException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }else{
          String id_furniture=request.getParameter("id_furniture")!=null?(String)request.getParameter("id_furniture"):"0";
          String kind=request.getParameter("kind")!=null?(String)request.getParameter("kind"):"0";
          int kindInt,id_furnitureInt;
            try {
                id_furnitureInt=Integer.parseInt(id_furniture);
            } catch (NumberFormatException e) {
                id_furnitureInt=0;
            }
            try {
                kindInt=Integer.parseInt(kind);
            } catch (NumberFormatException e) {
                kindInt=0;
            }
            boolean checkSuccess=roomOfALLDA.deleteFurniture(kindInt,id_furnitureInt);
            try {
                response.getWriter().print("{\"success\":"+checkSuccess+"}");
            } catch (IOException e) {
                e.printStackTrace();
            }


        }
    }
}
