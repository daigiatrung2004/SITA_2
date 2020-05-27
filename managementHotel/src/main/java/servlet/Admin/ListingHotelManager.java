package servlet.Admin;

import DAO.RegionDA;
import DAO.RoomOfALLDA;
import DTO.*;

import javax.servlet.ServletException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;


public class ListingHotelManager extends WebServletAdmin {

    @Override
    protected void process(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        try {
            String type = request.getParameter("type") != null ? (String) request.getParameter("type") : "";
            String id=request.getParameter("id")!=null?(String)request.getParameter("id"):"0";
            int idInt;
            try {
                idInt=Integer.parseInt(id);
            } catch (NumberFormatException e) {
                idInt=0;
            }
            RoomOfALLDA roomOfALLDA=new RoomOfALLDA();

            if (type.equals("")) {
                RegionDA regionDA = new RegionDA();
                ArrayList<RegionTO> listregion = regionDA.retrieveAllRegion();
                request.setAttribute("listregion", listregion);

                if (listregion != null) {
                    ArrayList<Integer> tongsophong = new ArrayList<>();
                    for (int i = 0; i < listregion.size(); i++) {
                        ArrayList<RoomTO> listRoomTO = roomOfALLDA.retrieveRoomByRegionId(listregion.get(i).getRegion_id());
                        tongsophong.add(listRoomTO.size());
                    }
                    request.setAttribute("tongsophong", tongsophong);

                }
                ArrayList<KindRoomTO> listKindRoomTO = roomOfALLDA.retrieveALLKindRoom();
                request.setAttribute("listKindRoomTO", listKindRoomTO);
                ArrayList<String> listtengia = new ArrayList<String>();
                if (listKindRoomTO != null && listKindRoomTO.size() > 0) {
                    for (int i = 0; i < listKindRoomTO.size(); i++) {
                        ArrayList<PriceRoomTO> listPriceTO = roomOfALLDA.retrievePriceByKindRoom(listKindRoomTO.get(i).getKindroom_id());
                        String tengiaphong = "";
                        if (listPriceTO != null) {
                            for (int j = 0; j < listPriceTO.size(); j++) {
                                if (j == listPriceTO.size() - 1) {
                                    tengiaphong += listPriceTO.get(j).getType_price_room_vi();

                                } else {
                                    tengiaphong += listPriceTO.get(j).getType_price_room_vi() + ",";
                                }
                            }
                        }
                        listtengia.add(tengiaphong);

                    }
                    request.setAttribute("listtengia", listtengia);
                }
                ArrayList<PriceRoomTO> listPrice = roomOfALLDA.retrieveALLPrice();
                request.setAttribute("listPrice", listPrice);

                forward("/Admin/listingHotelManager.jsp", request, response);
            } else if (type.equals("listingroom")) {
                RegionDA regionDA = new RegionDA();
                String regionid = request.getParameter("regionid") != null ? (String) request.getParameter("regionid") : "0";
                int regionidInt;
                try {
                    regionidInt = Integer.parseInt(regionid);
                } catch (NumberFormatException e) {
                    regionidInt = 0;
                }
                ArrayList<RegionTO> listRegionTO = regionDA.retrieveAllRegion();
                RegionTO regionTO = regionDA.retrieveAllRegion(regionidInt);
                request.setAttribute("regionTO", regionTO);
                request.setAttribute("listRegionTO", listRegionTO);

                ArrayList<RoomTO> listRoomTO = roomOfALLDA.retrieveRoomByRegionId(regionidInt);
                request.setAttribute("listRoomTO", listRoomTO);

                forward("Admin/ControlListingRoom.jsp", request, response);

            }else if(type.equals("delete-room")){
                RoomTO roomTO=roomOfALLDA.searchRoomById(idInt);
                roomTO.setStatus(StaticTO.REMOVE_STATUS);
                boolean checkSuccess=roomOfALLDA.updateRoom(roomTO);
                response.getWriter().print("{\"success\":"+checkSuccess+"}");

                return;
            }else if(type.equals("edit-room")){
                RoomTO roomTO=roomOfALLDA.searchRoomById(idInt);
                request.setAttribute("roomTO",roomTO);
                ArrayList<PriceRoomTO> listPriceRoom=roomOfALLDA.retrieveALLPrice();
                ArrayList<KindRoomTO> listKindRoom=roomOfALLDA.retrieveALLKindRoom();
                request.setAttribute("listKindRoom",listKindRoom);
                request.setAttribute("listPriceRoom",listPriceRoom);
                forward("Admin/edit-room.jsp",request,response);
            }else if(type.equals("edited-room")){
                String regionid=request.getParameter("regionid")!=null?(String)request.getParameter("regionid"):"0";
                String name_room=request.getParameter("name_room")!=null?(String)request.getParameter("name_room"):"";
                String max_peo=request.getParameter("max_peo")!=null?(String)request.getParameter("max_peo"):"0";
                String kindroom=request.getParameter("select-kind-room")!=null?(String)request.getParameter("max_peo"):"0";
                String priceid=request.getParameter("select-price-room-id-2")!=null?(String)request.getParameter("select-price-room-id-2"):"0";
                int regionIdInt,kindroomInt,priceidInt,max_peoInt;
                try {
                    regionIdInt=Integer.parseInt(regionid);
                } catch (NumberFormatException e) {
                    regionIdInt=0;
                }
                try {
                    kindroomInt=Integer.parseInt(kindroom);
                } catch (NumberFormatException e) {
                    kindroomInt=0;
                }
                try {
                    priceidInt=Integer.parseInt(priceid);
                } catch (NumberFormatException e) {
                    priceidInt=0;
                }
                try {
                    max_peoInt=Integer.parseInt(max_peo);
                } catch (NumberFormatException e) {
                    max_peoInt=0;
                }
                RoomTO roomTO=roomOfALLDA.searchRoomById(idInt);
                roomTO.setPrice_id(priceidInt);
                roomTO.setRegion_id(regionIdInt);
                roomTO.setKind_room_id(kindroomInt);
                roomTO.setName(name_room);
                roomTO.setMax_people(max_peoInt);
                boolean checkSuccess=roomOfALLDA.updateRoom(roomTO);
                response.sendRedirect("ListingHotelManager?checkSuccess="+checkSuccess);

            }
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }
}
