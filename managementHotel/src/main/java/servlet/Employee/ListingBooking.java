
package servlet.Employee;

import DAO.RoomOfALLDA;
import DTO.RoomTO;
import DTO.StaticTO;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

public class ListingBooking extends WebServletEmployee {

    @Override
    protected void process(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        try {
            String type=request.getParameter("type")!=null?(String)request.getParameter("type"):"";

            if(type.equals("")) {
                forward("/EMPLOYEE/listingBooking.jsp", request, response);
            }else{
                String roomId=request.getParameter("roomId")!=null?(String)request.getParameter("roomId"):"0";
                int roomIdInt;
                try {
                    roomIdInt=Integer.parseInt(roomId);
                } catch (NumberFormatException e) {
                    roomIdInt=0;
                }
                RoomOfALLDA roomOfALLDA=new RoomOfALLDA();
                RoomTO roomTO=roomOfALLDA.searchRoomById(roomIdInt);
                if(roomTO!=null) {
                    roomTO.setStatus(StaticTO.COMPLETE_STATUS);
                    boolean checkSucess = roomOfALLDA.updateRoom(roomTO);
                    if (checkSucess) {
                        response.sendRedirect("CheckOut?roomId=" + roomTO.getRoom_id());
                    } else {
                        forward("/EMPLOYEE/listingBooking.jsp", request, response);
                    }
                }else{
                    forward("/EMPLOYEE/listingBooking.jsp", request, response);
                }
            }
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
