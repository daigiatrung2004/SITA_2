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
    <div class="col-md-7 menu-task" style="height: 100%">
        <ul>
            <li>
                <div class="main-menu" id="booking-menu" name="pos-booking">
                    <span>Đặt phòng</span>
                    <span class="caret-down"><i class="fas fa-caret-down"></i></span>
                </div>
               <div class="pos-booking">
                   <ul>
                       <li><a href="ListingBooking" style="color: black;">Danh sách booking</a></li>
                       <li>Danh sách các phòng</li>
                   </ul>
               </div>
            </li>
        </ul>
    </div>
    <div class="col-md-2 user">
        <div class="content-user">
            <div class="avatar"><%=firstword%>
            </div>
            <div class="nameuser"><%=member_name%>
            </div>

        </div>
        <div class="menu-user-pos">
            <ul class="ul-menu-user-pos">
                <li  style="min-height: 80px;display: flex;align-items: center;justify-content: center;border-bottom:1px dashed black">
                    <div class="content-user">
                        <div class="avatar user-pos"><%=firstword%>
                        </div>
                        <div class="nameuser-pos user-pos"><%=member_name%>
                        </div>

                    </div>
                </li>
                <li class="li-item-menu-user">Thông tin cá nhân</li>
                <li class="li-item-menu-user"><a id="a-logout" href="LogOutEmployee" style="color: black;">Đăng xuất</a></li>
            </ul>
        </div>
    </div>

</div>
<script src="./scripts/Employee/header-employee.js"></script>
