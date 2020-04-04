<%@ page import="DTO.PositionEmployeeTO" %>
<%@ page import="DTO.RegionTO" %>
<%@ page import="DTO.EmployeeTO" %><%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 4/3/2020
  Time: 4:59 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    EmployeeTO employeeTO = (EmployeeTO) session.getAttribute("mem_sid");
    PositionEmployeeTO positionEmployeeTO=(PositionEmployeeTO)request.getAttribute("positionEmployeeTO");
    RegionTO regionTO=(RegionTO)request.getAttribute("regionTO");

%>
<html>
<head>
    <title>Thông tin cá nhân</title>
    <jsp:include page="../Library.jsp" ></jsp:include>
    <link rel="stylesheet" href="./css/Employeee/infoPerson.css">
</head>
<body>
<jsp:include page="Header-employee.jsp"></jsp:include>
<div class="info-employee container" style="mid-height:400px;">
    <%if(employeeTO!=null){%>
    <h2>Thông tin cá nhân</h2>
    <table style="margin: 50px;">
       <tbody>
       <tr>
           <td>Ho:</td>
           <td><%=employeeTO.getFirstName()%></td>
           <td>Tên:</td>
           <td><%=employeeTO.getLastName()%></td>
       </tr>
       <tr>
           <td>Vị trí làm việc:</td>
           <td><%=positionEmployeeTO.getName()%></td>
       </tr>
       <tr>
           <td>Địa chỉ:</td>
           <td><%=employeeTO.getAddress()%></td>
       </tr>
       <tr>
           <td>Thành phố:</td>
           <td><%=employeeTO.getCountry()%></td>
       </tr>

       <tr>
           <td>Điện thoại:</td>
           <td><%=employeeTO.getContact_person()%></td>
       </tr>
       <tr>
           <td>Email cá nhân:</td>
           <td><%=employeeTO.getContact_email()%></td>
       </tr>
       <tr>
           <td>Nơi làm việc:</td>
           <td><%=regionTO.getName_vi()%></td>
       </tr>

       </tbody>
    </table>
    <a href="#" id="editInfo" style="color: black;margin-bottom: 20px;">Chỉnh sửa thông tin cá nhân</a>
    <div class="edit-info">
        <form action="EditInfoPerson">
            <h2>Cập nhật thông tin cá nhân</h2>
             <input type="hidden" name="id" value="<%=employeeTO.getId()%>">
            <div class="form-group">
                <label for="firstname">Họ:</label>
                <input type="text" name="firstname" class="form-control" placeholder="Nhập họ" id="firstname">
            </div>
            <div class="form-group">
                <label for="lastname">Tên:</label>
                <input type="text" name="lastname" class="form-control" placeholder="Nhập họ" id="lastname">
            </div>
            <div class="form-group">
                <label for="address">Địa chỉ:</label>
                <input type="text" name="address" class="form-control" placeholder="Nhập họ" id="address">
            </div>
            <div class="form-group">
                <label for="city">Thành phố:</label>
                <input type="text" name="city" class="form-control" placeholder="Nhập họ" id="city">
            </div>
            <div class="form-group">
                <label for="phone">Điện thoại:</label>
                <input type="text" name="phone" class="form-control" placeholder="Nhập họ" id="phone">
            </div>
            <div class="form-group">
                <label for="email">Email:</label>
                <input type="text" name="email" class="form-control" placeholder="Nhập họ" id="email">
            </div>
         <button class="btn btn-primary">Cập nhật thông tin</button>
        </form>
        <a href="#">Reset tài khoản đăng nhập</a>
    </div>
    <%
        }
    %>

</div>
<script src="./scripts/Employee/infoEmployee.js"></script>
<jsp:include page="../Footer.jsp"></jsp:include>
</body>
</html>
