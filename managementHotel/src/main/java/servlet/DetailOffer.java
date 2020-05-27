package servlet;

import DAO.AdvertisementDA;
import DAO.PromoteDA;
import DAO.RegionDA;
import DTO.AdvertisementTO;
import DTO.PromoteTO;
import DTO.RegionTO;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

public class DetailOffer extends WebServlet {

    @Override
    protected void process(HttpServletRequest request, HttpServletResponse response) {
        try {
            String regionid=request.getParameter("regionid")!=null?(String)request.getParameter("regionid"):"0";
            String packageid=request.getParameter("packageid")!=null?(String)request.getParameter("packageid"):"0";
            int regionidInt;
            try {
                regionidInt=Integer.parseInt(regionid);
            } catch (NumberFormatException e) {
                regionidInt=0;
            }

            RegionDA regionDA=new RegionDA();
            RegionTO regionTO=regionDA.retrieveAllRegion(regionidInt);
            request.setAttribute("regionTO",regionTO);
            AdvertisementDA advertisementDA=new AdvertisementDA();
            long packageidLong;
            try {
                packageidLong=Long.parseLong(packageid);
            } catch (NumberFormatException e) {
                packageidLong=0;
            }
            AdvertisementTO advertisementTO =advertisementDA.retrievePackageById(packageidLong);
            PromoteDA promoteDA=new PromoteDA();
            if(advertisementTO!=null) {
                PromoteTO promoteTO=promoteDA.retrievePromotePrice(advertisementTO.getPromote_id());
                request.setAttribute("promoteTO",promoteTO);
                request.setAttribute("advertisementTO", advertisementTO);
            }
            // lay ra nhung package other
            ArrayList<AdvertisementTO> listAdvertisementOther=advertisementDA.retrieveAllNotPackageNow(packageidLong,regionidInt);
            if(listAdvertisementOther!=null&&listAdvertisementOther.size()>0) {
                request.setAttribute("listAdvertisementOther", listAdvertisementOther);
            }
            forward("detailOffer.jsp",request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
