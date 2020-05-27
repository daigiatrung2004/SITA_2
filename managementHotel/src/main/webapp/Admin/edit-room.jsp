<%@ page import="DTO.KindRoomTO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="DTO.PriceRoomTO" %>
<%@ page import="DTO.RoomTO" %><%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 24/05/2020
  Time: 12:37 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    ArrayList<KindRoomTO> listKindRoom=(ArrayList<KindRoomTO>)request.getAttribute("listKindRoom");
    ArrayList<PriceRoomTO> listPriceRoom=(ArrayList<PriceRoomTO>)request.getAttribute("listPriceRoom");
    RoomTO roomTO=(RoomTO) request.getAttribute("roomTO");
    String regionid=request.getParameter("regionid")!=null?(String)request.getParameter("regionid"):"0";

%>
<%if(roomTO!=null){%>
<form action="ListingHotelManager" method="post">
<div style="padding: 50px;">
    <h2 style="text-align: center">Cập nhật thông tin phòng</h2>
    <input type="hidden" name="type" value="edited-room">
    <input type="hidden" name="regionid" value="<%=roomTO.getRegion_id()%>">
    <input type="hidden" name="id" value="<%=roomTO.getRoom_id()%>">
    <div class="form-group">
        <label for="name_room"> Name Room :</label>
        <input type="text" class="form-control" placeholder="Enter Name Room" id="name_room" value="<%=roomTO.getName()%>" name="name_room">
    </div>

    <div class="form-group">
        <label for="max_peo"> Max people :</label>
        <input type="number" class="form-control" placeholder="Enter Max People" id="max_peo" name="max_peo" value="<%=roomTO.getMax_people()%>">
    </div>
    <div class="form-group">
        <label for="select-kind-room">Select kind room:</label>
        <select id="select-kind-room" name="select-kind-room">
            <%
                if (listKindRoom != null&&listKindRoom.size()>0) {
                    for (int i = 0; i < listKindRoom.size(); i++) {


            %>
            <option value="<%=listKindRoom.get(i).getKindroom_id()%>" <%=listKindRoom.get(i).getKindroom_id()==roomTO.getKind_room_id()?"selected":""%>><%=listKindRoom.get(i).getName_vi()%>
            </option>
            <%
                    }
                }%>

        </select>
    </div>
    <div class="form-group">
        <label for="select-price-room-id-2">Select type price:</label>
        <select id="select-price-room-id-2" name="select-price-room-id-2">
            <%
                if (listPriceRoom != null&&listPriceRoom.size()>0) {
                    for (int i = 0; i < listPriceRoom.size(); i++) {


            %>
            <option value="<%=listPriceRoom.get(i).getPrice_id()%>" <%=listPriceRoom.get(i).getPrice_id()==roomTO.getPrice_id()?"selected":""%>><%=listPriceRoom.get(i).getType_price_room_vi()%>
            </option>
            <%
                    }
                }%>

        </select>
    </div>

    <button type="submit" class="btn btn-primary" id="btn-room">Cập nhật</button>

    <div class="error" id="result-insert-room"></div>
</div>
</form>
<%
    }else{
%>
<h2 >Không tìm thấy dữ liệu càn cập nhật!!!!</h2>
<%
    }
%>