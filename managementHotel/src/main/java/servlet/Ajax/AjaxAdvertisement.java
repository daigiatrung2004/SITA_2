package servlet.Ajax;

import DAO.AdvertisementDA;
import DTO.AdvertisementTO;
import DTO.StaticTO;
import servlet.Employee.WebServletEmployee;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class AjaxAdvertisement extends WebServletEmployee {

    @Override
    protected void process(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        String id=request.getParameter("id")!=null?(String)request.getParameter("id"):"0";
        String type=request.getParameter("type")!=null?(String)request.getParameter("type"):"";
        AdvertisementDA advertisementDA = new AdvertisementDA();
        long idLong;
        try {
            idLong=Long.parseLong(id);
        } catch (NumberFormatException e) {
            idLong=0;
        }
        if(type.equals("delete")){
            AdvertisementTO advertisementTO = advertisementDA.retrievePackageById(idLong);
            Date startdate=null,enddate=null;
            DateFormat dateFormat=new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");

            try {
                startdate=dateFormat.parse(advertisementTO.getSTART_DATE());
                enddate=dateFormat.parse(advertisementTO.getEND_DATE());
            } catch (ParseException e) {
                e.printStackTrace();
            }
             DateFormat dateFormat1=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            if(startdate!=null&&enddate!=null){
                advertisementTO.setSTART_DATE(dateFormat1.format(startdate));
                advertisementTO.setEND_DATE(dateFormat1.format(enddate));
            }


            advertisementTO.setSTATUS(StaticTO.REMOVE_STATUS);
            boolean checkSuccess=advertisementDA.updatePackage(advertisementTO);
            try {
                response.getWriter().print("{\"success\":"+checkSuccess+"}");
            } catch (IOException e) {
                e.printStackTrace();
            }
        }else {

            AdvertisementTO advertisementTO = advertisementDA.retrievePackageById(idLong);
            request.setAttribute("advertisementTO", advertisementTO);
            try {
                forward("Admin/detailOffer.jsp", request, response);
            } catch (ServletException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }
}
