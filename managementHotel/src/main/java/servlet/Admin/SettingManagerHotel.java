package servlet.Admin;

import DAO.RegionDA;
import DAO.RoomOfALLDA;
import DTO.*;
import Utils.SaveImageInServer;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

public class SettingManagerHotel extends WebServletAdmin {
    @Override
    protected void process(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        try {
            String vi = request.getParameter("vi_region") != null ? (String) request.getParameter("vi_region") : "";
            String en = request.getParameter("en_region") != null ? (String) request.getParameter("en_region") : "";
            String type = request.getParameter("type") != null ? (String) request.getParameter("type") : "";
            RegionDA regionDA = new RegionDA();
            RoomOfALLDA roomOfALLDA = new RoomOfALLDA();
            RegionTO regionTO = null;
            KindRoomTO kindRoomTO = null;
            boolean checkSuccess = false;
            if ((!vi.equals("") && !en.equals("")||type.equals("room")||type.equals("price_room"))) {
                if (type.equals("kindroom")) {
                    // add du lieu loai phong
                    kindRoomTO = new KindRoomTO(0, vi, en, StaticTO.ACTIVE_STATUS, "");
                    checkSuccess = roomOfALLDA.addKindRoom(kindRoomTO);
                }else if(type.equals("price_room")){
                    String type_vi=request.getParameter("type_vi")!=null?(String)request.getParameter("type_vi"):"";
                    String type_en=request.getParameter("type_en")!=null?(String)request.getParameter("type_en"):"";
                    String priceStr=request.getParameter("price")!=null?(String)request.getParameter("price"):"0";
                    String kind_room=request.getParameter("kindroom")!=null?(String)request.getParameter("kindroom"):"0";
                    long priceLong;
                    int kind_roomInt;
                    try {
                        priceLong=Long.parseLong(priceStr);
                    } catch (NumberFormatException e) {
                        priceLong=0;
                    }
                    try {
                        kind_roomInt=Integer.parseInt(kind_room);
                    } catch (NumberFormatException e) {
                        kind_roomInt=0;
                    }
                    PriceRoomTO priceRoomTO=new PriceRoomTO(0,type_vi,type_en,priceLong,kind_roomInt,StaticTO.ACTIVE_STATUS,"");
                    checkSuccess=roomOfALLDA.addPriceRoom(priceRoomTO);

                }
                else if (type.equals("room")) {
                    // add du lieu phong
                    String name = request.getParameter("name") != null ? (String) request.getParameter("name") : "";
                    String kindroom = request.getParameter("kindroom") != null ? (String) request.getParameter("kindroom") : "0";
                    String priceroom = request.getParameter("priceroom") != null ? (String) request.getParameter("priceroom") : "0";
                    String region = request.getParameter("region") != null ? (String) request.getParameter("region") : "0";
                    String max_peo=request.getParameter("max_peo")!=null?(String)request.getParameter("max_peo"):"0";

                    int kindroomId, regionId,max_people,priceroomInt;
                    try {
                        kindroomId = Integer.parseInt(kindroom);
                    } catch (NumberFormatException e) {
                        kindroomId = 0;
                    }
                    try {
                        priceroomInt=Integer.parseInt(priceroom);
                    } catch (NumberFormatException e) {
                        priceroomInt=0;
                    }
                    System.out.println("priceroomInt:"+priceroomInt);
                    try {
                        regionId = Integer.parseInt(region);
                    } catch (NumberFormatException e) {
                        regionId = 0;
                    }
                    try {
                        max_people=Integer.parseInt(max_peo);
                    } catch (NumberFormatException e) {
                        max_people=0;
                    }
                    RoomTO roomTO=new RoomTO(0,name,kindroomId,priceroomInt,regionId,StaticTO.ACTIVE_STATUS,"",max_people);
                    checkSuccess=roomOfALLDA.addRoom(roomTO);

                } else {
                      // add du lieu khu vuc
                    String listImgOrgin = request.getParameter("listImgOrginData") != null ? (String) request.getParameter("listImgOrginData") : "";
                    String listSrc = request.getParameter("listSrcData") != null ? (String) request.getParameter("listSrcData") : "";
                    String contact = request.getParameter("contact") != null ? (String) request.getParameter("contact") : "";
                    String address = request.getParameter("address") != null ? (String) request.getParameter("address") : "";
                    String[] listSrcSplit = listSrc.split("\\.");
                    String base64="";
                    String[] type_img = listImgOrgin.replaceAll("\"","").split(",");
                    String filename="";
                    for (int i = 0; i < listSrcSplit.length; i++) {
                        base64= listSrcSplit[i].replaceAll("\"", "");
                        filename = type_img[i].split("\\.")[0];
                    }

                    regionTO = new RegionTO(0, vi, en, StaticTO.ACTIVE_STATUS, "", SaveImageInServer.createImageFromBase64(base64,filename+"_img_region"),address,contact);
                    checkSuccess = regionDA.addRegion(regionTO);

                }
            }
            if (checkSuccess) {

                response.getWriter().print("{\"success\":true}");

            } else {
                response.getWriter().print("{\"success\":false}");
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return;
    }


}
