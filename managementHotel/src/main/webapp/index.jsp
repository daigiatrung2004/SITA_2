<%@ page import="DTO.RegionTO" %>
<%@ page import="Language.LanguageControl" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="DTO.AdvertisementTO" %>
<%@ page import="DTO.StaticTO" %>
<%@ page import="Utils.TextCustomizeFormat" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%LanguageControl lang = (LanguageControl) session.getAttribute("LanguageControl");%>
<% String language = session.getAttribute("language") != null ? (String) session.getAttribute("language") : LanguageControl.VN_LAN;
    ArrayList<AdvertisementTO> listAdvertisement = (ArrayList<AdvertisementTO>) request.getAttribute("listAdvertisement");
%>
<html>
<head>
    <title>Home-Victoria Secret</title>
    <link rel="stylesheet" href="css/home-css.css"/>
    <jsp:include page="Library.jsp"></jsp:include>

</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<main class="container">
    <%
        ArrayList<RegionTO> listRegionTO = (ArrayList<RegionTO>) request.getAttribute("listRegionTO");

    %>
    <div class="div-main-home-customer">
        <%--        <div class="ui rail">--%>
        <%--            <div class="ui sticky ">--%>
        <%--                <!-- Any arbitrary content !-->--%>
        <%--                hello--%>
        <%--            </div>--%>
        <%--        </div>--%>
        <%--        <div id="context">--%>
        <%--            <!-- Long flowing text content !-->--%>
        <%--            <h2>xin choa</h2>--%>
        <%--        </div>--%>
        <!--danh cho booking-->
        <nav class="navbar navbar-inverse " id="nav-booking">
            <div class="search-booking  ">
                <!--search booking-->
                <form id="form-search-home" method="get" action="SearchControl">


                    <ul class="ul-search">
                        <li>
                            <!--location-->
                            <div>
                                <label><%=lang.readXMl("DESTINATION_TITLE")%>
                                </label>
                            </div>
                            <div class="element-search">
                                <select class="select-search" name="location">
                                    <option value="0">
                                        <%
                                            if (language.equals(LanguageControl.VN_LAN)) {
                                        %>
                                        Tất cả
                                        <%}else{%>
                                        All
                                        <%}%>
                                    </option>
                                    <%
                                        if (listRegionTO != null) {
                                            for (int i = 0; i < listRegionTO.size(); i++) {
                                                if (language.equals(LanguageControl.VN_LAN)) {
                                    %>

                                    <option value="<%=listRegionTO.get(i).getRegion_id()%>"><%=listRegionTO.get(i).getName_vi()%>
                                    </option>
                                    <%
                                    } else {
                                    %>
                                    <option value="<%=listRegionTO.get(i).getRegion_id()%>"><%=listRegionTO.get(i).getName_en()%>
                                    </option>
                                    <%

                                                }
                                            }
                                        }
                                    %>


                                </select>

                            </div>

                        </li>
                        <li>
                            <!--check in-->
                            <div>
                                <label><%=lang.readXMl("CHECK_IN_TITLE")%>
                                </label>
                            </div>
                            <div class="element-search div-check-in">
                                <div class="div-text-check">

                                    <input type="text" name="checkIn" value="" class="item-input-check" id="checkIn">
                                    <span class="span-check"><i class="calendar alternate icon"></i></span>
                                </div>
                            </div>
                        </li>
                        <li>
                            <!--check out-->
                            <div>
                                <label><%=lang.readXMl("CHECK_OUT_TITLE")%>
                                </label>
                            </div>
                            <div class="element-search div-check-out">
                                <div class="div-text-check">
                                    <%--                                    <span id="text-check-out"></span>--%>
                                    <input type="text" name="checkOut" class="item-input-check" value="" id="checkOut">
                                    <span class="span-check"><i class="calendar alternate icon"></i></span>
                                </div>
                            </div>

                        </li>
                        <li>
                            <!--so luong nguoi -->
                            <div>
                                <label><%=lang.readXMl("NUMOFPEO")%>
                                </label>
                            </div>
                            <div class="element-search">
                                <div class="select-customize">

                                <span id="show-num-people">
                                    <%
                                        if (language.equals(LanguageControl.VN_LAN)) {
                                    %>
                                    <span id="soluong">2</span> người lớn
                                    <%} else {%>
                                     <span id="soluong">2</span> person
                                    <%}%>
                                    <input type="hidden" value="2" name="numOfPeo" id="numOfPeo"/>
                                </span>
                                    <span class="icon"><i class="angle down icon"></i></span>
                                </div>
                                <div class="pos-show-num-people">
                                    <div>
                                        <%
                                            if (language.equals(LanguageControl.VN_LAN)) {
                                        %>
                                        <label>Người lớn per room</label>
                                        <%
                                        } else {
                                        %>
                                        <label>adult per room</label>
                                        <%
                                            }%>
                                        <div style="display: flex;justify-content: center;">
                                            <div class="bg-num-people substract">
                                                <button type="button" class="btn-peo">-</button>
                                            </div>
                                            <div class="div-show-num-people bg-num-people">2</div>
                                            <div class="bg-num-people plus">
                                                <button type="button" class="btn-peo">+</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <input type="hidden" name="numOfPeople" value="2" id="numOfPeople">
                        </li>
                        <li>
                            <!--promotion-->
                            <div>
                                <label><%=lang.readXMl("PROMOTION_TITLE")%>
                                </label>
                            </div>
                            <div class="element-search">
                                <input type="text" value="" name="promote" id="promote"
                                       placeholder="<%if(language.equals(LanguageControl.VN_LAN)){%>Mã Khuyến Mãi<%}else{%>Promote Code<%}%>">

                            </div>
                        </li>
                        <li style="align-items: center; margin-top: 35px;">
                            <!--btn tìm kiếm -->
                            <button class="search-btn-booking">
                                <%=lang.readXMl("SEARCH")%>
                            </button>
                        </li>

                    </ul>
                </form>
            </div>
        </nav>
        <div class="booking col-md-12" style=" padding-bottom: 100px!important;">
            <!--nội dung giới thiệu booking-->
            <div class="col-md-12" id="video-booking-home">
                <div class="col-md-4 video-content">
                    <div class="content-inner" style="min-height: 400px;">
                        <%if (language.equals(LanguageControl.VN_LAN)) {%>
                        <h2></h2>
                        <p><span style="font-size: 14pt;"><strong>ƯU ĐÃI CHO KHÁCH ĐẶT TRỰC TIẾP:</strong></span></p>
                        <ul>
                            <li>Miễn phí nhận phòng sớm và trả phòng muộn (Tuỳ tình trạng phòng trống)</li>
                            <li>Miễn phí nâng hạng loại phòng (Tuỳ tình trạng phòng trống)</li>
                            <li>Miễn phí đưa/đón tại sân bay (Tùy khách sạn)</li>
                            <li>Giảm giá dịch vụ Spa &amp; Ăn uống</li>
                        </ul>
                        <div class="video-content-link">

                            <a href="./vi/benefit-booking">CHI TIẾT</a>
                        </div>

                        <%} else {%>
                        <h2>EXCLUSIVE BENEFITS
                            FOR DIRECT BOOKERS:</h2>
                        <ul>
                            <li>Complimentary early check-in and late check-out (subject to availability)</li>
                            <li>Complimentary upgrade to next room category (subject to availability)</li>
                            <li>Complimentary airport transfer (selected accommodations)</li>
                            <li>Discount on Spa, Food and Beverage</li>
                        </ul>
                        <div class="video-content-link">
                            <a href="./en/benefit-booking">FIND OUT MORE</a>
                        </div>
                        <%}%>
                    </div>
                </div>


                <div class="col-md-8 video-iframe">
                    <div class="content-inner" style="min-height: 364px;">
                        <iframe src="https://www.youtube.com/embed/_MVk5J6ZZgs?rel=0" frameborder="0"
                                allowfullscreen=""></iframe>
                    </div>
                </div>
            </div>
        </div>

        <!--dành cho trải nghiệm-->
        <div class="experience-block   col-md-12" style=" padding-bottom: 100px!important;">
            <div class="experience-block-inner">

                <div class="block-title">
                    <h2><%=lang.readXMl("experience_header")%>
                    </h2>

                    <div class="under-line"></div>
                </div>
                <div class="col-md-12  experiences ">
                    <div class="col-md-8 experience-item ">

                        <a class="view-details" href="/vi/hotels-resorts/hoian/side-car.html">
                            <div class="experiences-bg" style="background: url('./img/13-med.jpg'); background-repeat: no-repeat;
							background-position: center 35%;
							background-size: cover;">
                                <div class="intro-text">
                                    <%if (language.equals(LanguageControl.VN_LAN)) {%>
                                    <h3>KHU NGHỈ DƯỠNG BIỂN &amp; SPA VICTORIA HỘI AN</h3>
                                    <div class="intro"><p>THAM QUAN</p>
                                        <p>BIÊN GIỚI LÀO</p>
                                        <p>BẰNG SIDE CAR</p></div>
                                    <%} else {%>
                                    <h3>VICTORIA HOI AN BEACH RESORT &amp; SPA</h3>
                                    <div class="intro"><p>SIDE CAR</p>
                                        <p>ADVENTURE TO</p>
                                        <p>THE LAOS BORDER</p></div>
                                    <%}%>
                                </div>
                            </div>
                        </a>

                    </div>
                    <div class="col-md-4 experience-item">
                        <a class="view-details" href="/vi/hotels-resorts/sapa/victoria-express-train.html">
                            <div class="experiences-bg" style="background: url('./img/12-med.jpg');
						background-repeat: no-repeat;
						background-position: center 35%;
						background-size: cover;">
                                <div class="intro-text">
                                    <%if (language.equals(LanguageControl.VN_LAN)) {%>
                                    <h3>KHU NGHỈ DƯỠNG &amp; SPA VICTORIA SAPA</h3>
                                    <div class="intro"><p>CHÀO MỪNG ĐẾN VỚI</p>
                                        <p>TÀU HOẢ</p>
                                        <p>VICTORIA EXPRESS</p></div>
                                    <%} else {%>

                                    <h3>VICTORIA SAPA RESORT &amp; SPA</h3>
                                    <div class="intro"><p>WELCOME TO</p>
                                        <p>VICTORIA&nbsp;</p>
                                        <p>EXPRESS TRAIN</p></div>
                                    <%}%>
                                </div>
                            </div>
                        </a>
                    </div>
                </div>
            </div>

        </div>

        <!--dành cho giá ưu đãi-->
        <div class="endow  col-md-12" style=" padding-bottom: 100px!important;">
            <%
                if (listAdvertisement != null) {
            %>
            <div class="block-title">
                <h2><%=lang.readXMl("enow_header")%>
                </h2>
                <div class="under-line"></div>
            </div>
            <div id="slide-endow" class="carousel slide" data-ride="carousel">
                <!-- Indicators -->


                <!-- The slideshow -->
                <div class="carousel-inner">
                    <%
                        if (listAdvertisement.size() > 0) {
                            for (int i = 0; i < listAdvertisement.size(); i++) {

                                if (i == 0) {
                    %>
                    <div class="carousel-item active">
                        <a href="./<%=language%>/<%=listAdvertisement.get(i).getRegion_id()%>/<%=listAdvertisement.get(i).getID()%>/endow.html">
                            <img src="<%=listAdvertisement.get(i).getFILE_URL_IMG().replace(StaticTO.STATIC_PATH,"")%>"
                                 alt="" class="img-size-endow">
                        </a>
                    </div>
                    <%
                    } else {
                    %>
                    <div class="carousel-item ">
                        <a href="./<%=language%>/<%=listAdvertisement.get(i).getRegion_id()%>/<%=listAdvertisement.get(i).getID()%>/endow.html">

                            <img src="<%=listAdvertisement.get(i).getFILE_URL_IMG().replace(StaticTO.STATIC_PATH,"")%>"
                                 alt="" class="img-size-endow">
                        </a>
                    </div>
                    <%
                                }
                            }
                        }
                    %>
                </div>

                <!-- Left and right controls -->
                <a class="carousel-control-prev" href="#slide-endow" data-slide="prev">
                    <span class="carousel-control-prev-icon"></span>
                </a>
                <a class="carousel-control-next" href="#slide-endow" data-slide="next">
                    <span class="carousel-control-next-icon"></span>
                </a>
            </div>
            <%
                }
            %>
        </div>

        <!-- giới thiệu về victoria-->
        <div class="about">
            <div class="about-us-block " style=" padding-bottom: 100px!important;">
                <div class="about-us-block-inner ">
                    <div class="block-title">
                        <h2><%=lang.readXMl("about_header")%>
                        </h2>
                        <div class="under-line"></div>
                    </div>
                    <div class="media ">

                        <img src="./img/15-med.jpg" style="height: 250px;">

                        <div class="media-body about-us-text">

                            <h2><%=lang.readXMl("title_content_about")%>
                            </h2>
                            <p><%=lang.readXMl("content_about_page1")%>
                            </p>
                            <p><%=lang.readXMl("content_about_page2")%>
                            </p>
                            <p>
                                <%if (language.equals(LanguageControl.VN_LAN)) {%>
                                <a class="view-details" href="./vi/about-victoria.html" style="color: black!important">Chi
                                    tiết</a>
                                <%} else {%>
                                <a class="view-details" href="./en/about-victoria.html" style="color: black!important">View
                                    Details</a>
                                <%}%>
                            </p></div>
                    </div>
                </div>

            </div>
        </div>
    </div>
