package servlet.Admin;

import DAO.RoomOfALLDA;
import DTO.FurnitureTO;
import DTO.KindRoomTO;
import DTO.StaticTO;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

public class ListingFurniture extends WebServletAdmin {

    @Override
    protected void process(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        try {
            String type=request.getParameter("type")!=null?(String)request.getParameter("type"):"";
            String furnitureid=request.getParameter("furnitureid")!=null?(String)request.getParameter("furnitureid"):"0";
            RoomOfALLDA roomOfALLDA = new RoomOfALLDA();
            int furnitureidInt;
            try {
                furnitureidInt=Integer.parseInt(furnitureid);
            } catch (NumberFormatException e) {
                furnitureidInt=0;
            }

            if(type.equals("delete")){

               FurnitureTO furnitureTO= roomOfALLDA.retrieveFurnitureById(furnitureidInt);
               furnitureTO.setStatus(StaticTO.REMOVE_STATUS);
               boolean checkSuccess=roomOfALLDA.updateFurniture(furnitureTO);

               response.sendRedirect("ListingFurniture?checkSuccess="+checkSuccess);
            }
            else if(type.equals("update")){
               FurnitureTO furnitureTO=roomOfALLDA.retrieveFurnitureById(furnitureidInt);
               request.setAttribute("furnitureTO",furnitureTO);
              forward("/Admin/updateFurniture.jsp",request,response);
            }
            else if(type.equals("updated")){
                String name_furniture_vi=request.getParameter("name_furniture_vi")!=null?(String)request.getParameter("name_furniture_vi"):"";
                String name_furniture_en=request.getParameter("name_furniture_en")!=null?(String)request.getParameter("name_furniture_en"):"";
                String details=request.getParameter("details")!=null?(String)request.getParameter("details"):"";
                String type_furniture=request.getParameter("type_furniture")!=null?(String)request.getParameter("type_furniture"):"";
                String type_furniture_en=request.getParameter("type_furniture_en")!=null?(String)request.getParameter("type_furniture_en"):"";
                String price_furniture=request.getParameter("price_furniture")!=null?(String)request.getParameter("price_furniture"):"0";
                String status=request.getParameter("status")!=null?(String)request.getParameter("status"):"";
                long price_furnitureLong;
                try {
                    price_furnitureLong=Long.parseLong(price_furniture);
                } catch (NumberFormatException e) {
                    price_furnitureLong=0;
                }

                FurnitureTO furnitureTO=new FurnitureTO(furnitureidInt,name_furniture_vi,name_furniture_en,type_furniture,price_furnitureLong,details,status,"",type_furniture_en);
                boolean checksucess=roomOfALLDA.updateFurniture(furnitureTO);
                response.sendRedirect("ListingFurniture?checkSuccess="+checksucess);

            }
            else {

                ArrayList<KindRoomTO> listingKind = roomOfALLDA.retrieveALLKindRoom();
                ArrayList<FurnitureTO> listFurniture = roomOfALLDA.listFurnitureAll();
                ArrayList<KindRoomTO> listKindRoomTO=roomOfALLDA.retrieveALLKindRoom();
                request.setAttribute("listKindRoomTO",listKindRoomTO);
                request.setAttribute("listingKind", listingKind);
                request.setAttribute("listFurniture", listFurniture);
                forward("/Admin/listingFurniture.jsp", request, response);
            }
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
