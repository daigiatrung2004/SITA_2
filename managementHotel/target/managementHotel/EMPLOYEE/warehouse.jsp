<%@ page import="DTO.CategoriesTO" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 4/12/2020
  Time: 4:23 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    ArrayList<CategoriesTO> listCategory=(ArrayList<CategoriesTO>)request.getAttribute("listCategory");
    String checkSuccess=request.getParameter("checkSuccess")!=null?(String)request.getParameter("checkSuccess"):"false";

%>
<html>
<head>
    <title>Kho</title>
    <jsp:include page="../Library.jsp"></jsp:include>
    <link rel="stylesheet" href="./css/Employeee/warehouse-css.css">
</head>
<body>
<jsp:include page="Header-employee.jsp"></jsp:include>
<div class="taskbar" style="min-height: 50px;">
    <ul>
        <li><a href="Warehouse" class="activeWarhouse" style="color: #424242;font-weight: unset!important;opacity: 0.5;font-size: 16px;">Danh mục các sản phẩm</a></li>
        <li><a href="ListProduct" style="color: #424242;font-weight: unset!important;opacity: 0.5;font-size: 16px;">Danh sách các sản phẩm</a></li>
    </ul>
</div>
<div class="div-main-warehouse">
    <div class="div-insert-product"></div>
    <form action="Warehouse">
    <fieldset>
        <legend>Thêm dữ liệu danh mục:</legend>
        <div class="form-group">
            <label for="nameCate">Tên danh mục:</label>s
            <input type="text" class="form-control" placeholder="Nhập tên danh mục" id="nameCate" name="nameCate">
            <input type="hidden" name="type" value="InsertCategory"/>
        </div>
        <button class="btn btn-primary">Thêm</button>
    </fieldset>
    </form>

<div>
    <table class="table">
        <thead>
        <th>STT</th>
        <th>Tên danh mục</th>

        </thead>
        <tbody>
        <%
            if(listCategory!=null){
                for (int i = 0; i <listCategory.size() ; i++) {


        %>
        <tr>
            <td><%=i%></td>
            <td><%=listCategory.get(i).getName()%></td>
        </tr>
        <%
                }
            }
        %>
        </tbody>
    </table>
</div>
</div>
<jsp:include page="../Footer.jsp"></jsp:include>
<script>
    <%
    if(checkSuccess.equals("true")){
    %>
    alert("Thành công");
    <%
    }
    %>
</script>
</body>
</html>
