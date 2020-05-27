<%@ page import="Language.LanguageControl" %>
<%@ page import="DTO.RegionTO" %>
<%@ page import="DTO.AdvertisementTO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="DTO.StaticTO" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="DTO.PromoteTO" %>
<%@ page import="DAO.PromoteDA" %><%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 18/05/2020
  Time: 11:12 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    LanguageControl lang = (LanguageControl) session.getAttribute("LanguageControl");
    String language = session.getAttribute("language") != null ? (String) session.getAttribute("language") : LanguageControl.VN_LAN;
    RegionTO regionTO = (RegionTO) request.getAttribute("regionTO");
    ArrayList<AdvertisementTO> listAdvertisementOther = (ArrayList<AdvertisementTO>) request.getAttribute("listAdvertisementOther");
    AdvertisementTO advertisementTO = (AdvertisementTO) request.getAttribute("advertisementTO");
    Date now = new Date();
    Date tomorrow = null;
    DateFormat dateformat = new SimpleDateFormat("dd/MM/yyyy");
    String dateCurrency = "", datetomorow = "";
    Calendar c = Calendar.getInstance();
    c.setTime(now);
    c.add(Calendar.DATE, 1);
    tomorrow = c.getTime();
    dateCurrency = dateformat.format(now);
    datetomorow = dateformat.format(tomorrow);
    PromoteTO promoteTO = (PromoteTO) request.getAttribute("promoteTO");

