package servlet.Ajax;

import DAO.TransportDA;
import DTO.StaticTO;
import DTO.TransportTO;
import servlet.Admin.WebServletAdmin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

public class AjaxInsertTransport extends WebServletAdmin {

    @Override
    protected void process(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        String name_trans_vi = request.getParameter("name_trans_vi") != null ? (String) request.getParameter("name_trans_vi") : "";
        String name_trans_en = request.getParameter("name_trans_en") != null ? (String) request.getParameter("name_trans_en") : "";
        String detail_trans_en = request.getParameter("detail_trans_en") != null ? (String) request.getParameter("detail_trans_en") : "";
        String detail_trans_vi = request.getParameter("detail_trans_vi") != null ? (String) request.getParameter("detail_trans_vi") : "";
        String price_trans = request.getParameter("price_trans") != null ? (String) request.getParameter("price_trans") : "0";
        String type = request.getParameter("type") != null ? (String) request.getParameter("type") : "";
        TransportDA transportDA = new TransportDA();
        long price_trans_long;
        try {
            price_trans_long = Long.parseLong(price_trans);
        } catch (NumberFormatException e) {
            price_trans_long = 0;
        }
        boolean checkSuccess = false;

        try {
            if (!type.equals("") && type.equals("other")) {
                // thêm các chi phí khác
                name_trans_vi = request.getParameter("name_fee_other_vi") != null ? (String) request.getParameter("name_fee_other_vi") : "";
                name_trans_en = request.getParameter("name_fee_other_en") != null ? (String) request.getParameter("name_fee_other_en") : "";
                price_trans = request.getParameter("price_fee_other") != null ? (String) request.getParameter("price_fee_other") : "0";
                try {
                    price_trans_long = Long.parseLong(price_trans);
                } catch (NumberFormatException e) {
                    price_trans_long = 0;
                }
                TransportTO transportTO = new TransportTO(0, name_trans_vi, name_trans_en, price_trans_long, StaticTO.ACTIVE_STATUS, "");
                checkSuccess = transportDA.addTransportOther(transportTO);
            } else if (!type.equals("") && type.equals("region")) {
                // áp dụng vận chuyển lên từng khu vực
                String region_trans = request.getParameter("region_trans") != null ? (String) request.getParameter("region_trans") : "0";
                String trans_select = request.getParameter("trans_select") != null ? (String) request.getParameter("trans_select") : "";
                String[] splitTransSelect = trans_select.split(",");
                long transSelectInt;
                for (int i = 0; i < splitTransSelect.length; i++) {
                    try {
                        transSelectInt = Integer.parseInt(splitTransSelect[i]);
                    } catch (NumberFormatException e) {
                        transSelectInt = 0;
                    }
                    TransportTO transportTO = new TransportTO(transSelectInt, 0, Integer.parseInt(region_trans));
                    checkSuccess = transportDA.addTransportRegion(transportTO);

                }

            } else {
                // thêm dữ liệu transport(Vân chuyển)
                TransportTO transportTO = new TransportTO(0, name_trans_vi, name_trans_en, detail_trans_vi, detail_trans_en, price_trans_long, StaticTO.ACTIVE_STATUS, "");
                checkSuccess = transportDA.addTransport(transportTO);
            }
            response.getWriter().print("{\"success\":" + checkSuccess + "}");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
