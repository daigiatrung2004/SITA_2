<%@ page import="DTO.RegionTO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="DTO.KindRoomTO" %>
<%@ page import="DTO.PriceRoomTO" %><%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 4/14/2020
  Time: 7:51 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    ArrayList<RegionTO> listRegion = (ArrayList<RegionTO>) request.getAttribute("listRegion");
    ArrayList<KindRoomTO> listKindRoom = (ArrayList<KindRoomTO>) request.getAttribute("listKindRoom");
    ArrayList<PriceRoomTO> listPriceRoom = (ArrayList<PriceRoomTO>) request.getAttribute("listPrice");
%>
<html>
<head>
    <title>Tạo phòng nhanh</title>
    <jsp:include page="../Library.jsp"></jsp:include>
    <link rel="stylesheet" href="./css/Admin/initManagerHotel.css">
</head>
<body>
<jsp:include page="HeaderAdmin.jsp"></jsp:include>
<H2>Tạo phòng nhanh</H2>
<div class="div-quick-room">
    <div class="form-group">
        <label for="amount"> Số lượng phòng :</label>
        <input type="number" class="form-control" placeholder="Nhập số lượng phòng" id="amount" name="amount">
    </div>
    <div class="form-group">
        <label for="max_peo"> Max people :</label>
        <input type="number" class="form-control" placeholder="Enter Max People" id="max_peo" name="max_peo">
    </div>
    <div class="form-group">
        <label for="select-kind-room">Select kind room:</label>
        <select id="select-kind-room">
            <%
                if (listRegion != null) {
                    for (int i = 0; i < listKindRoom.size(); i++) {


            %>
            <option value="<%=listKindRoom.get(i).getKindroom_id()%>"><%=listKindRoom.get(i).getName_vi()%>
            </option>
            <%
                    }
                }%>

        </select>
    </div>
    <div class="form-group">
        <label for="select-price-room-id-2">Select type price:</label>
        <select id="select-price-room-id-2">
            <%
                if (listPriceRoom != null) {
                    for (int i = 0; i < listPriceRoom.size(); i++) {


            %>
            <option value="<%=listPriceRoom.get(i).getPrice_id()%>"><%=listPriceRoom.get(i).getType_price_room_vi()%>
            </option>
            <%
                    }
                }%>

        </select>
    </div>
    <div class="form-group">
        <label for="select-region">Select region:</label>
        <select id="select-region">
            <%
                if (listRegion != null) {
                    for (int i = 0; i < listRegion.size(); i++) {


            %>
            <option value="<%=listRegion.get(i).getRegion_id()%>">
                <%=listRegion.get(i).getName_vi()%>
            </option>
            <%
                    }
                }
            %>
        </select>
    </div>
    <button type="submit" class="btn btn-primary" id="btn-room">Insert</button>
    <div class="error" id="result-insert-room"></div>
</div>
<jsp:include page="SideBar.jsp"></jsp:include>
<script src="./scripts/Admin/roomQuick-js.js"></script>
<script>
    var select_kind_room_id_2 = new SlimSelect({
        select: '#select-price-room-id-2'
    });
    var select_kind_room = new SlimSelect({
        select: '#select-kind-room'
    });
    var select_region = new SlimSelect({
        select: '#select-region'
    });
</script>
</body>
</html>
