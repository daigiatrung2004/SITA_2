<%@ page import="DTO.KindRoomTO" %><%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 23/05/2020
  Time: 7:35 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Cập nhật danh sách loại phòng</title>
    <jsp:include page="../Library.jsp"></jsp:include>

    <%
        KindRoomTO kindRoomTO = (KindRoomTO) request.getAttribute("kindRoomTO");
    %>
</head>
<body>
<jsp:include page="HeaderAdmin.jsp"></jsp:include>
<div style="padding: 20px;">
    <%
        if(kindRoomTO!=null){
    %>
    <form action="ListingKindRoom" method="post" id="frm-kindroom">
        <h2 style="text-align: center;">Cập nhật loại phòng</h2>
        <input type="hidden" name="type" value="edit">
        <input type="hidden" name="id" value="<%=kindRoomTO.getKindroom_id()%>">
        <div class="form-group">
            <label for="vi_name">Vietnamese Name:</label>
            <input type="text" class="form-control" placeholder="Enter Vietnamese" value="<%=kindRoomTO.getName_vi()%>" id="vi_name" name="vi_name">
        </div>
        <div class="form-group">
            <label for="en_name">EngLish Name:</label>
            <input type="text" class="form-control" placeholder="Enter English" id="en_name" value="<%=kindRoomTO.getName_en()%>" name="en_name">
        </div>
        <div>
            <label for="remarks"> Mô tả loại phòng:</label>
            <textarea id="remarks" name="remarks">

                </textarea>
        </div>
        <button type="button" class="btn btn-primary" id="btn-kind-room" style="margin-top: 20px;">Cập nhật</button>
        <div class="error" id="result-insert-kind-room"></div>
    </form>
    <%
        }
    %>
</div>
<script>
    $(document).ready(function(){
        tinymce.init({
            selector: '#remarks',
            <%
                   if(kindRoomTO!=null){


                   %>
            setup: function (editor) {
                editor.on('init', function (e) {

                    editor.setContent('<%=kindRoomTO.getRemark()%>');
                });
            },
            <%}%>
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
        $("#btn-kind-room").click(function(){
            var remark=tinymce.get("remarks").getContent();
            $("#remarks").val(remark);
            $("#frm-kindroom").submit();
        });
    });
</script>
<jsp:include page="SideBar.jsp"></jsp:include>
</body>
</html>
