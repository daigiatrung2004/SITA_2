package servlet.Admin;

import DAO.RegionDA;
import DAO.TransportDA;
import DTO.RegionTO;
import DTO.TransportTO;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

public class InsertTransport extends WebServletAdmin {

    @Override
    protected void process(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        try {
            // get data  region
            RegionDA regionDA = new RegionDA();
            ArrayList<RegionTO> region = regionDA.retrieveAllRegion();
            //get data transport
            TransportDA transportDA = new TransportDA();
            ArrayList<TransportTO> transport = transportDA.retreiveAllTransport();
            request.setAttribute("region",region);
            request.setAttribute("transport",transport);

            forward("Admin/InsertTransport.jsp", request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
