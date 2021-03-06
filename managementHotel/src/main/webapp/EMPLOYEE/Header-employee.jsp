<%@ page import="DTO.EmployeeTO" %><%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 3/29/2020
  Time: 11:25 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    EmployeeTO employeeTO = (EmployeeTO) session.getAttribute("mem_sid");
    String member_name = "", firstword = "";

    if (employeeTO != null) {
        member_name = employeeTO.getFirstName() + " " + employeeTO.getLastName();
        if (!employeeTO.getLastName().equals("")) {
            firstword = employeeTO.getLastName().substring(0, 1);
        }
    }
%>
<link rel="stylesheet" href="./css/Employeee/header-employee-css.css">

<div class="div-header-employee ">
    <div class="col-md-3">
        <a href="Home">
        <img src="./img/viclogo_black.png" style="height: 80px;">
        </a>
    </div>
    <div class="col-md-6 menu-task" style="height: 100%">
    <h2 style="color: #6078EA;">Hệ thống dành cho nhân viên</h2>

    </div>
    <div class="col-md-1 home">
        <A href="HomeEmployee" style="color: #46a2e4!important;" class="a-home"><span><i class="fas fa-home"></i></span></A>
    </div>
    <div class="col-md-2 user" id="user-main">

        <div class="content-user">
            <div class="avatar"><%=firstword%>
            </div>
            <div class="nameuser"><%=member_name%>
            </div>

        </div>
        <div class="menu-user-pos" id="menu-pos" style="background: white;">

            <ul class="ul-menu-user-pos" style="z-index: 10">
                <li  style="min-height: 80px;display: flex;align-items: center;justify-content: center;border-bottom:1px dashed black">
                    <div class="content-user">
                        <div class="avatar user-pos"><%=firstword%>
                        </div>
                        <div class="nameuser-pos user-pos"><%=member_name%>
                        </div>

                    </div>
                </li>
                <li class="li-item-menu-user"><a href="InformationEmployee" style="color: black;">Thông tin cá nhân</a></li>
                <li class="li-item-menu-user"><a id="a-logout" href="LogOutEmployee" style="color: black;">Đăng xuất</a></li>
            </ul>
        </div>
    </div>

</div>
<script src="./scripts/Employee/header-employee.js"></script>
