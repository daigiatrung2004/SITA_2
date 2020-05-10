package servlet;

import DAO.RoomOfALLDA;
import DTO.KindRoomTO;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

public class AccomodationDetail extends WebServlet {

    @Override
    protected void process(HttpServletRequest request, HttpServletResponse response) {
        String region=request.getParameter("region")!=null?(String)request.getParameter("region"):"0";
        int regionInt;
        regionInt=Integer.parseInt(region);
        RoomOfALLDA roomOfALLDA=new RoomOfALLDA();
        ArrayList<KindRoomTO> listKindRoom=roomOfALLDA.retrieveALLKindRoomByRegionId(regionInt);
        request.setAttribute("listKindRoom",listKindRoom);
        try {
            forward("/accomodationDetail.jsp",request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
