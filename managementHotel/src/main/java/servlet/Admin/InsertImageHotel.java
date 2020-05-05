package servlet.Admin;

import DAO.RegionDA;
import DTO.RegionTO;

import javax.servlet.ServletException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;


public class InsertImageHotel extends WebServletAdmin {

    @Override
    protected void process(HttpServletRequest request, HttpServletResponse response) throws SQLException {

        try {
            String type=request.getParameter("type")!=null?(String)request.getParameter("type"):"";
            if(type.equals("")) {
                RegionDA regionDA = new RegionDA();
                ArrayList<RegionTO> listRegion = regionDA.retrieveAllRegion();
                request.setAttribute("listRegion", listRegion);
                forward("/Admin/InsertImgHotel.jsp", request, response);
            }else{
                String listSrc=request.getParameter("listsrc")!=null?(String)request.getParameter("listsrc"):"";
                String listImgSource=request.getParameter("listomgorgin")!=null?(String)request.getParameter("listomgorgin"):"";
                System.out.println("listImgSource:"+listImgSource);
                System.out.println("listSrc:"+listSrc);
            }
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
