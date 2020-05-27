package servlet.Admin;

import DAO.RegionDA;
import DAO.TransportDA;
import DTO.RegionTO;
import DTO.StaticTO;
import DTO.TransportTO;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

public class ListingTransport extends WebServletAdmin {

    @Override
    protected void process(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        try {
            RegionDA regionDA=new RegionDA();
            TransportDA transportDA=new TransportDA();
            String type=request.getParameter("type")!=null?(String)request.getParameter("type"):"";
            String transportid=request.getParameter("transportid")!=null?(String)request.getParameter("transportid"):"0";
            long transportidLong;
            try {
                transportidLong=Long.parseLong(transportid);
            } catch (NumberFormatException e) {
                transportidLong=0;
            }
            if(type.equals("region")) {
                ArrayList<RegionTO> listRegionTO = (ArrayList<RegionTO>) regionDA.retrieveAllRegion();
                ArrayList listAllTransport = new ArrayList();

                request.setAttribute("listRegionTO", listRegionTO);
                if (listRegionTO != null) {
                    for (int i = 0; i < listRegionTO.size(); i++) {
                        ArrayList<TransportTO> listTransport = transportDA.retreiveAllTransByRegionId(listRegionTO.get(i).getRegion_id());
                        listAllTransport.add(listTransport);
                    }
                }
                request.setAttribute("listAllTransport", listAllTransport);
                forward("/Admin/listingTransport.jsp", request, response);
            }
            else if(type.equals("delete")){
                // delete item trong danh sach  transport


                TransportTO transportTO=transportDA.retreiveAllTransById(transportidLong);
                transportTO.setStatus(StaticTO.REMOVE_STATUS);
                boolean checkSuccess=transportDA.updateTransport(transportTO);
                response.getWriter().print("{\"success\":"+checkSuccess+"}");

            }
            else if(type.equals("edit")){
                TransportTO transportTO=transportDA.retreiveAllTransById(transportidLong);
                request.setAttribute("transportTO",transportTO);
                forward("Admin/edit-transport.jsp",request,response);

            }
            else if(type.equals("updated")){
                String name_vi=request.getParameter("name_vi")!=null?(String)request.getParameter("name_vi"):"";
                String name_en=request.getParameter("name_en")!=null?(String)request.getParameter("name_en"):"";
                String details_vi=request.getParameter("details_vi")!=null?(String)request.getParameter("details_vi"):"";
                String details_en=request.getParameter("details_en")!=null?(String)request.getParameter("details_en"):"";
                String price=request.getParameter("price")!=null?(String)request.getParameter("price"):"0";
                String remark=request.getParameter("remark")!=null?(String)request.getParameter("remark"):"";
                long priceLong;
                try {
                    priceLong=Long.parseLong(price);
                } catch (NumberFormatException e) {
                    priceLong=0;
                }
                TransportTO transportTO=new TransportTO(transportidLong,name_vi,name_en,details_vi,details_en,priceLong,StaticTO.ACTIVE_STATUS,remark);
                transportDA.updateTransport(transportTO);
                response.sendRedirect("/ListingTransport");
            }
            else {
              ArrayList<TransportTO> listtransport=transportDA.retreiveAllTransport();
              request.setAttribute("listtransport",listtransport);
               forward("Admin/TransportAll.jsp",request,response);
            }
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