%>
<html>
<head>
    <title>Thông tin ưu đãi</title>
    <jsp:include page="library_detail.jsp"></jsp:include>
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

        .btn-custom {
            padding: 5px !important;
            width: 200px;
            margin-bottom: 14px;
        }

        .item-other-offer {
            margin-left: 10px;
            margin-top: 20px;
            background-color: white;
            margin-bottom: 20px;
            padding: 0px!important;
        }

        .offer-other {
            padding: 0px !important;
        }

        .item-content {
            min-height: 450px;

            text-align: center;
        }

        .other-div-item {
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .btn-booking {
            width: 200px;
            text-align: center;
            clear: both;
        }
    </style>
</head>
<body style="background-color:#DEE1E6">
<jsp:include page="header-not-slide.jsp"></jsp:include>
<div class="title-contact">
    <%
        if (advertisementTO != null && regionTO != null) {
            if (language.equals(LanguageControl.VN_LAN)) {
    %>
    <h1 style="text-align: center"><%=advertisementTO.getTITLE()%>
    </h1>
    <h5 style="text-align: center;"><%=regionTO.getName_vi()%>
    </h5>
    <%
    } else {
    %>
    <h1 style="text-align: center"><%=advertisementTO.getTILTLE_EN()%>
    </h1>
    <h5 style="text-align: center;"><%=regionTO.getName_en()%>
    </h5>
    <%
            }
        }
    %>
</div>
<div class="main-detailOffer container" style="background: white;padding: 0px;">
    <%if (advertisementTO != null) {%>
    <div style="margin-bottom: 14px;">
        <div style="background: url('<%=request.getContextPath()%>/<%=advertisementTO.getFILE_URL_IMG().replace(StaticTO.STATIC_PATH,"").replace("\\","/")%>') no-repeat;background-position: center;background-size: 100% 100%;height: 350px;width: inherit;margin-bottom: 20px">

        </div>
        <!-- short description-->
        <div class="short-description">
            <%
                if (language.equals(LanguageControl.VN_LAN)) {
            %>
            <h2 style="font-size: 30px;text-align: center;"><%=advertisementTO.getSHORT_DESCRIPTION()%>
            </h2>

            <%
            } else {
            %>
            <h2 style="font-size: 30px;text-align: center;"><%=advertisementTO.getSHORT_DESCRIPTION_EN()%>
            </h2>

            <%
                }
            %>
            <div style="border: 1px solid black;width: 40%;height: 1px;margin:auto;">
            </div>


        </div>
        <!---->
        <!--description-->
        <div class="description" style="padding: 20px;">
            <p style="padding: 10px;">
                <%
                    if (language.equals(LanguageControl.VN_LAN)) {

                %>
                <%=advertisementTO.getDESCRIPTION()%>
                <%}else{%>
                <%=advertisementTO.getDESCRIPTION_EN()%>
                <%}%>
            </p>
            <div style="display: flex;justify-content: center;clear: both">
                <%
                    if (language.equals(LanguageControl.VN_LAN)) {
                        if (promoteTO != null) {
                %>
                <A href="<%=request.getContextPath()%>/SearchControl?location=<%=regionTO.getRegion_id()%>&checkOut=<%=datetomorow%>&numOfPeo=2&checkIn=<%=dateCurrency%>&promote=<%=promoteTO.getPro_code()%>">
                    <button class="btn btn-static-2 btn-booking">Đặt gói ưu đãi</button>
                </A>
                <%
                    }
                } else {
                %>
                <A href="<%=request.getContextPath()%>/SearchControl?location=<%=regionTO.getRegion_id()%>&checkOut=<%=datetomorow%>&numOfPeo=2&checkIn=<%=dateCurrency%>&promote=<%=promoteTO.getPro_code()%>">
                    <button class="btn btn-static-2 btn-booking">BOOK THIS PROMOTION</button>
                </A>
                <%
                    }
                %>
            </div>
        </div>
    </div>


    <%
    } else {
    %>
    <h2>
        Không tìm thấy kết quả nào!!!
    </h2>
    <%
        }
    %>

</div>
<%
    if (language.equals(LanguageControl.VN_LAN)) {
%>
<h2 style="text-align: center">Những ưu đãi khác</h2>
<%
} else {
%>
<h2 style="text-align: center">SEE OTHER OFFERS</h2>
<%}%>
<div class="offer-other container">
    <div class="col-md-12 row" style="justify-content: center">
        <%
            if (listAdvertisementOther != null) {
                for (int i = 0; i < listAdvertisementOther.size(); i++) {
                    PromoteDA promoteDA = new PromoteDA();
                    PromoteTO promoteTO1 = promoteDA.retrievePromotePrice(listAdvertisementOther.get(i).getPromote_id());
                    if (promoteTO1 != null) {

        %>
        <div class="item-other-offer" style="width: 350px;">
            <div class="item-img"
                 style="height: 250px;background: url('<%=request.getContextPath()%>/<%=listAdvertisementOther.get(i).getFILE_URL_IMG().replace(StaticTO.STATIC_PATH,"").replace("\\","/")%>') no-repeat;background-size: 100% 100%;background-position: center;">

            </div>
            <div class="div-content">
                <div class="item-content">
                    <h2>
                        <%
                            if (language.equals(LanguageControl.VN_LAN)) {
                        %>
                        <%=listAdvertisementOther.get(i).getTITLE()%>
                        <%}else{%>
                        <%=listAdvertisementOther.get(i).getTILTLE_EN()%>
                        <%}%>
                    </h2>
                    <p>
                        <%
                            if (language.equals(LanguageControl.VN_LAN)) {
                        %>
                        <%=listAdvertisementOther.get(i).getSHORT_DESCRIPTION()%>
                        <%}else{%>
                        <%=listAdvertisementOther.get(i).getSHORT_DESCRIPTION_EN()%>
                        <%}%>
                    </p>
                </div>
                <div>
                    <%
                        if (language.equals(LanguageControl.VN_LAN)) {
                    %>
                    <div class="other-div-item">
                        <a href="<%=request.getContextPath()%>/vi/<%=regionTO.getRegion_id()%>/<%=listAdvertisementOther.get(i).getID()%>/endow.html">
                            <button class="btn btn-custom"
                                    style="border: 2px solid #B9975B;color: #B9975B;padding: 10px 20px;">Chi
                                tiết
                            </button>
                        </a>
                    </div>
                    <div class="other-div-item">
                        <A href="<%=request.getContextPath()%>/SearchControl?location=<%=regionTO.getRegion_id()%>&checkOut=<%=datetomorow%>&numOfPeo=2&checkIn=<%=dateCurrency%>&promote=<%=promoteTO1.getPro_code()%>">
                            <button class="btn btn-custom"
                                    style="border: 2px solid #B9975B;color: white;background-color:#B9975B ;padding: 10px 20px; ">
                                ĐẶT GÓI KHUYẾN MÃI
                            </button>
                        </A>
                        </div>
                            <%
                            } else {
                            %>
                            <div class="other-div-item">
                                <a href="<%=request.getContextPath()%>/en/<%=regionTO.getRegion_id()%>/<%=listAdvertisementOther.get(i).getID()%>/endow.html">
                                <button class="btn btn-custom"
                                        style="border: 2px solid #B9975B;color: #B9975B;padding: 10px 20px;">VIEW
                                    DETAIL
                                </button>
                                </a>
                            </div>
                            <div class="other-div-item">
                                <A href="<%=request.getContextPath()%>/SearchControl?location=<%=regionTO.getRegion_id()%>&checkOut=<%=datetomorow%>&numOfPeo=2&checkIn=<%=dateCurrency%>&promote=<%=promoteTO1.getPro_code()%>">
                                    <button class="btn btn-custom"
                                            style="border: 2px solid #B9975B;color: white;background-color:#B9975B ;padding: 10px 20px; ">
                                        BOOK THIS PROMOTION
                                    </button>
                                </a>
                            </div>
                            <%
                                }
                            %>
                        </div>
                    </div>
                </div>

        <%
                }
            }
        } else {
        %>
        <%
            if (language.equals(LanguageControl.VN_LAN)) {
        %>
        <h2>Hiện tại không có dữ liệu liên quan</h2>
        <%
        } else {
        %>
        <h2>There are currently no related data</h2>
        <%
                }
            }
        %>
    </div>
</div>

<%--    </div>--%>
<%--</div>--%>


<jsp:include page="loading.jsp"></jsp:include>
<jsp:include page="Footer.jsp"></jsp:include>
</body>
</html>
