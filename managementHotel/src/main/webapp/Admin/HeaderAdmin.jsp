<%@ page import="DTO.EmployeeTO" %><%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 3/5/2020
  Time: 12:23 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    EmployeeTO employeeTO = (EmployeeTO)session.getAttribute("admin_id");
%>
<link rel="stylesheet" href="./css/Admin/header-admin.css?ver=2.0">
<div id="header-admin">
    <div style="padding: 10px;">
        <span style="margin-left: 10px;" id="btn-sidebar">
             <i class="sidebar icon"></i>
        </span>
    </div>
    <div class="account-admin " >
        <div id="div-account-admin">
            <img src="./img/Admin/img-director.png" style="height: 25px;width: 25px">
            <span id="account-admin">
            <%if (employeeTO != null) {%>
        Chào,<span class="name-admin-span"><%=employeeTO.getFirstName() + " " + employeeTO.getLastName()%></span>
            <%}%>

        </span>
            <span><i class="fas fa-caret-down"></i></span>
        </div>
        <div id="div-pos-account-admin">
            <ul class="ul-account-admin">
                <li class="li-item-account">Thông tin cá nhân</li>
                <li class="li-item-account"><a href="LogOut">Đăng xuất</a></li>
            </ul>
        </div>
    </div>


</div>
<script>
    $(document).ready(function () {
        $("#account-admin").click(function () {
            // alert("xin chao");
            $("#div-pos-account-admin").toggle();
        });
    });
</script>
