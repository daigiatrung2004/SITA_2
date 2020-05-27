package servlet.Employee;

import DAO.AdvertisementDA;
import DAO.PromoteDA;
import DTO.AdvertisementTO;
import DTO.EmployeeTO;
import DTO.PromoteTO;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

public class Advertisement extends WebServletEmployee {

    @Override
    protected void process(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        try {
            String type = request.getParameter("type") != null ? (String) request.getParameter("type") : "";
            AdvertisementDA advertisementDA = new AdvertisementDA();
            if (type.equals("")) {

                EmployeeTO employeeTO = (EmployeeTO) session.getAttribute("mem_sid");
                if (employeeTO == null) {
                    response.sendRedirect("/LoginEmployee");
                    return;
                }
                ArrayList<AdvertisementTO> listAdvertisementTO = advertisementDA.retrievePackageByRegionId(employeeTO.getRegion_id());
                request.setAttribute("listAdvertisementTO", listAdvertisementTO);
                forward("/EMPLOYEE/advertisement.jsp", request, response);
            } else {
                String id = request.getParameter("id") != null ? (String) request.getParameter("id") : "";
                long idLong;
                try {
                    idLong = Long.parseLong(id);
                } catch (NumberFormatException e) {
                    idLong = 0;
                }
                AdvertisementTO advertisementTO = advertisementDA.retrievePackageById(idLong);
                request.setAttribute("advertisementTO", advertisementTO);
                PromoteDA promoteDA=new PromoteDA();
                ArrayList<PromoteTO> listPromote=promoteDA.retreiveAllPromote();
                request.setAttribute("listPromote",listPromote);
                forward("/EMPLOYEE/edit-advertisement.jsp", request, response);
            }
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
