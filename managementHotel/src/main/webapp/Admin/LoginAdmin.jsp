<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 2/26/2020
  Time: 6:15 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String loginStatus = request.getParameter("loginStatus") != null ? (String) request.getParameter("loginStatus") : "false";
%>

<html>
<head>
    <title>Login Admin</title>

    <jsp:include page="../Library.jsp"></jsp:include>
    <%--    <link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css" />--%>
    <link rel="stylesheet" href="./css/aos.css?ver=1.0"/>
    <link  rel="stylesheet" type="text/css"  href="./css/employeeLogin.css?ver=1.1"/>
    <link rel="stylesheet" href="./css/static.css">

</head>

<body>
<div id="particles-js"></div>
<div class="login-div" data-aos="zoom-in">
    <form action="AuthenticationAdmin" method="post">
        <h4 class="h4" style="text-align: center">Đăng nhập Admin</h4>
        <div class="form-group">
            <label for="email">Username:</label>
            <input type="text" name="username" class="form-control" placeholder="Enter username" id="email" required="required" autocomplete="true">
        </div>
        <div class="form-group">
            <label for="pwd">Password:</label>
            <input type="password" name="password" class="form-control" placeholder="Enter password" id="pwd" required="required" autocomplete="true">
        </div>
        <div class="form-group form-check">
            <label class="form-check-label">
                <input class="form-check-input" type="checkbox"> Remember me
            </label>
        </div>
        <%
            if (loginStatus.equals("true")) {
        %>
        <div class="error-login" style="background-color: red;">
            <span>Tên đăng nhập hoặc mật khẩu không đúng</span>
        </div>
        <%
            }
        %>
        <input type="hidden" name="LoginPanel" value="true">
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
