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
<style>

    .item:hover{
        color:#0588e4!important;
    }
    .item a:hover{
        color:#0588e4!important;
    }
</style>
<link rel="stylesheet" href="./css/Admin/header-admin.css?ver=2.0">
<div id="header-admin">
    <div style="padding: 10px;">
        <span style="margin-left: 10px;" id="btn-sidebar">
             <i class="sidebar icon"></i>
        </span>
    </div>
    <div >
        <div id="div-account-admin" class="ui floating dropdown account-admin ">
            <img src="./img/Admin/img-director.png" style="height: 25px;width: 25px">
            <span id="account-admin">
            <%if (employeeTO != null) {%>
        Chào,<span class="name-admin-span"><%=employeeTO.getFirstName() + " " + employeeTO.getLastName()%></span>
            <%}%>

        </span>
            <span><i class="fas fa-caret-down"></i></span>
            <div class="menu">
                <div class="item" data-value="drop"><a href="InfoAdmin"  style="color: black;">Thông tin cá nhân</a></div>
                <div class="item"  data-value="drop"  ><a href="LogOut" id="LogOut" style="color: black;">Đăng xuất</a></div>

            </div>
        </div>




    </div>


</div>
<script>
    $(document).ready(function () {
        $('.dropdown').dropdown({
            // you can use any ui transition
            transition: 'drop'
        });
        $("#account-admin").click(function () {
            // alert("xin chao");
            // $("#div-pos-account-admin").toggle();


        });
    });
</script>
