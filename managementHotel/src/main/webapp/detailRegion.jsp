<%@ page import="DTO.RegionTO" %>
<%@ page import="Language.LanguageControl" %>
<%@ page import="DTO.StaticTO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="DTO.KindRoomTO" %>
<%@ page import="DTO.UploadResourceTO" %><%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 07/05/2020
  Time: 8:26 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    RegionTO regionTO = (RegionTO) request.getAttribute("regionTO");
    LanguageControl lang = (LanguageControl) session.getAttribute("LanguageControl");
    String language = session.getAttribute("language") != null ? (String) session.getAttribute("language") : LanguageControl.VN_LAN;
    ArrayList<KindRoomTO> listRoom=(ArrayList<KindRoomTO>)request.getAttribute("listRoom");
    ArrayList<UploadResourceTO> listResource=(ArrayList<UploadResourceTO>)request.getAttribute("listResource");
%>
<html>
<head>
    <title>
        <%
            if (regionTO != null) {
                if (language.equals(LanguageControl.VN_LAN)) {
        %>
        <%=regionTO.getName_vi()%>
        <%
        } else {
        %>
        <%=regionTO.getName_en()%>
        <%
                }
            }
        %>
    </title>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/home-css.css"/>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/detailRegion-css.css"/>
    <style>
        .header-div-main {
            position: relative !important;
        }
    </style>
    <jsp:include page="library_detail.jsp"></jsp:include>
