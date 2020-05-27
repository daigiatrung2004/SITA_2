package servlet.Admin;

import DAO.EmployeeDA;
import DTO.EmployeeTO;
import Utils.EncryptDecryptPassword;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;

public abstract class WebServletAdmin extends HttpServlet {
    protected HttpSession session;

    protected abstract void process(HttpServletRequest request, HttpServletResponse response) throws SQLException;

    protected void forward(String url, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        RequestDispatcher requestDispatcher = request.getRequestDispatcher(url);
        String web_server = getServletContext().getInitParameter("WEB_SERVER_ADMIN");
        request.setAttribute("web_server_admin", web_server);
        requestDispatcher.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        session = request.getSession();
        try {
            checkCookies(request,response);
            process(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return;
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        session = request.getSession();
        try {
            checkCookies(request,response);
            process(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return;
    }

    protected void checkCookies(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        EmployeeTO employeeTO_1=(EmployeeTO)request.getSession().getAttribute("admin_id");
        if(employeeTO_1==null) {
            Cookie[] cookies = request.getCookies();
            HttpSession session = request.getSession();
            for (int i = 0; i < cookies.length; i++) {
                if (cookies[i].getName().equals("acc_admin")) {
                    String username = cookies[i].getValue().substring(0,cookies[i].getValue().indexOf("^"));
                    String password=cookies[i].getValue().substring(cookies[i].getValue().indexOf("^")+1,cookies[i].getValue().length());


                        EmployeeDA employeeDA = new EmployeeDA();
                        EmployeeTO employeeTO = employeeDA.retrieveEmployeeByEmail(username);
                        EncryptDecryptPassword encryptDecryptPassword = new EncryptDecryptPassword(employeeTO.getSankey());

                        String pass = encryptDecryptPassword.decrypt(employeeTO.getEncryptpass());
                        if (employeeTO != null && (pass.equals(password))) {
                            session.setAttribute("admin_id", employeeTO);
                        }


                }
            }
        }
    }
}
