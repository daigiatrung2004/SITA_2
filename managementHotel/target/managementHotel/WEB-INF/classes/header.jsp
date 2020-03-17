<%@ page import="Language.LanguageControl" %><%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 2/26/2020
  Time: 1:50 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%LanguageControl lang = (LanguageControl) session.getAttribute("LanguageControl");%>
<% String language = session.getAttribute("language") != null ? (String) session.getAttribute("language") : LanguageControl.VN_LAN;%>
<div id="header-slide" class="carousel slide " data-ride="carousel">
<jsp:include page="header-not-slide.jsp"></jsp:include>


    <!-- The slideshow -->
    <div class="carousel-inner">
        <div class="carousel-item active">
            <img src="./img/224-big.jpg" alt="Los Angeles" style="width: inherit;height: 600px">
        </div>
        <div class="carousel-item">
            <img src="./img/225-big.jpg" alt="Chicago" style="width: inherit;height: 600px">
        </div>

    </div>

    <!-- Left and right controls -->
    <a class="carousel-control-prev" href="#header-slide" data-slide="prev">
        <span class="carousel-control-prev-icon"></span>
    </a>
    <a class="carousel-control-next" href="#header-slide" data-slide="next">
        <span class="carousel-control-next-icon"></span>
    </a>

</div>
<script src="scripts/header-home.js"></script>

