<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 4/11/2020
  Time: 3:46 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Đã xảy ra lỗi</title>
    <jsp:include page="Library.jsp"></jsp:include>
    <link rel="stylesheet" href="css/home-css.css"/>
    <style>
        .header-div-main {
            position: relative !important;
        }
    </style>
</head>
<body>
<jsp:include page="header-not-slide.jsp"></jsp:include>
<div style="background: url('./img/employee/bg-hcm.jpeg') no-repeat;background-position: center;background-size: 100% 100%;min-height: 500px;display: flex;justify-content: center;align-items: center">
<div>
    <H2 style="text-align: center;font-family: serif;font-size: 40px;color: white"><b>Có vấn đề đang xảy ra !!!</b></H2>
    <h4 style="text-align: center;font-size: 25px;font-family: serif;color: white">Có thể là hệ thống đang được nâng cấp</h4>
</div>
</div>
<jsp:include page="Footer.jsp"></jsp:include>
</body>
</html>
