package servlet;

import DAO.RegionDA;
import DTO.RegionTO;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

public class BenefitBooking extends WebServlet {

    @Override
    protected void process(HttpServletRequest request, HttpServletResponse response) {
        try {
            RegionDA regionDA=new RegionDA();
            ArrayList<RegionTO> listRegionTO=regionDA.retrieveAllRegion();
            request.setAttribute("listRegionTO",listRegionTO);
            forward("benefitBooking.jsp",request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
