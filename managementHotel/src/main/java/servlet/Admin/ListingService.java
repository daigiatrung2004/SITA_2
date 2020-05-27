package servlet.Admin;

import DAO.ServiceDA;
import DTO.ServiceTO;
import DTO.StaticTO;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

public class ListingService extends WebServletAdmin {

    @Override
    protected void process(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        try {
            String type = request.getParameter("type") != null ? (String) request.getParameter("type") : "";
            ServiceDA serviceDA = new ServiceDA();
            String id = request.getParameter("id") != null ? (String) request.getParameter("id") : "0";
            int idInt;
            try {
                idInt = Integer.parseInt(id);
            } catch (NumberFormatException e) {
                idInt = 0;
            }
            if (type.equals("")) {

                ArrayList<ServiceTO> listService = serviceDA.retrieveAllService();
                request.setAttribute("listService", listService);
                forward("Admin/listingService.jsp", request, response);
            } else if (type.equals("delete-service")) {


                ServiceTO serviceTO = serviceDA.retrieveServiceById(idInt);
                serviceTO.setStatus(StaticTO.REMOVE_STATUS);
                boolean checkSuccess=serviceDA.updateService(serviceTO);
                response.getWriter().print("{\"success\":"+checkSuccess+"}");
            }else if(type.equals("edit-service")){
                ServiceTO serviceTO = serviceDA.retrieveServiceById(idInt);
                request.setAttribute("serviceTO",serviceTO);

                forward("Admin/edit-service.jsp",request,response);
            }else if(type.equals("edited-service")){
                 String name_service_vi=request.getParameter("name_service_vi")!=null?(String)request.getParameter("name_service_vi"):"";
                 String name_service_en=request.getParameter("name_service_en")!=null?(String)request.getParameter("name_service_en"):"";
                 String content_service_vi=request.getParameter("content_service_vi")!=null?(String)request.getParameter("content_service_vi"):"";
                 String content_service_en=request.getParameter("content_service_en")!=null?(String)request.getParameter("content_service_en"):"";
                ServiceTO serviceTO = serviceDA.retrieveServiceById(idInt);
                serviceTO.setService_name_vi(name_service_vi);
                serviceTO.setService_name_en(name_service_en);
                serviceTO.setService_details_en(content_service_en);
                serviceTO.setService_name_vi(content_service_vi);
                boolean checkSuccess=serviceDA.updateService(serviceTO);
                response.sendRedirect("ListingHotelManager?checkSuccess="+checkSuccess);
            }
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
