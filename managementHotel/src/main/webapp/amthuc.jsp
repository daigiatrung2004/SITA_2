<%@ page import="DTO.RegionTO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Language.LanguageControl" %><%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 28/05/2020
  Time: 1:32 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String language = session.getAttribute("language") != null ? (String) session.getAttribute("language") : LanguageControl.VN_LAN;
    ArrayList<RegionTO> listRegion = (ArrayList<RegionTO>) request.getAttribute("listRegion");
    String checkSuccess = request.getAttribute("checkSuccess") != null ? (String) request.getAttribute("checkSuccess") : "";
%>
<html>
<head>
    <title>
        <%
            if(language.equals(LanguageControl.VN_LAN)){
                %>
        Ẩm thực
        <%
            }else{
                %>
        Food
        <%
            }
        %>
    </title>

    <jsp:include page="Library.jsp"></jsp:include>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/home-css.css"/>
    <style>
        .header-div-main {
            position: relative !important;
        }

        .title-contact {
            padding: 100px;
            margin-bottom: 100px;
            background: white;
        }
        h1{
            text-align: center;
        }
    </style>
</head>
<body style="background-color:#DEE1E6">
<jsp:include page="header-not-slide.jsp"></jsp:include>
<div class="title-contact">
    <%
        if (language.equals(LanguageControl.VN_LAN)) {
    %>
    <h1>Ẩm thực</h1>

    <%} else {%>
    <h1>Food</h1>

    <%}%>

</div>
<div class="container" style="background-color: white;padding: 10px;margin-bottom: 20px;">
    <div style="margin-bottom: 30px;">
        <img src="<%=request.getContextPath() %>/img/amthuc.jpg" style="text-align: center;">
    </div>
    <p>
        <%if (language.equals(LanguageControl.VN_LAN)) {%>
        Nhà hàng Spices thanh lịch với khu vực trong nhà ấm cúng và khu vực ngoài trời thoáng đãng hướng thẳng ra sông
        Hậu yên bình. Nhà hàng phục vụ tất cả các bữa ăn trong ngày và cả các món ăn nhẹ giữa buổi, với ẩm thực Âu - Á
        đa dạng.
        <br/>
        Sức chứa: 100 thực khách trong nhà, 70 khách ngoài trời
        <br/>
        Giờ phục vụ: 6:00 - 22:00 mỗi ngày
        <br/>
        Quầy bar Cửu Long với không gian thư giãn mang phong cách cổ điển, được trang bị bàn bi-da, bảng phóng phi tiêu...ghế ngồi thoải mái và có phong phú các loại thức uống giải khát từ nước ép trái cây, cocktails đến các loại có cồn khác.
        <br/>
        Sức chứa: 40 thực khách trong nhà, 40 thực khách ngoài trời
        Giờ hoạt động: từ 6:00 đến 23:00 mỗi ngày
        <br/>
        Dịch vụ ẩm thực phòng tại Victoria Cần Thơ với đa dạng ẩm thực Âu - Á, luôn sẵn sàng phục vụ tận phòng quý khách các bữa ăn trong ngày từ 6:00 đến 23:00.
        <%} else {%>
        The elegant Spices Restaurant overlooks the Hau River, with both indoor and outdoor seating. The restaurant offers all-day dining featuring International and Vietnamese favourites.
        <br/>
        Seating capacity: 100 guests indoors, 70 guests outdoors
        <br/>
        Opening hours: 6:00 am to 10:00 pm
        <br/>
        The semi open-air Cuu Long Bar features a vintage chic vibe with pool table and plush seating and serves up a wide range of light fare, refreshing cocktails and other beverages.
        <br/>
        Seating capacity: 40 guests indoors, 40 guests outdoors
        <br/>
        Opening hours: 6:00 am to 11:00 pm
        <br/>
        Room Service with Vietnamese and International favorites are also available for in-room dining from 6:00 am to 10:00 pm
        <%}%>
    </p>
</div>
<jsp:include page="loading.jsp"></jsp:include>
<jsp:include page="./Footer.jsp"></jsp:include>
</body>
</html>
