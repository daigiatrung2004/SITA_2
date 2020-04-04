package servlet.Employee;

import DAO.RoomOfALLDA;
import DTO.EmployeeTO;
import DTO.RoomTO;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

public class ListingRoom extends WebServletEmployee {

    @Override
    protected void process(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        try {
            RoomOfALLDA roomOfALLDA = new RoomOfALLDA();
            EmployeeTO employeeTO = (EmployeeTO) session.getAttribute("mem_sid");
            ArrayList<RoomTO> listRoomTO = roomOfALLDA.retrieveRoomByRegionId(employeeTO.getRegion_id());

            request.setAttribute("listRoomTO", listRoomTO);
            forward("/EMPLOYEE/listingRoom.jsp", request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
