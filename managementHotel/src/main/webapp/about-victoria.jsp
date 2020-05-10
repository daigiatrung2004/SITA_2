<%@ page import="Language.LanguageControl" %><%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 04/05/2020
  Time: 7:33 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String language = session.getAttribute("language") != null ? (String) session.getAttribute("language") : LanguageControl.VN_LAN;
    LanguageControl lang = (LanguageControl) session.getAttribute("LanguageControl");

%>
<html>
<head>
    <title>Về Victoria</title>
    <jsp:include page="Library.jsp"></jsp:include>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/home-css.css"/>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/about-victoria-css.css"/>
    <style>
        .header-div-main {
            position: relative !important;
        }

    </style>
</head>
<body style="background-color:#DEE1E6">
<jsp:include page="header-not-slide.jsp"></jsp:include>
<div class="main-about-victoria ">
    <div class="header-about title-footer" style="margin: 0px;">
        <h2 class="h2-about" style="text-align: center;"><%=lang.readXMl("about_header")%>
        </h2>
    </div>
    <div>
        <ul class="ul-tab" style="display: flex;justify-content: center;">
            <li class="li-active" id="about" name="about "><%=lang.readXMl("about_header")%>
            </li>
            <li name="CSR" id="CSR">CSR</li>
            <li name="TMG" id="TMG">
                <%if (language.equals(LanguageControl.VN_LAN)) {%>
                Về TMG
                <%} else {%>
                About TMG
                <%}%>
            </li>
        </ul>
    </div>
    <div class="body-about container" style="background-color: white;">

        <div class="item-about div-item  active">
            <div class="col-md-12" style="display: flex;justify-content: center;">
                <img src="<%=request.getContextPath() %>/img/img_about_1.jpg" style="height:385px;width:100%;">
            </div>
            <div class="col-md-12 row" style="margin-top: 20px;">
                <%
                    if (language.equals(LanguageControl.VN_LAN)) {
                %>
                <div class="col-md-4" style="display: flex;justify-content: flex-end;margin:20px 0px;">
                    <h2 style="color: #B9975B">Giới thiệu</h2>
                </div>
                <div class="col-md-4">
                    <p>
                        Chuỗi khách sạn và nghỉ dưỡng Victoria mang đến cho du khách những trải nghiệm độc nhất vô
                        nhị về một Đông Dương đích thực. Mỗi khách sạn Victoria mang những đặc trưng nổi bật của
                        phong cách kiến trúc Pháp cổ cũng như giới thiệu với du khách giá trị văn hóa và cảnh quan
                        thiên nhiên của từng vùng miền. Sứ mệnh của Victoria là trở thành người bạn đồng hành trong
                        chuyến hành trình trải nghiệm sự khác biệt thông qua dịch vụ tận tâm, niềm tự hào về nền văn hóa
                        lâu đời và tinh thần hào phóng.
                    </p>
                    <p>
                        Ngoài ra, Victoria sở hữu phương tiện di chuyển rất riêng và độc quyền như các loại xe cổ,
                        thuyền tam bản truyền thống xe lửa hạng sang… nhằm hoàn thiện trải nghiệm của du khách trên
                        chặng đường khám phá nét đặc trưng của Đông Dương.
                    </p>
                </div>
                <div class="col-md-4">
                    <p>
                        Từ những dãy núi nguyên sơ bao quanh thị trấn Sapa, tới khu phố cổ Hội An, qua các cồn cát ven
                        biển Phan Thiết đến khu chợ nổi đặc sắc miền Cửu Long và thành phố cổ kính Luang Prabang của
                        Lào, du khách sẽ luôn tìm thấy ở Victoria sự hiếu khách chân thành và tinh thần hăng say, nồng
                        nhiệt đặc trưng của văn hoá Á Đông. Không chỉ đem đến một kỳ nghỉ thư thái, các khách sạn
                        luôn mong muốn mang tới cho du khách cảm nhận sự kỳ diệu của Đông Dương qua những trải nghiệm
                        gần gũi với văn hóa và con người địa phương.
                    </p>
                </div>
                <%
                } else {
                %>
                <div class="col-md-4" style="display: flex;justify-content: flex-end;margin:20px 0px;">
                    <h2 style="color: #B9975B;">ABOUT
                        VICTORIA
                    </h2>
                </div>
                <div class="col-md-4">
                    <p>
                        Victoria Hotels and Resorts connect guests with the real Indochina in ways like no other hotel
                        can. Proud of our Indochina roots, our boutique properties embrace the best aspects of the
                        colonial heritage, while showcasing local culture and landscapes. We are dedicated to helping
                        our guests along their journeys of distinction through heartfelt service, pride in our culture,
                        and generosity of spirit.
                    </p>
                    <p>
                        Victoria also offers guests cruising and rail travel opportunities in key tourism destinations
                        in Vietnam and Laos, providing guests with unparalleled charm, comfort, service and privacy.
                    </p>
                </div>
                <div class="col-md-4">
                    <p>
                        From the pristine mountains of Sapa to the historic Hoi An Ancient Town, from the coastline
                        backed by desert-like sand dunes in Phan Thiet to the exotic floating markets of the Mekong
                        Delta or Luang Prabang, one of Asia’s most beautiful and peaceful towns, each property offers
                        genuine hospitality and a lively energy that are trademarks of the real Indochina. Mixing
                        French-colonial styles of architecture with flourishes of local tradition, our captivating
                        properties blend history, culture and landscape into a gently unforgettable experience.
                    </p>
                </div>
                <%
                    }
                %>
            </div>
            <div class="col-md-12 row" style="padding:20px;">
                <div class="col-md-6" style="display: flex;justify-content: center;align-items: center;padding:20px;">
                    <img src="<%=request.getContextPath() %>/img/img_about_2.jpg" style="width: inherit;">
                </div>
                <div class="col-md-6">
                    <%if (language.equals(LanguageControl.VN_LAN)) {%>
                    <h2 style="color:#B9975B">GIÁ TRỊ CỐT LÕI</h2>
                    <h4>TRẢI NGHIỆM ĐẶC TRƯNG</h4>
                    <p>Các khu nghỉ dưỡng và khách sạn của Victoria mang đến cho du khách những trải nghiệm độc nhất vô
                        nhị về một Đông Dương địch thực.</p> <h4>TRẢI NGHIỆM ĐẶC TRƯNG</h4>
                    <h4>NÉT ĐẸP CỔ ĐIỂN</h4>
                    <p>Victoria luôn cung cấp những dịch vụ đạt chuẩn 4 sao với nét cổ điển và cá tính riêng của từng
                        vùng miền nhằm đáp ứng nhu cầu du lịch trải nghiệm đa dạng của quý khách.</p>
                    <h4>KẾT NỐI CỘNG ĐỒNG</h4>
                    <p>Với am hiểu và gắn bó về văn hóa, phong tục địa phương, chúng tôi đưa du khách đến gần hơn với
                        những giá trị truyền thống bản địa.</p>
                    <h4>TINH THẦN HIẾU KHÁCH</h4>
                    <p>Không tọa lạc tại những thành phố lớn, các khách sạn và khu nghỉ dưỡng của Victoria nằm ở những
                        điểm đến độc đáo của Việt Nam & Lào, thể hiện sự hiếu khách chân thành và nồng nhiệt đặc trưng
                        của văn hoá Á Đông.</p>
                    <h4>PHONG CÁCH, QUYẾN RŨ & CÁ TÍNH</h4>
                    <p>Không gò bó trong các khuôn khổ, các dịch vụ tại Victoria từ dịch vụ chuyên chở, dịch vụ ẩm thực,
                        đến những lịch trình tham quan, dịch vụ chăm sóc trẻ hay các món ăn đểu được thiết kế nhằm
                        truyền cảm hứng, giải trí và đáp ứng nhu cầu nghỉ dưỡng của quý khách.</p>
                    <%} else {%>
                    <h2 style="color:#B9975B">VICTORIA
                        BRAND ESSENCE</h2>
                    <h4>JOURNEYS OF DISTINCTION</h4>
                    <p>Both within and beyond the walls of our hotel we connect our guests with the magic of the Real
                        Indochina.</p> <h4>TRẢI NGHIỆM ĐẶC TRƯNG</h4>
                    <h4>OLD-STYLE INDULGENCE</h4>
                    <p>We care for our guests like Asian hotels used to. We carefully create indulgent moments and
                        celebrate our colonial heritage and style.</p>
                    <h4>CONNECTED TO OUR COMMUNITY</h4>
                    <p>We respect and support our communities. We ensure that interactions with our guests are a
                        positive experience on both sides.</p>
                    <h4>HEARTFELT WARMTH</h4>
                    <p>We are not city-slickers, we are people from small towns in the heart of Indochina and we welcome
                        guests as we would in our family home.</p>
                    <h4>STYLE, ELEGANCE & FUN</h4>
                    <p>We don’t take ourselves too seriously. Our vehicles, F&B outlets, excursions, kids clubs and our
                        cuisine are designed to inspire and entertain and engage our guests. Everything is done with a
                        dash of style and a sense of fun.</p>
                    <%}%>
                </div>
            </div>
            <div class="col-md-12">
                <div class="col-md-12" style="padding: 30px 0px;">
                    <img src="<%=request.getContextPath() %>/img/img_about_3.jpg" style="width: inherit;padding: 20px;">
                </div>
                <div class="col-md-12 row" style="padding: 20px!important;">
                    <%if (language.equals(LanguageControl.VN_LAN)) {%>
                    <div class="col-md-4">
                        <h2 style="color: #B9975B">CÂU CHUYỆN VICTORIA</h2>
                    </div>
                    <div class="col-md-4">
                        <p>
                            Vào đầu những năm 1990, khi các thành phố lớn là điểm đến hấp dẫn của các nhà
                            đầu tư khách sạn, Victoria lại vẽ cho mình một lối đi tiên phong và hoàn toàn
                            khác biệt: xây dựng các khu nghỉ dưỡng theo chuẩn quốc tế ở những điểm đến độc đáo nhât
                            tại Việt Nam, những vùng đất chưa được phát triển nhưng lại ẩn giấu những nét
                            cá tính rất riêng biệt và đặc trưng của vùng đất dải chữ S. Rất nhanh chóng
                            chỉ trong 2 năm, Victoria đã khai trương 3 khu nghỉ dưỡng đầu tiên tại Phan Thiết,
                            Sapa và Cần Thơ, những địa danh vô danh vào lúc đó nhưng hiện nay là một trong
                            những điểm du lịch hấp dẫn nhất tại Việt Nam.
                        </p>
                    </div>
                    <div class="col-md-4">
                        <p>
                            Cựu Tổng Giám đốc Ông Jean-Francois Henin của công ty Eau et Electricite de Madagascar, công
                            ty sở hữu chuỗi Victoria lúc bấy giờ, phát biểu: “Vào năm 1993, khi đang tìm kiếm các
                            cơ hội đầu tư, chúng tôi đã rất ngạc nhiên bởi sự nghèo nàn của các khách sạn ở các tỉnh
                            thành ngoài các thành phố chính. Nhận thấy tiềm năng du lịch của những điểm đến ấy,
                            chúng tôi liền quyết định tạo ra sản phẩm của riêng mình." Và sau hơn hai thập kỷ, Victoria
                            đã liên tục đổi mới và dẫn đầu trong ngành với những thành tích "đầu tiên" – khu nghỉ dưỡng
                            có spa đầu tiên ở Hội An, khu nghỉ dưỡng cao cấp đầu tiên ở Sapa ... Với tinh thần ấy,
                            Victoria tin tưởng mang lại những trải nghiệm riêng biệt , không ồn ào và xa hoa, nhưng
                            tinh tế và chạm đến trái tim của từng du khách với hy vọng lan tỏa tình yêu cho
                            vẻ đẹp của Đông Dương.

                        </p>
                    </div>
                    <%
                    } else {
                    %>
                    <div class="col-md-4">
                        <h2 style="color: #B9975B">VICTORIA
                            HISTORY</h2>
                    </div>
                    <div class="col-md-4">
                        <p>
                            Right from its beginnings in the early 1990s, Victoria has always forged its own path. When
                            other companies were building enormous hotels in major cities, Victoria looked to Vietnam’s
                            less visited, but equally fascinating destinations – places where hardly any hotels existed,
                            much less upscale boutique resorts with a colonial vibe. Our first three resorts were built
                            in quick succession in 1997/98 – in the sleepy, coastal fishing village of Phan Thiet, the
                            scenic highlands of Sapa and the idyllic countryside of Can Tho in the heart of the Mekong
                            Delta, each bringing something completely new to the area.
                        </p>
                    </div>
                    <div class="col-md-4">
                        <p>
                            "In 1993 we travelled around looking for investment opportunities and we were surprised by
                            the poor hotels we found outside the main cities. We decided to create our own product." –
                            Jean-Francois Henin, chairman of Victoria's then parent company, Eau et Electricite de
                            Madagascar.
                            After more than two decades, Victoria continues to innovate and lead the way by achieving
                            many “firsts” – first hotel spa in Hoi An, first upscale resort in Sapa – just to name a
                            couple. Our outlook has always focused on the guest experience – smaller, better, more
                            authentic – in sharing a slice of the beauty and charm of Indochina.

                        </p>
                    </div>
                    <%
                        }
                    %>
                </div>

            </div>
            <%
                if (!language.equals(LanguageControl.VN_LAN)) {
            %>
            <section id="cd-timeline" class="cd-container max-content" style="position:relative;padding-bottom: 20px;">
                <div class="cd-timeline-block">
                    <div class="cd-timeline-content cd-left cd-timeline-dot">
                        <div class="text text0">
                            <p>3/1997</p>
                            <p>Victoria Phan Thiet Beach Resort &amp; Spa opening on Vietnam's South Central
                                coastline</p>
                        </div>
                        <img class="img0" style="width: 100%"
                             src="<%=request.getContextPath() %>/img/history_1.jpg">
                    </div>
                    <div class="cd-timeline-content cd-right cd-t-60 cd-timeline-dot" style="margin-top: 110px">
                        <div class="text">
                            <p>3/1998</p>
                            <p>Victoria Sapa Resort &amp; Spa opening in the scenic hill station of northern Vietnam</p>
                        </div>
                        <img style="width: 100%" src="<%=request.getContextPath() %>/img/history_2.jpg">
                    </div>
                </div>
                <div class="cd-timeline-block">
                    <div class="cd-timeline-content cd-center cd-timeline-dot" style="width: 100%">
                        <div class="text text6"
                             style="position: absolute; text-align: right; padding-right:40px; max-width: 300px;">
                            <p>10/1998</p>
                            <p>Victoria Can Tho Resort openings in Vietnam’s Mekong Delta</p>
                        </div>
                        <img class="img-full" style="width: 300px"
                             src="<%=request.getContextPath() %>/img/history_3.jpg">
                    </div>
                </div>
                <div class="cd-timeline-block">
                    <div class="cd-timeline-content cd-center cd-timeline-dot" style="width: 60%">
                        <img class="img-full" src="./img/history_4.jpg">
                    </div>
                </div>
                <div class="cd-timeline-block cd-tb-2em">
                    <div class="cd-timeline-content cd-right cd-timeline-dot">
                        <div class="text">
                            <p>1999</p>
                            <p>Victoria Hang Chau Chau Doc Hotel renovated under the Victoria Hotels &amp; Resorts
                                brand</p>
                        </div>
                    </div>
                </div>
                <div class="cd-timeline-block">
                    <div class="cd-timeline-content cd-center cd-timeline-dot" style="width: 100%">
                        <div class="text text6"
                             style="position: absolute; text-align: right; padding-right: 40px; max-width: 300px;">
                            <p>5/1999</p>
                            <p>Victoria Nui Sam Hotel opening near the Vietnam-Cambodia border</p>
                        </div>
                        <img class="img-full" style="width: 300px"
                             src="<%=request.getContextPath() %>/img/history_5.jpg">
                    </div>
                </div>
                <div class="cd-timeline-block cd-b-0">
                    <div class="cd-timeline-content cd-right cd-timeline-dot">
                        <div class="text">
                            <p>4/2001</p>
                            <p>Victoria Hoi An Beach Resort &amp; Spa opening &amp; featuring Hoi An’s very first
                                spa</p>
                        </div>
                    </div>
                </div>
                <div class="cd-timeline-block cd-t-0 ">
                    <div class="cd-timeline-content cd-center" style="width: 100%">
                        <img class="img-full" style="width: 300px"
                             src="<%=request.getContextPath() %>/img/history_6.jpg">
                    </div>
                </div>
                <div class="cd-timeline-block">
                    <div class="cd-timeline-content cd-center cd-timeline-dot" style="width: 60%">
                        <img class="img-full" style="width: 100%"
                             src="<%=request.getContextPath() %>/img/history_7.jpg">
                    </div>
                </div>
                <div class="cd-timeline-block">
                    <div class="cd-timeline-content cd-right cd-timeline-dot">
                        <div class="text">
                            <p>2011</p>
                            <p>Xiengthong Hotel opening in Luang Prabang, Laos (now the Victoria Xiengthong Palace since
                                2013)</p>
                        </div>
                        <img style="width: 100%" src="<%=request.getContextPath() %>/img/history_8.jpg">
                    </div>
                    <div class="cd-timeline-content cd-left t2013 cd-t-60 cd-timeline-dot">
                        <div class="text" style="text-align: right">
                            <p>10/2013</p>
                            <p>Opening ceremony for newly renovated Victoria Nui Sam Lodge, near Chau Doc</p>
                        </div>
                        <img class="img-full" style="width: 100%"
                             src="<%=request.getContextPath() %>/img/history_9.jpg">
                    </div>
                    <div class="cd-timeline-content cd-right cd-t-60 cd-timeline-dot" style="margin-top: 35px">
                        <div class="text" style="text-align: left">
                            <p>11/2017</p>
                            <p>Victoria Hotels &amp; Resorts celebrating 20th anniversary</p>
                        </div>
                        <img src="<%=request.getContextPath() %>/img/history_10.png">
                    </div>
                </div>
            </section>
            <%
            } else {
            %>
            <section id="cd-timeline" class="cd-container max-content" style="position:relative;padding-bottom: 20px;">
                <div class="cd-timeline-block">
                    <div class="cd-timeline-content cd-left cd-timeline-dot">
                        <div class="text text0">
                            <p>03/1997</p>
                            <p>Khánh thành Khu nghỉ dưỡng &amp; Spa Victoria Phan Thiết tại vùng biển miền Trung Việt
                                Nam</p>
                        </div>
                        <img class="img0" style="width: 100%"
                             src="<%=request.getContextPath() %>/img/history_1.jpg">
                    </div>
                    <div class="cd-timeline-content cd-right cd-t-60 cd-timeline-dot" style="margin-top: 110px">
                        <div class="text">
                            <p>3/1998</p>
                            <p>Khánh thành Khu nghỉ dưỡng Victoria Sapa tại vùng núi Tây Bắc Việt Nam</p>
                        </div>
                        <img style="width: 100%" src="<%=request.getContextPath() %>/img/history_2.jpg">
                    </div>
                </div>
                <div class="cd-timeline-block">
                    <div class="cd-timeline-content cd-center cd-timeline-dot" style="width: 100%">
                        <div class="text text6"
                             style="position: absolute; text-align: right; padding-right:40px; max-width: 300px;">
                            <p>10/1998</p>
                            <p>Khánh thành Khu nghỉ dưỡng Victoria Cần Thơ tại Đồng bằng Sông Cửu Long</p>
                        </div>
                        <img class="img-full" style="width: 300px"
                             src="<%=request.getContextPath() %>/img/history_3.jpg">
                    </div>
                </div>
                <div class="cd-timeline-block">
                    <div class="cd-timeline-content cd-center cd-timeline-dot" style="width: 60%">
                        <img class="img-full" src="<%=request.getContextPath() %>/img/history_4.jpg">
                    </div>
                </div>
                <div class="cd-timeline-block cd-tb-2em">
                    <div class="cd-timeline-content cd-right cd-timeline-dot">
                        <div class="text">
                            <p>1999</p>
                            <p>Khách sạn Victoria Hàng Châu Châu Đốc được tu sửa và đổi tên thành khách sạn Victoria
                                Châu Đốc</p>
                        </div>
                    </div>
                </div>
                <div class="cd-timeline-block">
                    <div class="cd-timeline-content cd-center cd-timeline-dot" style="width: 100%">
                        <div class="text text6"
                             style="position: absolute; text-align: right; padding-right: 40px; max-width: 300px;">
                            <p>5/1999</p>
                            <p>Khởi công xây dựng Khách sạn Victoria Núi Sam gần với biên giới Việt Nam – Campuchia</p>
                        </div>
                        <img class="img-full" style="width: 300px"
                             src="<%=request.getContextPath() %>/img/history_5.jpg">
                    </div>
                </div>
                <div class="cd-timeline-block cd-b-0">
                    <div class="cd-timeline-content cd-right cd-timeline-dot">
                        <div class="text">
                            <p>4/2001</p>
                            <p>Khánh thành Khu nghỉ dưỡng &amp; Spa Victoria Hội An, trở thành spa đầu tiên tại Hội
                                An</p>
                        </div>
                    </div>
                </div>
                <div class="cd-timeline-block cd-t-0 ">
                    <div class="cd-timeline-content cd-center" style="width: 100%">
                        <img class="img-full" style="width: 300px"
                             src="<%=request.getContextPath() %>/img/history_6.jpg">
                    </div>
                </div>
                <div class="cd-timeline-block">
                    <div class="cd-timeline-content cd-center cd-timeline-dot" style="width: 60%">
                        <img class="img-full" style="width: 100%"
                             src="<%=request.getContextPath() %>/img/history_7.jpg">
                    </div>
                </div>
                <div class="cd-timeline-block">
                    <div class="cd-timeline-content cd-right cd-timeline-dot">
                        <div class="text">
                            <p>2011</p>
                            <p>Khánh thành Khách sạn Xiengthong tại Luang Prabang, Lào (năm 2013 đổi tên thành khách sạn
                                Victoria Xiengthong Palace)</p>
                        </div>
                        <img style="width: 100%" src="<%=request.getContextPath() %>/img/history_8.jpg">
                    </div>
                    <div class="cd-timeline-content cd-left t2013 cd-t-60 cd-timeline-dot">
                        <div class="text" style="text-align: right">
                            <p>10/2013</p>
                            <p>Lễ khánh thành của Victoria Núi Sam, Châu Đốc</p>
                        </div>
                        <img class="img-full" style="width: 100%"
                             src="<%=request.getContextPath() %>/img/history_9.jpg">
                    </div>
                    <div class="cd-timeline-content cd-right cd-t-60 cd-timeline-dot" style="margin-top: 35px">
                        <div class="text" style="text-align: left">
                            <p>11/2017</p>
                            <p>Victoria Hotels &amp; Resorts kỉ niệm 20 năm thành lập</p>
                        </div>
                        <img src="<%=request.getContextPath() %>/img/history_10.png">
                    </div>
                </div>
            </section>
            <%
                }
            %>
        </div>
        <!--CSR-->
        <div class="item-CSR div-item hidden ">
            <div style="max-width: 960px ;margin: 0 auto; padding: 30px; background: white">
                <div style="text-align: center;color: #B9975B">
                    <h2 class="title" style="margin-bottom: 10px;"> TRÁCH NHIỆM
                    </h2>
                    <h2 class="bold-title" style=""> CỘNG ĐỒNG
                    </h2>
                </div>
                <div class="col-md-12 row" style="margin-top: 30px;">
                    <div class="col-md-6">
                        <img style="width: 100%; min-height: 250px;" src="<%=request.getContextPath() %>/img/CSR_IMG_1.jpg">
                    </div>
                    <div class="col-md-6">
                        <div class="corporate-body">
                            <p class="corporate-title"> CON NGƯỜI </p>
                            <p class="corporate-text"> Đội ngũ nhân viên luôn đóng vai trò quan trọng trong quá trình
                                phát triển bền vững lâu dài của chuỗi khách sạn và nghỉ dưỡng Victoria. Để đạt được mục
                                đích đó, chúng tôi đã và đang nỗ lực mang đến cho nhân viên môi trường làm việc công
                                bằng và chuyên nghiệp, tạo cơ hội trao quyền và nâng cao tay nghề cho nhân viên. </p>
                        </div>
                    </div>
                </div>
                <div class="col-md-12 row" style="margin-top: 30px;">
                    <div class="col-md-6 dtransfers">
                        <div class="corporate-body">
                            <p class="corporate-title"> MÔI TRƯỜNG </p>
                            <p class="corporate-text"> Chuỗi khách sạn và nghỉ dưỡng Victoria hoạt động có trách nhiệm
                                với môi trường trong khắp các hoạt động của mình vì lợi ích của cộng đồng địa phương.
                                Chúng tôi luôn chú trọng vào du lịch phát triển bền vững thông qua việc quản lý năng
                                lượng, nước và rác thải. Ngoài ra, chúng tôi cũng khuyển khích khách nghỉ dưỡng tình
                                nguyện tham gia vào các hoạt động xanh bảo vệ môi trường của chúng tôi. </p>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <img style="width: 100%; min-height: 250px;" src="<%=request.getContextPath() %>/img/CSR_IMG_2.jpg">
                    </div>
                    <div class="col-md-6 mtransfers">
                        <div class="corporate-body">
                            <p class="corporate-title"> MÔI TRƯỜNG </p>
                            <p class="corporate-text"> Chuỗi khách sạn và nghỉ dưỡng Victoria hoạt động có trách nhiệm
                                với môi trường trong khắp các hoạt động của mình vì lợi ích của cộng đồng địa phương.
                                Chúng tôi luôn chú trọng vào du lịch phát triển bền vững thông qua việc quản lý năng
                                lượng, nước và rác thải. Ngoài ra, chúng tôi cũng khuyển khích khách nghỉ dưỡng tình
                                nguyện tham gia vào các hoạt động xanh bảo vệ môi trường của chúng tôi. </p>
                        </div>
                    </div>
                </div>
                <div class="col-md-12 row" style="margin-top: 30px;">
                    <div class="col-md-6">
                        <img style="width: 100%; min-height: 250px;" src="<%=request.getContextPath() %>/img/CSR_IMG_4.jpg">
                    </div>
                    <div class="col-md-6">
                        <div class="corporate-body">
                            <p class="corporate-title"> CỘNG ĐỒNG </p>
                            <p class="corporate-text"> Các chính sách của chúng tôi luôn chú trọng việc tuyển dụng và
                                đào tạo nguồn nhân lực địa phương, tham gia và tài trợ cho các dự án cộng đồng, đồng
                                thời cổ vũ tinh thần tình nguyện của nhân viên và khách nghỉ vào các hoạt động vì cộng
                                đồng. </p>
                        </div>
                    </div>
                </div>
                <div class="col-md-12 row" style="margin-top: 30px;">

                    <div class="col-md-6 mtransfers">
                        <div class="corporate-body">
                            <p class="corporate-title"> THỰC PHẨM LÀNH MẠNH </p>
                            <p class="corporate-text"> Với nỗ lực bảo vệ môi trường, chuỗi khách sạn và nghỉ dưỡng
                                Victoria cam kết cung cấp thực phẩm xanh tươi và lành mạnh đến thực khách. Ngoài việc
                                cắt giảm lượng chất thải nhà bếp, chúng tôi còn ưu tiên các nhà cung cấp sử dụng lượng
                                carbon thấp và mua các sản phẩm theo mùa tại địa phương để hạn chế thời gian và chi phí
                                vận chuyển cũng như việc thất thoát chất dinh dưỡng. </p>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <img style="width: 100%; min-height: 250px;" src="<%=request.getContextPath() %>/img/CSR_IMG_3.jpg">
                    </div>
                </div>
            </div>
        </div>
        <!--TMG-->
        <div class="item-TMG div-item hidden">
            <div class="col-md-12 row" style="margin-bottom: 50px;">
                <div class="col-md-3" style="position: relative;">
                    <img class="tmg-logo" src="<%=request.getContextPath() %>/img/TMG_IMG_1.png">
                </div>
                <div class="col-md-9">

                    <div class="tmg-text">
                        <%if (language.equals(LanguageControl.VN_LAN)) {%>
                        <p>Được thành lập từ năm 1994, Tập đoàn Thiên Minh (TMG) là một trong những tập đoàn Việt Nam
                            dẫn đầu trong lĩnh vực cung cấp các dịch vụ lữ hành và khách sạn tại Châu Á. Hang năm, TMG
                            đón tiếp khoảng 90.000 khách du lịch và hơn 200.000 khách nghỉ dưỡng tại các khách sạn. Trải
                            qua hơn 20 năm không ngừng đổi mới và mở rộng, TMG hiện nay là một trong những doanh nghiệp
                            hàng đầu của Việt Nam về mảng du lịch lữ hành, đặt phòng trực tuyến, khách sạn nghỉ dưỡng,
                            du thuyền, và hàng không.</p>
                        <p>TMG Website:
                            <a href="http://www.tmgroup.vn" style="color:#bc935f">www.tmgroup.vn</a>
                        </p>
                        <%} else {%>
                        <p>Founded in 1994 and headquartered in Vietnam, Thien Minh Group (TMG) is one of the leading
                            integrated travel and hospitality group based in Southeast Asia. The Group brings
                            approximately 90,000 tourists to the region serving a broad range of budget to high-end
                            travellers and hosts over 200,000 hotel guests annually. The Group offers a one-stop
                            solution for travellers in Indochina and Thailand region, providing them with touring
                            activities, accommodation, cruises, transfers and transports as well as travel agency
                            services.
                        </p>
                        <p>TMG Website:
                            <a href="http://www.tmgroup.vn" style="color:#bc935f">www.tmgroup.vn</a>
                        </p>
                        <%}%>
                    </div>
                </div>
            </div>
            <div style="width: 100%;" class="white-bg-block">
                <div class="tmg-white">
                    <div class="col-md-12 row">
                        <div class="col-md-6 tmg-item">
                            <div class="tmg-item-wrapper">
                                <div>
                                    <img src="<%=request.getContextPath() %>/img/TMG_IMG_2.jpg" style="width: inherit;height: 380px;">
                                </div>
                                <div class="tmg-body ">
                                    <%if (language.equals(LanguageControl.VN_LAN)) {%>
                                    <h2>Lĩnh vực Khách sạn</h2>
                                    <p>Khối Khách sạn trực thuộc TMG chuyên cung cấp các dịch vụ lưu trú cao cấp, đồng
                                        hành cùng dịch vụ điều hành và quản lý hệ thống khách sạn của tập đoàn và các
                                        công ty đối tác. Sau gần hai thập kỷ hoạt động, sở hữu 11 khách sạn và khu nghỉ
                                        dưỡng, hàng loạt đội du thuyền và tàu hỏa; khối khách sạn của TMG tiếp đón hơn
                                        200,000 lượt khách mỗi năm tới tham quan và nghỉ dưỡng tại những địa điểm đẹp
                                        nhất tại Việt Nam, Campuchia, và Lào.</p>
                                    <%} else {%>
                                    <h2>Hospitality Brands</h2>
                                    <p>TMG Hospitality was established to provide specialist hospitality and management
                                        services to the group and partners’ hotel brands.
                                        After almost two decades of hospitality management, TMG Hospitality has a
                                        portfolio of eleven hotels & resorts which host more than 200,000 guests
                                        annually, as well as a number of cruising and rail travel opportunities in key
                                        tourism destinations in Vietnam, Cambodia, and Laos.</p>
                                    <%}%>
                                </div>
                                <div class="logo-foundy">
                                    <img class="tmg-item-logo" src="<%=request.getContextPath() %>/img/TMG_FOUNDY.png">
                                    <a href="https://www.victoriahotels.asia/" target="_blank">
                                        <img class="tmg-item-logo logo-mh-65" src="<%=request.getContextPath() %>/img/victoria_foundy.png">
                                    </a>
                                    <a href="http://www.emmhotels.com/" target="_blank">
                                        <img class="tmg-item-logo logo-mh-55" src="<%=request.getContextPath() %>/img/Emm-foundy.png">
                                    </a>
                                    <a href="http://maichaulodge.com/en/">
                                        <img class="tmg-item-logo" src="<%=request.getContextPath() %>/img/MCl-foundy.png">
                                    </a>
                                    <a href="http://emeraude-cruises.com/" target="_blank">
                                        <img class="tmg-item-logo" src="<%=request.getContextPath() %>/img/Emeraude_foundy.png">
                                    </a>
                                    <a href="http://lazaleecruises.vn/" target="_blank">
                                        <img class="tmg-item-logo" src="<%=request.getContextPath() %>/img/Lazale-foundy.png">
                                    </a>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 tmg-item">
                            <div class="tmg-item-wrapper ">
                                <div>
                                    <img src="<%=request.getContextPath() %>/img/TMG_IMG_3.jpg" style="width: inherit;height: 380px;">
                                </div>
                                <div class="tmg-body ">
                                    <%if (language.equals(LanguageControl.VN_LAN)) {%>
                                    <h2>Lĩnh vực Quản lý điểm đến</h2>
                                    <p>Là lĩnh vực kinh doanh nền tảng của TMG, lĩnh vực Quản lý điểm đến sở hữu những
                                        kiến thức và hiểu biết hàng đầu về từng địa phương tại mọi điểm đến do chúng tôi
                                        quản lý. Với nhiều năm kinh nghiệm, cộng hưởng cùng dịch vụ và nguồn lực dồi
                                        dào, chúng tôi còn là những chuyên gia trong việc cung cấp dịch vụ sự kiện và
                                        thiết kế hành trình riêng biệt.
                                        <br>
                                        Bằng việc áp dụng Công Nghệ Thông Tin trong phương thức quản lý, huấn luyện đội
                                        ngũ chăm sóc khách hàng xuất sắc, và định hướng du lịch trải nghiệm có trách
                                        nhiệm với cộng đồng, TMG đã xây dựng một nền tảng ổn định để phục vụ khách hàng
                                        một cách tiện lợi nhất tạo nên sự khác biệt.
                                    </p>
                                    <%} else {%>
                                    <h2>Destinations Management Brands</h2>
                                    <p>TMG Destinations Management possess extensive local knowledge, expertise and
                                        resources, specializing in the design and implementation of events, activities,
                                        tours, transportation and program logistics.
                                        <br>
                                        By taking IT, customers service excellence, responsible travel and community
                                        orientation as core competences, TMG has successfully build up a stable platform
                                        to serve customers with ease and with distinctions.
                                    </p>
                                    <%}%>
                                </div>
                                <!-- <div class="logo-foundy"><a href="http://www.buffalotours.com/" target="_blank"><img class="tmg-item-logo" src="https://www.victoriahotels.asia//images/articles/About_TMG/Logo/Buffalo-tours.png"></a><a href="http://www.cholontours.com.vn/cn/" target="_blank"><img class="tmg-item-logo" src="https://www.victoriahotels.asia//images/articles/About_TMG/Logo/Cholon-tours.png"></a><img class="tmg-item-logo" src="https://www.victoriahotels.asia//images/articles/About_TMG/Logo/Thienminh-transportation.png"><img class="tmg-item-logo" src="https://www.victoriahotels.asia//images/articles/About_TMG/Logo/Go-vacation.png"></a><a href="http://www.asiaoutdoors.com.vn/" target="_blank"><img class="tmg-item-logo" src="https://www.victoriahotels.asia//images/articles/About_TMG/Logo/Asia-outdoors.png"></a></div> -->
                            </div>
                        </div>
                        <div class="col-md-12 row">
                            <div class="col-md-6 tmg-item">
                                <div class="tmg-item-wrapper col-md-12">
                                    <div class="col-md-12">
                                        <img src="<%=request.getContextPath() %>/img/TMG_IMG_4.jpg" style="width: inherit;">
                                    </div>
                                    <div class="tmg-body">
                                        <%if (language.equals(LanguageControl.VN_LAN)) {%>
                                        <h2>Lĩnh vực Bán hàng trực tuyến </h2>
                                        <p>Mọi chuyến đi đều bắt đầu bằng việc lên kế hoạch, và iVIVU.com ra đời nhằm
                                            mang đến cho khách hàng giải pháp trực tuyến dễ dàng và thuận tiện nhất
                                            trong việc lên kế hoạch và tự thiết kế hành trình của riêng mình.
                                            <br>
                                            iVIVU.com sở hữu dữ liệu và liên kết hoạt động cùng 5.000 khách sạn tại Việt
                                            Nam, và 345.000 khách sạn trên toàn thế giới; phục vụ chủ yếu cho thị trường
                                            khách hàng nội địa. Với nền tảng công nghệ vững chắc, điều khoản thanh toán
                                            linh hoạt, và dịch vụ khách hàng được chú trọng phát triển, việc lên kế
                                            hoạch cho mỗi chuyến đi trở nên đơn giản và thuận tiện cho khách hàng.
                                        </p>
                                        <%} else {%>
                                        <h2>Online Brands </h2>
                                        <p>
                                            Every Journey begins with the planning, and iVIVU.com offers an online
                                            solution for travellers to organize and customize their journey with ease.
                                            iVIVU.com has an inventory of more than 5,000 hotels in Vietnam, and 345,000
                                            internationally, serving primarily domestic customers. With instant
                                            confirmation, flexible payment options and exceptional customer service,
                                            iVIVU.com makes journey planning breeze.
                                        </p>
                                        <%}%>
                                    </div>
                                    <div class="logo-foundy">
                                        <a href="https://www.ivivu.com/" target="_blank">
                                            <img class="tmg-item-logo logo-mh-55" src="<%=request.getContextPath() %>/img/TMG_IMG_6.png">
                                        </a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6 tmg-item ">
                                <div class="tmg-item-wrapper col-md-12">
                                    <div class="col-md-12">
                                        <img src="<%=request.getContextPath() %>/img/TMG_IMG_5.jpg" style="width: inherit;">
                                    </div>
                                    <div class="tmg-body">
                                        <%if (language.equals(LanguageControl.VN_LAN)) {%>
                                        <h2>Lĩnh vực Hàng không chung</h2>
                                        <p>Thành lập từ năm 2011, Hàng không Hải Âu tự hào là đơn vị tiên phong tại Việt
                                            Nam khai thác kinh doanh loại hình thủy phi cơ qua ba gói sản phẩm dịch vụ
                                            cao cấp, bao gồm: Bay Hành Trình - chuyên chở khách hàng theo lộ trình có
                                            sẵn, Bay Ngắm Cảnh - đưa du khách đi tham quan ngắm cảnh từ thủy phi cơ tại
                                            các khu du lịch nổi tiếng trong các tuyến được hoạt động, và Bay Thuê Chuyến
                                            - theo yêu cầu của cá nhân và tổ chức - đáp ứng nhu cầu riêng của khách
                                            hàng.
                                            <br>
                                            Đây là một loại hình dịch vụ sẽ mang đến cho du khách trong và ngoài nước
                                            những trải nghiệm du lịch độc đáo, chưa từng có ở Việt Nam.
                                        </p>
                                        <%} else {%>
                                        <h2>Aviation Brands</h2>
                                        <p>Established in 2011, Hai Au Aviation is proud to be the first seaplanes
                                            operator in Vietnam. Hai Au Aviation offers three deluxe service packages
                                            including: transportation flight - transport customer with a given route,
                                            scenic flight - take visitors on a tour to enjoy scenic view from the top,
                                            and charter flight - meet the individual needs of the customers.
                                            Seaplane services will give the customers a unique travel experience.


                                        </p>
                                        <%}%>
                                    </div>
                                    <div class="logo-foundy">
                                        <a href="https://www.seaplanes.vn/en/" target="_blank">
                                            <img class="tmg-item-logo logo-mh-65" src="<%=request.getContextPath() %>/img/HaiAu_TMG_7.png">
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>
<script>
    $(document).ready(function () {
        $(".ul-tab li").click(function () {
            $(".ul-tab li").removeClass("li-active");
            var name = $(this).attr("name");
            if (name === "CSR") {
                <%if(language.equals(LanguageControl.VN_LAN)){%>
                $(".h2-about").text("Trách nhiệm cộng đồng");
                <%}else{%>
                $(".h2-about").text("CORPORATE SOCIAL RESPONSIBILITIES");
                <%
                }
                %>
            } else if (name === "TMG") {
                <%if(language.equals(LanguageControl.VN_LAN)){%>
                $(".h2-about").text("Về TMG");
                <%}else{%>
                $(".h2-about").text("About TMG");
                <%
                }
                %>
            } else {
                $(".h2-about").text("<%=lang.readXMl("about_header")%>");
            }
            $("#" + name).addClass("li-active");
            $(".div-item").removeClass("active");
            $(".div-item").addClass("hidden");
            $(".item-" + name).removeClass("hidden");
            $(".item" + name).addClass("active");
        });
    });
</script>
<jsp:include page="loading.jsp"></jsp:include>
<jsp:include page="./Footer.jsp"></jsp:include>
</body>
</html>
