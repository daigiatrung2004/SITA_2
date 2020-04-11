<%@ page import="DTO.EmployeeTO" %><%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 4/11/2020
  Time: 4:59 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    EmployeeTO employeeTO = (EmployeeTO) session.getAttribute("admin_id");
    String checkSuccess = request.getParameter("checkSuccess") != null ? (String) request.getParameter("checkSuccess") : "false";
%>
<html>
<head>
    <title>Thông tin admin</title>
    <jsp:include page="../Library.jsp"></jsp:include>
    <style>
        .div-edit {
            display: none;
        }
    </style>
</head>
<body>
<jsp:include page="HeaderAdmin.jsp"></jsp:include>
<table class="table">
    <thead>
    <th>STT</th>
    <th>Họ và tên</th>
    <th>Thành phố</th>
    <th>Địa chỉ</th>
    <th>Điện thoại</th>
    <th>Địa chỉ email</th>
    </thead>
    <tbody>
    <%
        if (employeeTO != null) {
            int count = 1;

    %>
    <tr>
        <td><%=count%>
        </td>
        <td><%=employeeTO.getFirstName()+" "+employeeTO.getLastName()%>
        </td>
        <td>
            <%=employeeTO.getCountry()%>
        </td>
        <td><%=employeeTO.getAddress()%>
        </td>
        <td><%=employeeTO.getContact_person()%>
        </td>
        <td><%=employeeTO.getContact_email()%>
        </td>

    </tr>
    <%


        }%>
    </tbody>
</table>
<button class="btn btn-primary" id="editEmployee">Chỉnh sửa nhân viên</button>
<div class="div-edit">
    <form action="InfoAdmin" method="post">
        <input type="hidden"  name="type" value="edit">
        <div class="form-group">
            <label for="address">Địa chỉ :</label>
            <input type="text" class="form-control" name="address" placeholder="Nhập địa chỉ" id="address">
        </div>
        <div class="form-group">
            <label for="city">Thành phố:</label>
            <input type="text" class="form-control" name="city" placeholder="Nhập tên thành phố" id="city">
        </div>
        <div class="form-group">
            <label for="phone">Thành phố:</label>
            <input type="number" class="form-control" name="phone" placeholder="Nhập tên thành phố" id="phone">
        </div>
        <div class="form-group">
            <label for="email">Thành phố:</label>
            <input type="email" class="form-control" name="email" placeholder="Nhập tên thành phố" id="email">
        </div>
        <button class="btn btn-primary">Chỉnh sửa</button>
    </form>
</div>
<jsp:include page="SideBar.jsp"></jsp:include>
<script>
    <%if(checkSuccess.equals("true")){
        %>
    alert("Cập nhật thành công");
    <%
    }
    %>
    $("#editEmployee").click(function () {
        $(".div-edit").toggle();
    })
</script>
</body>
</html>
