<%@ page import="Language.LanguageControl" %>
<%@ page import="DTO.KindRoomTO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="DTO.UploadResourceTO" %>
<%@ page import="DTO.StaticTO" %>
<%@ page import="DTO.RegionTO" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Calendar" %><%--
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
    ArrayList<KindRoomTO> listKindRoom = (ArrayList<KindRoomTO>) request.getAttribute("listKindRoom");
    ArrayList listUploadTO = (ArrayList) request.getAttribute("listUploadTO");
    RegionTO regionTO=(RegionTO) request.getAttribute("regionTO");

%>
<html>
<head>
    <%
        if (language.equals(LanguageControl.VN_LAN)) {
    %>
    <title>Phòng nghỉ</title>
    <%
    } else {
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

        .title-contact h1 {
            margin-bottom: 5px;
            text-transform: uppercase;
            font-weight: 700;
            color: #505050;
            font-size: 32px;
            line-height: 30px;
        }

        .title-contact h3 {
            font-size: 14px;
            margin-top: 5px;
            text-transform: uppercase;
            font-weight: normal;
            color: #505050;
            letter-spacing: 3px;
            margin-bottom: 0px;
        }

        .title-contact {
            text-align: center;
            padding: 50px;
            background-color: white;
        }

        .item-kind-room {
            display: flex;
            background: white;
            margin: 50px 0px;
        }
        .btn-booking{
            border: 0px solid;
            border-radius: 0px;
            padding: 10px;
            width: 200px;
            margin: auto;
        }

    </style>
    <jsp:include page="library_detail.jsp"></jsp:include>
</head>
<body style="background-color: #e6e8e7">
<jsp:include page="header-not-slide.jsp"></jsp:include>
<div class="title-contact">
    <%
        if (language.equals(LanguageControl.VN_LAN)) {
    %>
    <h1 style="text-align: center">LOẠI PHÒNG</h1>
    <h3>Khu nghỉ dưỡng &amp; spa Victoria Sapa</h3>
    <%
    } else {
    %>
    <h1 style="text-align: center">ROOMS AND SUITES</h1>
    <h3>VICTORIA SAPA RESORT & SPA</h3>
    <%
        }
    %>
</div>
<div class="div-main container" style="min-height: 400px">
    <%
        if (listUploadTO != null&&regionTO!=null && listUploadTO.size() > 0) {
            Date date=new Date();
            DateFormat dateFormat=new SimpleDateFormat("dd/MM/yyyy");
            Date dt1=new Date();
            Calendar c = Calendar.getInstance();
            c.setTime(dt1);
            c.add(Calendar.DATE, 1);
            dt1 = c.getTime();
            String today=dateFormat.format(date);
            String tomorrow=dateFormat.format(dt1);
            for (int i = 0; i < listUploadTO.size(); i++) {
                ArrayList<UploadResourceTO> listUploadResource = (ArrayList<UploadResourceTO>) listUploadTO.get(i);



    %>
    <div class="item-kind-room col-md-12">

        <div class="col-md-3" style="padding: 20px;">
            <p>
                Located on the ground floor, Superior Rooms feature a 25m² (269 sq. ft) space, en-suite bathtub and
                private terrace offering garden views.
            </p>
            <p>-A sofa and a writing desk</p>
            <p>-Ceiling fan</p>
            <p>-Mini-bar</p>
            <p>-Coffee & Tea making facilities</p>
            <%
                if (language.equals(LanguageControl.VN_LAN)) {
            %>

            <A href="<%=request.getContextPath()%>/SearchControl?location=<%=regionTO.getRegion_id()%>&checkIn=<%=today%>&checkOut=<%=tomorrow%>&numOfPeo=2&promote="><button class="btn btn-static-2 btn-booking" >Đặt phòng</button></A>
            <%
                }else{
            %>
            <a href="<%=request.getContextPath()%>/SearchControl?location=<%=regionTO.getRegion_id()%>&checkIn=<%=today%>&checkOut=<%=tomorrow%>&numOfPeo=2&promote="><button class="btn btn-static-2 btn-booking" >Booking Now</button></a>
            <%
                }
            %>

        </div>
        <div class="col-md-9" style="padding: 0px;">

            <div id="demo-<%=i%>" class="carousel slide" data-ride="carousel">

                <!-- Indicators -->
                <ul class="carousel-indicators">
                    <%
                        if (listUploadResource != null) {
                            for (int j = 0; j < listUploadResource.size(); j++) {
                                if (j == 0) {

                    %>
                    <li data-target="#demo-<%=j%>" data-slide-to="0" class="active"></li>
                    <%
                    } else {
                    %>
                    <li data-target="#demo-<%=j%>" data-slide-to="0"></li>
                    <%
                                }
                            }
                        }
                    %>
                </ul>

                <!-- The slideshow -->
                <div class="carousel-inner">
                    <%
                        if (listUploadResource != null) {
                            for (int j = 0; j < listUploadResource.size(); j++) {
                                if (j == 0) {

                    %>
                    <div class="carousel-item active">
                        <img src="<%=request.getContextPath()%>/<%=listUploadResource.get(j).getFile_url().replace(StaticTO.STATIC_PATH,"")%>"
                             height="500" style="width:100%;">
                    </div>
                    <%
                    } else {
                    %>
                    <div class="carousel-item ">
                        <img src="<%=request.getContextPath()%>/<%=listUploadResource.get(j).getFile_url().replace(StaticTO.STATIC_PATH,"")%>"
                             height="500" style="width:100%;">
                    </div>
                    <%
                                }
                            }
                        }
                    %>

                </div>

                <!-- Left and right controls -->
                <a class="carousel-control-prev" href="#demo-<%=i%>" data-slide="prev">
                    <span class="carousel-control-prev-icon"></span>
                </a>
                <a class="carousel-control-next" href="#demo-<%=i%>" data-slide="next">
                    <span class="carousel-control-next-icon"></span>
                </a>
            </div>

        </div>
    </div>
    <%
            }
        }

    %>

</div>
<jsp:include page="loading.jsp"></jsp:include>
<jsp:include page="./Footer.jsp"></jsp:include>
</body>
</html>
