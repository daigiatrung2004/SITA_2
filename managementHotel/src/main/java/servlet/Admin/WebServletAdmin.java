package servlet.Admin;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

public abstract class WebServletAdmin extends HttpServlet {
    protected HttpSession session;
    protected abstract void process(HttpServletRequest request, HttpServletResponse response) throws SQLException;

    protected void forward(String url, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher(url);
        String web_server = getServletContext().getInitParameter("WEB_SERVER_ADMIN");
        request.setAttribute("web_server_admin", web_server);
        requestDispatcher.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        session=request.getSession();
        try {
            process(request,response);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return ;
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        session=request.getSession();
        try {
            process(request,response);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return ;
    }
}
