<%@ page import="DTO.RegionTO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="DTO.StaticTO" %>
<%@ page import="Language.LanguageControl" %><%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 4/11/2020
  Time: 10:49 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String checkIn = request.getParameter("checkIn") != null ? (String) request.getParameter("checkIn") : "";
    String checkOut = request.getParameter("checkOut") != null ? (String) request.getParameter("checkOut") : "";
    String numOfPeo = request.getParameter("numOfPeo") != null ? (String) request.getParameter("numOfPeo") : "0";
    String promote = request.getParameter("promote") != null ? (String) request.getParameter("promote") : "";
    ArrayList<RegionTO> listRegion = (ArrayList<RegionTO>) request.getAttribute("listRegion");
    ArrayList<Integer> listCheckRoom = (ArrayList<Integer>) request.getAttribute("listCheckRoom");
    LanguageControl lang = (LanguageControl) session.getAttribute("LanguageControl");
    String language = session.getAttribute("language") != null ? (String) session.getAttribute("language") : LanguageControl.VN_LAN;
%>
<html>
<head>
    <title>
        <%
            if (language.equals(LanguageControl.VN_LAN)) {
        %>
        Danh sách tìm kiếm được
        <%} else {%>
        Listing search all
        <%}%>
    </title>
    <jsp:include page="Library.jsp"></jsp:include>
    <link rel="stylesheet" href="css/listSearchAll-css.css">
    <link rel="stylesheet" href="css/home-css.css"/>
    <style>
        .header-div-main {
            position: relative !important;
        }
    </style>
</head>
<body>
<jsp:include page="header-not-slide.jsp"></jsp:include>
<div class="div-list-search-all container">
    <h2>
        <%
            if (language.equals(LanguageControl.VN_LAN)) {
        %>
        Chọn khách sạn
        <%
        } else {
        %>
        Choose your hotel
        <%
            }
        %>
    </h2>
    <%
        if (listRegion != null && listCheckRoom != null) {
            for (int i = 0; i < listRegion.size(); i++) {
                int checkExistRoom = listCheckRoom.get(i);

    %>
    <div class="div-item-search col-lg-12 ">

        <div class="body-search-item">
            <div class="div-name-region">
                <h4> <%
                    if (language.equals(LanguageControl.VN_LAN)) {
                %>
                    <%=listRegion.get(i).getName_vi()%>
                    <%}else{%>
                    <%=listRegion.get(i).getName_en()%>
                    <%}%>
                </h4>
            </div>
            <%if (!listRegion.get(i).getFile_url_img().equals("")) {%>
            <div class="div-img-region"
                 style="background:url('<%=listRegion.get(i).getFile_url_img().replace(StaticTO.STATIC_PATH,"").replace("\\","//")%>') no-repeat;background-position: center;background-size: 100%;">
                <%if (checkExistRoom == 0) {%>
                <div class="NotEmptyRoom">
                    <%
                        if (language.equals(LanguageControl.VN_LAN)) {
                    %>
                    Không còn phòng chống
                    <%
                        }else{
                    %>
                    There is no room
                    <%
                        }
                    %>
                </div>
                <%}%>
            </div>
            <%} else {%>
            <div class="div-img-region" style="background:url('./img/employee/cantho-daidien.jpg') no-repeat">
                <%if (checkExistRoom == 0) {%>
                <div class="NotEmptyRoom">
                    <%
                        if (language.equals(LanguageControl.VN_LAN)) {
                    %>
                    Không còn phòng chống
                    <%}else{%>
                    There is no room
                    <%}%>
                </div>
                <%}%>
            </div>
            <%}%>
        </div>
        <div class="div-footer-item col-lg-12">
            <div class="col-lg-8">
                <%
                    if (language.equals(LanguageControl.VN_LAN)) {
                %>
                <p>Địa chỉ:<%=listRegion.get(i).getAddress()%>
                </p>
                <p>Hotline:<%=listRegion.get(i).getContact_phone()%>
                </p>
                <%}else{%>
                <p>Address:<%=listRegion.get(i).getAddress()%>
                </p>
                <p>Hotline:<%=listRegion.get(i).getContact_phone()%>
                </p>
                <%}%>
            </div>
            <div class="col-lg-4">
                <%if (checkExistRoom == 0) {%>
                <button class="btn btn-static select-region" data-region="<%=listRegion.get(i).getRegion_id()%>">
                    <%
                        if (language.equals(LanguageControl.VN_LAN)) {
                    %>
                    Chọn ngày khả dụng
                    <%}else{%>
                    Choose an available date
                    <%}%>
                </button>
                <%} else {%>
                <button class="btn btn-static search" data-region="<%=listRegion.get(i).getRegion_id()%>"
                        data-enable="<%=checkExistRoom%>">
                    <%
                        if (language.equals(LanguageControl.VN_LAN)) {
                    %>
                    Xem tất cả các phòng
                    <%}else{%>
                    View all rooms
                    <%}%>
                </button>
                <%}%>
            </div>

        </div>
    </div>
    <%
            }
        }
    %>
</div>
<form id="form_search" action="SearchControl">
    <input type="hidden" name="location" id="location" value="">
    <input type="hidden" name="checkOut" value="<%=checkOut%>">
    <input type="hidden" name="numOfPeo" value="<%=numOfPeo%>">
    <input type="hidden" name="promote" value="<%=promote%>">
    <input type="hidden" name="checkIn" value="<%=checkIn%>">
</form>
<form id="frm-select-region" action="SearchControl">
    <input type="hidden" name="location" id="location_select" value="">
    <input type="hidden" name="checkOut" value="<%=checkOut%>">
    <input type="hidden" name="numOfPeo" value="<%=numOfPeo%>">
    <input type="hidden" name="promote" value="<%=promote%>">
    <input type="hidden" name="checkIn" value="<%=checkIn%>">
    <input type="hidden" name="type" value="select_region_other">
</form>
<script>
    $(document).ready(function () {
        $(".select-region").click(function () {
            var location = $(this).data('region');
            $("#location_select").val(location);
            $("#frm-select-region").submit();
        });
        $(".search").click(function () {

            var location = $(this).data('region');
            $("#location").val(location);
            var enable = $(this).data('enable');
            if (enable == "1") {
                $("#form_search").submit();
            }
            // alert("xin chao"+location);
        });
    });
</script>
<jsp:include page="loading.jsp"></jsp:include>
<jsp:include page="Footer.jsp"></jsp:include>
</body>
</html>
