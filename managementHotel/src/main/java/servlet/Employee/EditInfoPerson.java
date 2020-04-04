package servlet.Employee;

import DAO.EmployeeDA;
import DTO.EmployeeTO;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

public class EditInfoPerson extends WebServletEmployee {

    @Override
    protected void process(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        try {
            String id = request.getParameter("id") != null ? (String) request.getParameter("id") : "0";
            String firstname = request.getParameter("firstname") != null ? (String) request.getParameter("firstname") : "";
            String lastname = request.getParameter("lastname") != null ? (String) request.getParameter("lastname") : "";
            String address = request.getParameter("address") != null ? (String) request.getParameter("address") : "";
            String city = request.getParameter("city") != null ? (String) request.getParameter("city") : "";
            String phone = request.getParameter("phone") != null ? (String) request.getParameter("phone") : "";
            String email = request.getParameter("email") != null ? (String) request.getParameter("email") : "";
            EmployeeTO employeeTO = (EmployeeTO) session.getAttribute("mem_sid");
            employeeTO.setFirstName(firstname);
            employeeTO.setLastName(lastname);
            employeeTO.setAddress(address);
            employeeTO.setCountry(city);
            employeeTO.setContact_person(phone);
            employeeTO.setContact_email(email);
            EmployeeDA employeeDA = new EmployeeDA();
            boolean checkSuccess = false;
            checkSuccess = employeeDA.updateEmployee(employeeTO);
            if(checkSuccess){
                session.removeAttribute("mem_sid");
                session.setAttribute("mem_sid",employeeTO);

            }
            forward("InformationEmployee",request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }
}
