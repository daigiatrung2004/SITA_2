package servlet.Ajax;

import DAO.BookingDA;
import DAO.RegionDA;
import DAO.RoomOfALLDA;
import DTO.*;
import com.mysql.cj.Session;
import servlet.Employee.WebServletEmployee;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

public class AjaxListingBooking extends WebServletEmployee {

    @Override
    protected void process(HttpServletRequest request, HttpServletResponse response) throws SQLException {

        try {
            // booking
            String name=request.getParameter("name")!=null?(String)request.getParameter("name"):"";
            EmployeeTO employeeTO=(EmployeeTO)request.getSession().getAttribute("mem_sid");
            BookingDA bookingDA = new BookingDA();
            ArrayList<BookingTO> listBooking = bookingDA.retrieveAllBookingByRegion(employeeTO.getRegion_id(),name);
            request.setAttribute("listBooking", listBooking);
            //danh sach room
            RoomOfALLDA roomOfALLDA = new RoomOfALLDA();

            RegionDA regionDA = new RegionDA();
            ArrayList<RoomTO> listRoomTO=null;
            if (listBooking != null && listBooking.size() > 0) {
                listRoomTO= new ArrayList<RoomTO>();
                for (int i = 0; i < listBooking.size(); i++) {
                    BookingTO bookingTO = listBooking.get(i);
                    KindRoomTO kindRoomTO = roomOfALLDA.retrieveKindRoomById(bookingTO.getKind_room_id());
                    RegionTO regionTO = regionDA.retrieveAllRegion(bookingTO.getRegion_id());
                    RoomTO roomTO = roomOfALLDA.searchRoomById(bookingTO.getRoom_id());
                    CustomerTO customer=bookingDA.retrieveCustomer(bookingTO.getCustomer_id());
                    RoomTO roomTO1 = new RoomTO(kindRoomTO, regionTO, roomTO,customer);
                    listRoomTO.add(roomTO1);
                }
            }
            request.setAttribute("listRoomTO", listRoomTO);


            forward("/EMPLOYEE/detailBooking.jsp", request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
