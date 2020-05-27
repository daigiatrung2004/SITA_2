<%@ page import="Language.LanguageControl" %>
<%@ page import="DTO.StaticTO" %>
<%@ page import="DTO.RegionTO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Utils.TextCustomizeFormat" %><%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 18/05/2020
  Time: 8:26 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String language = session.getAttribute("language") != null ? (String) session.getAttribute("language") : LanguageControl.VN_LAN;
    String checkSuccess = request.getAttribute("checkSuccess") != null ? (String) request.getAttribute("checkSuccess") : "";
    ArrayList<RegionTO> listRegionTO = (ArrayList<RegionTO>) request.getAttribute("listRegionTO");
%>
<html>
<head>
    <title>Victoria Hotel-Benefit</title>
    <jsp:include page="Library.jsp"></jsp:include>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/home-css.css"/>
    <style>
        .header-div-main {
            position: relative !important;
        }
        p{
            padding: 15px;
        }
        ul li{
            padding: 15px;
        }
    </style>

</head>
<body style="background-color:#DEE1E6">
<jsp:include page="header-not-slide.jsp"></jsp:include>
<div class="img-gallery-display"
     style="height: 450px;width: 100%;background:url('<%=request.getContextPath()%>/img/travelVietnam.jpg') no-repeat;background-size: 100% 100%;background-position: center;">

</div>
<div class="main-benefit">

    <div class="header-career title-footer">
        <%
            if (language.equals(LanguageControl.VN_LAN)) {
        %>
        <h2 style="text-align: center">
            ĐẶT TRỰC TIẾP ĐỂ HƯỞNG ƯU ĐÃI
        </h2>
        <p>
            Tại chuỗi khách sạn và khu nghỉ dưỡng Victoria, quý khách sẽ được hưởng những ưu đãi đặc biệt dành riêng cho
            mình khi đặt trực tiếp qua Website của chúng tôi. Từ nâng hạng phòng, đưa đón sân bay, cocktails miễn phí
            tới miễn phí nhận phòng sớm và trả phòng muộn, quý khách sẽ được đón tiếp thật khác biệt khi đặt phòng với
            chúng tôi.
        </p>
        <%
        } else {
        %>
        <h2 style="text-align: center">
            BOOK DIRECT AND ENJOY SPECIAL PERKS!
        </h2>
        <p>
            At Victoria Hotels and Resorts, we make booking directly with us worth your while with extra perks that are
            exclusively offered for you. From complimentary room upgrades, airport transfers, and cocktails, to early
            check-ins, late check-outs and more, get ready to enjoy amazing extras when you book directly with us!
        </p>
        <%
            }
        %>
    </div>
    <div class="container" >
        <div class="col-md-12 row" style="justify-content: center;">
            <%
                if (listRegionTO != null) {
                    for (int i = 0; i < listRegionTO.size(); i++) {


            %>
            <div class="item-book col-md-4" style="background: white;padding: 0px;margin: 10px;">
                <div class="item-img"
                     style="background: url('<%=request.getContextPath()+"/"+listRegionTO.get(i).getFile_url_img().replace(StaticTO.STATIC_PATH,"").replace("\\","/")%>') no-repeat;background-size: 100% 100%;background-position: center;height: 300px;">

                </div>
                <div class="item-content" style="padding: 15px;height: 50%;">
                   <p style="padding: 15px;">
                       <%=listRegionTO.get(i).getRemark().replace("description:","")%>
                   </p>
                </div>
                <div style="display: flex;justify-content: center;align-items: center;margin-bottom: 10px;">
                    <%
                        if (language.equals(LanguageControl.VN_LAN)) {
                    %>
                    <a href="<%=request.getContextPath()+"/vi/"+listRegionTO.get(i).getRegion_id()+"/"+TextCustomizeFormat.convertTextToString(listRegionTO.get(i).getName_en())+".html"%>"><button class="btn btn-static-2" style="padding: 10px 20px;border: 0px solid ;">Đặt phòng</button></a>
                    <%}else{%>
                    <a href="<%=request.getContextPath()+"/"+listRegionTO.get(i).getRegion_id()+"/"+TextCustomizeFormat.convertTextToString(listRegionTO.get(i).getName_en())+".html"%>"><button class="btn btn-static-2" style="padding: 10px 20px;border: 0px solid ;">Đặt phòng</button></a>
                    <%}%>
                </div>
            </div>
            <%
                    }
                }
            %>
        </div>
    </div>
</div>
<jsp:include page="loading.jsp"></jsp:include>
<jsp:include page="./Footer.jsp"></jsp:include>
</body>
</html>
