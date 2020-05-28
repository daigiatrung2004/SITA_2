<%@ page import="DTO.RegionTO" %>
<%@ page import="Language.LanguageControl" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 27/05/2020
  Time: 2:46 CH
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
            if (language.equals(LanguageControl.VN_LAN)) {
        %>
        VICTORIA HOI AN BEACH RESORT & SPA
        <%}else{%>
        Khu Nghỉ Dưỡng Biển &amp; Spa Victoria Hội An
        <%}%>
    </title>
    <jsp:include page="Library.jsp"></jsp:include>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/home-css.css"/>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/pr-css.css"/>
    <style>
        .header-div-main {
            position: relative !important;
        }

        .title-contact {
            padding: 100px;
            margin-bottom: 100px;
            background-color: white;
            text-align: center;
            margin: 0;
            border-bottom: 1px solid #cccccc;
        }

        h1 {
            margin-bottom: 5px;
            text-transform: uppercase;
            font-weight: 700;
            color: #505050;
            font-size: 32px;
            line-height: 30px;
        }

        h3 {
            font-size: 14px;
            margin-top: 5px;
            text-transform: uppercase;
            font-weight: normal;
            color: #505050;
            letter-spacing: 3px;
            margin-bottom: 0px;
        }

        .favor-block {
            padding: 30px 20px;
        }


    </style>
</head>
<body style="background-color: white">
<jsp:include page="header-not-slide.jsp"></jsp:include>
<div class="title-contact">
    <%
        if (language.equals(LanguageControl.VN_LAN)) {
    %>
    <h1>TRẢI NGHIỆM VICTORIA</h1>
    <h3>Khu Nghỉ Dưỡng Biển &amp; Spa Victoria Hội An</h3>
    <%} else {%>
    <h1>VICTORIA EXPERIENCE</h1>
    <h3>VICTORIA HOI AN BEACH RESORT & SPA</h3>
    <%}%>

