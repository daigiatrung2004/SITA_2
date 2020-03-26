package servlet.Admin;

import DAO.PromoteDA;
import DAO.RegionDA;
import DAO.RoomOfALLDA;
import DAO.ServiceDA;
import DTO.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Array;
import java.sql.SQLException;
import java.util.ArrayList;

public class InsertHotelManager extends WebServletAdmin {
    @Override
    protected void process(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        try {
            RegionDA regionDA = new RegionDA();
            RoomOfALLDA roomOfALLDA = new RoomOfALLDA();
            ServiceDA serviceDA = new ServiceDA();
            ArrayList<KindRoomTO> listKindRoom = roomOfALLDA.retrieveALLKindRoom();
            ArrayList<PriceRoomTO> listPriceRoom = roomOfALLDA.retrieveALLPrice();
            ArrayList<ServiceTO> listServiceTO = serviceDA.retrieveAllService();
            ArrayList<RegionTO> listRegion = regionDA.retrieveAllRegion();
            PromoteDA promoteDA=new PromoteDA();
            ArrayList<PromoteTO> listPromote=promoteDA.retreiveAllPromote();
            request.setAttribute("listPromote", listPromote);
            request.setAttribute("listPriceRoom", listPriceRoom);
            request.setAttribute("listServiceTO", listServiceTO);
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
