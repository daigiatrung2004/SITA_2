package servlet.Admin;

import DAO.EmployeeDA;
import DTO.EmployeeTO;
import DTO.StaticTO;
import Utils.EncryptDecryptPassword;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class AuthenticationAdmin extends WebServletAdmin {
    public static int Max_Age_Cookies_1_Year = 1000 * 60 * 60 * 24 * 365;

    @Override
    protected void process(HttpServletRequest request, HttpServletResponse response) {
        try {
            String LoginPanel = request.getParameter("LoginPanel") != null ? (String) request.getParameter("LoginPanel") : "false";
            if (LoginPanel.equals("false")) {
                forward("/Admin/LoginAdmin.jsp", request, response);
            } else {
                String username = request.getParameter("username") != null ? (String) request.getParameter("username") : "false";
                String password = request.getParameter("password") != null ? (String) request.getParameter("password") : "false";
                EmployeeTO employeeTO = authentication(username, password);
                if (employeeTO != null) {
                    addCookies(request, response, username, password);
                    response.sendRedirect("Admin");
                } else {
                    forward("/Admin/LoginAdmin.jsp?loginStatus=true", request, response);
                }
            }
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private EmployeeTO authentication(String username, String password) {
        EmployeeTO employeeTO = null;
        EmployeeDA adminDA = new EmployeeDA();
        employeeTO = adminDA.retrieveEmployeeByEmail(username);
        if (employeeTO != null) {
            EncryptDecryptPassword encryptDecryptPassword = new EncryptDecryptPassword(employeeTO.getSankey());
            if (employeeTO.getPositionEmployeeId() == StaticTO.ADMINID) {
                System.out.println("decrypt " + encryptDecryptPassword.decrypt(employeeTO.getEncryptpass()));
                if (!encryptDecryptPassword.decrypt(employeeTO.getEncryptpass()).equals(password)) {
                    employeeTO = null;
                } else {
                    session.setAttribute("admin_id", employeeTO);
                }
            }
        }

        return employeeTO;
    }

    protected void addCookies(HttpServletRequest request, HttpServletResponse response, String username, String password) {

        Cookie cookie = new Cookie("acc_admin", username + "^" + password);
        cookie.setMaxAge(Max_Age_Cookies_1_Year);
        response.addCookie(cookie);
    }
}
