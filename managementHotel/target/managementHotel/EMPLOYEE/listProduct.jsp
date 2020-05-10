<%@ page import="DTO.ProductTO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Utils.TextCustomizeFormat" %>
<%@ page import="DTO.CategoriesTO" %><%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 4/12/2020
  Time: 5:51 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    ArrayList<ProductTO> listProduct = (ArrayList<ProductTO>) request.getAttribute("listProduct");
    ArrayList<CategoriesTO> listCategory = (ArrayList<CategoriesTO>) request.getAttribute("listCategory");
    String checkSuccess = request.getParameter("checkSuccess") != null ? (String) request.getParameter("checkSuccess") : "false";
%>
<!DOCTYPE html>
<html>
<head>
    <title>Danh sách các sản phẩm</title>
    <jsp:include page="../Library.jsp"></jsp:include>
    <link rel="stylesheet" href="./css/Employeee/warehouse-css.css">
</head>
<body>
<jsp:include page="Header-employee.jsp"></jsp:include>
<div class="taskbar" style="min-height: 100px;">
    <ul>
        <li><a href="Warehouse"
               style="color: #424242;font-weight: unset!important;opacity: 0.5;font-size: 16px;">Danh mục các sản
            phẩm</a></li>
        <li><a href="ListProduct" class="activeWarhouse" style="color: #424242;font-weight: unset!important;opacity: 0.5;font-size: 16px;">Danh
            sách các sản phẩm</a></li>
        <li><a href="Warehouse?type=in" style="color: #424242;font-weight: unset!important;opacity: 0.5;font-size: 16px;">Nhập kho</a></li>
        <li><a href="Warehouse?type=ex" style="color: #424242;font-weight: unset!important;opacity: 0.5;font-size: 16px;">Xuất kho</a></li>
    </ul>
</div>
<div class="div-main-warehouse">
    <div class="div-insert-product"></div>
    <form action="ListProduct" method="post">
        <fieldset>
            <legend>Thêm dữ liệu sản phẩm:</legend>
            <div class="form-group">
                <label for="NAME">Tên sản phẩm:</label>
                <input type="text" class="form-control" placeholder="Nhập tên sản phẩm " id="NAME" name="NAME">
                <input type="hidden" name="type" value="InsertProduct"/>
            </div>
            <div class="form-group">
                <label for="DESCRIPTION">Mô tả sàn phẩm:</label>
                <textarea id="DESCRIPTION" name="DESCRIPTION"></textarea>
            </div>
            <div class="form-group">
                <label for="price">Giá:</label>
                <input type="number" class="form-control" placeholder="Nhập giá " id="price" name="price">

            </div>
            <div class="form-group">
                <label for="UNIT">Đơn vị tính:</label>
                <input type="text" class="form-control" placeholder="Nhập đơn vị tính " id="UNIT" name="UNIT">

            </div>
            <div class="form-group">
                <label for="AMOUNT">Số lượng:</label>
                <input type="text" class="form-control" placeholder="Nhập số lượng " id="AMOUNT" name="AMOUNT">

            </div>
            <div class="form-group">
                <label for="cate_id">Danh mục sản phẩm:</label>
                <select id="cate_id" name="cate_id">
                    <%
                        if (listCategory != null) {
                            for (int i = 0; i < listCategory.size(); i++) {


                    %>
                    <option value="<%=listCategory.get(i).getCate_id()%>"><%=listCategory.get(i).getName()%>
                    </option>
                    <%
                            }
                        }
                    %>
                </select>

            </div>
            <button class="btn btn-primary">Thêm</button>
        </fieldset>
    </form>

    <div>
        <h2 style="text-align: center;margin-top: 20px;margin-bottom: 20px;">Danh sách sản phẩm</h2>
        <table class="table">
            <thead>
            <th>STT</th>
            <th>Tên sản phẩm</th>
            <th>Giá</th>
            <th>Đơn vị tính</th>
            <th>Số lượng</th>
            <th>Hành động</th>

            </thead>
            <tbody>
            <%
                if (listProduct != null) {
                    for (int i = 0; i < listProduct.size(); i++) {


            %>
            <tr>
                <td><%=i%>
                </td>
                <td><%=listProduct.get(i).getNAME()%>
                </td>
                <td><%=TextCustomizeFormat.currency_format(listProduct.get(i).getPRICE())%>
                </td>
                <td><%=listProduct.get(i).getUNIT()%>
                </td>
                <td><%=listProduct.get(i).getAMOUNT()%>
                </td>
                <td>
                    <button class="btn btn-primary">Xem chi tiết</button>
                </td>
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
    tinymce.init({
        selector: '#DESCRIPTION',
        menu: {
            file: {title: 'File', items: 'newdocument'},
            edit: {title: 'Edit', items: 'undo redo | cut copy paste pastetext | selectall'},
            insert: {title: 'Insert', items: 'link media | template hr'},
            view: {title: 'View', items: 'visualaid'},
            format: {
                title: 'Format',
                items: 'bold italic underline strikethrough superscript subscript | formats | removeformat'
            },
            table: {title: 'Table', items: 'inserttable tableprops deletetable | cell row column'},
            tools: {title: 'Tools', items: 'spellchecker code'}
        }
    });
    var cate_id = new SlimSelect({
        select: '#cate_id'
    });
</script>
</body>
</html>
