<%@ page import="DTO.AnnoucementTO" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 4/12/2020
  Time: 11:24 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Thông báo</title>
    <jsp:include page="../Library.jsp"></jsp:include>
    <link rel="stylesheet" href="./css/Employeee/announcement-css.css">
</head>
<body>
<jsp:include page="/EMPLOYEE/Header-employee.jsp"></jsp:include>
<%
    ArrayList<AnnoucementTO> listAnnoucement=(ArrayList<AnnoucementTO>)request.getAttribute("listAnnoucement");
%>
<div class="main-announcement container">
<h2 class="">Thông báo</h2>
    <%if(listAnnoucement!=null){
        for (int i = 0; i <listAnnoucement.size() ; i++) {


    %>
    <div class="item-announcement">
        <div class="body-item-announcement">
            <h3><%=listAnnoucement.get(i).getTITLE()%></h3>
            <p style="max-height: 50px;">
                <%=listAnnoucement.get(i).getCONTENT()%>
            </p>
        </div>
        <div class="footer-item-announcement">
            <form>
                <button class="btn btn-primary">Xem chi tiết</button>
            </form>


        </div>
    </div>
    <%
            }
        }
    %>
</div>
<jsp:include page="../Footer.jsp"></jsp:include>
</body>
</html>
