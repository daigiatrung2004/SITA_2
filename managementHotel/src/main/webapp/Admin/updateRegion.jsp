<%@ page import="DTO.RegionTO" %>
<%@ page import="DTO.StaticTO" %><%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 01/05/2020
  Time: 8:31 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    RegionTO regionTO=(RegionTO) request.getAttribute("regionTO");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Cập nhật thông Tin khu vực</title>
    <jsp:include page="../Library.jsp"></jsp:include>
    <link rel="stylesheet" href="./scripts/dropify/dist/css/dropify.min.css"/>
    <link rel="stylesheet" href="./scripts/dropify/dist/fonts/*">
    <style>
        .gallery:hover{
            cursor: pointer;
        }
    </style>
</head>
<body>
<jsp:include page="HeaderAdmin.jsp"></jsp:include>
<div class="div-main-update" style="padding:50px;">
    <form action="UpdateRegion" method="post" enctype="multipart/form-data">
        <input type="hidden" id="type" name="type" value="updated">

        <%if(regionTO!=null){%>
        <input type="hidden" id="region" name="region" value="<%=regionTO.getRegion_id()%>">
          <h2>Cập nhật thông tin khu vực</h2>

        <div class="form-group">
            <label for="name_vi">Tên tiếng việt:</label>
            <input type="text" class="form-control" id="name_vi" placeholder="Vui lòng nhập tên khu vực bằng tiếng việt"  name="name_vi" value="<%=regionTO.getName_vi()%>" required="required">
        </div>
        <div class="form-group">
            <label for="name_en">Tên tiếng anh:</label>
            <input type="text" class="form-control" placeholder="Vui lòng nhập tên khu vực bằng tiếng anh" id="name_en" name="name_en" value="<%=regionTO.getName_en()%>" required="required">
        </div>
        <div class="form-group">
            <label for="address">Địa chỉ:</label>
            <input type="text" class="form-control" placeholder="Vui lòng nhập địa chỉ" id="address" name="address" value="<%=regionTO.getAddress()%>" required="required">
        </div>
        <div class="form-group">
            <label for="phone">Số điện thoại:</label>
            <input type="text" class="form-control" placeholder="Vui lòng nhập địa chỉ" id="phone" name="phone" value="<%=regionTO.getAddress()%>" required="required">
        </div>
        <div class="form-group">
            <label for="phone">Hình ảnh đại diện:</label>
            <div class="gallery" style="width: max-content;">
                <%
                    if(!regionTO.getFile_url_img().equals("")){
                %>
                <img src="<%=regionTO.getFile_url_img().replace(StaticTO.STATIC_PATH,"").replace("\\","//")%>" style="height: 150px;width: 150px;" id="img-gallery">
                <%
                    }else{
                %>
                <img src="./img/employee/cantho-daidien.jpg" style="height: 150px;width: 150px;">
                <%
                    }
                %>
            </div>

        </div>
        <div class="form-group">
            <label for="select-status">Trạng thái:</label>
            <select id="select-status" name="status">
                <option value="<%=StaticTO.ACTIVE_STATUS%>">Đang hoạt động</option>
                <option value="<%=StaticTO.PENDING_STATUS%>">Đang sửa chữa</option>
                <option value="<%=StaticTO.DELETE_STATUS%>">Ngưng hoạt động</option>
            </select>
        </div>
        <div class="form-group">
            <label for="remark">Ghi chú:</label>
            <textarea id="remark" name="remark">
            </textarea>
        </div>
        <%
            }
        %>
        <div class="ui modal" id="myModal">


            <!-- Modal Header -->
            <div class="header">
                <h4 class="modal-title">Thêm ảnh</h4>
                <button type="button" class="close  ui ok">&times;</button>
            </div>

            <!-- Modal body -->
            <div class="image content">

                <input type="file" id="input-file-region" name="file" class="dropify"/>
            </div>

            <!-- Modal footer -->
            <div class="actions">
                <button type="button" class="btn btn-primary" id="insert-img-region">Insert</button>
                <button type="button" class="btn btn-primary ui ok ">Close</button>
            </div>


        </div>
        <button type="button" class="btn btn-primary" id="btn-update">Cập nhật</button>
    </form>

</div>

<script src="./scripts/dropify/dist/js/dropify.min.js"></script>
<script src="./scripts/Admin/updateRegion-js.js">

</script>
<jsp:include page="SideBar.jsp"></jsp:include>
</body>
</html>
