package servlet.Employee;

import DAO.EmployeeDA;
import DTO.EmployeeTO;
import Utils.EncryptDecryptPassword;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class LoginEmployee_V2 extends WebServletEmployee {
    @Override
    protected void process(HttpServletRequest request, HttpServletResponse response) {
        String checkLogin = request.getParameter("login") != null ? (String) request.getParameter("login") : "false";
        try {
            EmployeeTO employeeTO=null;
            if (checkLogin.equals("false")) {
                // chua co seesion dang nhap
                employeeTO=(EmployeeTO)session.getAttribute("mem_sid");
                if(employeeTO!=null){
                   response.sendRedirect("HomeEmployee");
                }else {

                    forward("/EMPLOYEE/loginEmployee.jsp", request, response);
                }
            } else {
                // xac thuc dang nhap
                String email = request.getParameter("email") != null ? (String) request.getParameter("email") : "";
                String password = request.getParameter("password") != null ? (String) request.getParameter("password") : "";
                if(!email.equals("")&&!password.equals("")){
                    employeeTO=Authentiaction(email,password);
                    if(employeeTO!=null){
                        // tam thoi luu seesions
                        session.setAttribute("mem_sid",employeeTO);
                        response.sendRedirect("HomeEmployee");
                    }else{
                        forward("/EMPLOYEE/loginEmployee.jsp?loginStatus=true",request,response);
                    }
                }else{
                    forward("/EMPLOYEE/loginEmployee.jsp?loginStatus=true",request,response);
                }
            }
        } catch (ServletException e) {
            e.printStackTrace();
            System.out.println("Xảy ra lỗi khi loadd login");
        } catch (IOException e) {
            e.printStackTrace();
            System.out.println("Xảy ra lỗi khi loadd login");
        }
    }
    private EmployeeTO Authentiaction(String email,String password){
        EmployeeTO employeeTO=null;
        EmployeeDA employeeDA=new EmployeeDA();
        employeeTO= employeeDA.retrieveEmployeeByEmail(email);
        if(employeeTO!=null){
            // ma hoa dang nhap va tra ket qua ve
            EncryptDecryptPassword encryptDecryptPassword=new EncryptDecryptPassword(employeeTO.getSankey());
            String passwordDB=encryptDecryptPassword.decrypt(employeeTO.getEncryptpass());
            System.out.println("password"+passwordDB);
            boolean comparePasswordResult=false;
            if(!passwordDB.equals(password)){
                employeeTO=null;
            }
        }
        return employeeTO;

    }
}
