package servlet.Admin;

import DAO.RegionDA;
import DAO.UploadResourceDA;
import DTO.RegionTO;
import DTO.StaticTO;
import DTO.UploadResourceTO;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;


public class ImageManagerHotel extends WebServletAdmin{

    @Override
    protected void process(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        try {
            UploadResourceDA uploadResourceDA=new UploadResourceDA();
            RegionDA regionDA=new RegionDA();
            ArrayList<RegionTO> listRegion=regionDA.retrieveAllRegion();
            ArrayList listImg=new ArrayList();
            if(listRegion!=null){
                for (int i = 0; i < listRegion.size() ; i++) {
                   ArrayList<UploadResourceTO> listImgeItem=uploadResourceDA.retrieveImgRegion(StaticTO.IMAGE_HOTEL+listRegion.get(i).getRegion_id());
                   listImg.add(listImgeItem);
                }
                request.setAttribute("listImg",listImg);
            }

            forward("/Admin/ListImageHotel.jsp",request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
