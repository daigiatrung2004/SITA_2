package servlet;

import DAO.AdvertisementDA;
import DAO.RegionDA;
import DTO.AdvertisementTO;
import DTO.RegionTO;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

public class DetailAllOffer extends WebServlet {

    @Override
    protected void process(HttpServletRequest request, HttpServletResponse response) {
        try {
            String type = request.getParameter("type") != null ? (String) request.getParameter("type") : "";
            RegionDA regionDA = new RegionDA();
            AdvertisementDA advertisementDA = new AdvertisementDA();
            if (type.equals("")) {

                ArrayList<RegionTO> listRegionTO = regionDA.retrieveAllRegion();
                request.setAttribute("listRegionTO", listRegionTO);
                forward("detailAllOffer.jsp", request, response);
            } else {
                String region = request.getParameter("region") != null ? (String) request.getParameter("region") : "0";
                int regionInt;
                try {
                    regionInt = Integer.parseInt(region);
                } catch (NumberFormatException e) {
                    regionInt = 0;
                }
                ArrayList<AdvertisementTO> listAdvertisementTO = (ArrayList<AdvertisementTO>) advertisementDA.retrievePackageByRegionId(regionInt);
                request.setAttribute("listAdvertisementTO", listAdvertisementTO);
                RegionTO regionTO = regionDA.retrieveAllRegion(regionInt);
                request.setAttribute("regionTO",regionTO);
                forward("DetailOfferRegion.jsp",request,response);
            }
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
