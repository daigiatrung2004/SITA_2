package servlet.Admin;

import DAO.PromoteDA;
import DAO.RoomOfALLDA;
import DTO.PriceRoomTO;
import DTO.PromoteTO;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

public class ListingPromote extends WebServletAdmin {

    @Override
    protected void process(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        try {
            RoomOfALLDA roomOfALLDA = new RoomOfALLDA();
            ArrayList<PriceRoomTO> listPriceRoom = roomOfALLDA.retrieveALLPrice();
            request.setAttribute("listPriceRoom", listPriceRoom);
            PromoteDA promoteDA=new PromoteDA();
            ArrayList<PromoteTO> listPromote=promoteDA.retreiveAllPromote();
            request.setAttribute("listPromote", listPromote);
            forward("/Admin/listingPromote.jsp",request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
