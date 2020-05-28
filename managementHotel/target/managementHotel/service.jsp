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
        Thư giản
        <%
        }else{
        %>
        Relax
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
    <h1>Dịch vụ</h1>

    <%} else {%>
    <h1>Thiết bị</h1>

    <%}%>

</div>
<div class="container" style="background-color: white;padding: 10px;margin-bottom: 20px;">
    <div style="margin-bottom: 30px;">
        <img src="<%=request.getContextPath() %>/img/dichvu.jpg">
    </div>

        <%if (language.equals(LanguageControl.VN_LAN)) {%>
    <div style="background-color: white; padding: 22px 15px 5px 20px;">
        <p>Nhằm mang lại trải nghiệm tốt nhất cho quý khách tại Victoria , chúng tôi cung cấp các dịch vụ:</p>
        <div class="uk-grid uk-grid-small">
            <div class="uk-width-large-1-2">
                <ul class="circle-list">
                    <li>Nhân viên giao tiếp đa ngôn ngữ</li>
                    <li>Dịch vụ trông trẻ</li>
                    <li>Dịch vụ tour du ngoạn</li>
                    <li>Dịch vụ xe / du thuyền</li>
                    <li>Tàu đi vào trung tâm thành phố, miễn phí</li>
                    <li>Cảng tàu riêng</li>
                    <li>Gửi thư/ bưu kiện</li>
                    <li>Đổi ngoại tệ</li>
                </ul>
            </div>
            <div class="uk-width-large-1-2">
                <ul class="circle-list">
                    <li>Góc làm việc</li>
                    <li>Quầy lưu niệm</li>
                    <li>Hỗ trợ kiểm tra và đặt vé máy bay</li>
                    <li>Dịch vụ giặt ủi</li>
                    <li>Wifi miễn phí trong tất cả các phòng khách và khu vực chung</li>
                </ul>
            </div>
        </div>
    </div>


        <%}else{%>
    <div style="background-color: white; padding: 22px 15px 5px 20px;">
        <p>To enhance your stay at Victoria Can Tho, additional services are available including:</p>
        <div class="uk-grid uk-grid-small">
            <div class="uk-width-large-1-2">
                <ul class="circle-list">
                    <li>Multi-lingual hotel staff</li>
                    <li>Babysitting</li>
                    <li>Sightseeing tour services</li>
                    <li>Transportation facilities</li>
                    <li>Free shuttle boat to town</li>
                    <li>Private jetty</li>
                    <li>Postal services</li>
                    <li>Foreign currency exchange</li>
                </ul>
            </div>
            <div class="uk-width-large-1-2">
                <ul class="circle-list">
                    <li>Souvenir shop</li>
                    <li>Cyber corner</li>
                    <li>Flight reconfirmation and booking services</li>
                    <li>Laundry services</li>
                    <li>Major credit cards accepted (Amex, Visa, MasterCard, JCB)</li>
                    <li>Free WIFI available in all guestrooms and public areas</li>
                </ul>
            </div>
        </div>
    </div>
        <%}%>
</div>
<jsp:include page="loading.jsp"></jsp:include>
<jsp:include page="./Footer.jsp"></jsp:include>
</body>
</html>
