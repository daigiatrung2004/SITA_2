<%@ page import="DTO.TransportTO" %><%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 20/05/2020
  Time: 12:55 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    TransportTO transportTO=(TransportTO) request.getAttribute("transportTO");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Chỉnh sửa deanh sách vân chuyển</title>
    <jsp:include page="../Library.jsp"></jsp:include>
</head>
<body>
<jsp:include page="HeaderAdmin.jsp"></jsp:include>
<div class="edit-transport" style="padding: 20px;">
    <h2 style="text-align: center;margin-bottom: 14px;">Chỉnh sửa thông tin vận chuyển</h2>
    <%
        if(transportTO!=null){
    %>
    <form action="ListingTransport" method="post" id="frm-listing">
        <input type="hidden" name="type" value="updated">
        <input type="hidden" name="transportid" value="<%=transportTO.getTransport_id()%>">
        <div class="form-group">
            <label for="name_vi">Tên vận chuyển tiếng việt:</label>
            <input type="text" class="form-control" placeholder="Nhập tên tiếng việt" value="<%=transportTO.getName_vi()%>" name="name_vi" id="name_vi">
        </div>
        <div class="form-group">
            <label for="name_en">Tên vận chuyển tiếng anh:</label>
            <input type="text" class="form-control" placeholder="Nhập tên tiếng anh" value="<%=transportTO.getName_en()%>" name="name_en" id="name_en">
        </div>
        <div class="form-group">
            <label for="name_en">Chi tiết (vi):</label>
           <textarea id="details_vi" name="details_vi" >

           </textarea>
        </div>
        <div class="form-group">
            <label for="details_en">Chi tiết (en):</label>
            <textarea id="details_en" name="details_en">

           </textarea>
        </div>
        <div class="form-group">
            <label for="price">Giá vận chuyển:</label>
            <input type="number" class="form-control" placeholder="Nhập giá vận chuyển" value="<%=transportTO.getPrice()%>" name="price" id="price">
        </div>
        <div class="form-group">
            <label for="remark">Ghi chú:</label>
            <textarea id="remark" name="remark">

           </textarea>
        </div>
        <button type="button"  class="btn btn-primary" id="update">Cập nhật</button>
    </form>
    <%
        }
    %>
</div>
<script>
    $(document).ready(function(){

        tinymce.init({
            selector: '#details_vi',
            setup: function (editor) {
                editor.on('init', function (e) {
                    editor.setContent('<%=transportTO.getDetails_vi()%>');
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

        tinymce.init({
            selector: '#details_en',
            setup: function (editor) {
                editor.on('init', function (e) {
                    editor.setContent('<%=transportTO.getDetails_en()%>');
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
        tinymce.init({
            selector: '#remark',
            setup: function (editor) {
                editor.on('init', function (e) {
                    editor.setContent('<%=transportTO.getRemark()%>');
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
        $("#update").click(function(){
            var detail_vi=tinymce.get("details_vi").getContent();
            var details_en=tinymce.get("details_en").getContent();
            var remark=tinymce.get("remark").getContent();
            $("#details_vi").val(detail_vi);
            $("#details_en").val(details_en);
            $("#remark").val(remark);
            $("#frm-listing").submit();


        });

    });
</script>
<jsp:include page="SideBar.jsp"></jsp:include>
</body>
</html>
