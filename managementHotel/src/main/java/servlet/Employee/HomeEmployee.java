package servlet.Employee;

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
        EmployeeTO employeeTO=(EmployeeTO)session.getAttribute("mem_sid");
        try {
            if(employeeTO!=null){
                forward("/EMPLOYEE/homeEmployee.jsp",request,response);
            }else{
                forward("LoginEmployee_V2",request,response);
            }
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


}
