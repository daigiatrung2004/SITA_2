<%@ page import="DTO.RegionTO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="DTO.PriceRoomTO" %>
<%@ page import="DTO.KindRoomTO" %><%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 23/05/2020
  Time: 9:07 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%

  ArrayList<KindRoomTO> listKindRoom =( ArrayList<KindRoomTO>)request.getAttribute("listKindRoomTO");
  PriceRoomTO priceRoomTO=(PriceRoomTO) request.getAttribute("priceRoomTO");
%>

<html>
<head>
    <title>Cập nhật giá</title>
    <jsp:include page="../Library.jsp"></jsp:include>
</head>
<body>
<jsp:include page="HeaderAdmin.jsp"></jsp:include>
<div style="padding: 20px">
    <%if(priceRoomTO!=null){%>
    <form action="ListingKindRoom" method="post">
        <h2 style="text-align: center">Cập nhật giá</h2>
        <input type="hidden" name="type" value="edited-price">
        <input type="hidden" name="id" value="<%=priceRoomTO.getPrice_id()%>">
    <div class="form-group">
        <label for="type_vi"> Type Price Room VietNam :</label>
        <input type="text" class="form-control" placeholder="Enter Name Room" value="<%=priceRoomTO.getType_price_room_vi()%>"  id="type_vi" name="type_vi">
    </div>
    <div class="form-group">
        <label for="type_en">Type Price Room EngLish:</label>
        <input type="text" class="form-control" placeholder="Enter Name Room" value="<%=priceRoomTO.getType_price_room_en()%>" id="type_en" name="type_en">
    </div>
    <div class="form-group">
        <label for="price"> Price / 1 night:</label>
        <input type="number" class="form-control" placeholder="Enter Name Room" id="price" value="<%=priceRoomTO.getPrice_1_night()%>" name="price">
    </div>

    <div class="form-group">
        <label for="select-kind-room-id">Select kind room:</label>
        <select id="select-kind-room-id">
            <%
                if (listKindRoom != null) {
                    for (int i = 0; i < listKindRoom.size(); i++) {


            %>
            <option value="<%=listKindRoom.get(i).getKindroom_id()%>" <%=listKindRoom.get(i).getKindroom_id()==priceRoomTO.getKind_room_id()?"selected":""%>><%=listKindRoom.get(i).getName_vi()%>
            </option>
            <%
                    }
                }%>

        </select>
    </div>
    <button type="submit" class="btn btn-primary" id="btn-price-room">Cập nhật</button>
    <div class="error" id="result-price-room"></div>
    </form>
        <%
            }
            %>
    <script>
        $(document).ready(function(){
            var service = new SlimSelect({
                select: '#select-kind-room-id'
            });
        });
    </script>
<jsp:include page="SideBar.jsp"></jsp:include>
</body>
</html>
