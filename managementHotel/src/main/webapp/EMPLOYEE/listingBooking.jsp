<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 3/29/2020
  Time: 5:32 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Danh sách các bookind của khách sạn</title>
    <jsp:include page="../Library.jsp"></jsp:include>
    <link rel="stylesheet" href="./css/Employeee/listingBooking-css.css">
</head>
<body>
<jsp:include page="/EMPLOYEE/Header-employee.jsp"></jsp:include>
<div class="div-listing-booking container">
<div class="col-md-12 taskbar-booking">
    <div class="form-group">
<input type="text" class="form-control" placeholder="search by code receive" id="searchReceive" value="" name="searchReceive">
    </div>
</div>
 <div class="col-md-12 details-booking">

 </div>
</div>
<jsp:include page="../Footer.jsp"></jsp:include>
<script src="./scripts/Employee/js-ListingBooking.js"></script>
</body>
</html>
