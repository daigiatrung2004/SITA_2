package servlet.Employee;

import DAO.AnnoucementDA;
import DTO.AnnoucementTO;
import DTO.EmployeeTO;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

public class Announcement extends WebServletEmployee {
    @Override
    protected void process(HttpServletRequest request, HttpServletResponse response) throws SQLException {

        try {
            EmployeeTO employeeTO=(EmployeeTO) session.getAttribute("mem_sid");
            if(employeeTO!=null){
                AnnoucementDA annoucementDA=new AnnoucementDA();
                ArrayList<AnnoucementTO> listAnnoucement=annoucementDA.retrieveALLAnounceByEmployee(employeeTO.getId());
                request.setAttribute("listAnnoucement",listAnnoucement);
            }
            forward("/EMPLOYEE/announcement.jsp",request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


}
