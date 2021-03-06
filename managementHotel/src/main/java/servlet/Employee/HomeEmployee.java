package servlet.Employee;

import DAO.AnnoucementDA;
import DTO.EmployeeTO;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

public class HomeEmployee extends WebServletEmployee {
    @Override
    protected void process(HttpServletRequest request, HttpServletResponse response) throws SQLException {



        try {
            EmployeeTO employeeTO=(EmployeeTO)session.getAttribute("mem_sid");
            AnnoucementDA annoucementDA=new AnnoucementDA();

            if(employeeTO!=null){
                // get dữ liêu thông báo
                int countAnnounce=annoucementDA.countAnnoucementUnread(employeeTO.getId());
                request.setAttribute("countAnnounce",String.valueOf(countAnnounce));

                forward("/EMPLOYEE/homeEmployee.jsp", request, response);
            }else{
//                forward("LoginEmployee_V2",request,response);
                response.sendRedirect("LoginPanel");
            }
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


}
