package servlet.Admin;

import DTO.EmployeeTO;
import servlet.WebServlet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class Admin extends WebServletAdmin {
    @Override
    protected void process(HttpServletRequest request, HttpServletResponse response) {
        try {
            EmployeeTO employeeTO=(EmployeeTO) session.getAttribute("admin_id");
            if(employeeTO!=null){
                request.setAttribute("employeeTO",employeeTO);
                forward("/Admin/HomeAdmin.jsp",request,response);
            }else{
                forward("/AuthenticationAdmin", request, response);
            }


        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


}
