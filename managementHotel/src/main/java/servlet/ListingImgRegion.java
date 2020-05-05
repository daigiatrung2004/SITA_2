package servlet;

import DAO.RegionDA;
import DAO.UploadResourceDA;
import DTO.RegionTO;
import DTO.StaticTO;
import DTO.UploadResourceTO;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;


public class ListingImgRegion extends WebServlet {

    @Override
    protected void process(HttpServletRequest request, HttpServletResponse response) {

        try {
            String region=request.getParameter("region")!=null?(String)request.getParameter("region"):"0";
            int regionInt;
            RegionDA regionDA = new RegionDA();
            try {
                regionInt=Integer.parseInt(region);
            } catch (NumberFormatException e) {
                regionInt=0;
            }
            if(regionInt>0){
                RegionTO regionTO=regionDA.retrieveAllRegion(regionInt);
                UploadResourceDA uploadResourceDA=new UploadResourceDA();
                ArrayList<UploadResourceTO> listresource=uploadResourceDA.retrieveImgRegion(StaticTO.IMAGE_HOTEL+regionInt);
                request.setAttribute("listresource",listresource);
                request.setAttribute("regionTO",regionTO);
                forward("detailImg.jsp",request,response);
            }else {

                ArrayList<RegionTO> listRegionTO = regionDA.retrieveAllRegion();
                request.setAttribute("listRegionTO", listRegionTO);
               forward("listingImgRegion.jsp", request, response);
            }
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
