package servlet.Admin;

import DAO.RoomOfALLDA;
import DTO.FurnitureTO;
import DTO.KindRoomTO;

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
            RoomOfALLDA roomOfALLDA=new RoomOfALLDA();
            ArrayList<KindRoomTO> listingKind=roomOfALLDA.retrieveALLKindRoom();
            ArrayList<FurnitureTO> listFurniture=roomOfALLDA.listFurnitureAll();
            request.setAttribute("listingKind",listingKind);
            request.setAttribute("listFurniture",listFurniture);
            forward("/Admin/listingFurniture.jsp", request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
