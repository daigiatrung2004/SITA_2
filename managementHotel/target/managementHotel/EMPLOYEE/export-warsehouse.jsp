<%@ page import="java.util.ArrayList" %>
<%@ page import="DTO.WarsehouseTO" %>
<%@ page import="DTO.ProductTO" %><%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 10/05/2020
  Time: 5:55 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    ArrayList<WarsehouseTO> listWare=( ArrayList<WarsehouseTO>)request.getAttribute("listWare");
    ArrayList<ProductTO> listProduct=( ArrayList<ProductTO>)request.getAttribute("listProduct");

%>
<html>
<head>
    <title>Xuất kho</title>
    <jsp:include page="../Library.jsp"></jsp:include>
    <link rel="stylesheet" href="./css/Employeee/warehouse-css.css">
</head>
<body>
<jsp:include page="Header-employee.jsp"></jsp:include>
<div class="taskbar" style="min-height: 50px;">
    <ul>
        <li><a href="Warehouse"  style="color: #424242;font-weight: unset!important;opacity: 0.5;font-size: 16px;">Danh mục các sản phẩm</a></li>
        <li><a href="ListProduct"  style="color: #424242;font-weight: unset!important;opacity: 0.5;font-size: 16px;">Danh sách các sản phẩm</a></li>
        <li><a href="Warehouse?type=in" style="color: #424242;font-weight: unset!important;opacity: 0.5;font-size: 16px;">Nhập kho</a></li>
        <li><a href="Warehouse?type=ex"  class="activeWarhouse" style="color: #424242;font-weight: unset!important;opacity: 0.5;font-size: 16px;">Xuất kho</a></li>
    </ul>
</div>
<div class="div-main-import" style="margin: 50px;">
    <div class="col-md-12">
        <form action="Warehouse" method="post">
            <fieldset>
                <legend>Xuất kho</legend>
                <div class="row">
                    <div class="form-group col-md-5">
                        <label for="namePro">Chọn sản phẩm:</label>
                        <select id="namePro" name="productId" class="form-control">
                            <%
                                if(listProduct!=null){
                                    for (int i = 0; i <listProduct.size() ; i++) {


                            %>
                            <option value="<%=listProduct.get(i).getID()%>"><%=listProduct.get(i).getNAME()%></option>
                            <%
                                    }
                                }
                            %>
                        </select>



                    </div>
                    <div class="form-group col-md-5">
                        <label for="namePro">Số lượng:</label>
                        <input type="number" class="form-control" name="amount" value="0">
                        <input type="hidden" name="type" value="export" >
                    </div>
                </div>
                <button class="btn btn-primary">Xuất kho</button>
            </fieldset>
        </form>
    </div>

</div>

<jsp:include page="../Footer.jsp"></jsp:include>
</body>
</html>
