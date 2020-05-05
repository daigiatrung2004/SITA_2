<%@ page import="DTO.RegionTO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="DTO.StaticTO" %>
<%@ page import="Language.LanguageControl" %><%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 29/04/2020
  Time: 6:04 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    ArrayList<RegionTO> listRegionTO=(ArrayList<RegionTO>)request.getAttribute("listRegionTO");
    LanguageControl lang = (LanguageControl) session.getAttribute("LanguageControl");
    String language = session.getAttribute("language") != null ? (String) session.getAttribute("language") : LanguageControl.VN_LAN;
%>
<html>
<head>
    <title>Hình ảnh -Victoria sercret</title>
    <jsp:include page="Library.jsp"></jsp:include>
    <link rel="stylesheet" href="css/home-css.css"/>
    <link rel="stylesheet" href="css/listingImgRegion-css.css"/>
    <style>
        .header-div-main {
            position: relative !important;
        }
    </style>
</head>
<body>
<jsp:include page="header-not-slide.jsp"></jsp:include>
<div class="div-main-img-region col-md-12" style="background:#e6e8e7">
<div class="div-img-region container row">
    <%
        if(listRegionTO!=null){
            for (int i = 0; i <listRegionTO.size() ; i++) {


    %>
<div class="item-img-region col-md-4">
    <a href="ListingImgRegion?region=<%=listRegionTO.get(i).getRegion_id()%>" class="anchor-item-region"></a>
    <%if (listRegionTO.get(i).getFile_url_img().equals("")) {%>
    <div class="body-img-regio col-md-12" style="background: url('./img/employee/cantho-daidien.jpg') no-repeat;background-position: center;background-size: 100% 100%;height: 430px;">

    </div>
    <%}else{%>
    <div class="body-img-regio col-md-12" style="background: url('<%=listRegionTO.get(i).getFile_url_img().replace(StaticTO.STATIC_PATH,"").replace("\\","//")%>') no-repeat;background-position: center;background-size: 100% 100%;height: 430px;">

    </div>
    <%}%>
    <div class="footer-img-region col-md-12">
        <%if(language.equals(LanguageControl.VN_LAN)){%>
        <span style="text-align: center;">
           <%=listRegionTO.get(i).getName_vi()%>
        </span>
        <%
            }else{
        %>
        <span style="text-align: center;">
           <%=listRegionTO.get(i).getName_en()%>
        </span>
        <%
            }
        %>
    </div>
</div>
    <%
            }
        }
    %>
</div>
</div>
<jsp:include page="loading.jsp"></jsp:include>
<jsp:include page="Footer.jsp"></jsp:include>
</body>
</html>