</div>
<div class="side-car container" style="margin-top: 20px;margin-bottom: 30px;">
    <div class="favor-block-inner max-content" style="background-color:#DEE1E6;padding-bottom: 20px;">
        <div style="text-align: center;">
            <img src="<%=request.getContextPath() %>/img/VHA-sidecar-9.jpg" alt="" width="100%">
            <div style="padding: 23px 15px 0; line-height: 25px; display: flex; justify-content: center; align-items: center; flex-direction: column;">
                <%
                    if (language.equals(LanguageControl.VN_LAN)) {
                %>
                <p style="margin-bottom: 5px; font-size: 13pt;">Tận hưởng trải nghiệm tham quan phố phường Hội An đầy
                    thú vị và phong cách bằng xe mô tô ba bánh khi nghỉ dưỡng tại Victoria Hội An. Áp dụng cho cả khách
                    ở tại Victoria Hội An và khách ngoài.</p>
                <p style="margin-bottom: 5px; font-size: 13pt;">Để biết thêm thông tin và đặt chỗ, vui lòng liên hệ với
                    chúng tôi
                    <a href="mailto:%20resa.hoian@victoriahotels.asia" style=" color: #4183c4!important;">tại đây</a>
                    hoặc gọi
                    <a href="tel:+1800599955" style=" color: #4183c4!important;">1800 599 955</a>.
                </p>
                <%
                } else {

                %>

                <p style="margin-bottom: 5px; font-size: 13pt;">Enjoy an open-air experience of Hoi An town while being
                    chauffeured around in a vintage sidecar at Victoria Hoi An.</p>
                <p style="margin-bottom: 5px; font-size: 13pt;">Below sidecar tours are open to both Victoria Hoi An
                    guests and non-guests.</p>
                <p style="margin-bottom: 5px; font-size: 13pt;">For further information and reservation, please contact
                    us <a href="mailto:%20resa.hoian@victoriahotels.asia" style=" color: #4183c4!important;">here</a> or
                    call us at <a href="tel:+1800599955" style=" color: #4183c4!important;">1800 599 955</a></p>
                <%}%>
            </div>
        </div>
    </div>
    <div class="container">
        <!--vung que hoi an-->
        <div class="favor-block white-bg-block">
            <div class="favor-block-inner max-content">
                <div class="block-title">
                    <%
                        if (language.equals(LanguageControl.VN_LAN)) {
                    %>
                    <h2>THAM GIAN VÙNG QUÊ HỘI AN</h2>
                    <%} else {%>
                    <h2>SIDECAR TRIP TO THE COUNTRYSIDE</h2>
                    <%}%>
                    <div class="under-line">&nbsp;</div>
                </div>
                <div class="col-md-12 row">
                    <div class="col-md-6">
                        <img style="height: 100%;" src="<%=request.getContextPath() %>/img/VHA-sidecar-10.jpg" alt=""
                             width="100%" height="100%">
                    </div>
                    <div class="col-md-6" style="padding-left: 5px;">
                        <div style="background-color: #e6e8e7; padding: 25px 30px 25px 27px;">
                            <%
                                if (language.equals(LanguageControl.VN_LAN)) {
                            %>
                            <p>Khám phá vùng quê Hội An, các trang trại nuôi tôm cá và làng rau Trà Quế bằng xe mô tô ba
                                bánh cổ điển trong 60 phút</p>
                            <p>Khởi hành: tại Khu nghỉ dưỡng và spa Victoria Hội An</p>
                            <p>Giờ khởi hành: Theo yêu cầu</p>
                            <p>Thời lượng: 60 phút</p>
                            <%} else {%>
                            <ul class="circle-list" style="margin-top: 0px;list-style: circle">
                                <ul class="circle-list" style="margin-top: 0px;list-style: circle">
                                    <li>Riding the classic sidecar to explore countryside</li>
                                    <li>60-minute adventure scenic rice fields, fish and shrimp farms…</li>
                                    <li>Visit the peaceful Tra Que Vegetable Village</li>
                                </ul>
                            </ul>
                            <p>Departure: From Victoria Hoi An beach resort &amp; spa</p>
                            <p>Departure time: On request</p>
                            <p>Duration: 60 minutes</p>
                            <%}%>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!---->

        <!--nghe thu cong-->
        <div class="favor-block white-bg-block">
            <div class="favor-block-inner max-content">
                <div class="block-title">
                    <%
                        if (language.equals(LanguageControl.VN_LAN)) {
                    %>
                    <h2>THAM GIAN VÙNG QUÊ HỘI AN</h2>
                    <%} else {%>
                    <h2>SIDECAR TRIP TO THE VILLAGES OF HOI AN</h2>
                    <%}%>
                    <div class="under-line">&nbsp;</div>
                </div>
                <div class="col-md-12 row">
                    <div class="col-md-6">
                        <img style="height: 100%;" src="<%=request.getContextPath() %>/img/VHA-sidecar-4.jpg" alt=""
                             width="100%" height="100%">
                    </div>
                    <div class="col-md-6" style="padding-left: 5px;">
                        <div style="background-color: #e6e8e7; padding: 25px 30px 25px 27px;">
                            <%
                                if (language.equals(LanguageControl.VN_LAN)) {
                            %>
                            <p>Khám phá vùng quê Hội An, các trang trại nuôi tôm cá và làng rau Trà Quế bằng xe mô tô ba
                                bánh cổ điển trong 60 phút</p>
                            <p>Khởi hành: tại Khu nghỉ dưỡng và spa Victoria Hội An</p>
                            <p>Giờ khởi hành: Theo yêu cầu</p>
                            <p>Thời lượng: 60 phút</p>
                            <%} else {%>
                            <ul class="circle-list" style="margin-top: 0px;list-style: circle;">
                                <ul class="circle-list" style="margin-top: 0px;list-style: circle;">
                                    <li>Explore the countryside surrounding Hoi An on classic sidecar</li>
                                    <li>Experience the scenic rice fields, fish and shrimp farms, and grazing buffalo
                                    </li>
                                    <li>Visit the peaceful Tra Que Vegetable Village</li>
                                    <li>Visit fascinating craft village (pottery or carpentry).</li>
                                </ul>
                            </ul>
                            <p>Departure: From Victoria Hoi An beach resort &amp; spa</p>
                            <p>
                                <span style="font-size: 12.16px;">Departure time: On request</span>
                            </p>
                            <p>Duration: 2 hours</p>
                            <%}%>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!---->
        <!--cho ca hoi an-->
        <div class="favor-block white-bg-block">
            <div class="favor-block-inner max-content">
                <div class="block-title">
                    <%
                        if (language.equals(LanguageControl.VN_LAN)) {
                    %>
                    <h2>KHÁM PHÁ CHỢ CÁ HỘI AN</h2>
                    <%} else {%>
                    <h2>DISCOVER HOI AN’S EARLY FISH MARKET</h2>
                    <%}%>
                    <div class="under-line">&nbsp;</div>
                </div>
                <div class="col-md-12 row">
                    <div class="col-md-6">
                        <img style="height: 100%;" src="<%=request.getContextPath() %>/img/VHA-sidecar-11.jpg" alt=""
                             width="100%" height="100%">
                    </div>
                    <div class="col-md-6" style="padding-left: 5px;">
                        <div style="background-color: #e6e8e7; padding: 25px 30px 25px 27px;">
                            <%
                                if (language.equals(LanguageControl.VN_LAN)) {
                            %>
                            <ul class="circle-list" style="margin-top: 0px;">
                                <li>Tham quan và trải nghiệm chợ cá Hội An vào sáng sớm. Tham gia mua hải sản tươi sống
                                    được ngư dân đánh bắt vào sáng sớm
                                </li>
                            </ul>
                            <p>Khởi hành: tại Khu nghỉ dưỡng và spa Victoria Hội An</p>
                            <p>Giờ khởi hành: 6h sáng và trở về lúc 8h sáng</p>
                            <p>Thời lượng: 120 phút</p>
                            <%} else {%>
                            <ul class="circle-list" style="margin-top: 0px;list-style: circle;">
                                <li>Wake up early to visit the fish market of Hoi An, when the fishermen bring in their
                                    morning catch. A real show where buyers and sellers interact for your enjoyment.
                                </li>
                            </ul>
                            <p>Departure: From Victoria Hoi An beach resort &amp; spa</p>
                            <p>
                                <span style="font-size: 12.16px;">Departure time: </span>6am
                                <span style="font-size: 12.16px;"> and back at 8am for breakfast at the resort</span>
                            </p>
                            <p>Duration: 2 hours</p>
                            <%}%>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--tham quan ba na hill-->
        <div class="favor-block white-bg-block">
            <div class="favor-block-inner max-content">
                <div class="block-title">
                    <%
                        if (language.equals(LanguageControl.VN_LAN)) {
                    %>
                    <h2>THAM QUAN BÀ NÀ HILL</h2>
                    <%} else {%>
                    <h2>SIDECAR TRIP TO BA NA HILL</h2>
                    <%}%>
                    <div class="under-line">&nbsp;</div>
                </div>
                <div class="col-md-12 row">
                    <div class="col-md-6">
                        <img style="height: 100%;" src="<%=request.getContextPath() %>/img/VHA-sidecar-3.jpg" alt=""
                             width="100%" height="100%">
                    </div>
                    <div class="col-md-6" style="padding-left: 5px;">
                        <div style="background-color: #e6e8e7; padding: 25px 30px 25px 27px;">
                            <%
                                if (language.equals(LanguageControl.VN_LAN)) {
                            %>
                            <ul class="circle-list" style="margin-top: 0px;">
                                <li>Tham quan Khu Nghỉ Dưỡng Bà Nà Hill (110 km)</li>
                                <li>Đi cáp treo tại Ngũ Hành Sơn và tận hưởng cảnh quan thiên nhiên ngoạn mục của Đà
                                    Nẵng từ trên cao
                                </li>
                            </ul>
                            <p>Khởi hành: tại Khu nghỉ dưỡng và spa Victoria Hội An</p>
                            <p>Giờ khởi hành: 9:00 sáng</p>
                            <p>Thời lượng: Nửa ngày</p>
                            <%} else {%>
                            <ul class="circle-list" style="margin-top: 0px;list-style: circle">
                                <li>Drive 110 km to Ba Na, an immense hillside resort</li>
                                <li>Stop at Marble Mountain for a cable car ride over the lush tropical forest</li>
                                <li>Enjoy a spectacular bird’s eye view of Danang</li>
                            </ul>
                            <p>Departure: From Victoria Hoi An beach resort &amp; spa</p>
                            <p>Departure time: 9:00 am</p>
                            <p>Duration: Half day</p>
                            <%}%>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!---->
        <!--Tham deo ba van-->
        <div class="favor-block-inner max-content">
            <div class="block-title">
                <%
                    if (language.equals(LanguageControl.VN_LAN)) {
                %>
                <h2>THAM QUAN ĐÈO HẢI VÂN VÀ BIỂN LĂNG CÔ</h2>
                <%} else {%>
                <h2>SIDECAR TRIP OVER SCENIC HAI VAN PASS AND LANG CO BEACH</h2>
                <%}%>
                <div class="under-line">&nbsp;</div>
            </div>
            <div class="col-md-12 row">
                <div class="col-md-6"><img style="height: 100%;"
                                           src="<%=request.getContextPath() %>/img/VHA-sidecar-5.jpg" alt=""
                                           width="100%" height="100%"></div>
                <div class="col-md-6" style="padding-left: 5px;">
                    <div style="background-color: #e6e8e7; padding: 25px 30px 25px 27px;">
                        <%
                            if (language.equals(LanguageControl.VN_LAN)) {
                        %>
                        <ul class="circle-list" style="margin-top: 0px;">
                            <li>Khám phá vẻ đẹp của đèo Hải Vân</li>
                            <li>Tham quan Bãi biển Lăng Cô và Ngũ Hành Sơn</li>
                            <li>Ăn trưa tại nhà hàng địa phương</li>
                        </ul>
                        <p>Khởi hành: tại Khu nghỉ dưỡng và spa Victoria Hội An</p>
                        <p>Giờ khởi hành: 9:00 sáng</p>
                        <p>Thời lượng: Toàn ngày</p>
                        <%} else {%>
                        <ul class="circle-list" style="margin-top: 0px;list-style: circle">
                            <ul class="circle-list" style="margin-top: 0px;list-style: circle;">
                                <li>Visit 693 meter high Son Tra Mountain , enjoy breathtaking views of the city</li>
                                <li>Lunch is served at the top of the mountain or at Suoi Da stream</li>
                                <li>Explore the local fishing boats and dazzling white sand beaches</li>
                            </ul>
                        </ul>
                        <p>Departure: From Victoria Hoi An beach resort &amp; spa</p>
                        <p>Departure time: 9:00 am</p>
                        <p>Duration: Full day</p>
                        <%}%>
                    </div>
                </div>
            </div>
        </div>
        <!---->
    </div>

</div>
<jsp:include page="loading.jsp"></jsp:include>
<jsp:include page="./Footer.jsp"></jsp:include>
</body>
</html>