</main>
<jsp:include page="loading.jsp"></jsp:include>
<script>
    $(document).ready(function () {
        var d = new Date();

        var month = d.getMonth() + 1;
        var month_check_out = d.getMonth() + 1;
        var day = d.getDate();
        var datTomorow = d.getDate() + 1;
        var checkIn = (('' + day).length < 2 ? '0' : '') + day + '/' + (('' + month).length < 2 ? '0' : '') + month + '/' + d.getFullYear();
        var checkOut = (('' + datTomorow).length < 2 ? '0' : '') + datTomorow + '/' + (('' + month_check_out).length < 2 ? '0' : '') + month_check_out + '/' + d.getFullYear();
        $("#checkOut").val(checkOut);
        $("#checkIn").val(checkIn);
        // $("#text-check-in").text(checkIn);
        // $("#text-check-out").text(checkOut);
        $(function () {
            $("#checkOut").datepicker({
                format: 'dd/mm/yyyy',
                changeMonth: true,
                minDate: 0
            });
            $("#checkIn").datepicker({
                format: 'dd/mm/yyyy',
                changeMonth: true,
                minDate: 0
            });
        });
        $(".select-customize").click(function () {
            $("#text-check-out").hide();
            $("#pos-check-in").hide();
            $(".pos-show-num-people").toggle();
        });
        $(".plus").click(function () {
            var numOfPeo = $(".div-show-num-people").text();
            if (numOfPeo < 10) {
                numOfPeo++;
            }
            $("#numOfPeople").val(numOfPeo);
            $("#show-num-people #soluong").text(numOfPeo);
            $(".div-show-num-people").text(numOfPeo);

        });
        $(".substract").click(function () {
            var numOfPeo = $(".div-show-num-people").text();
            if (numOfPeo > 1) {
                numOfPeo--;
            }
            $("#numOfPeople").val(numOfPeo);
            $("#show-num-people #soluong").text(numOfPeo);
            $(".div-show-num-people").text(numOfPeo);
        });

    });


    function formatDate(date) {
        var split = date.split("/");
        var reformat = split[1] + "/" + split[0] + "/" + split[2];
        return reformat;
    }


</script>
<script>
    // $('.ui.sticky').sticky({context: '#form-search-home'});
</script>

<jsp:include page="Footer.jsp"></jsp:include>
</body>
</html>