</head>
<body style="background-color: #e6e8e7">
<jsp:include page="header-not-slide.jsp"></jsp:include>
<%
    if (regionTO != null) {
%>
<div class="img-gallery-display"
     style="height: 450px;width: 100%;background:url('<%=request.getContextPath() %>/<%=regionTO.getFile_url_img().replace(StaticTO.STATIC_PATH,"").replace("\\","//")%>') no-repeat;background-size: 100% 100%;background-position: center;">

</div>
<div class="container div-main-detail">
    <!--Giới thiệu-->
    <div class="title-detail col-md-12">
        <h2>
            <%if (language.equals(LanguageControl.VN_LAN)) {%>
            Giới thiệu
            <%} else {%>
            Introduction
            <%}%>
        </h2>
        <div class="under-line"></div>
    </div>

    <div class="content-detail col-md-12">
        <div class="col-md-12" id="intro-offers">
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
                            <a href="https://www.victoriahotels.asia/benefit-booking">CHI TIẾT</a>
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
                            <a href="https://www.victoriahotels.asia/benefit-booking">FIND OUT MORE</a>
                        </div>
                        <%}%>
                    </div>
                </div>


                <div class="col-md-8 video-iframe">
                    <div class="content-inner" style="min-height: 364px;">
                        <iframe src="https://www.youtube.com/embed/-Q7_mPUSJuc" frameborder="0"
                                allowfullscreen=""></iframe>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-6"></div>
    </div>
    <!---->

    <!--Phòng nghỉ-->
    <div class="title-detail col-md-12" style="margin: 15px;">
        <h2>
            <%if (language.equals(LanguageControl.VN_LAN)) {%>
            Phòng nghỉ
            <%} else {%>
            ancomodation
            <%}%>
        </h2>
        <div class="under-line"></div>
    </div>

    <div class="content-detail col-md-12">
        <div class="col-md-12" id="room">
            <!--nội dung giới thiệu phòng ngỉ-->
            <div class="clients-wrap">
                <ul id="clients-list" class="clearfix" style="display: flex;max-width: inherit;overflow: hidden;position: relative;">
                    <%
                        if(listRoom!=null&&listResource!=null){
                            for (int i = 0; i <listRoom.size() ; i++) {


                    %>
                   <li style="margin-right: 10px;">
                       <%if (language.equals(LanguageControl.VN_LAN)) {%>

                       <%}else{%>

                       <%
                           }
                       %>
                           <a href="<%=request.getContextPath()+"/vi/"+regionTO.getRegion_id()+"/accomodation.html"%>">
                       <div class="parent">
                       <div class="child" style="background: url('<%=request.getContextPath()+"/"+listResource.get(i).getFile_url().replace(StaticTO.STATIC_PATH,"").replace("\\","//")%>') no-repeat;background-position: center;background-size: 100% 100%" >

                       </div>
                       </div>
                           </a>
                       <div class="pos-title">
                           <%if (language.equals(LanguageControl.VN_LAN)) {%>
                          <h2><%=listRoom.get(i).getName_vi()%></h2>
                           <%
                               }else{
                           %>
                           <h2><%=listRoom.get(i).getName_en()%></h2>
                           <%
                               }
                           %>
                       </div>
                   </li>
                    <%
                            }
                        }
                    %>
                </ul>
                <div class="prev action-item"><button><span><i class="angle left icon"></i></span></button></div>
                <div class="next action-item"><button><span><i class="angle right icon"></i></span></button></div>
            </div>
        </div>



    </div>

    <!---->

    <!--Giai tri va tien ich-->
    <div class="title-detail col-md-12" style="margin: 15px;">
        <h2>
            <%if (language.equals(LanguageControl.VN_LAN)) {%>
            GIẢI TRÍ VÀ TIỆN ÍCH
            <%} else {%>
            AT THE HOTEL
            <%}%>
        </h2>
        <div class="under-line"></div>
    </div>
    <div class="content-detail col-md-12">
        <div class="col-md-12 row" id="entertainment" style="justify-content: center;">
            <div class="col-md-4">
                <div class="img-entertainment" style="background: url('<%=request.getContextPath()%>/img/amthuc.jpg') no-repeat;">
                    <a href="amthuc"></a>
                </div>
                <div class="content-entertainment">
                    <h3>Ẩm thực</h3>
                    <p style="word-break: break-word">
                        Cảm nhận đặc trưng của ẩm thực Sapa thông qua nguyên liệu, hương vị độc đáo tại nhà hàng Tả Văn và bar Tả Fin với lò sưởi ấm áp cùng tầm nhìn hùng vĩ của Fansipan.
                    </p>
                    <a href="amthuc" style="color: black">Chi tiết</a>
                </div>
            </div>
            <div class="col-md-4">
                <div class="img-entertainment" style="background: url('<%=request.getContextPath()%>/img/thugian.jpg') no-repeat;">
                    <a href="thugian"></a>
                </div>
                <div class="content-entertainment">
                    <h3>Thư giãn</h3>
                    <p style="word-break: break-word">
                        Spa Victoria trải dài hai tầng với hệ thống xông hơi và bồn tắm bằng gỗ thông được thiết kế riêng. Khu phức hợp bao gồm 8 phòng trị liệu đơn và 4 phòng trị liệu đôi.
                    </p>
                    <a href="thugian" style="color: black">Chi tiết</a>
                </div>
            </div>
            <div class="col-md-4">
                <div class="img-entertainment" style="background: url('<%=request.getContextPath()%>/img/dichvu.jpg') no-repeat;">
                    <a href="dichvu"></a>
                </div>
                <div class="content-entertainment">
                    <h3>Dịch vụ</h3>
                    <p style="word-break: break-word">
                        Khu nghỉ dưỡng cung cấp nhiều dịch vụ từ vận chuyển và lịch trình tham quan đến trông trẻ và khu vui chơi trẻ em.
                    </p>
                    <a href="dichvu" style="color: black">Chi tiết</a>
                </div>
            </div>
        </div>
    </div>


    <!---->

    <!--Trai nghiem-->
    <div class="title-detail col-md-12" style="margin: 15px;">
        <h2>
            <%if (language.equals(LanguageControl.VN_LAN)) {%>
            TRẢI NGHIỆM VICTORIA
            <%} else {%>
            VICTORIA EXPERIENCE
            <%}%>
        </h2>
        <div class="under-line"></div>
    </div>
    <div class="content-detail col-md-12">
        <div class="col-md-12 " id="experience">
            <div id="demo" class="carousel slide" data-ride="carousel">

                <!-- Indicators -->
                <ul class="carousel-indicators">
                    <li data-target="#demo" data-slide-to="0" class="active"></li>
                    <li data-target="#demo" data-slide-to="1"></li>
                    <li data-target="#demo" data-slide-to="2"></li>
                </ul>

                <!-- The slideshow -->
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img src="<%=request.getContextPath()%>/img/trainghiem-1.jpg" alt="Los Angeles">
                    </div>
                    <div class="carousel-item">
                        <img src="<%=request.getContextPath()%>/img/trainghiem-2.jpg" alt="Chicago">
                    </div>
                    <div class="carousel-item">
                        <img src="<%=request.getContextPath()%>/img/trainghiem-3.jpg" alt="New York">
                    </div>
                </div>

                <!-- Left and right controls -->
                <a class="carousel-control-prev" href="#demo" data-slide="prev">
                    <span class="carousel-control-prev-icon"></span>
                </a>
                <a class="carousel-control-next" href="#demo" data-slide="next">
                    <span class="carousel-control-next-icon"></span>
                </a>

            </div>
        </div>
    </div>

    <!--ưu đãi-->
    <div class="title-detail col-md-12" style="margin: 15px;">
        <h2>
            <%if (language.equals(LanguageControl.VN_LAN)) {%>
            ƯU ĐÃI
            <%} else {%>
            SPECIAL OFFERS
            <%}%>
        </h2>
        <div class="under-line"></div>
    </div>
    <div class="content-detail col-md-12">
        <div class="col-md-12 row" id="offers">
            <div class="col-md-4">
                <div class="img-entertainment" style="background: url('<%=request.getContextPath()%>/img/uudai-1.jpg') no-repeat;">
                    <a href="amthuc"></a>
                </div>
                <div class="content-entertainment">
                    <h3>Gói Tham Dự Giải Chạy Vietnam Mountain Marathon 2020</h3>
                    <p style="word-break: break-word">
                        US $410/ 2 khách hoặc US $305/ khách
                    </p>
                    <p style="word-break: break-word">
                        Cùng Victoria Sapa vượt qua giới hạn bản thân với giải Vietnam Mountain Marathon 2020 trên những cung đường thử thách nhất Việt Nam tại Sapa.
                    </p>
                    <p style="word-break: break-word">
                    3 Ngày / 2 Đêm
                </p>
                    <p style="word-break: break-word">
                        Áp dụng đến 20/09/2020
                    </p>
                    <a href="amthuc" style="color: black">Chi tiết</a>
                </div>
            </div>
            <div class="col-md-4">
                <div class="img-entertainment" style="background: url('<%=request.getContextPath()%>/img/uudai-2.jpg') no-repeat;">
                    <a href="thugian"></a>
                </div>
                <div class="content-entertainment">
                    <h3>Gói Tham Dự Giải Chạy Vietnam Mountain Marathon 2020 Bao Gồm Tàu</h3>
                    <p style="word-break: break-word">
                        US $710/ 2 khách hoặc US $435/ 1 khách
                    </p>
                    <p style="word-break: break-word">
                        Trải nghiệm cuộc đua hoàn hảo hơn với tàu Victoria Express 2 chiều khởi hành từ Hà Nội, thưởng thức những bữa ăn bổ dưỡng và mát-xa thư giãn chuẩn bị cho cuộc đua.
                    </p>
                    <p style="word-break: break-word">
                        3 Ngày / 2 Đêm
                    </p>
                    <p style="word-break: break-word">
                        Áp dụng đến 20/09/2020
                    </p>
                    <a href="thugian" style="color: black">Chi tiết</a>
                </div>
            </div>
            <div class="col-md-4">
                <div class="img-entertainment" style="background: url('<%=request.getContextPath()%>/img/trainghiem-2.jpg') no-repeat;">
                    <a href="dichvu"></a>
                </div>
                <div class="content-entertainment">
                    <h3>Khám Phá Sapa Cùng Tàu Victoria Express</h3>
                    <p style="word-break: break-word">
                        VND 4,136,000 ++ / khách – Tối thiểu 2 khách 1 phòng
                    </p>
                    <p style="word-break: break-word">
                        (Giảm thêm 20% cho khách khởi hành vào thứ 3 hàng tuần)
                    </p>
                    <p style="word-break: break-word">
                        Trải nghiệm Sapa hoàn hảo với 2 ngày 1 đêm nghỉ tại Victoria Sapa bao gồm vé tàu 2 chiều từ Hà Nội, tour thưởng ngoạn sapa, dịch vụ mát xa, ăn tối và nhiều ưu đãi khác
                    </p>
                    <p style="word-break: break-word">
                        2 Ngày / 1 Đêm
                    </p>
                    <p style="word-break: break-word">
                        Áp dụng đến 23/12/2020
                    </p>
                    <a href="dichvu" style="color: black">Chi tiết</a>
                </div>
            </div>
        </div>
    </div>
    <!---->


