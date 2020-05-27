<%@ page import="DTO.PositionEmployeeTO" %><%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 21/05/2020
  Time: 8:33 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    PositionEmployeeTO positionEmployeeTO=(PositionEmployeeTO)request.getAttribute("positionEmployeeTO");
%>
<html>
<head>
    <title>Cập nhật vị trí làm việc</title>
    <jsp:include page="../Library.jsp"></jsp:include>
</head>
<body>
<jsp:include page="HeaderAdmin.jsp"></jsp:include>
<div style="padding: 20px;">
    <div >
        <div class="home-admin col-md-12" style="margin-top: 10px;">
           <form action="ListingHR" method="post">
           <input type="hidden" name="type" value="edited-position">
           <input type="hidden" name="id" value="<%=positionEmployeeTO.getId()%>">
          <%if(positionEmployeeTO!=null){%>
            <h2>Cập nhật vị trí công việc</h2>
            <div class="form-group">
                <label for="name">Vị trí làm việc:</label>
                <input type="text" name="name" class="form-control" value="<%=positionEmployeeTO.getName()%>" placeholder="Vị trí cộng việc" id="name">
            </div>
            <button type="submit" class="btn btn-primary" id="insertPositionEmployee" name="1">Cập nhật</button>


            <div class="error-position" style="color: red"></div>
               <%
                   }
               %>
           </form>
        </div>
    </div>
</div>
<jsp:include page="SideBar.jsp"></jsp:include>
</body>
</html>
