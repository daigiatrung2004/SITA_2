package servlet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class PR extends WebServlet {

    @Override
    protected void process(HttpServletRequest request, HttpServletResponse response) {
        try {
             String type=request.getParameter("type")!=null?(String)request.getParameter("type"):"";
             if(type.equals("")) {
                 forward("pr-static.jsp", request, response);
             }else{
                 forward("experience-static.jsp",request,response);
             }
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
