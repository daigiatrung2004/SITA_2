package servlet.Admin;

import DAO.EmployeeDA;
import DTO.EmployeeTO;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

public class InfoAdmin extends WebServletAdmin {

    @Override
    protected void process(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        try {
            String type = request.getParameter("type") != null ? (String) request.getParameter("type") : "";
            String address = request.getParameter("address") != null ? (String) request.getParameter("address") : "";
            String city = request.getParameter("city") != null ? (String) request.getParameter("city") : "";
            String phone = request.getParameter("phone") != null ? (String) request.getParameter("phone") : "";
            String email = request.getParameter("email") != null ? (String) request.getParameter("email") : "";
            if (type.equals("")) {
                forward("Admin/infoAdmin.jsp", request, response);
            }else{
                EmployeeTO employeeTO=(EmployeeTO)session.getAttribute("admin_id");
                employeeTO.setContact_email(email);
                employeeTO.setAddress(address);
                employeeTO.setContact_person(phone);
                employeeTO.setCountry(city);
                EmployeeDA employeeDA=new EmployeeDA();
                boolean checkSuccess=employeeDA.updateEmployee(employeeTO);
                request.setAttribute("checkSuccess",checkSuccess);
                forward("Admin/infoAdmin.jsp?checkSuccess="+checkSuccess, request, response);

            }
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
