package servlet;

import DAO.BookingDA;
import DAO.RegionDA;
import DAO.RoomOfALLDA;
import DAO.SystemDA;
import DTO.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.InetAddress;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

public class Home extends WebServlet {

    @Override
    protected void process(HttpServletRequest request, HttpServletResponse response) {


        try {
            request.setCharacterEncoding("UTF-8");
            response.setCharacterEncoding("UTF-8");
            response.setContentType("text/html; charset=UTF-8");
            RegionDA regionDA = new RegionDA();
            //Cập nhật check booking nếu thời gian check in mà lớn hơn thời gian check out thì cập nhật lại thành active
            Date time = new Date();
            DateFormat dateFormat = new SimpleDateFormat("HH");
            DateFormat dateFormat1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            RoomOfALLDA roomOfALLDA = new RoomOfALLDA();
            BookingDA bookingDA = new BookingDA();
            ArrayList<BookingTO> listBooking = bookingDA.retrieveAllBooking();
            for (int i = 0; i < listBooking.size(); i++) {
                Date date_current = new Date();
                Date date_check_out = null;
                long now, checkOut;
                try {

                    now = date_current.getTime();
                    date_check_out = dateFormat1.parse(listBooking.get(i).getCheck_out_date());
                    checkOut = date_check_out.getTime();
                } catch (ParseException e) {
                    now = 0;
                    checkOut = 0;
                } catch (Exception e) {
                    now = 0;
                    checkOut = 0;
                }
//                System.out.println("now=" + now + "checcheckOut=" + checkOut);
                if (now >= checkOut && (listBooking.get(i).equals(StaticTO.ACTIVE_STATUS))) {
                    listBooking.get(i).setStatus(StaticTO.REMOVE_STATUS);
                    bookingDA.updateBooking(listBooking.get(i));
                    CustomerTO customer = bookingDA.retrieveCustomer(listBooking.get(i).getCustomer_id());

                    customer.setStatus(StaticTO.REMOVE_STATUS);
                    bookingDA.updateCustomer(customer);
                    RoomOfALLDA roomOfALLDA1 = new RoomOfALLDA();
                    RoomTO roomTO = roomOfALLDA1.searchRoomById(listBooking.get(i).getRoom_id());
                    roomTO.setStatus(StaticTO.ACTIVE_STATUS);
                    roomOfALLDA.updateRoom(roomTO);

                }


            }

            //

            ArrayList<RegionTO> listRegionTO = (ArrayList<RegionTO>) regionDA.retrieveAllRegion();
            request.setAttribute("listRegionTO", listRegionTO);
            // tính lượt views
            String ip = request.getRemoteAddr();
            if (ip.equalsIgnoreCase("0:0:0:0:0:0:0:1")) {
                InetAddress inetAddress = InetAddress.getLocalHost();
                String ipAddress = inetAddress.getHostAddress();
                ip = ipAddress;
            }
            SystemDA systemDA = new SystemDA();
            Date date = new Date();
            DateFormat dateformat = new SimpleDateFormat("yyyy-MM-dd");
            DateFormat dateformat2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            String dateStr = dateformat.format(date);
            String startDate = dateStr + " 00:00:00";
            String endDate = dateStr + " 23:59:00";
            if (!systemDA.checkViews(ip, startDate, endDate)) {
                SystemTO systemTO = new SystemTO(0, StaticTO.KEY_VIEW, ip, StaticTO.TYPE_VIEWS, "1", dateformat2.format(date));
                boolean checkSuccess = systemDA.addView(systemTO);
                System.out.println("addCheckSuceess:" + checkSuccess);

            }

            forward("/index.jsp", request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
