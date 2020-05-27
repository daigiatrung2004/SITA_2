package servlet;

import DAO.AdvertisementDA;
import DAO.RegionDA;
import DAO.RoomOfALLDA;
import DAO.UploadResourceDA;
import DTO.AdvertisementTO;
import DTO.KindRoomTO;
import DTO.RegionTO;
import DTO.UploadResourceTO;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

public class DetailRegion extends WebServlet {

    @Override
    protected void process(HttpServletRequest request, HttpServletResponse response) {
        try {
            String regionid=request.getParameter("regionid")!=null?(String)request.getParameter("regionid"):"0";
            String name=request.getParameter("name")!=null?(String)request.getParameter("name"):"0";
            if(name.equals("accomodation")){
                forward("/AccomodationDetail", request, response);
            }else {
                int regionidInt;
                try {
                    regionidInt = Integer.parseInt(regionid);
                } catch (NumberFormatException e) {
                    regionidInt = 0;
                }
                RegionDA regionDA = new RegionDA();
                RoomOfALLDA roomOfALLDA = new RoomOfALLDA();
                ArrayList<KindRoomTO> listRoom = roomOfALLDA.retrieveALLKindRoomByRegionId(regionidInt);
                ArrayList<UploadResourceTO> listResource = new ArrayList<UploadResourceTO>();
                UploadResourceDA uploadResourceDA = new UploadResourceDA();

                if (listRoom != null) {
                    for (int i = 0; i < listRoom.size(); i++) {
                        UploadResourceTO uploadResourceTO = uploadResourceDA.retrieveImgGalery("kind_room_" + listRoom.get(i).getKindroom_id());
                        listResource.add(uploadResourceTO);
                    }
                }
                request.setAttribute("listRoom", listRoom);
                request.setAttribute("listResource", listResource);
                RegionTO regionTO = regionDA.retrieveAllRegion(regionidInt);
                request.setAttribute("regionTO", regionTO);

                // ưu đãi
                AdvertisementDA advertisementDA=new AdvertisementDA();
                if(regionTO!=null) {
                    ArrayList<AdvertisementTO> listAdvertisementTO = advertisementDA.retrievePackageByRegionId(regionTO.getRegion_id());
                    request.setAttribute("listAdvertisementTO",listAdvertisementTO);

                }
                forward("detailRegion.jsp", request, response);
            }
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
