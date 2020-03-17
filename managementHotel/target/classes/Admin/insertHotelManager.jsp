<%@ page import="DTO.RegionTO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="DTO.KindRoomTO" %><%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 3/15/2020
  Time: 4:58 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Thêm dữ liệu khách sạn</title>
    <jsp:include page="../Library.jsp"></jsp:include>
</head>
<body>
<%
    ArrayList<RegionTO> listRegion = (ArrayList<RegionTO>) request.getAttribute("listRegion");
    ArrayList<KindRoomTO> listKindRoom = (ArrayList<KindRoomTO>) request.getAttribute("listKindRoom");
%>
<div class="insertData">
    <jsp:include page="HeaderAdmin.jsp"></jsp:include>
    <div class="ui top attached tabular menu menu_insertData">
        <a class="item active" data-tab="region">Thêm khu vực</a>
        <a class="item" data-tab="kindroom">Thêm loại phòng</a>
        <a class="item" data-tab="room">Thêm phòng</a>
        <a class="item" data-tab="price-room">Giá phòng</a>
    </div>
    <div class="ui bottom attached tab segment active" data-tab="region">
        <div class="form-group">
            <label for="vi_name">Vietnamese Name:</label>
            <input type="text" class="form-control" placeholder="Enter Vietnamese" id="vi_name" name="vi_name">
        </div>
        <div class="form-group">
            <label for="en_name">EngLish Name:</label>
            <input type="text" class="form-control" placeholder="Enter English" id="en_name" name="en_name">
        </div>
        <button type="submit" class="btn btn-primary" id="btn-region">Insert</button>
        <div class="error" id="result-insert-region"></div>
    </div>
    <div class="ui bottom attached tab segment" data-tab="kindroom">
        <div class="form-group">
            <label for="vi_name">Vietnamese Name:</label>
            <input type="text" class="form-control" placeholder="Enter Vietnamese" id="vi_name_kind" name="vi_name">
        </div>
        <div class="form-group">
            <label for="en_name">EngLish Name:</label>
            <input type="text" class="form-control" placeholder="Enter English" id="en_name_kind" name="en_name">
        </div>
        <button type="submit" class="btn btn-primary" id="btn-kind-room">Insert</button>
        <div class="error" id="result-insert-kind-room"></div>
    </div>
    <div class="ui bottom attached tab segment" data-tab="room">
        <div class="form-group">
            <label for="en_name"> Name Room :</label>
            <input type="text" class="form-control" placeholder="Enter Name Room" id="name_room" name="en_name">
        </div>

        <div class="form-group">
            <label for="en_name"> Max people :</label>
            <input type="text" class="form-control" placeholder="Enter Max People" id="max_peo" name="max_peo">
        </div>
        <div class="form-group">
            <label for="en_name">Select kind room:</label>
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
            <label for="en_name">Select region:</label>
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
        <div class="ui bottom attached tab segment" data-tab="price-room">
            <div class="form-group">
                <label for="en_name"> Type Price Room VietNam :</label>
                <input type="text" class="form-control" placeholder="Enter Name Room" id="type_vi" name="type_vi">
            </div>
            <div class="form-group">
                <label for="en_name">Type Price Room EngLish:</label>
                <input type="text" class="form-control" placeholder="Enter Name Room" id="type_en" name="type_en">
            </div>
            <div class="form-group">
                <label for="en_name"> Price / 1 night:</label>
                <input type="text" class="form-control" placeholder="Enter Name Room" id="price" name="price">
            </div>
            <div class="form-group">
                <label for="en_name">Select kind room:</label>
                <select id="select-kind-room-id">
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
            <button type="submit" class="btn btn-primary" id="btn-price-room">Insert</button>
            <div class="error" id="result-price-room"></div>
        </div>
</div>
<script src="./scripts/Admin/InsertHotelManager.js"></script>
<script>
    $(document).ready(function () {
        $(".menu_insertData .item").tab();
    });
</script>
</body>
</html>
