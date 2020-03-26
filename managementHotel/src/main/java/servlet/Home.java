package servlet;

import DAO.RegionDA;
import DTO.RegionTO;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

public class Home extends WebServlet {

    @Override
    protected void process(HttpServletRequest request, HttpServletResponse response) {


        try {
            request.setCharacterEncoding("UTF-8");
            response.setCharacterEncoding("UTF-8");
            response.setContentType("text/html; charset=UTF-8");
            RegionDA regionDA=new RegionDA();

            ArrayList<RegionTO> listRegionTO=(ArrayList<RegionTO>)regionDA.retrieveAllRegion();
            request.setAttribute("listRegionTO",listRegionTO);


            forward("/index.jsp",request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
