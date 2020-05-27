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
          <style>
              .lds-dual-ring {
                  display: inline-block;
                  width: 80px;
                  height: 80px;
              }
              .lds-dual-ring:after {
                  content: " ";
                  display: block;
                  width: 64px;
                  height: 64px;
                  margin: 8px;
                  border-radius: 50%;
                  border: 6px solid #007bff;
                  border-color: #007bff transparent #007bff transparent;
                  animation: lds-dual-ring 1.2s linear infinite;
              }
              @keyframes lds-dual-ring {
                  0% {
                      transform: rotate(0deg);
                  }
                  100% {
                      transform: rotate(360deg);
                  }
              }
              .loading{
                  display: none;
              }

          </style>
</head>
<body>
<jsp:include page="/EMPLOYEE/Header-employee.jsp"></jsp:include>
<div class="div-listing-booking container" style="position: relative">
<div class="col-md-12 taskbar-booking" >
    <div class="form-group">
<input type="text" class="form-control" placeholder="search by code receive" id="searchReceive" value="" name="searchReceive">
    </div>
</div>
 <div class="col-md-12 details-booking">

 </div>
    <div class="loading" style="position: absolute;top: 0;right: 0;left: 0;bottom: 0;height: 100%;width: 100%">
        <div style="display: flex;justify-content: center;align-items: center;height: inherit">
            <div class="lds-dual-ring"></div>
        </div>
    </div>
</div>
<jsp:include page="../Footer.jsp"></jsp:include>
<script src="./scripts/Employee/js-ListingBooking.js"></script>
</body>
</html>
