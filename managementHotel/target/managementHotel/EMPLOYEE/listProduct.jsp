<%@ page import="DTO.ProductTO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Utils.TextCustomizeFormat" %>
<%@ page import="DTO.CategoriesTO" %>
<%@ page import="DTO.StaticTO" %><%--
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
    <link rel="stylesheet" href="./scripts/dropify/dist/css/dropify.min.css"/>
    <link rel="stylesheet" href="./scripts/dropify/dist/fonts/*">
    <link rel="stylesheet" href="./css/Employeee/warehouse-css.css">
    <style>
        .div-img:hover{
            cursor: pointer;
        }
    </style>
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
<%--            <div class="form-group">--%>
<%--                <div class="div-img" style="width: max-content;margin-bottom: 10px;">--%>
<%--                    <label>Hình ảnh:</label>--%>
<%--                    <div class="element-img">--%>
<%--                    <img src="./img/img_default.png" style="height: 100px;width: 100px;border:1px solid #ccc;">--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
            <button class="btn btn-primary">Thêm</button>
        </fieldset>
    </form>
<div class="ui modal" id="modal-img">
    <!-- Modal Header -->
    <div class="header">
        <h4 class="modal-title">Thêm ảnh</h4>
        <button type="button" class="close  ui ok" style="position:absolute;right:10px;top: 10px!important;">&times;</button>
    </div>

    <!-- Modal body -->
    <div class="image content">

        <input type="file" id="input-file-product" class="dropify"/>
    </div>

    <!-- Modal footer -->
    <div class="actions">
        <button type="button" class="btn btn-primary" id="insert-img-product">Insert</button>
        <button type="button" class="btn btn-primary ui ok ">Close</button>
    </div>
</div>
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
                    <button class="btn btn-primary chitiet" data-id="modal-<%=listProduct.get(i).getID()%>" ><span>Xem chi tiết</span><span style="margin-left:10px;"><i class="fas fa-info-circle"></i></span></button>
                    <a href="ListProduct?productid=<%=listProduct.get(i).getID()%>&type=edit"><button class="btn btn-success chinhsua" data-id="<%=listProduct.get(i).getID()%>"><span>Chỉnh sửa</span><span style="margin-left:10px;"><i class="fas fa-pencil-alt"></i></span></button></a>
                    <a href="ListProduct?productid=<%=listProduct.get(i).getID()%>&type=deleteProduct"><button class="btn btn-danger"><span>Xóa</span><span style="margin-left: 10px;"><i class="fa fa-window-close" aria-hidden="true"></i></span></button></a>
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

<%
    if(listProduct!=null){
        for (int i = 0; i <listProduct.size() ; i++) {


%>

<div class="ui modal" id="modal-<%=listProduct.get(i).getID()%>">
    <div class="header">
      Thông tin chi tiết sản phẩm
        <span style="font-size: 18px;position: absolute;top: 10px;right: 10px;" class="close"><i class="fa fa-window-close" aria-hidden="true"></i></span>
    </div>
    <div class="content">
        <table>
            <tbody>
            <tr>
                <td>Tên sản phẩm:</td>
                <td><%=listProduct.get(i).getNAME()%></td>
            </tr>
            <tr>
                <td>Hình ảnh:</td>
                <td>
                    <%
                        if(listProduct.get(i).getFILE_IMG_URL().equals("")){
                    %>
                    <img class="img" src="./img/img_default.png" style="height: 100px;width: 100px;">
                    <%
                        }else{
                    %>
                    <img class="img"  src="<%=listProduct.get(i).getFILE_IMG_URL().replace(StaticTO.STATIC_PATH,"")%>" style="height: 100px;width: 100px;">
                    <%
                        }
                    %>
                </td>
            </tr>
            <tr>
                <td>Mô tả sản phẩm:</td>
                <td>
                    <p>
                        <%=listProduct.get(i).getDESCRIPTION()%>
                    </p>
                </td>
            </tr>
            <tr>
                <td>Giá sản phẩm:</td>
                <td><%=TextCustomizeFormat.currency_format(listProduct.get(i).getPRICE())%></td>
                <td><%=listProduct.get(i).getUNIT()%></td>
            </tr>
            <tr>
                <td>Số lượng:</td>
                <td><%=listProduct.get(i).getAMOUNT()%></td>

            </tr>
            <tr>
                <td>Tình trạng:</td>
                <td>
                    <%
                        if(listProduct.get(i).getAMOUNT()==0){
                    %>
                    <span style="color: red;">Hết hàng</span>
                    <%
                        }else{
                    %>
                    <span style="color: red;">Còn hàng</span>
                    <%
                        }
                    %>
                </td>
            </tr>

            </tbody>
        </table>
    </div>
</div>
<%
        }
        }
%>
<jsp:include page="../Footer.jsp"></jsp:include>
<script src="./scripts/dropify/dist/js/dropify.min.js"></script>
<script>
    $('#input-file-product').dropify();
</script>
<script>
    $(document).ready(function(){
        $("#insert-img-product").click(function(){
            var input_img = $("#input-file-product").val();

            var filename_origin = input_img.split("\\").pop();

            var input_img_src = $("#modal-img .dropify-render img").attr("src");
            $(".element-img img").remove();
            $(".element-img").append("<img class='img' style='height: 100px;width: 100px;border:1px solid #ccc;margin:10px;background-size: cover;background-position: center' src='" + input_img_src + "' name='" + filename_origin + "'>"
            );

        });
        $(".element-img").click(function(){
            $("#modal-img").modal("show");
        });

      $(".chitiet").click(function(){
          var id=$(this).data("id");
          $(".modal").modal('hide');
          $("#"+id).modal('show');
      });

      $(".close").click(function(){
          $(".modal").modal('hide');
      });

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

    });

</script>
</body>
</html>
