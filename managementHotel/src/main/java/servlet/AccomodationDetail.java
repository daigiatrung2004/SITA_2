package servlet;

import DAO.RegionDA;
import DAO.RoomOfALLDA;
import DAO.UploadResourceDA;
import DTO.KindRoomTO;
import DTO.RegionTO;
import DTO.UploadResourceTO;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

public class AccomodationDetail extends WebServlet {

    @Override
    protected void process(HttpServletRequest request, HttpServletResponse response) {
        String region=request.getParameter("regionid")!=null?(String)request.getParameter("regionid"):"0";
        int regionInt;
        regionInt=Integer.parseInt(region);
        RoomOfALLDA roomOfALLDA=new RoomOfALLDA();
        ArrayList<KindRoomTO> listKindRoom=roomOfALLDA.retrieveALLKindRoomByRegionId(regionInt);
        RegionDA regionDA=new RegionDA();
        RegionTO regionTO=regionDA.retrieveAllRegion(regionInt);
        request.setAttribute("regionTO",regionTO);
        UploadResourceDA uploadResourceDA=new UploadResourceDA();
        ArrayList listUploadTO=new ArrayList();

        if(listKindRoom!=null){
            for (int i = 0; i <listKindRoom.size() ; i++) {
               ArrayList<UploadResourceTO> listUpload=uploadResourceDA.retrieveUploadByKindRoomId("kind_room_"+listKindRoom.get(i).getKindroom_id());

                   listUploadTO.add(listUpload);


            }
        }
        request.setAttribute("listUploadTO",listUploadTO);
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
