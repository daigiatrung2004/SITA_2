package servlet.Admin;

import DAO.AnnoucementDA;
import DTO.AnnoucementTO;
import DTO.EmployeeTO;
import DTO.StaticTO;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

public class PostAnnouncement extends WebServletAdmin {

    @Override
    protected void process(HttpServletRequest request, HttpServletResponse response) throws SQLException {

        try {
            String type = request.getParameter("type") != null ? (String) request.getParameter("type") : "";
            String title = request.getParameter("title") != null ? (String) request.getParameter("title") : "";
            String content = request.getParameter("content") != null ? (String) request.getParameter("content") : "";
            boolean checkSuccess=false;
            if(!type.equals("")){
                AnnoucementDA annoucementDA=new AnnoucementDA();
                EmployeeTO employeeTO=(EmployeeTO)session.getAttribute("admin_id");
                Date date=new Date();
                DateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd");
                String dateStr=dateFormat.format(date);
                AnnoucementTO annoucementTO=new AnnoucementTO(0,title,content,employeeTO.getId(), StaticTO.ACTIVE_STATUS,"",dateStr);
                checkSuccess=annoucementDA.addAnnoucement(annoucementTO);
                forward("Admin/postAnnouncement.jsp?checkSuccess="+checkSuccess, request, response);
            }else {
                forward("Admin/postAnnouncement.jsp", request, response);
            }
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
