package servlet.Admin;

import DAO.EmployeeDA;
import DTO.EmployeeTO;
import DTO.PositionEmployeeTO;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

public class ListingHR extends WebServletAdmin {

    @Override
    protected void process(HttpServletRequest request, HttpServletResponse response) throws SQLException {

        try {
            String position = request.getParameter("position") != null ? (String) request.getParameter("position") : "";
            EmployeeDA employeeDA = new EmployeeDA();
            // get all data vi tri
            ArrayList<PositionEmployeeTO> listPos = employeeDA.retreiveAllPositionEmployee();
            request.setAttribute("listPos", listPos);
            ArrayList<EmployeeTO> listEmployeeTO = employeeDA.retrieveALLEmployee();

            for (int i = 0; i < listEmployeeTO.size(); i++) {
                PositionEmployeeTO pos = employeeDA.retrieveEmployeeById(listEmployeeTO.get(i).getPositionEmployeeId());
                if (pos != null) {
                    listEmployeeTO.get(i).setPostionName(pos.getName());
                }
            }
            request.setAttribute("listEmployeeTO", listEmployeeTO);
            // dk neu co fetch vi tri
            request.setAttribute("position", position);
            forward("/Admin/ListingHR.jsp", request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