</div>
<div class="col-md-6"></div>
</div>
</div>
<%
    }
%>
<script>
    $(document).ready(function(){
        var $clientcarousel = $('#clients-list');
        var clients = $clientcarousel.children().length;
        var clientwidth = (3 * 360); // 140px width for each client item
        $clientcarousel.css('width',clientwidth);

        var animtime = 750;
        var rotating = true;
        var clientspeed = 1800;
        // var seeclients = setInterval(rotateClients, clientspeed);
        $('.prev').on('click', function(){
            var $last = $('#clients-list li:last');
            $last.remove().css({ 'margin-left': '-340px' });
            $('#clients-list li:first').before($last);
            $last.animate({ 'margin-left': '0px' }, animtime);
        });

        $('.next').on('click', function(){
            var $first = $('#clients-list li:first');
            $first.animate({ 'margin-left': '-340px' }, animtime, function() {
                $first.remove().css({ 'margin-left': '0px' });
                $('#clients-list li:last').after($first);
            });
        });

        $(document).on({
            mouseenter: function(){
                rotating = false; // turn off rotation when hovering
            },
            mouseleave: function(){
                rotating = true;
            }
        }, '#clients');

        function rotateClients() {
            if(rotating != false) {
                var $first = $('#clients-list li:first');
                $first.animate({ 'margin-left': '-360px' }, 600, function() {
                    $first.remove().css({ 'margin-left': '0px' });
                    $('#clients-list li:last').after($first);
                });
            }
        }

    });
</script>
<jsp:include page="loading.jsp"></jsp:include>
<jsp:include page="./Footer.jsp"></jsp:include>
</body>
</html>
