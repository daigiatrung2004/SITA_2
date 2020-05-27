<%@ page import="DTO.AdvertisementTO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="DTO.RegionTO" %>
<%@ page import="Language.LanguageControl" %>
<%@ page import="DTO.PromoteTO" %>
<%@ page import="DAO.PromoteDA" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="DTO.StaticTO" %><%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 20/05/2020
  Time: 4:43 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String language = session.getAttribute("language") != null ? (String) session.getAttribute("language") : LanguageControl.VN_LAN;
    LanguageControl lang = (LanguageControl) session.getAttribute("LanguageControl");
    ArrayList<AdvertisementTO> listAdvertisementTO=(ArrayList<AdvertisementTO>)request.getAttribute("listAdvertisementTO");
    RegionTO regionTO=(RegionTO) request.getAttribute("regionTO");
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
%>
<head>
    <title>Các ưu đãi khách sạn Victoria</title>
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
            padding: 0px;
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
<div class="title-contact" style="text-align: center;">
    <%if(language.equals(LanguageControl.VN_LAN)){%>
    <h1 style="text-align: center"><%=lang.readXMl("enow_header")%></h1>
    <h5><%=regionTO.getName_vi()%></h5>
    <%}else{%>
    <h1 style="text-align: center"><%=lang.readXMl("enow_header")%></h1>
    <h3><%=regionTO.getName_en()%></h3>
    <%}%>
</div>
<div class="div-offer container" style="margin-bottom: 30px;">

        <div class="col-md-12 row">
            <%
                if (listAdvertisementTO != null) {
                    for (int i = 0; i < listAdvertisementTO.size(); i++) {
                        PromoteDA promoteDA = new PromoteDA();
                        PromoteTO promoteTO1 = promoteDA.retrievePromotePrice(listAdvertisementTO.get(i).getPromote_id());
                        if (promoteTO1 != null) {

            %>
            <div class="item-other-offer " style="width: 350px;">
                <div class="item-img"
                     style="height: 250px;background: url('<%=request.getContextPath()%>/<%=listAdvertisementTO.get(i).getFILE_URL_IMG().replace(StaticTO.STATIC_PATH,"").replace("\\","/")%>') no-repeat;background-size: 100% 100%;background-position: center;">

                </div>
                <div class="div-content">
                    <div class="item-content">
                        <h2><%=listAdvertisementTO.get(i).getTITLE()%>
                        </h2>
                        <p><%=listAdvertisementTO.get(i).getSHORT_DESCRIPTION()%>
                        </p>
                    </div>
                    <div>
                        <%
                            if (language.equals(LanguageControl.VN_LAN)) {
                        %>
                        <div class="other-div-item">
                            <a href="<%=request.getContextPath()%>/vi/<%=regionTO.getRegion_id()%>/<%=listAdvertisementTO.get(i).getID()%>/endow.html">
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
                            <div>
                                <%
                                } else {
                                %>
                                <div class="other-div-item">
                                    <a href="<%=request.getContextPath()%>/en/<%=regionTO.getRegion_id()%>/<%=listAdvertisementTO.get(i).getID()%>/endow.html">
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
<jsp:include page="loading.jsp"></jsp:include>
<jsp:include page="./Footer.jsp"></jsp:include>
</body>
</html>
