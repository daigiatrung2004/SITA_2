<%@ page import="DTO.FurnitureTO" %>
<%@ page import="Utils.TextCustomizeFormat" %>
<%@ page import="DTO.StaticTO" %><%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 17/05/2020
  Time: 9:02 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    FurnitureTO furnitureTO=(FurnitureTO) request.getAttribute("furnitureTO");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Cập nhật thông tin thiết bị</title>
    <jsp:include page="../Library.jsp"></jsp:include>
</head>
<body>
<jsp:include page="HeaderAdmin.jsp"></jsp:include>
<div class="div-update-furniture" style="margin: 20px;">
    <%
        if(furnitureTO!=null){
    %>
<h2 style="text-align: center;margin-bottom: 30px;">Cập nhật thông tin thiết bị</h2>
<form action="ListingFurniture" method="post" id="frm-update">
    <input type="hidden" name="type" value="updated">
    <input type="hidden" name="furnitureid" value="<%=furnitureTO.getId_furniture()%>">
    <div class="form-group">
        <div class="form-group">
            <label for="name_furniture_vi">Tên thiết bị(vi):</label>
            <input type="text" class="form-control" placeholder="Enter name vietnamese " value="<%=furnitureTO.getName_vi()%>" id="name_furniture_vi" name="name_furniture_vi">
        </div>
        <div class="form-group">
            <label for="name_furniture_en">Tên thiết bi(en):</label>
            <input type="text" class="form-control" placeholder="Enter name english " value="<%=furnitureTO.getName_en()%>" id="name_furniture_en"
                   name="name_furniture_en">
        </div>
        <div class="form-group">
            <label for="name_furniture_en">Chi tiết về thiết bị:</label>
            <textarea id="details" name="details">

            </textarea>
        </div>
        <div class="form-group">
            <label for="type_furniture">Đơn vị tính(vi):</label>
            <input type="text" class="form-control" placeholder="Enter type english " value="<%=furnitureTO.getType()%>" id="type_furniture"
                   name="type_furniture">
        </div>
        <div class="form-group">
            <label for="type_furniture_en">Đơn vị tính(en):</label>
            <input type="text" class="form-control" placeholder="Enter type english " value="<%=furnitureTO.getType_en()%>" id="type_furniture_en"
                   name="type_furniture_en">
        </div>
        <div class="form-group">
            <label for="price_furniture">Giá:</label>
            <input type="text" class="form-control" placeholder="Enter price " value="<%=furnitureTO.getPrice()%>" id="price_furniture"
                   name="price_furniture">
        </div>
        <div class="form-group">
            <label for="price_furniture">Trạng thái:</label>
            <select name="status" id="status">
                <option value="<%=StaticTO.ACTIVE_STATUS%>" <%=furnitureTO.getStatus().equals(StaticTO.ACTIVE_STATUS)?"selected":""%>>Đang sử dụng</option>
                <option value="<%=StaticTO.PENDING_STATUS%>"<%=furnitureTO.getStatus().equals(StaticTO.PENDING_STATUS)?"selected":""%>>Đang chờ xét</option>
                <option value="<%=StaticTO.REMOVE_STATUS%>" <%=furnitureTO.getStatus().equals(StaticTO.REMOVE_STATUS)?"selected":""%>>Đã bỏ</option>
            </select>
        </div>
        <button type="button" class="btn btn-primary" id="btn-furniture">Cập nhật thông tin</button>
    </div>
</form>
    <%}%>
</div>
<jsp:include page="SideBar.jsp"></jsp:include>
<script>
    $(document).ready(function(){
        $("#btn-furniture").click(function(){
        var detail=tinymce.get("details").getContent();
        $("#details").val(detail);
        $("#frm-update").submit();
        });
        $(".close").click(function () {
            $(".modal").modal("hide");
        });
        var status = new SlimSelect({
            select: '#status'
        });

        tinymce.init({
            selector: '#details',
            setup: function (editor) {
                editor.on('init', function (e) {
                    <%
                    if(furnitureTO!=null){
                    %>
                    editor.setContent('<%=furnitureTO.getDetails()%>');
                    <%
                    }
                    %>
                });
            },
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
    });
</script>
</body>
</html>
