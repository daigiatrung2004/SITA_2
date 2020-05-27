<%@ page import="DTO.ServiceTO" %><%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 24/05/2020
  Time: 2:54 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    ServiceTO serviceTO = (ServiceTO) request.getAttribute("serviceTO");

%>
<!DOCTYPE html>
<html>
<head>
    <title>Cập nhật dịch vụ</title>
    <jsp:include page="../Library.jsp"></jsp:include>
</head>
<body>
<jsp:include page="HeaderAdmin.jsp"></jsp:include>
<%
    if (serviceTO != null) {
%>
<div style="padding: 20px;">
<form action="ListingService" id="frm-service" method="post">
    <input type="hidden" name="type" value="edited-service">
    <input type="hidden" name="id" value="<%=serviceTO.getId_service()%>">
    <div>
        <h2 style="text-align: center">Cập nhật dịch vụ</h2>
        <div class="form-group">
            <label for="name_service_vi"> Thêm tên dịch vụ tiếng việt :</label>
            <input type="text" class="form-control" placeholder="Nhập tên dịch vụ tiếng việt"
                   id="name_service_vi"
                   name="name_service_vi" value="<%=serviceTO.getService_name_vi()%>">
        </div>
        <div class="form-group">
            <label for="name_service_en"> Thêm tên dịch vụ tiếng anh :</label>
            <input type="text" class="form-control" placeholder="Nhập tên dịch vụ tiếng anh"
                   id="name_service_en"
                   name="name_service_en" value="<%=serviceTO.getService_name_en()%>">
        </div>
        <div class="form-group">
            <label for="content_service_vi"> Thêm nội dung dịch vụ tiếng việt:</label>
            <textarea id="content_service_vi" name="content_service_vi">

        </textarea>
        </div>
        <div class="form-group">
            <label for="content_service_en"> Thêm nội dung dịch vụ tiếng anh:</label>
            <textarea id="content_service_en" name="content_service_en">

        </textarea>
        </div>
        <button class="btn btn-primary edit">Cập nhật</button>
    </div>
</form>
</div>
<jsp:include page="SideBar.jsp"></jsp:include>
<script>
    $(document).ready(function () {
        $(".edit").click(function(){
               var en=tinymce.get("content_service_en").getContent();
               var vi=tinymce.get("content_service_vi").getContent();
               $("#content_service_en").val(en);
               $("#content_service_vi").val(vi);
               $("#frm-service").submit();

        });
        tinymce.init({
            selector: '#content_service_en',
            <%--setup: function (editor) {--%>
            <%--    editor.on('init', function (e) {--%>
            <%--        editor.setContent("<%=serviceTO.getService_details_en()%>");--%>
            <%--    });--%>
            <%--},--%>
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
            selector: '#content_service_vi',
            <%--setup: function (editor) {--%>
            <%--    editor.on('init', function (e) {--%>
            <%--        editor.setContent("<%=serviceTO.getService_details_vi()%>");--%>
            <%--    });--%>
            <%--},--%>
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
<%
} else {
%>
<h2>Không tìm thấy dữ liệu cần cập nhật</h2>
<%
    }%>
</body>
</html>
