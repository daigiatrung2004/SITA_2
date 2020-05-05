package servlet.Admin;

import DAO.RegionDA;
import DTO.RegionTO;

import javax.servlet.ServletException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;


public class ListingHotelManager extends WebServletAdmin {

    @Override
    protected void process(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        try {
            RegionDA regionDA=new RegionDA();
            ArrayList<RegionTO> listregion=regionDA.retrieveAllRegion();
            request.setAttribute("listregion",listregion);
            forward("/Admin/listingHotelManager.jsp",request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }
}
