<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 2/26/2020
  Time: 6:15 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String loginStatus = request.getParameter("loginStatus") != null ?(String)request.getParameter("loginStatus") : "false";
%>
<html>
<head>
    <title>Login Employee</title>

    <jsp:include page="../Library.jsp"></jsp:include>
    <%--    <link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css" />--%>
    <link rel="stylesheet" href="./css/aos.css?ver=1.0"/>
    <link rel="stylesheet" type="text/css" href="./css/employeeLogin.css?ver=1.7"/>
    <link rel="stylesheet" href="./css/static.css">

</head>

<body>

<div id="particles-js"></div>
<div class="div-header-login">
    <div>
        <img src="./img/viclogo.png" style="height:100px;"/>
    </div>
    <div class="div-home">
        <a href="Home">Trang Chủ</a>
        <div id="div-underline"></div>
    </div>
    </ul>
</div>
<div class="login-div" data-aos="zoom-in" id="employeeId">
    <form action="LoginEmployee" method="post">
        <h4 class="h4" style="text-align: center">Đăng nhập nhân viên</h4>
        <div class="form-group">
            <label for="email">Tên đăng nhập:</label>
            <input type="text" name="email" class="form-control" placeholder="Nhập tên đăng nhập" id="email" required="required" autocomplete="true">
        </div>
        <div class="form-group">
            <label for="pwd">Password:</label>
            <input type="password" name="password" class="form-control" placeholder="Nhập mật khẩu" id="pwd" required="required" autocomplete="true">
        </div>
        <div class="form-group form-check">
            <label class="form-check-label">
                <input class="form-check-input" type="checkbox"> Remember me
            </label>
        </div>
        <%
            if (loginStatus.equals("true")) {
        %>
        <div class="error-login" style="background-color: red;color:white;">
            <span>Tên đăng nhập hoặc mật khẩu không đúng</span>
        </div>
        <%
            }
        %>
        <input type="hidden" name="login" value="true">
        <button type="submit" class="btn btn-danger" style="width:100%">Đăng nhập</button>
    </form>
</div>
<!-- scripts -->
<script src="./scripts/particles.js"></script>
<script src="./scripts/app.js"></script>
<script src="./scripts/aos.js?ver=1.0"></script>
<%--<script src="https://unpkg.com/aos@next/dist/aos.js"></script>--%>
<script>
    AOS.init();
</script>
</body>
</html>
