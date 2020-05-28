<%@ page import="DTO.RegionTO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Language.LanguageControl" %><%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 28/05/2020
  Time: 12:37 CH
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
        Tàu Victoria
        <%} else {%>
        Victoria Express Train
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

        .circle-list {
            list-style: circle;
        }

    </style>
</head>
<body>
<jsp:include page="header-not-slide.jsp"></jsp:include>
<div class="title-contact">
    <%
        if (language.equals(LanguageControl.VN_LAN)) {
    %>
    <h1>TRẢI NGHIỆM VICTORIA</h1>
    <h3>KHU NGHỈ DƯỠNG & SPA VICTORIA SAPA</h3>
    <%} else {%>
    <h1>VICTORIA EXPERIENCE</h1>
    <h3>VICTORIA SPA RESORT</h3>
    <%}%>

</div>
<div class="express-train">
    <div class="side-car container" style="margin-top: 20px;margin-bottom: 30px;">
        <div class="favor-block-inner max-content" style="background-color:#DEE1E6;padding-bottom: 20px;">
            <div style="text-align: center;">
                <img src="<%=request.getContextPath() %>/img/Overview.jpg" alt="" width="100%">
                <div style="padding: 23px 15px 0; line-height: 25px; display: flex; justify-content: center; align-items: center; flex-direction: column;">
                    <%
                        if (language.equals(LanguageControl.VN_LAN)) {
                    %>
                    <div style="text-align: center; padding: 25px 15px 0px;"><span style="font-size: 13pt;">Tái hiện lại thời kỳ vàng của du lịch, tàu hoả Victoria Express đầy phong cách, lấy cảm hứng từ phong cách thiết kế Đông Dương mang đến một chuyến đi khoảng 8 giờ qua đêm trên tàu giữa Hà Nội và Lào Cai. Quý khách sẽ tràn đầy năng lượng khi đến nơi và sẵn sàng cho một ngày tham quan, khám phá.</span>
                    </div>
                    <%
                    } else {

                    %>
                    <div style="text-align: center; padding: 25px 15px 0px;"><span style="font-size: 13pt;">Reviving the Golden Age of Travel, the stylish, Indochina-inspired Victoria Express Train is all about a restful 8-hour overnight journey between Hanoi and Lao Cai, helping guests arrive refreshed and ready for a full day of sightseeing ahead.</span>
                    </div>
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
                        <h2>TOA TÀU</h2>
                        <%} else {%>
                        <h2>TRAIN CARRIAGE FEATURE</h2>
                        <%}%>
                        <div class="under-line">&nbsp;</div>
                    </div>
                    <div class="col-md-12 row">
                        <div class="col-md-6">
                            <img style="height: 100%;" src="<%=request.getContextPath() %>/img/Train_Carriage.jpg"
                                 alt=""
                                 width="100%" height="100%">
                        </div>
                        <div class="col-md-6" style="padding-left: 5px;">
                            <div style="background-color: #e6e8e7; padding: 25px 30px 25px 27px;">
                                <%
                                    if (language.equals(LanguageControl.VN_LAN)) {
                                %>
                                <ul class="circle-list" style="list-style: circle">
                                    <li>2 toa tàu giường nằm với sức chứa 48 hành khách</li>
                                    <li>13 khoang tàu (4 giường mỗi khoang, có thể chuyển thành 2 giường)</li>
                                    <li>Khoang phục vụ nước uống và thức ăn nhẹ</li>
                                    <li>Phòng vệ sinh</li>
                                    <li>Wi-Fi miễn phí</li>
                                </ul>
                                <%} else {%>
                                <ul class="circle-list" style="list-style: circle">
                                    <li>2 elegant sleeper carriages accommodating 48 passengers (part of local train)
                                    </li>
                                    <li>13 cabins (4 shared berths - can be converted to 2 private berths)</li>
                                    <li>Snack cabin (refreshments and drinks for purchase)</li>
                                    <li>Restroom facilities</li>
                                    <li>Free Wi-Fi</li>
                                </ul>
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
                        <h2>TRANG THIẾT BỊ TRÊN KHOANG TÀU</h2>
                        <%} else {%>
                        <h2>TRAIN CABIN FEATURE</h2>
                        <%}%>
                        <div class="under-line"></div>
                    </div>
                    <div class="col-md-12 row">
                        <div class="col-md-6">
                            <img style="height: 100%;" src="<%=request.getContextPath() %>/img/Train_Cabin.jpg" alt=""
                                 width="100%" height="100%">
                        </div>
                        <div class="col-md-6" style="padding-left: 5px;">
                            <div style="background-color: #e6e8e7; padding: 25px 30px 25px 27px;">
                                <%
                                    if (language.equals(LanguageControl.VN_LAN)) {
                                %>
                                <ul class="circle-list">
                                    <li>Điều hòa</li>
                                    <li>Đèn đọc sách cá nhân</li>
                                    <li>Bộ vật dụng cá nhân</li>
                                    <li>Dép mang trên tàu</li>
                                    <li>Nơi đựng hành lý</li>
                                    <li>Cửa kính lớn ngắm cảnh</li>
                                </ul>
                                <%} else {%>
                                <ul class="circle-list">
                                    <li>Air-conditioning</li>
                                    <li>Individual reading light</li>
                                    <li>Individual amenity kit / slippers</li>
                                    <li>Luggage storage</li>
                                    <li>Large picture window</li>
                                </ul>
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
                        <h2>PHÒNG CHỜ VICTORIA</h2>
                        <%} else {%>
                        <h2>VICTORIA LOUNGE</h2>
                        <%}%>
                        <div class="under-line">&nbsp;</div>
                    </div>
                    <div class="col-md-12 row">
                        <div class="col-md-6">
                            <img style="height: 100%;" src="<%=request.getContextPath() %>/img/Lounge.jpg" alt=""
                                 width="100%" height="100%">
                        </div>
                        <div class="col-md-6" style="padding-left: 5px;">
                            <div style="background-color: #e6e8e7; padding: 25px 30px 25px 27px;">
                                <%
                                    if (language.equals(LanguageControl.VN_LAN)) {
                                %>
                                Phòng chờ Victoria là nơi đưa đón quý khách khi sử dụng dịch vụ tàu hỏa Victoria
                                Express. Với chỗ ngồi thoải mái, các món ăn nhẹ, nước uống ngon miệng, Wi-Fi và tạp chí,
                                quý khách có thể thư giãn trước và sau mỗi chuyến đi.<br>
                                <p>Giờ mở cửa: 19:00 – &nbsp;20:45 mỗi ngày (trừ thứ 7)<br>Địa chỉ:&nbsp;Khách sạn
                                    Flower Garden Hotel, 46 Nguyễn Trường Tộ, phường Trúc Bạch, quận Ba Đình, Hà
                                    Nội.<br>Hotline: 0913-360-030</p>
                                <%} else {%>
                                Victoria Express Train passengers have exclusive access to the Victoria Express Lounge
                                to check in. This private lounge features Wi-Fi, snacks and light refreshments.
                                <p>Open daily, 7:00 – 8:45pm (except Saturday) <br>Location:&nbsp;Flower Garden Hotel,
                                    46 Nguyen Truong To, Truc Bach Lake, Ba Dinh District, Hanoi.<br>Hotline:
                                    0913-360-030</p>
                                <%}%>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
<%if(language.equals(LanguageControl.VN_LAN)){%>
            <!--bảng gia tàu-->
            <div class="favor-block white-bg-block container">
                <div class="favor-block-inner max-content">
                    <div class="block-title">
                        <div class="block-title">
                            <h2 style="padding-top: 30px;">BẢNG GIÁ TÀU VICTORIA EXPRESS</h2>
                        </div>
                        <table style="border-color: #c5c2c1; text-align: center; margin-left: auto; margin-right: auto; border-collapse: collapse; width: 932px;"
                               border="1">
                            <tbody>
                            <tr>
                                <td style="border-color: #c5c2c1; width: 230px; height: 40px;" colspan="5">
                                    <strong>Áp dụng từ 01/10/2019 đến 30/09/2020</strong>
                                </td>
                            </tr>
                            <tr>
                                <td style="border-color: #c5c2c1; width: 230px; height: 40px;" rowspan="2">
                                    <b>Số khách</b>&nbsp;
                                </td>
                                <td style="border-color: #c5c2c1; width: 460px; height: 40px;" colspan="2">
                                    <strong>2 CHIỀU</strong>
                                </td>
                                <td style="border-color: #c5c2c1; width: 230px; height: 40px;" colspan="2">
                                    <b>1 CHIỀU</b>
                                </td>
                            </tr>
                            <tr>
                                <td style="border-color: #c5c2c1; width: 241px; height: 40px;">
                                    <strong>Phòng chung</strong>
                                    <br>
                                    <strong>(giá / giường)</strong>
                                </td>
                                <td style="border-color: #c5c2c1; width: 219px; height: 40px;">
                                    <b>Phòng riêng</b>
                                    <br>
                                    <strong>(giá / phòng)</strong>
                                </td>
                                <td style="border-color: #c5c2c1; width: 230px; height: 40px;">
                                    <strong>Phòng chung</strong>
                                    <br>
                                    <strong>(giá / giường)</strong>
                                </td>
                                <td style="border-color: #c5c2c1; width: 230px; height: 40px;">
                                    <b>Phòng riêng</b>
                                    <br>
                                    <strong>(giá / phòng)</strong>
                                </td>
                            </tr>
                            <tr>
                                <td style="border-color: #c5c2c1; width: 230px; height: 40px;">1</td>
                                <td style="border-color: #c5c2c1; width: 241px; height: 40px;">VND 3,062,000 ++</td>
                                <td style="border-color: #c5c2c1; width: 219px; height: 40px;">VND 8,280,000 ++</td>
                                <td style="border-color: #c5c2c1; width: 230px; height: 40px;">VND 1,939,000 ++</td>
                                <td style="border-color: #c5c2c1; width: 230px; height: 40px;">VND 5,235,300 ++</td>
                            </tr>
                            <tr>
                                <td style="border-color: #c5c2c1; width: 230px; height: 40px;">2</td>
                                <td style="border-color: #c5c2c1; width: 241px; height: 40px;">VND 6,124,000 ++</td>
                                <td style="border-color: #c5c2c1; width: 219px; height: 40px;">VND 9,200,000 ++</td>
                                <td style="border-color: #c5c2c1; width: 230px; height: 40px;">VND 3,878,000 ++</td>
                                <td style="border-color: #c5c2c1; width: 230px; height: 40px;">VND 5,817,000 ++</td>
                            </tr>
                            <tr>
                                <td style="border-color: #c5c2c1; width: 230px; height: 40px;">3</td>
                                <td style="border-color: #c5c2c1; width: 241px; height: 40px;">VND 9,186,000 ++</td>
                                <td style="border-color: #c5c2c1; width: 219px; height: 40px;">VND 10,580,000 ++</td>
                                <td style="border-color: #c5c2c1; width: 230px; height: 40px;">VND 5,817,000 ++</td>
                                <td style="border-color: #c5c2c1; width: 230px; height: 40px;">VND 6,689,550 ++</td>
                            </tr>
                            <tr>
                                <td style="border-color: #c5c2c1; width: 230px; height: 40px;">4</td>
                                <td style="border-color: #c5c2c1; width: 241px; height: 40px;" colspan="2">VND
                                    12,248,000 ++
                                </td>
                                <td style="border-color: #c5c2c1; width: 230px; height: 40px;" colspan="2">VND 7,756,000
                                    ++
                                </td>
                            </tr>
                            </tbody>
                        </table>
                        <ul class="circle-list" style="list-style: circle;padding: 75px;">
                            <li style="text-align: left;">Xác nhận đặt chỗ tuỳ vào số lượng giường trống.</li>
                            <li style="text-align: left;">Giá được tính theo Việt Nam Đồng, chưa bao gồm phí phục vụ và
                                thuế.
                            </li>
                            <li style="text-align: left;">Ưu đãi bữa sáng miễn phí tại Victoria Sapa Resort &amp; Spa
                                khi đến nơi, áp dụng cho khách di chuyển từ Hà Nội tới Lào Cai bằng tàu Victoria Express
                                và ở tại khách sạn
                            </li>
                            <li style="text-align: left;">Áp dụng nâng hạng phòng, vui lòng liên hệ để nhận báo giá chi
                                tiết
                                <strong>
                                    <br>Chính sách dành cho trẻ em
                                </strong>
                            </li>
                            <li style="text-align: left;">Miễn phí cho trẻ dưới 5 tuổi (nằm chung giường với bố mẹ)</li>
                            <li style="text-align: left;">Giảm 15% trên giá người lớn dành cho trẻ từ 5-12 tuổi (chỉ áp
                                dụng cho phòng chung)
                            </li>
                        </ul>
                    </div>
                    <div class="favor-block  gray-bg-block" style="margin-top: 50px;background-color: #e6e8e7;">
                        <div class="favor-block-inner max-content">
                            <div class="block-title">
                                <h2>THÔNG TIN LIÊN HỆ</h2>
                                <div class="under-line">&nbsp;</div>
                            </div>
                            <div style="text-align: center;">BỘ PHẬN ĐẶT PHÒNG
                                <br>Tel (84) 214 3871 522
                                <br>Fax (84) 214 3871 539
                                <br>Email:
                                <span id="cloak22febf03c30691d97ee94a7c6ffc6fad">
														<a style="color: #4183c4!important;"
                                                           href="mailto:resa.sapa@victoriahotels.asia">resa.sapa@victoriahotels.asia</a>
													</span>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!---->
            <%}else{%>
            <div class="favor-block white-bg-block">
                <div class="favor-block-inner max-content">
                    <div class="block-title">
                        <h2 style="padding-top: 30px;">VICTORIA EXPRESS TRAIN TARIFF&nbsp;</h2>
                    </div>
                    <table style="border-color: #c5c2c1; text-align: center; margin-left: auto; margin-right: auto; border-collapse: collapse; width: 932px;" border="1">
                        <tbody>
                        <tr>
                            <td style="border-color: #c5c2c1; width: 230px; height: 40px;" colspan="5"><strong>Valid from 01 Oct, 2019 until 30 Sep, 2020</strong></td>
                        </tr>
                        <tr>
                            <td style="border-color: #c5c2c1; width: 230px; height: 40px;" rowspan="2"><strong>Number of guests</strong>&nbsp;&nbsp;</td>
                            <td style="border-color: #c5c2c1; width: 460px; height: 40px;" colspan="2"><strong>ROUND TRIP</strong></td>
                            <td style="border-color: #c5c2c1; width: 230px; height: 40px;" colspan="2"><b>ONE WAY </b></td>
                        </tr>
                        <tr>
                            <td style="border-color: #c5c2c1; width: 241px; height: 40px;"><strong>Shared Cabin</strong><br><strong>(price per berth)</strong></td>
                            <td style="border-color: #c5c2c1; width: 219px; height: 40px;"><strong>Private Cabin</strong><br><strong>(price per cabin)</strong></td>
                            <td style="border-color: #c5c2c1; width: 230px; height: 40px;"><strong>Shared Cabin</strong><br><strong>(price per berth)</strong></td>
                            <td style="border-color: #c5c2c1; width: 230px; height: 40px;"><strong>Private Cabin<br>(price per cabin)</strong></td>
                        </tr>
                        <tr>
                            <td style="border-color: #c5c2c1; width: 230px; height: 40px;">1</td>
                            <td style="border-color: #c5c2c1; width: 241px; height: 40px;">VND 3,062,000 ++</td>
                            <td style="border-color: #c5c2c1; width: 219px; height: 40px;">VND 8,280,000 ++</td>
                            <td style="border-color: #c5c2c1; width: 230px; height: 40px;">VND 1,939,000 ++</td>
                            <td style="border-color: #c5c2c1; width: 230px; height: 40px;">VND 5,235,300 ++</td>
                        </tr>
                        <tr>
                            <td style="border-color: #c5c2c1; width: 230px; height: 40px;">2</td>
                            <td style="border-color: #c5c2c1; width: 241px; height: 40px;">VND 6,124,000 ++</td>
                            <td style="border-color: #c5c2c1; width: 219px; height: 40px;">VND 9,200,000 ++</td>
                            <td style="border-color: #c5c2c1; width: 230px; height: 40px;">VND 3,878,000 ++</td>
                            <td style="border-color: #c5c2c1; width: 230px; height: 40px;">VND 5,817,000 ++</td>
                        </tr>
                        <tr>
                            <td style="border-color: #c5c2c1; width: 230px; height: 40px;">3</td>
                            <td style="border-color: #c5c2c1; width: 241px; height: 40px;">VND 9,186,000 ++</td>
                            <td style="border-color: #c5c2c1; width: 219px; height: 40px;">VND 10,580,000 ++</td>
                            <td style="border-color: #c5c2c1; width: 230px; height: 40px;">VND 5,817,000 ++</td>
                            <td style="border-color: #c5c2c1; width: 230px; height: 40px;">VND 6,689,550 ++</td>
                        </tr>
                        <tr>
                            <td style="border-color: #c5c2c1; width: 230px; height: 40px;">4</td>
                            <td style="border-color: #c5c2c1; width: 241px; height: 40px;" colspan="2">VND 12,248,000 ++</td>
                            <td style="border-color: #c5c2c1; width: 230px; height: 40px;" colspan="2">VND 7,756,000 ++</td>
                        </tr>
                        </tbody>
                    </table>
                    <ul class="circle-list" style="padding: 75px;">
                        <li>Bookings subject to berth availability.</li>
                        <li>Rates are quoted in Vietnam Dong; exclusive of service fees and applicable government taxes.</li>
                        <li>Complimentary breakfast is offered upon arrival at Victoria Sapa Resort &amp; Spa to passengers traveling from Hanoi to Laocai on Victoria Express Train and staying at our resort.</li>
                        <li style="text-align: left;">Upgrading options are available, kindly contact us for a quotation<strong><br>Children's Policy</strong></li>
                        <li style="text-align: left;">Free of charge for children less than 5 yrs old using parents' existing berth</li>
                        <li style="text-align: left;">15% off Adults' rates for children between 5 -12 years old (applied for shared cabin only, no special rate for private cabin)</li>
                    </ul>
                </div>
            </div>
            <%}%>
        </div>
    </div>
</div>
        <jsp:include page="loading.jsp"></jsp:include>
        <jsp:include page="./Footer.jsp"></jsp:include>
</body>
</html>
