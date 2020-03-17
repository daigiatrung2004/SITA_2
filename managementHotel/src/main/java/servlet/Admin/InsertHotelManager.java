package servlet.Admin;

import DAO.RegionDA;
import DAO.RoomOfALLDA;
import DTO.KindRoomTO;
import DTO.RegionTO;
import DTO.StaticTO;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

public class InsertHotelManager extends WebServletAdmin {
    @Override
    protected void process(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        try {
            RegionDA regionDA = new RegionDA();
            RoomOfALLDA roomOfALLDA = new RoomOfALLDA();
            ArrayList<KindRoomTO> listKindRoom = roomOfALLDA.retrieveALLKindRoom();
            ArrayList<RegionTO> listRegion = regionDA.retrieveAllRegion();
            request.setAttribute("listKindRoom", listKindRoom);
            request.setAttribute("listRegion", listRegion);
            forward("./Admin/insertHotelManager.jsp", request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


}
