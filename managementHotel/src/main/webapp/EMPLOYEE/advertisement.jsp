<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 14/05/2020
  Time: 1:31 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Quảng cáo victoria</title>
    <jsp:include page="../Library.jsp"></jsp:include>
</head>
<body>
<jsp:include page="/EMPLOYEE/Header-employee.jsp"></jsp:include>
<div class="main-advertisement">
<jsp:include page="taskbar-advertisement.jsp">
    <jsp:param name="type" value="offer"/>
</jsp:include>
    <div style="min-height: 400px;">
    <div>
        <A href="CreateOffer" class="btn btn-primary" style="margin: 50px;">Tạo ưu đãi</A>
    </div>
    <div class="ListOffer">

    </div>
    </div>
</div>
<jsp:include page="../Footer.jsp"></jsp:include>
</body>
</html>
