<%@ page import="DTO.RoomTO" %>
<%@ page import="DTO.KindRoomTO" %>
<%@ page import="DTO.PriceRoomTO" %>
<%@ page import="Utils.TextCustomizeFormat" %>
<%@ page import="Language.LanguageControl" %><%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 3/26/2020
  Time: 2:55 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String name=request.getAttribute("name")!=null?(String)request.getAttribute("name"):"";
    String contact_person=request.getAttribute("contact_person")!=null?(String)request.getAttribute("contact_person"):"";
    String verify_person=request.getAttribute("verify_person")!=null?(String)request.getAttribute("verify_person"):"";
    String code_receive=request.getAttribute("code_receive")!=null?(String)request.getAttribute("code_receive"):"";
    String total=request.getAttribute("total")!=null?(String)request.getAttribute("total"):"";
    RoomTO roomTO=(RoomTO) request.getAttribute("roomTO");
    KindRoomTO kindRoomTO=(KindRoomTO) request.getAttribute("kindRoomTO");
    PriceRoomTO priceRoomTO=(PriceRoomTO) request.getAttribute("priceRoomTO");
    String language = session.getAttribute("language") != null ? (String) session.getAttribute("language") : LanguageControl.VN_LAN;
    LanguageControl lang = (LanguageControl) session.getAttribute("LanguageControl");
%>
<html>
<head>
    <title>Hóa đơn thanh toán</title>
    <link rel="stylesheet" href="css/home-css.css"/>
    <jsp:include page="Library.jsp"></jsp:include>
    <style>
        .header-div-main {
            position: relative !important;
        }
    </style>
</head>
<body>
<jsp:include page="header-not-slide.jsp"></jsp:include>
<div style="background: url('img/136290873.jpg') no-repeat;background-size: cover;width: 100%">
<div class="container" style="min-height: 700px;background-color: white;padding: 100px" >
    <%if(language.equals(LanguageControl.VN_LAN)){%>
    <h2>Hóa đơn điện tử</h2>
    <table >
        <tbody>
        <tr>
            <td>Họ và tên:</td>
            <td><%=name%></td>
        </tr>
        <tr>
            <td>Số điện thoại:</td>
            <td><%=contact_person%></td>
        </tr>
        <tr>
            <td>Số CMND:</td>
            <td><%=verify_person%></td>
        </tr>
        <tr>
            <td>Phòng:</td>
            <td><%=roomTO.getName()%></td>
        </tr>
        <tr>
            <td>Loại phòng:</td>
            <td><%=kindRoomTO.getName_vi()%></td>
        </tr>
        <tr>
            <td>Tổng tiền thanh toán:</td>
            <td><%=TextCustomizeFormat.currency_format(Long.parseLong(total))%></td>
        </tr>
        <tr>
            <td>Hình thức thanh toán:</td>
            <td>
                <%if(priceRoomTO!=null){%>
                <%=priceRoomTO.getType_price_room_vi()%>
                <%}%>
            </td>
        </tr>
        <tr>
            <td>Code nhận phòng:</td>
            <td><%=code_receive%></td>
        </tr>
        <tr>
            <td><a href="Home"><button class="btn btn-primary">Quay về trang chủ</button></a></td>

        </tr>
        </tbody>
    </table>
    <%}else{%>
    <h2>Electronic bill</h2>
    <table >
        <tbody>
        <tr>
            <td>First and last name:</td>
            <td><%=name%></td>
        </tr>
        <tr>
            <td>Phone number:</td>
            <td><%=contact_person%></td>
        </tr>
        <tr>
            <td>ID number:</td>
            <td><%=verify_person%></td>
        </tr>
        <tr>
            <td>Room:</td>
            <td><%=roomTO.getName()%></td>
        </tr>
        <tr>
            <td>Kind of room:</td>
            <td><%=kindRoomTO.getName_vi()%></td>
        </tr>
        <tr>
            <td>Tổng tiền thanh toán:</td>
            <td><%=TextCustomizeFormat.currency_format(Long.parseLong(total))%></td>
        </tr>
        <tr>
            <td>Method payment:</td>
            <td>
                <%if(priceRoomTO!=null){%>
                <%=priceRoomTO.getType_price_room_vi()%>
                <%}%>
            </td>
        </tr>
        <tr>
            <td>Code nhận phòng:</td>
            <td><%=code_receive%></td>
        </tr>
        <tr>
            <td><a href="Home"><button class="btn btn-primary">Back to home page</button></a></td>

        </tr>
        </tbody>
    </table>
    <%}%>
</div>
</div>
<jsp:include page="./Footer.jsp"></jsp:include>
</body>
</html>
