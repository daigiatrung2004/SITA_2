<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 4/12/2020
  Time: 12:07 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String checkSuccess=request.getParameter("checkSuccess")!=null?(String)request.getParameter("checkSuccess"):"false";
%>
<!DOCTYPE html>
<html>
<head>
    <title>Thông báo</title>
    <jsp:include page="../Library.jsp"></jsp:include>
</head>
<body>
<jsp:include page="HeaderAdmin.jsp"></jsp:include>
<div class="container">
    <div class="div-announce">
        <form id="frm-announce" action="PostAnnouncement">
            <input type="hidden" name="type" value="insert">;
            <div class="form-group">
                <label for="name_trans_vi">Tên tiêu đề</label>
                <input type="text" class="form-control" placeholder="Nhập tiêu đề" id="name_trans_vi"
                       name="title">
            </div>
            <div class="form-group">
                <label for="name_trans_vi">Nội dung:</label>
                <textarea id="content-announce" name="content"></textarea>
            </div>
            <button type="button" class="btn btn-primary" id="btn-announce">Đăng</button>
        </form>
    </div>
</div>
<jsp:include page="SideBar.jsp" ></jsp:include>
<script>
    tinymce.init({
        selector: '#content-announce',
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
    $(document).ready(function(){
          $("#btn-announce").click(function(){
              var content = tinymce.get('content-announce').getContent();
              $("#content-announce").val(content);
              $("#frm-announce").submit();
          });
          <%if(checkSuccess.equals("true")){%>
        alert("Thành công");
        <%}%>
    });
</script>
</body>
</html>
