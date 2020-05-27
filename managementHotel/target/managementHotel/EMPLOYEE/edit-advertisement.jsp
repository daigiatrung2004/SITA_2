<%@ page import="DTO.PromoteTO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="DTO.AdvertisementTO" %>
<%@ page import="DTO.StaticTO" %><%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 21/05/2020
  Time: 4:46 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    ArrayList<PromoteTO> listPromote = (ArrayList<PromoteTO>) request.getAttribute("listPromote");
    AdvertisementTO advertisementTO = (AdvertisementTO) request.getAttribute("advertisementTO");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Cập nhật ưu đãi</title>
    <link rel="stylesheet" href="./scripts/dropify/dist/css/dropify.min.css"/>
    <link rel="stylesheet" href="./scripts/dropify/dist/fonts/*">
    <jsp:include page="../Library.jsp"></jsp:include>
    <style>
        .imgArray {
            width: max-content;
        }

        .imgArray:hover {
            cursor: pointer;
        }
    </style>
</head>
<body>
<jsp:include page="/EMPLOYEE/Header-employee.jsp"></jsp:include>
<div class="edit-advertisement">
    <%
        if (advertisementTO != null) {
    %>
    <h2 style="text-align: center">Cập nhật ưu đãi</h2>
    <input type="hidden" id="id" value="<%=advertisementTO.getID()%>">
    <div class="div-createoffer container" style="padding:50px 0px;background: white">
        <div class="form-group">
            <label for="title">Tiêu đề:</label>
            <input type="text" class="form-control" id="title" placeholder="Vui lòng nhập chủ đề" name="title"
                   required="required" value="<%=advertisementTO.getTITLE()%>">
        </div>
        <div class="form-group">
            <label for="title">Tiêu đề(en):</label>
            <input type="text" class="form-control" id="title_en" value="<%=advertisementTO.getTILTLE_EN()%>"
                   placeholder="Vui lòng nhập chủ đề" name="title_en" required="required">
        </div>
        <div class="form-group">
            <label for="shortDescription">Mô tả ngắn:</label>
            <textarea id="shortDescription">

        </textarea>
        </div>
        <div class="form-group">
            <label for="shortDescription_en">Mô tả ngắn(en):</label>
            <textarea id="shortDescription_en">

        </textarea>
        </div>
        <div class="form-group">
            <label for="Description">Mô tả chi tiết:</label>
            <textarea id="Description">

        </textarea>
        </div>
        <div class="form-group">
            <label for="Description_en">Mô tả chi tiết(en):</label>
            <textarea id="Description_en">

        </textarea>
        </div>
        <div class="form-group" id="div-img">
            <label for="image">Hình ảnh :</label>
            <div class="imgArray" id="image">
                 <%if(advertisementTO.getFILE_URL_IMG()!=null&&!advertisementTO.getFILE_URL_IMG().equals("")){
                     %>
                <img src="<%=advertisementTO.getFILE_URL_IMG().replace(StaticTO.STATIC_PATH,"")%>" style="height: 150px;width: 150px;border: 1px solid #ccc">
                <%
                 }else{
                %>
                <img src="./img/img_default.png" style="height: 150px;width: 150px;border: 1px solid #ccc">
                <%}%>

            </div>
        </div>
        <div class="form-group">
            <label for="start_date">Ngày bắt đầu:</label>
            <input type="text" class="form-control" id="start_date" value="<%=advertisementTO.getSTART_DATE().split(" ")[0]%>" placeholder="Vui lòng nhập ngày bắt đầu"
                   name="start_date" readonly>
        </div>
        <div class="form-group">
            <label for="end_date">Ngày kết thúc:</label>
            <input type="text" class="form-control" id="end_date" value="<%=advertisementTO.getEND_DATE().split(" ")[0]%>" placeholder="Vui lòng nhập ngày hết hạn"
                   name="en_date" readonly>
        </div>
        <div class="form-group">
            <label for="promote">Chọn mã giảm giá:</label>
            <select id="promote" style="margin-bottom: 14px;">
                <%
                    if (listPromote != null) {
                        for (int i = 0; i < listPromote.size(); i++) {

                %>
                <option value="<%=listPromote.get(i).getPromte_id()%>" <%=listPromote.get(i).getPromte_id()==advertisementTO.getPromote_id()?"selected":""%>><%=listPromote.get(i).getPro_code()%>
                </option>
                <%
                        }
                    }
                %>
            </select>
            <button class="btn btn-primary insertpromote">Thêm mã giảm giá</button>
            <button class="btn btn-success viewpromote">Xem chi tiết các mã giảm giá</button>
            <button class="btn btn-static-2 insertoffer">Cập nhật ưu đãi</button>
        </div>
        <div class="ui modal " id="promote-modal">
            <div class="header">
                <span>Thêm mã giảm giá</span>
                <span class="close" style="position: absolute;top: 10px;right: 10px"><i class="fa fa-window-close"
                                                                                        aria-hidden="true"></i></span>
            </div>
            <div class="content">
                <div class="promote">
                    <div class="form-group">
                        <label for="procode">Mã giảm giá:</label>
                        <input type="text" class="form-control" id="procode" placeholder="Vui lòng nhập mã giảm giá"
                               name="procode" required="required">
                    </div>
                    <div class="form-group">
                        <label for="provalue">Giá trị mã giảm giá(%):</label>
                        <input type="text" class="form-control" id="provalue"
                               placeholder="Vui lòng nhập giá trị mã giảm giá" name="provalue" required="required">
                    </div>
                    <div class="form-group">
                        <label for="expire">Chọn ngày hết hạn:</label>
                        <input type="text" class="form-control" id="expire" placeholder="Vui lòng nhập ngày hết hạn"
                               name="expire" required="required">
                    </div>
                    <button class="btn btn-primary" id="promote-insert">Thêm mới</button>
                </div>
            </div>
        </div>
        <div class="ui modal " id="promote-view-modal">
            <div class="header">
                <span>Các mã giảm giá</span>
                <span class="close" style="position: absolute;top: 10px;right: 10px"><i class="fa fa-window-close"
                                                                                        aria-hidden="true"></i></span>
            </div>
            <div class="content">
                <table class="table">
                    <thead>
                    <th>Mã giảm giá</th>
                    <th>Giá trị giảm giá(%)</th>
                    </thead>
                    <tbody>
                    <%
                        if (listPromote != null) {
                            for (int i = 0; i < listPromote.size(); i++) {


                    %>
                    <tr>
                        <td><%=listPromote.get(i).getPro_code()%>
                        </td>
                        <td><%=listPromote.get(i).getPro_value()%>
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
    </div>
    <div class="ui modal" id="img-upload">


        <!-- Modal Header -->
        <div class="header">
            <h4 class="modal-title">Thêm ảnh</h4>
            <button type="button" class="close ui ok">&times;</button>
        </div>

        <!-- Modal body -->
        <div class="content">

            <input type="file" id="input-file-now" class="dropify"/>
        </div>

        <!-- Modal footer -->
        <div class="actions">
            <button type="button" class="btn btn-primary" id="insert-img-resource">Insert</button>
            <button type="button" class="btn btn-primary ui ok">Close</button>
        </div>


    </div>


</div>
<%} else {%>
<h2 style="text-align:center;">Không tìm thấy ưu đãi để chỉnh sửa</h2>
<%}%>
<script src="./scripts/dropify/dist/js/dropify.min.js"></script>
<script>
    $('#input-file-now').dropify();
</script>
<script>
    tinymce.init({
        selector: '#Description',
        // setup: function (editor) {
        //     editor.on('init', function (e) {
        //         editor.setContent("<p></p>");
        //     });
        // },
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
        selector: '#Description_en',
        <%--setup: function (editor) {--%>
        <%--    editor.on('init', function (e) {--%>
        <%--        editor.setContent('<%=advertisementTO.getDESCRIPTION_EN()%>');--%>
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
        selector: '#shortDescription',
        <%--setup: function (editor) {--%>
        <%--    editor.on('init', function (e) {--%>
        <%--        editor.setContent("<%=advertisementTO.getSHORT_DESCRIPTION().replaceAll("\"","'")%>");--%>
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
        selector: '#shortDescription_en',
        <%--setup: function (editor) {--%>
        <%--    editor.on('init', function (e) {--%>
        <%--        editor.setContent('<%=advertisementTO.getSHORT_DESCRIPTION_EN()%>');--%>
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
</script>
<script src="./scripts/Employee/editOffer-js.js"></script>
<jsp:include page="../Footer.jsp"></jsp:include>
</body>
</html>
