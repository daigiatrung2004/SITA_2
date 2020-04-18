package servlet.Admin;

import DAO.RegionDA;
import DAO.RoomOfALLDA;
import DTO.KindRoomTO;
import DTO.PriceRoomTO;
import DTO.RegionTO;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

public class RoomQuick extends WebServletAdmin {

    @Override
    protected void process(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        try {
            String type=request.getParameter("type")!=null?(String)request.getParameter("type"):"";
            RegionDA regionDA=new RegionDA();
            RoomOfALLDA roomOfALLDA=new RoomOfALLDA();

            ArrayList<RegionTO> listRegion=regionDA.retrieveAllRegion();
            request.setAttribute("listRegion",listRegion);
            ArrayList<KindRoomTO> listKindRoom=roomOfALLDA.retrieveALLKindRoom();
            request.setAttribute("listKindRoom",listKindRoom);
            ArrayList<PriceRoomTO> listPrice=roomOfALLDA.retrieveALLPrice();
            request.setAttribute("listPrice",listPrice);
            forward("Admin/roomQuick.jsp",request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }
}
