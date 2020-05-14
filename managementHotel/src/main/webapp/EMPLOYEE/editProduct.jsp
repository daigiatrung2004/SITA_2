<%@ page import="DTO.StaticTO" %>
<%@ page import="DTO.ProductTO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Utils.TextCustomizeFormat" %><%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 11/05/2020
  Time: 12:05 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    ProductTO productTO= (ProductTO)request.getAttribute("productTO");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Chỉnh sửa thông tin sản phẩm</title>
    <jsp:include page="../Library.jsp"></jsp:include>
    <link rel="stylesheet" href="./scripts/dropify/dist/css/dropify.min.css"/>
    <link rel="stylesheet" href="./scripts/dropify/dist/fonts/*">
    <link rel="stylesheet" href="./css/Employeee/warehouse-css.css">

    <style>
        .img:hover{
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
<div class="div-edit-product" style="margin: 50px;">
    <h2 style="text-align: center">Chỉnh sửa sản phẩm</h2>
    <%if(productTO!=null){%>

        <input type="hidden" name="type" id="type" value="updateProduct">
        <input type="hidden" name="productid" id="productid" value="<%=productTO.getID()%>">
        <div class="form-group">
         <label for="name">Tên sản phẩm</label>
            <input type="text" class="form-control" name="name" id="name" placeholder="Vui lòng nhập tên sản phẩm" value="<%=productTO.getNAME()%>" required="required">
        </div>
        <div>
            <label for="name">Mô tả sản phẩm:</label>
            <textarea id="description" name="description">

            </textarea>
        </div>
        <div class="div-img">
            <label for="name">Hình ảnh sản phẩm:</label>
            <div class="element-img" style="width: max-content;">
            <%if(productTO.getFILE_IMG_URL()==null||productTO.getFILE_IMG_URL().equals("")){%>
            <img class="img" src="./img/img_default.png" style="width: 100px;height: 100px;border: 1px solid #ccc;margin-top: 10px;" />
            <%}else{%>
            <img class="img" src="<%=productTO.getFILE_IMG_URL().replace(StaticTO.STATIC_PATH,"")%>" style="width: 100px;height: 100px;border: 1px solid #ccc;margin-top: 10px;" />
            <%}%>
            </div>
        </div>
        <div class="form-group">
            <label for="name">Trạng thái:</label>
            <select name="status" id="status">
                <option value="<%=StaticTO.ACTIVE_STATUS%>" <%=productTO.getSTATUS().equals(StaticTO.ACTIVE_STATUS)?"selected":""%>>Đang sử dụng</option>
                <option value="<%=StaticTO.PENDING_STATUS%>" <%=productTO.getSTATUS().equals(StaticTO.PENDING_STATUS)?"selected":""%>>Đang chờ duyệt</option>
                <option value="<%=StaticTO.REMOVE_STATUS%>" <%=productTO.getSTATUS().equals(StaticTO.REMOVE_STATUS)?"selected":""%>>Đã bỏ</option>
            </select>
        </div>
        <div>
            <label for="name">Ghi chú:</label>
            <textarea id="remarks" name="remarks">

            </textarea>
        </div>
        <div class="form-group">
            <label for="price">Giá sản phẩm:</label>
            <input type="text" class="form-control" name="name" id="price" placeholder="Vui lòng nhập giá sản phẩm" value="<%=TextCustomizeFormat.currency_format(productTO.getPRICE())%>" required="required">
        </div>
        <div class="form-group">
            <label for="unit">Đơn vị tính:</label>
            <input type="text" class="form-control" name="name" id="unit" placeholder="Vui lòng nhập đơn vị tính" value="<%=productTO.getUNIT()%>" required="required">
        </div>
        <button class="btn btn-primary" id="btn-update">Cập nhật</button>

<%
    }
%>
</div>
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
        tinymce.init({
            selector: '#description',
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
        tinymce.init({
            selector: '#remarks',
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
        var status = new SlimSelect({
            select: '#status'
        });

    tinymce.get("remarks").setContent("' '<%=productTO.getREMARK()%>");
    tinymce.get("description").setContent("' '<%=productTO.getDESCRIPTION()%>");
    $(".close").click(function(){
        // alert("xin chao");
        $("#modal-img").modal("hide");

    });
    $("#btn-update").click(function(){
        // alert("xin chao");
       var name=$("#name").val();
       var description=tinymce.get("description").getContent();
       var listsrc=$(".img").attr("src");
       var listOrgin=$(".img").attr("name");
       var status=$("#status").val();
       var remarks=tinymce.get("remarks").getContent();
       var price=$("#price").val();
       var unit=$("#unit").val();
       $.ajax({
           url: 'ListProduct',
           type: 'POST',
           dataType: 'JSON',
           data: {
               listSrcData: JSON.stringify(listsrc),
               listImgOrginData: JSON.stringify(listOrgin),
               name:name,
               description:description,
               status:status,
               remarks:remarks,
               price:price,
               unit:unit,
               type:"updateProduct",
               productid:"<%=productTO.getID()%>",
           },
           success: function (data) {
               if (data['success']) {
                   alert("Cập nhật thành công");
                   window.location.href="http://localhost:8080/managementHotel_war_exploded/ListProduct";
               } else {
                   alert("Thất bại");
               }
           }
       });
    });
    });

</script>
<jsp:include page="../Footer.jsp"></jsp:include>
</body>
</html>
