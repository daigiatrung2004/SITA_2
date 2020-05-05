<%@ page import="DTO.UploadResourceTO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="DTO.StaticTO" %>
<%@ page import="Language.LanguageControl" %>
<%@ page import="DTO.RegionTO" %><%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 29/04/2020
  Time: 6:30 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    RegionTO regionTO=(RegionTO) request.getAttribute("regionTO");
    ArrayList<UploadResourceTO> listresource=(ArrayList<UploadResourceTO>)request.getAttribute("listresource");
    LanguageControl lang = (LanguageControl) session.getAttribute("LanguageControl");
    String language = session.getAttribute("language") != null ? (String) session.getAttribute("language") : LanguageControl.VN_LAN;
%>
<html>
<head>
    <title>Hình ảnh chi tiết</title>
    <jsp:include page="Library.jsp"></jsp:include>
    <link rel="stylesheet" href="css/home-css.css"/>
    <style>
        .header-div-main {
            position: relative !important;
        }
        .pos-item{
            display: none;
            align-items: center;
            justify-content: center;
            background: rgba(0,0,0,0.5);
        }
        .item-img-detail:hover .pos-item{
            display: flex;
            cursor: pointer;
        }
        .item-img-detail:hover{
            cursor: pointer;
        }

    </style>
</head>
<body style="background-color: #e6e8e7">
<jsp:include page="header-not-slide.jsp"></jsp:include>
<div style="text-align: center;background-color: white;">
    <%
       if(language.equals(LanguageControl.VN_LAN)){
    %>
    <h2>Bộ sưu tập</h2>
    <span><%=regionTO.getName_vi()%></span>
    <%
        }else{
    %>
    <h2>Gallery</h2>
    <span><%=regionTO.getName_en()%></span>
    <%
        }
    %>
</div>
<div class="div-main-detail-img container row" style="align-items: center;padding: 20px;margin: auto;">

    <%
        if(listresource!=null){
            for (int i = 0; i <listresource.size() ; i++) {

    %>
<div class="item-img-detail " style="width: 300px;margin:10px;height: 300px;background: url('<%=listresource.get(i).getFile_url().replace(StaticTO.STATIC_PATH,"").replace("\\","//")%>');background-position: center;background-size: 100% 100%;position: relative;">
    <div style="position: absolute;top:0px;right: 0px;left: 0px;bottom: 0px;height: 100%;width: 100%;" class="pos-item" data-id="<%=listresource.get(i).getId()%>">
        <span><i class="search icon" style="font-size: 30px;color: white;"></i></span>
    </div>
</div>

    <%
            }
        }
    %>
</div>
<div class="ui modal" id="slide">
    <div id="demo" class="carousel slide" data-ride="carousel" data-interval="false">

        <!-- Indicators -->
        <ul class="carousel-indicators">
            <%
                if(listresource!=null){
                    for (int i = 0; i <listresource.size() ; i++) {
                        if(i>0){
            %>
            <li data-target="#demo" data-slide-to="<%=i%>" id="li-<%=listresource.get(i).getId()%>"></li>

            <%
                        }else{
                            %>
            <li data-target="#demo" data-slide-to="<%=i%>" class="active" id="li-<%=listresource.get(i).getId()%>"></li>
            <%
                        }
                }
                }
            %>
        </ul>

        <!-- The slideshow -->
        <div class="carousel-inner">
            <%
                if(listresource!=null){
                    for (int i = 0; i <listresource.size() ; i++) {
                        if(i>0){
            %>
            <div class="carousel-item "  id="div-item-<%=listresource.get(i).getId()%>">
                <img src="<%=listresource.get(i).getFile_url().replace(StaticTO.STATIC_PATH,"").replace("\\","//")%>" alt="Los Angeles">
            </div>
           <%
                       }else{
                            %>
            <div class="carousel-item active" id="div-item-<%=listresource.get(i).getId()%>">
                <img src="<%=listresource.get(i).getFile_url().replace(StaticTO.STATIC_PATH,"").replace("\\","//")%>" alt="Los Angeles">
            </div>

            <%
                       }
               }
               }
           %>
        </div>

        <!-- Left and right controls -->
        <a class="carousel-control-prev" href="#demo" data-slide="prev">
            <span class="carousel-control-prev-icon"></span>
        </a>
        <a class="carousel-control-next" href="#demo" data-slide="next">
            <span class="carousel-control-next-icon"></span>
        </a>

    </div>

<%--        <span style="position:absolute;top:-10px;right: -10px;color: white;font-size: 18px; "><i class="fas fa-times-circle"></i></span>--%>

</div>
<script>
    $(".pos-item").click(function(){
        $(".carousel-indicators li").removeClass("active");
        $(".carousel-item").removeClass("active");
        var id=$(this).data("id");
        $("#li-"+id).addClass("active");
        $("#div-item-"+id).addClass("active");
       $("#slide").modal("show");
    });
</script>
<jsp:include page="loading.jsp"></jsp:include>
<jsp:include page="Footer.jsp"></jsp:include>
</body>
</html>
