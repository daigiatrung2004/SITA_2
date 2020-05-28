<%@ page import="Language.LanguageControl" %>
<%@ page import="DTO.RegionTO" %>
<%@ page import="java.util.ArrayList" %><%--
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
    <h1>Thư giản</h1>

    <%} else {%>
    <h1>Relax</h1>

    <%}%>

</div>
<div class="container" style="background-color: white;padding: 10px;margin-bottom: 20px;">
    <div style="margin-bottom: 30px;">
        <img src="<%=request.getContextPath() %>/img/thugian.jpg">
    </div>
    <p>
        <%if (language.equals(LanguageControl.VN_LAN)) {%>
        Nổi tiếng với các liệu trình đa dạng như, tầy tế bào chết toàn thân, các liệu trình dưỡng thể, Victoria Spa còn phục vụ khách những liệu trình đặc trưng ở Sapa như tắm lá thuốc của người Dao Đỏ, sự pha trộn giữa các loại thảo mộc và vỏ cây trong vùng với tác dụng cải thiện hệ thống tuần hoàn và giảm căng thẳng mệt mỏi được sử dụng qua hàng thế kỉ. Liệu trình Victoria Sapa Massage kéo dài khoảng 1.5 giờ, kết hợp với sự thư giãn và Massage kiểu Thái.
        <br/>
        (Dịch vụ tư vấn: từ 8:00 sáng)
        <br/>
        Giữ thân hình khoẻ mạnh cân đối bằng các bài tập Cardio và thể lực với các máy tập và những bài tập không tạ tại phòng tập Gym của Victoria Sapa.
        <br/>
        Được bao quanh bởi núi đồi Sapa hùng vĩ, hồ bơi nước nóng trong nhà tại Victoria Sapa là nơi hoàn hảo để ngâm mình thư giãn

        <%} else {%>
        Renowned for its extensive range of treatments including body scrubs, wraps and body treatments, the Victoria Spa also offers treatments unique to Sapa, like the Red Dao herbal bath, a concoction of medicinal herbs and bark from the surrounding mountains, used for centuries to improve circulation and sooth tension. The signature Victoria Sapa Massage is 1.5 hours of bliss, incorporating traditional Thai massage and reflexology.
        <br/>
        Make use of the Fitness Centre’s cardio and strength training machines with a built-in television, together with free weights.
        <br/>
        The Victoria Sapa’s indoor heated swimming pool is with its adjoining outdoor terrace, which is perfect for laps or simply a refreshing dip at your leisure.


        <%}%>
    </p>
</div>
<jsp:include page="loading.jsp"></jsp:include>
<jsp:include page="./Footer.jsp"></jsp:include>
</body>
</html>
