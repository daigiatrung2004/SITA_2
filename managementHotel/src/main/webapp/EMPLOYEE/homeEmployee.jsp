<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 3/5/2020
  Time: 6:28 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Home-Nhân Viên Sales</title>
    <jsp:include page="../Library.jsp"></jsp:include>
    <link rel="stylesheet" href="./css/Employeee/index.css">

</head>
<body>
<jsp:include page="/EMPLOYEE/Header-employee.jsp"></jsp:include>
<div class="welcome-div-employee"
     style="min-height: 700px; background-size: cover;background-position: center;margin: 100px">
    <div class="func col-lg-12 row">
        <div class="func-item-employee col-lg-3 ">
            <a href="ListingBooking" class="a-func-item"></a>
            <div class="func-item-img"
                 style="background:url('./img/employee/booking_icon_employee.jpg') no-repeat;min-height: 200px;background-size: 90% 90%;background-position: center;">
                <%--         <img src="" style="max-width: 200px;max-height:200px;">--%>
            </div>
            <div class="footer-tiem-img" style="background-color: #3E691C;">
                <h3 style="text-transform: uppercase;margin: 0px">Danh sách booking</h3>
                <h5 style="margin: 0px;"><small style="text-transform: uppercase;margin: 0px">Listing booking</small>
                </h5>
            </div>
        </div>
        <div class="func-item-employee col-lg-3">
            <a href="ListingRoom" class="a-func-item"></a>
            <div class="func-item-img"
                 style="background:url('./img/employee/20-512.webp') no-repeat;min-height: 200px;background-size: 90% 90%;background-position: center;">
                <%--         <img src="" style="max-width: 200px;max-height:200px;">--%>
            </div>
            <div class="footer-tiem-img" style="background-color: #C38E5E;">
                <h3 style="text-transform: uppercase;margin: 0px">Danh sách các phòng</h3>
                <h5 style="margin: 0px;"><small style="text-transform: uppercase;margin: 0px">Listing room</small>
                </h5>
            </div>
        </div>
    </div>
</div>
<jsp:include page="../Footer.jsp"></jsp:include>
</body>
</html>
