package servlet.Admin;

import DAO.PromoteDA;
import DAO.RoomOfALLDA;
import DTO.PriceRoomTO;
import DTO.PromoteTO;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Map;

public class ListingPromote extends WebServletAdmin {

    @Override
    protected void process(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        try {
            String type=request.getParameter("type")!=null?(String)request.getParameter("type"):"";
            RoomOfALLDA roomOfALLDA = new RoomOfALLDA();
            PromoteDA promoteDA = new PromoteDA();
            if(type.equals("")) {
                ArrayList<PriceRoomTO> listPriceRoom = roomOfALLDA.retrieveALLPrice();
                request.setAttribute("listPriceRoom", listPriceRoom);
                ArrayList<PromoteTO> listPromote = promoteDA.retreiveAllPromote();
                ArrayList<Map<PriceRoomTO, PromoteTO>> listCodePrice = promoteDA.retrieveAllCodePrice();
                request.setAttribute("listCodePrice", listCodePrice);
                request.setAttribute("listPromote", listPromote);
                forward("/Admin/listingPromote.jsp", request, response);
                return;
            }
            else if(type.equals("edit-code")){
                String promoteid=request.getParameter("promoteid")!=null?(String)request.getParameter("promoteid"):"0";
                int promoteidInt,priceidInt;
                try {
                    promoteidInt=Integer.parseInt(promoteid);
                } catch (NumberFormatException e) {
                    promoteidInt=0;
                }
                PromoteTO promoteTO=promoteDA.retrievePromotePrice(promoteidInt);
                request.setAttribute("promoteTO",promoteTO);
                request.setAttribute("type","promote");
                forward("/Admin/editPromotePrice.jsp",request,response);

            }else if(type.equals("edited-code")){
                String promoteid=request.getParameter("promoteid")!=null?(String)request.getParameter("promoteid"):"0";
                int promoteidInt,priceidInt;
                try {
                    promoteidInt=Integer.parseInt(promoteid);
                } catch (NumberFormatException e) {
                    promoteidInt=0;
                }
                String code_promote=request.getParameter("code_promote")!=null?(String)request.getParameter("code_promote"):"";
                String value_promote=request.getParameter("value_promote")!=null?(String)request.getParameter("value_promote"):"";
                String expried_date=request.getParameter("expried_date")!=null?(String)request.getParameter("expried_date"):"";
                String [] expried_datesplit=expried_date.split("/");
                if(expried_datesplit.length>0){
                    expried_date=expried_datesplit[2]+"-"+expried_datesplit[1]+"-"+expried_datesplit[0];

                }
                PromoteTO promoteTO=promoteDA.retrievePromotePrice(promoteidInt);
                promoteTO.setPro_code(code_promote);
                promoteTO.setPro_value(value_promote);
                promoteTO.setExpired_date(expried_date);
                boolean checkSuccess=promoteDA.updatePromote(promoteTO);
                response.sendRedirect("ListingPromote?checkSuccess="+checkSuccess);
            }
            else if(type.equals("edited")){
                String priceId=request.getParameter("priceId")!=null?(String)request.getParameter("priceId"):"0";
                String promoteid=request.getParameter("promoteid")!=null?(String)request.getParameter("promoteid"):"0";
                int promoteidInt,priceidInt;
                try {
                    promoteidInt=Integer.parseInt(promoteid);
                } catch (NumberFormatException e) {
                    promoteidInt=0;
                }
                try {
                    priceidInt=Integer.parseInt(priceId);
                } catch (NumberFormatException e) {
                    priceidInt=0;

                }
                PromoteTO promoteTO=promoteDA.retreivePromotePrice(priceidInt);
                promoteTO.setPromte_id(promoteidInt);
                boolean checkSuccess=promoteDA.updatePromotePrice(promoteTO);
                response.sendRedirect("ListingPromote");
                return ;
            }
            else{
                String promoteId=request.getParameter("promoteId")!=null?(String)request.getParameter("promoteId"):"0";
                String priceId=request.getParameter("priceId")!=null?(String)request.getParameter("priceId"):"0";
                int promoteidInt,priceidInt;
                try {
                    promoteidInt=Integer.parseInt(promoteId);
                } catch (NumberFormatException e) {
                    promoteidInt=0;
                }
                try {
                    priceidInt=Integer.parseInt(priceId);
                } catch (NumberFormatException e) {
                    priceidInt=0;

                }
                PromoteTO promoteTO=promoteDA.retreivePromoteByPrice(priceidInt);
                ArrayList<PromoteTO> listpromoteTO=promoteDA.retreiveAllPromote();
                request.setAttribute("promoteTO",promoteTO);
                request.setAttribute("listpromoteTO",listpromoteTO);

                forward("/Admin/editPromotePrice.jsp",request,response);
            }
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
