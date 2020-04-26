<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 4/11/2020
  Time: 4:12 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Không tìm thấy Phòng</title>
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
<div style="min-height: 700px;display: flex;align-items: center;justify-content: center;background: bisque;">
<div style="max-width: 350px;padding: 25px;border: 1px solid #ccc;border-radius: 5px;background: white">
    <h2>Không tìm thấy kết qủa nào</h2>
    <p>
     Hiện tại khách sạn không còn phòng theo ngày của quý khách đã chọn.Vui lòng trở về trang chủ để tìm ngày check in khác hoặc khách sạn khác của chúng tôôi!!!

    </p>
    <a class="btn btn-static-2" href="Home" style="color: white;">Quay về trang chủ</a>
</div>
</div>
<jsp:include page="Footer.jsp"></jsp:include>
</body>
</html>
