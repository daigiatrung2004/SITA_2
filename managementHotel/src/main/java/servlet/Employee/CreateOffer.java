package servlet.Employee;

import DAO.AdvertisementDA;
import DAO.PromoteDA;
import DAO.RegionDA;
import DTO.AdvertisementTO;
import DTO.EmployeeTO;
import DTO.PromoteTO;
import DTO.StaticTO;
import Utils.SaveImageInServer;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

public class CreateOffer extends WebServletEmployee {

    @Override
    protected void process(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        try {
            String type=request.getParameter("type")!=null?(String)request.getParameter("type"):"";
            EmployeeTO employeeTO=(EmployeeTO)session.getAttribute("mem_sid");
            if(employeeTO==null){
                response.sendRedirect("/LoginEmployee");
            }
            String title=request.getParameter("title")!=null?(String)request.getParameter("title"):"";
            String shortDescription=request.getParameter("shortDescription")!=null?(String)request.getParameter("shortDescription"):"";
            String Description=request.getParameter("Description")!=null?(String)request.getParameter("Description"):"";
            String src=request.getParameter("src")!=null?(String)request.getParameter("src"):"";
            String name=request.getParameter("name")!=null?(String)request.getParameter("name"):"";
            String filename_origin=request.getParameter("filename_origin")!=null?(String)request.getParameter("filename_origin"):"";
            String input_img_src=request.getParameter("input_img_src")!=null?(String)request.getParameter("input_img_src"):"";
            String start_date=request.getParameter("start_date")!=null?(String)request.getParameter("start_date"):"";
            String end_date=request.getParameter("end_date")!=null?(String)request.getParameter("end_date"):"";
            String promoteid=request.getParameter("promoteid")!=null?(String)request.getParameter("promoteid"):"";
            String title_en=request.getParameter("title_en")!=null?(String)request.getParameter("title_en"):"";
            String description_en=request.getParameter("description_en")!=null?(String)request.getParameter("description_en"):"";
            String short_description_en=request.getParameter("shortDescription_en")!=null?(String)request.getParameter("shortDescription_en"):"";

            String []splitstart_date=start_date.split("/");
            String []splitend_date=end_date.split("/");
            start_date=splitstart_date[2]+"-"+splitend_date[1]+"-"+splitend_date[0];
            end_date=splitend_date[2]+"-"+splitend_date[1]+"-"+splitend_date[0];
            src=src.replaceAll("\"","");
            name=name.replaceAll("\"","");
            String []splliname=name.split("\\.");
            if(splliname.length>0){
                name=splliname[0];
            }
            if(type.equals("insert")){

               String path= SaveImageInServer.createImageFromBase64(src,name);
               int promoteidLong;
                try {
                    promoteidLong=Integer.parseInt(promoteid);
                } catch (NumberFormatException e) {
                    promoteidLong=0;
                }
                AdvertisementTO advertisementTO=new AdvertisementTO(0,title,shortDescription,path,start_date,end_date,employeeTO.getRegion_id(),"", StaticTO.ACTIVE_STATUS,promoteidLong,Description,title_en,description_en,short_description_en);
                AdvertisementDA advertisementDA=new AdvertisementDA();
                boolean checkSucess=advertisementDA.addPackage(advertisementTO);
                 response.getWriter().print("{\"success\":"+checkSucess+"}");

            }
            else if(type.equals("update")){
                AdvertisementDA advertisementDA=new AdvertisementDA();
                String id=request.getParameter("id")!=null?(String)request.getParameter("id"):"";
                long idLong;
                try {
                    idLong=Long.parseLong(id);
                } catch (NumberFormatException e) {
                    idLong=0;
                }
                AdvertisementTO advertisementTOOld=advertisementDA.retrievePackageById(idLong);
                String path= null;
                try {
                    path = SaveImageInServer.createImageFromBase64(src,name);
                } catch (Exception e) {
                    path=advertisementTOOld.getFILE_URL_IMG();
                }
                if(!path.equals(advertisementTOOld.getFILE_URL_IMG())){
                    SaveImageInServer.deleteFileName(advertisementTOOld.getFILE_URL_IMG());
                }
                int promoteidLong;
                try {
                    promoteidLong=Integer.parseInt(promoteid);
                } catch (NumberFormatException e) {
                    promoteidLong=0;
                }
                AdvertisementTO advertisementTO=new AdvertisementTO(idLong,title,shortDescription,path,start_date,end_date,employeeTO.getRegion_id(),"", StaticTO.ACTIVE_STATUS,promoteidLong,Description,title_en,description_en,short_description_en);

                boolean checkSucess=advertisementDA.updatePackage(advertisementTO);
                response.getWriter().print("{\"success\":"+checkSucess+"}");
            }
            else {
                PromoteDA promoteDA = new PromoteDA();
                ArrayList<PromoteTO> listPromote = promoteDA.retreiveAllPromote();
                request.setAttribute("listPromote", listPromote);
                forward("/EMPLOYEE/createOffer.jsp", request, response);
            }
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
