<%@ page import="DTO.FurnitureTO" %>
<%@ page import="DTO.KindRoomTO" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 4/3/2020
  Time: 11:25 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    ArrayList<KindRoomTO> listingKind = (ArrayList<KindRoomTO>) request.getAttribute("listingKind");
    ArrayList<FurnitureTO> listingFurniture = (ArrayList<FurnitureTO>) request.getAttribute("listFurniture");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Danh sách các thiết bị</title>
    <jsp:include page="../Library.jsp"></jsp:include>

</head>
<body>
<jsp:include page="HeaderAdmin.jsp"></jsp:include>
<div class="ui top attached tabular menu menu_insertDataTrans">
    <a class="item active" data-tab="listing">Danh sách các thiết bị</a>
    <a class="item " data-tab="update">Cập nhật thiết bị theo từng loại phòng</a>
</div>
<div class="ui bottom attached tab segment active " data-tab="listing">
    <!--Thêm thiết bị-->
    <fieldset>
        <legend>Thêm thiết bị</legend>
        <div class="form-group">
            <label for="name_furniture_vi">Tên thiết bị(vi):</label>
            <input type="text" class="form-control" placeholder="Enter name vietnamese " id="name_furniture_vi"
                   name="name_furniture_vi">
        </div>
        <div class="form-group">
            <label for="name_furniture_en">Tên thiết bi(en):</label>
            <input type="text" class="form-control" placeholder="Enter name english " id="name_furniture_en"
                   name="name_furniture_en">
        </div>
        <div class="form-group">
            <label for="name_furniture_en">Chi tiết về thiết bị:</label>
            <textarea id="details" name="details">

            </textarea>
        </div>
        <div class="form-group">
            <label for="type_furniture">Đơn vị tính(vi):</label>
            <input type="text" class="form-control" placeholder="Enter type english " id="type_furniture"
                   name="price_furniture">
        </div>
        <div class="form-group">
            <label for="type_furniture_en">Đơn vị tính(en):</label>
            <input type="text" class="form-control" placeholder="Enter type english " id="type_furniture_en"
                   name="price_furniture">
        </div>
        <div class="form-group">
            <label for="price_furniture">Giá:</label>
            <input type="text" class="form-control" placeholder="Enter price " id="price_furniture"
                   name="price_furniture">
        </div>
        <button class="btn btn-primary" id="btn-furniture">Thêm</button>
    </fieldset>
    <!--Danh sách các thiết bị-->
    <div class="listingFurniture">
        <h2 style="text-align: center">Danh sách các thiết bị</h2>
        <div style="min-height: 400px;">
            <table class="table">
                <thead>
                <th>STT</th>
                <th>Tên thiết bị</th>
                <th>Giá</th>
                <th>Đơn vị tính</th>
                <th>Trạng thái</th>
                <th>Hành động</th>
                </thead>
                <tbody>
                <%
                    if (listingFurniture != null) {
                        for (int i = 0; i < listingFurniture.size(); i++) {

                %>
                <tr>
                    <td><%=i%>i%></td>
                    <td><%=listingFurniture.get(i).getName_vi()%>
                    </td>
                    <td><%=listingFurniture.get(i).getPrice()%>
                    </td>
                    <td><%=listingFurniture.get(i).getType()%>
                    </td>
                    <td><%=listingFurniture.get(i).getStatus()%>
                    </td>
                    <td>
                        <button class="btn btn-primary">Chỉnh sửa</button>
                        <button class="btn btn-damage">Xóa</button>
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
<div class="ui bottom attached tab segment " data-tab="update">
    <div class="form-group">
        <label for="kind_room">Chọn loại phòng:</label>
        <select id="kind_room">
            <%
                if (listingKind != null) {
                    for (int i = 0; i < listingKind.size(); i++) {


            %>
            <option value="<%=listingKind.get(i).getKindroom_id()%>"><%=listingKind.get(i).getName_vi()%>
            </option>
            <%
                    }
                }
            %>
        </select>
    </div>
    <div class="form-group">
        <label for="furniture_select">Chọn các thiết bị:</label>
        <select id="furniture_select" multiple>
            <%
                if(listingFurniture!=null){
                for (int i = 0; i < listingFurniture.size(); i++) {


            %>
            <option value="<%=listingFurniture.get(i).getId_furniture()%>"><%=listingFurniture.get(i).getName_vi()%>
            </option>
            <%
                }
                }
            %>
        </select>
    </div>
    <button class="btn btn-primary" id="furniture_room">Thêm</button>
</div>
<jsp:include page="SideBar.jsp"></jsp:include>
<script src="./scripts/Admin/listingFurniture.js"></script>
<script>

    $(document).ready(function () {
        $(".menu_insertDataTrans .item").tab();
    });

</script>
<script>
    var furniture_select = new SlimSelect({
        select: '#furniture_select'
    });
    var kind_room = new SlimSelect({
        select: '#kind_room'
    });
    tinymce.init({
        selector: '#details',
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
</body>
</html>
