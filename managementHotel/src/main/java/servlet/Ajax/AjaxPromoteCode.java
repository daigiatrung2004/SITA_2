package servlet.Ajax;

import DAO.PromoteDA;
import DTO.PromoteTO;
import DTO.StaticTO;
import servlet.Admin.WebServletAdmin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

public class AjaxPromoteCode extends WebServletAdmin {

    @Override
    protected void process(HttpServletRequest request, HttpServletResponse response) throws SQLException {

        try {
            String pro_code = request.getParameter("pro_code") != null ? (String) request.getParameter("pro_code") : "";
            String pro_value = request.getParameter("pro_value") != null ? (String) request.getParameter("pro_value") : "";
            String expired_date = request.getParameter("expired_date") != null ? (String) request.getParameter("expired_date") : "now()";
            PromoteDA promoteDA = new PromoteDA();
            String type=request.getParameter("type") != null ? (String) request.getParameter("type") : "";
            boolean checkSuccess = false;
            if(!type.equals("")){
                String promote_id = request.getParameter("promote_id") != null ? (String) request.getParameter("promote_id") : "0";
                String price_id = request.getParameter("price_id") != null ? (String) request.getParameter("price_id") : "0";
                int promote_idInt,price_idInt;
                promote_idInt=Integer.parseInt(promote_id);
                price_idInt=Integer.parseInt(price_id);
                PromoteTO promoteTO=new PromoteTO(promote_idInt,0,price_idInt);
                checkSuccess = promoteDA.addPromotePrice(promoteTO);

            }else {
                if (!pro_code.isEmpty() && !pro_value.isEmpty()) {
                    PromoteTO promoteTO = new PromoteTO(0, pro_code, pro_value, StaticTO.ACTIVE_STATUS, "", expired_date);
                    checkSuccess = promoteDA.addPromote(promoteTO);
                }
            }
            response.getWriter().print("{\"success\":" + checkSuccess + "}");

        } catch (IOException e) {
            e.printStackTrace();
        }

    }
}
