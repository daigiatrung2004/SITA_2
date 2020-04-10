package servlet.Admin;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

public class LogOut extends WebServletAdmin {
    @Override
    protected void process(HttpServletRequest request, HttpServletResponse response) throws SQLException {

        try {
            session.removeAttribute("admin_id");
            Cookie[] cookies = request.getCookies();
            for (int i = 0; i < cookies.length; i++) {
                if (cookies[i].getName().equals("acc_admin")) {
                      cookies[i].setMaxAge(0);
                      response.addCookie(cookies[i]);
                      break;
                }
            }
            response.sendRedirect("Admin");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


}
