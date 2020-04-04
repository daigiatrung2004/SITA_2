package servlet.Employee;

import DAO.RoomOfALLDA;
import DAO.ServiceDA;
import DAO.UploadResourceDA;
import DTO.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

public class DetailsRoom extends WebServletEmployee {

    @Override
    protected void process(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        try {
            String roomId = request.getParameter("roomId") != null ? (String) request.getParameter("roomId") : "0";
            int roomIdInt;
            try {
                roomIdInt = Integer.parseInt(roomId);
            } catch (NumberFormatException e) {
                roomIdInt = 0;
            }
            RoomOfALLDA roomOfALLDA = new RoomOfALLDA();
            ServiceDA serviceDA=new ServiceDA();
            UploadResourceDA uploadResourceDA=new UploadResourceDA();
            ArrayList<UploadResourceTO> listUploadResourceto=null;
            RoomTO roomTO = roomOfALLDA.searchRoomById(roomIdInt);
            KindRoomTO kindRoomTO=null;
            PriceRoomTO priceRoomTO=null;
            ArrayList<ServiceTO> listServiceTO=null;
            if (roomTO != null) {
                kindRoomTO=roomOfALLDA.retrieveKindRoomById(roomTO.getKind_room_id());
                priceRoomTO=roomOfALLDA.retrievePriceById(roomTO.getPrice_id());
                if(priceRoomTO!=null){
                    listServiceTO=serviceDA.retrieveServiceByPrice(priceRoomTO.getPrice_id());

                }
                if(kindRoomTO!=null){
                    listUploadResourceto=uploadResourceDA.retrieveUploadByKindRoomId("kind_room_"+kindRoomTO.getKindroom_id());
                }

            }
            request.setAttribute("roomTO",roomTO);
            request.setAttribute("kindRoomTO",kindRoomTO);
            request.setAttribute("listServiceTO",listServiceTO);
            request.setAttribute("priceRoomTO",priceRoomTO);

            request.setAttribute("listUploadResourceto",listUploadResourceto);
            if(roomTO.getStatus().equals(StaticTO.ACTIVE_STATUS)) {
                forward("/EMPLOYEE/detailRoom.jsp", request, response);
            }else{
                response.sendRedirect("ListingRoom");
            }
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
