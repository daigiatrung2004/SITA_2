<%@ page import="DTO.RoomTO" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 4/3/2020
  Time: 7:27 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    ArrayList<RoomTO> listRoomTO=(ArrayList<RoomTO>)request.getAttribute("listRoomTO");
%>
<html>
<head>
    <title>Danh sách các phòng </title>
    <jsp:include page="../Library.jsp"></jsp:include>
    <link rel="stylesheet" href="./css/Employeee/listingRoom.css"/>
</head>
<body>
<jsp:include page="Header-employee.jsp"></jsp:include>
<div>
<div class="main-room row" >
    <%
        for (int i = 0; i <listRoomTO.size() ; i++) {


    %>
    <div class="item-room col-md-2">
        <a href="DetailsRoom?roomId=<%=listRoomTO.get(i).getRoom_id()%>" style="color: black;">
        <div class="img-item">
            <img src="./img/employee/img-daidien-room.jpg" style="height: 150px;width: 100%">
        </div>
        <div class="footer-item">
            <div class="footer-div">Số giường:2</div>
            <div class="footer-div">Số người tối đa:<%=listRoomTO.get(i).getMax_people()%></div>
            <div class="footer-div">Status:<span class="error"><%=listRoomTO.get(i).getStatus()%></span></div>

        </div>
        </a>
    </div>
    <%
        }
    %>
</div>
</div>
<jsp:include page="../Footer.jsp"></jsp:include>
</body>
</html>
