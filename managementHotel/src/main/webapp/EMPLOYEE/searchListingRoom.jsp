<%@ page import="DTO.RoomTO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="DTO.StaticTO" %><%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 26/05/2020
  Time: 8:29 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    ArrayList<RoomTO> listRoomTO = (ArrayList<RoomTO>) request.getAttribute("listRoomTO");
%>
<%
    if (listRoomTO != null) {
        for (int i = 0; i < listRoomTO.size(); i++) {


%>
<div class="item-room">
    <%
        if (listRoomTO.get(i).getStatus().equals(StaticTO.ACTIVE_STATUS)) {
    %>
    <a href="DetailsRoom?roomId=<%=listRoomTO.get(i).getRoom_id()%>" style="color: black;">
            <%
                    }else{
                %>
        <a href="CheckOut?roomId=<%=listRoomTO.get(i).getRoom_id()%>" style="color: black;">
            <%
                }
            %>
            <div class="img-item">
                <img src="./img/employee/img-daidien-room.jpg" style="height: 150px;width: 100%">
            </div>
            <div class="footer-item">
                <div class="footer-div">Số giường:2</div>
                <div class="footer-div">Số người tối đa:<%=listRoomTO.get(i).getMax_people()%>
                </div>
                <div class="footer-div">Trạng thái phòng:<span class="error">
                        <%if (listRoomTO.get(i).getStatus().equals(StaticTO.ACTIVE_STATUS)) {%>
                        Đang trống
                        <%} else if (listRoomTO.get(i).getStatus().equals(StaticTO.COMPLETE_STATUS)) {%>
                        Đang được sử dụng
                        <%} else {%>
                        Đang sữa chữa
                        <%}%>
                    </span></div>

            </div>
        </a>
</div>
<%
    }
} else {
%>
<h2>Không tìm thấy kết quả nào hết!!!</h2>
<%
    }
%>