package servlet.Ajax;

import DAO.ServiceDA;
import DTO.ServiceRoomTO;
import servlet.Admin.WebServletAdmin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

public class AjaxInsertServiceRoom extends WebServletAdmin {

    @Override
    protected void process(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        String listService = request.getParameter("listService") != null ? request.getParameter("listService") : "";
        String type_price = request.getParameter("type_price") != null ? request.getParameter("type_price") : "";
        String[] listServiceSplit = listService.split(",");
        ServiceDA serviceDA = new ServiceDA();
        try {
            int serviceInt, typeInt;
            try {
                typeInt = Integer.parseInt(type_price);
            } catch (NumberFormatException e) {
                typeInt = 0;
            }
            boolean checkSuccess = false;
            for (int i = 0; i < listServiceSplit.length; i++) {
                try {
                    serviceInt = Integer.parseInt(listServiceSplit[i]);
                } catch (NumberFormatException e) {
                    serviceInt = 0;
                }

                ServiceRoomTO serviceRoomTO = new ServiceRoomTO(0, serviceInt, typeInt);
                checkSuccess = serviceDA.addServiceRoom(serviceRoomTO);
            }
            response.getWriter().print("{\"success\":" + checkSuccess + "}");
        } catch (IOException e) {
            e.printStackTrace();
        }


    }
}
