<%@ page import="Language.LanguageControl" %><%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 09/05/2020
  Time: 7:43 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    LanguageControl lang = (LanguageControl) session.getAttribute("LanguageControl");
    String language = session.getAttribute("language") != null ? (String) session.getAttribute("language") : LanguageControl.VN_LAN;
%>
<html>
<head>
    <%
        if(language.equals(LanguageControl.VN_LAN)){
    %>
    <title>Phòng nghỉ</title>
    <%
        }else{
    %>
    <title>Accomodation</title>
    <%
        }
    %>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/home-css.css"/>
    <style>
        .header-div-main {
            position: relative !important;
        }
    </style>
    <jsp:include page="library_detail.jsp"></jsp:include>
</head>
<body>
<jsp:include page="header-not-slide.jsp"></jsp:include>
<div class="div-main" style="min-height: 400px">
    <h2>Phòng ngỉ</h2>
</div>
<jsp:include page="loading.jsp"></jsp:include>
<jsp:include page="./Footer.jsp"></jsp:include>
</body>
</html>
