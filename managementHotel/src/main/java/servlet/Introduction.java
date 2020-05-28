package servlet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class Introduction extends WebServlet {


    @Override
    protected void process(HttpServletRequest request, HttpServletResponse response) {
        try {
            String type = request.getParameter("type") != null ? (String) request.getParameter("type") : "";
            if (type.equals("relax")) {

                forward("relax.jsp", request, response);

            } else if (type.equals("service")) {
                forward("service.jsp", request, response);
            } else {
                forward("amthuc.jsp", request, response);
            }
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
