package servlet.Employee;

import DAO.AnnoucementDA;
import DTO.AnnoucementTO;
import DTO.EmployeeTO;
import DTO.StaticTO;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

public class Announcement extends WebServletEmployee {
    @Override
    protected void process(HttpServletRequest request, HttpServletResponse response) throws SQLException {

        try {
            String detail = request.getParameter("detail") != null ? (String) request.getParameter("detail") : "0";
            EmployeeTO employeeTO = (EmployeeTO) session.getAttribute("mem_sid");
            AnnoucementDA annoucementDA = new AnnoucementDA();
            if (employeeTO != null) {

                ArrayList<AnnoucementTO> listAnnoucement = annoucementDA.retrieveALLAnounceByEmployee(employeeTO.getId());
                request.setAttribute("listAnnoucement", listAnnoucement);
            }
            if (!detail.equals("0")) {
                long ANNOUNCE_ID;
                try {
                    ANNOUNCE_ID = Long.parseLong(detail);
                } catch (NumberFormatException e) {
                    ANNOUNCE_ID = 0;
                }

                AnnoucementTO annoucementTO = annoucementDA.retrieveAnnounceById(ANNOUNCE_ID);
                AnnoucementTO annoucementTO1=new AnnoucementTO(annoucementTO.getANNOUNCE_ID(),employeeTO.getId(), StaticTO.READ_STATUS);
                annoucementDA.updateAnnounceByEmployee(annoucementTO1);
                request.setAttribute("annoucementTO", annoucementTO);
                forward("/EMPLOYEE/detailAnnouce.jsp",request,response);
            } else {
                forward("/EMPLOYEE/announcement.jsp", request, response);
            }

        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


}
