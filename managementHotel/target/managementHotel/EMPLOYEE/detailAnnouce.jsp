<%@ page import="DTO.AnnoucementTO" %><%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 21/04/2020
  Time: 5:42 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    AnnoucementTO annoucementTO=(AnnoucementTO) request.getAttribute("annoucementTO");
%>
<html>
<head>
    <title>Chi tiết về thông báo</title>
    <jsp:include page="../Library.jsp"></jsp:include>
    <%

    %>
</head>
<body style="background-color: #DEE1E6;">
<jsp:include page="/EMPLOYEE/Header-employee.jsp"></jsp:include>
<div class="main-detail-announce container " style="min-height: 400px;padding-top:50px;">
    <%if(annoucementTO!=null){%>
    <h2 style="text-align: center;margin-bottom: 20px;color: #0588e4"><%=annoucementTO.getTITLE()%></h2>
    <p><%=annoucementTO.getCONTENT()%></p>
    <%}else{%>
    <h3 style="text-align: center">Không tìm thấy nội dung thông báo</h3>
    <%}%>
</div>
<jsp:include page="../Footer.jsp"></jsp:include>
</body>
</html>
