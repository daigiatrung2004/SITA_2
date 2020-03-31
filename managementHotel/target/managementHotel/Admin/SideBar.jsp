<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 3/5/2020
  Time: 10:55 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<link rel="stylesheet" href="./css/Admin/SideBar.css?ver=1.3">

<div class="ui left vertical inverted labeled icon sidebar menu">
    <div class="item" id="img-logo">
        <img src="./img/viclogo.png" height="100px;text-align:center;">
    </div>
    <a class="item">
        <i class="home icon"></i>

        <font style="vertical-align: inherit;margin-left: 30px;"><h4 style="vertical-align: inherit;">
            Home
        </h4></font>
    </a>
    <div class="item" id="menu-hotel">

        <i class="fas fa-hotel icon"></i>
        <font style="vertical-align: inherit;margin-left: 30px;"><h4 style="vertical-align: inherit;">
            Manager Hotel
        </h4></font>

        <div id="div-manager-hotel-admin">
            <ul class="ul-admin">
                <li><a href="InsertHotelManager">Thêm dữ liệu hotel</a></li>
                <li>Danh sách dữ liệu hotel</li>


            </ul>
        </div>
    </div>
    <div class="item" id="menu-transport">

        <i class="shipping fast icon"></i>
        <font style="vertical-align: inherit;margin-left: 30px;"><h4 style="vertical-align: inherit;">
            Manager transport
        </h4></font>

        <div id="div-manager-trans-admin">
            <ul class="ul-admin">
                <li><a href="InsertTransport">Thêm dữ liệu vận chuyển</a></li>
                <li>Danh sách dữ liệu vận chuyển</li>


            </ul>
        </div>
    </div>
    <div class="item" id="anchor-hr">

        <i class="user icon"></i>
        <font style="vertical-align: inherit;margin-left: 30px"><h4 style="vertical-align: inherit;">
            Settings Humans Resource
        </h4></font>


        <div id="div-hr-amdin">
            <ul class="ul-admin">
                <li><a href="InsertEmployee">Thêm nhân viên</a></li>
                <li><a href="ListingHR">Danh sách quản lí nhân viên</a></li>
                <li><a href="ListingHR?position=true">Danh sách vị trí làm việc</a></li>

            </ul>
        </div>
    </div>

</div>

<script src="./scripts/Admin/SideBar.js?ver=1.0"></script>
<script>
    $(document).ready(function () {
        $('.left.sidebar').sidebar('toggle').sidebar('attach events', '#btn-sidebar');
        $('.menu .item').tab();
    });
</script>

