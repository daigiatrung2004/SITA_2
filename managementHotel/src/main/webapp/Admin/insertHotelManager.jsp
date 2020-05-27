<%@ page import="DTO.*" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 3/15/2020
  Time: 4:58 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Thêm dữ liệu khách sạn</title>
    <link rel="stylesheet" href="./scripts/dropify/dist/css/dropify.min.css"/>
    <link rel="stylesheet" href="./scripts/dropify/dist/fonts/*">
    <jsp:include page="../Library.jsp"></jsp:include>
    <link rel="stylesheet" href="./css/Admin/initManagerHotel.css">

</head>
<body>
<%
    ArrayList<RegionTO> listRegion = (ArrayList<RegionTO>) request.getAttribute("listRegion");
    ArrayList<KindRoomTO> listKindRoom = (ArrayList<KindRoomTO>) request.getAttribute("listKindRoom");
    ArrayList<PriceRoomTO> listPriceRoom = (ArrayList<PriceRoomTO>) request.getAttribute("listPriceRoom");
    ArrayList<ServiceTO> listServiceTO = (ArrayList<ServiceTO>) request.getAttribute("listServiceTO");
    ArrayList<PromoteTO> listPromote = (ArrayList<PromoteTO>) request.getAttribute("listPromote");
%>
<div class="insertData">
    <jsp:include page="HeaderAdmin.jsp"></jsp:include>
    <div>
        <div class="ui top attached tabular menu menu_insertData">
            <a class="item active" data-tab="region">Thêm khu vực</a>
            <a class="item" data-tab="kindroom">Thêm loại phòng</a>
            <a class="item" data-tab="price-room">Giá phòng</a>
            <a class="item" data-tab="room">Thêm phòng</a>
            <a class="item" data-tab="upload_img">Thêm ảnh phòng </a>
            <a class="item" data-tab="service_data">Thêm dữ liệu dịch vụ</a>
            <a class="item" data-tab="service_room">Thêm dịch vụ cho từng loại phòng̣</a>


        </div>

        <!--them khu vuc-->
        <div class="ui bottom attached tab segment active" data-tab="region">
            <div class="form-group">
                <label for="vi_name">Tên(tiếng việt):</label>
                <input type="text" class="form-control" placeholder="Nhập tên tiếng việt" id="vi_name" name="vi_name">
            </div>
            <div class="form-group">
                <label for="en_name">Tên(tiếng anh):</label>
                <input type="text" class="form-control" placeholder="Nhập tên tiếng anh" id="en_name" name="en_name">
            </div>
            <div class="form-group">
                <label for="address_region">Địa chỉ:</label>
                <input type="text" class="form-control" placeholder="Nhập địa chỉ" id="address_region" name="address_region">
            </div>
            <div class="form-group">
                <label for="phone_region">Số điện thoại liên hệ:</label>
                <input type="text" class="form-control" placeholder="Nhập số điện thoại" id="phone_region" name="phone_region">
            </div>
            <div class="form-group">
                <label for="en_name">Thêm hình ảnh:</label>
                <div class="img-region-insert" style="display:flex;">
                    <div class="array-img-region-insert">

                    </div>
                    <div class="div-img-region-insert">
                        <span><i class="fas fa-plus"></i></span>
                    </div>
                    <div class="ui modal" id="regionModal">


                        <!-- Modal Header -->
                        <div class="header">
                            <h4 class="modal-title">Thêm ảnh</h4>
                            <button type="button" class="close ui ok">&times;</button>
                        </div>

                        <!-- Modal body -->
                        <div class="content">

                            <input type="file" id="input-file-region" class="dropify"/>
                        </div>

                        <!-- Modal footer -->
                        <div class="actions">
                            <button type="button" class="btn btn-primary" id="insert-img-region">Insert</button>
                            <button type="button" class="btn btn-primary ui ok">Close</button>
                        </div>


                    </div>
                </div>
            </div>
            <button type="submit" class="btn btn-primary" id="btn-region">Insert</button>
            <div class="error" id="result-insert-region"></div>
        </div>


        <!--them loai phong -->
        <div class="ui bottom attached tab segment" data-tab="kindroom">
            <div class="form-group">
                <label for="vi_name">Vietnamese Name:</label>
                <input type="text" class="form-control" placeholder="Enter Vietnamese" id="vi_name_kind" name="vi_name">
            </div>
            <div class="form-group">
                <label for="en_name">EngLish Name:</label>
                <input type="text" class="form-control" placeholder="Enter English" id="en_name_kind" name="en_name">
            </div>
            <div>
                <label for="en_name"> Mô tả loại phòng:</label>
                <textarea id="remarks">

                </textarea>
            </div>
            <button type="submit" class="btn btn-primary" id="btn-kind-room">Insert</button>
            <div class="error" id="result-insert-kind-room"></div>
        </div>

        <!--them gia phong-->
        <div class="ui bottom attached tab segment" data-tab="price-room">
            <div class="form-group">
                <label for="en_name"> Type Price Room VietNam :</label>
                <input type="text" class="form-control" placeholder="Enter Name Room" id="type_vi" name="type_vi">
            </div>
            <div class="form-group">
                <label for="en_name">Type Price Room EngLish:</label>
                <input type="text" class="form-control" placeholder="Enter Name Room" id="type_en" name="type_en">
            </div>
            <div class="form-group">
                <label for="en_name"> Price / 1 night:</label>
                <input type="text" class="form-control" placeholder="Enter Name Room" id="price" name="price">
            </div>

            <div class="form-group">
                <label for="en_name">Select kind room:</label>
                <select id="select-kind-room-id">
                    <%
                        if (listRegion != null) {
                            for (int i = 0; i < listKindRoom.size(); i++) {


                    %>
                    <option value="<%=listKindRoom.get(i).getKindroom_id()%>"><%=listKindRoom.get(i).getName_vi()%>
                    </option>
                    <%
                            }
                        }%>

                </select>
            </div>
            <button type="submit" class="btn btn-primary" id="btn-price-room">Insert</button>
            <div class="error" id="result-price-room"></div>
        </div>
        <!---->


        <!--them phong moi-->
        <div class="ui bottom attached tab segment" data-tab="room">
            <div class="form-group">
                <label for="en_name"> Name Room :</label>
                <input type="text" class="form-control" placeholder="Enter Name Room" id="name_room" name="en_name">
            </div>

            <div class="form-group">
                <label for="en_name"> Max people :</label>
                <input type="number" class="form-control" placeholder="Enter Max People" id="max_peo" name="max_peo">
            </div>
            <div class="form-group">
                <label for="en_name">Select kind room:</label>
                <select id="select-kind-room">
                    <%
                        if (listRegion != null) {
                            for (int i = 0; i < listKindRoom.size(); i++) {


                    %>
                    <option value="<%=listKindRoom.get(i).getKindroom_id()%>"><%=listKindRoom.get(i).getName_vi()%>
                    </option>
                    <%
                            }
                        }%>

                </select>
            </div>
            <div class="form-group">
                <label for="select-price-room-id-2">Select type price:</label>
                <select id="select-price-room-id-2">
                    <%
                        if (listPriceRoom != null) {
                            for (int i = 0; i < listPriceRoom.size(); i++) {


                    %>
                    <option value="<%=listPriceRoom.get(i).getPrice_id()%>"><%=listPriceRoom.get(i).getType_price_room_vi()%>
                    </option>
                    <%
                            }
                        }%>

                </select>
            </div>
            <div class="form-group">
                <label for="en_name">Select region:</label>
                <select id="select-region">
                    <%
                        if (listRegion != null) {
                            for (int i = 0; i < listRegion.size(); i++) {


                    %>
                    <option value="<%=listRegion.get(i).getRegion_id()%>">
                        <%=listRegion.get(i).getName_vi()%>
                    </option>
                    <%
                            }
                        }
                    %>
                </select>
            </div>
            <button type="submit" class="btn btn-primary" id="btn-room">Insert</button>
            <div class="error" id="result-insert-room"></div>
        </div>

        <!---->

        <!--upload img-->
        <div class="ui bottom attached tab segment" data-tab="upload_img" id="imgUpload">

            <div class="form-group">
                <label for="kindroom"> Select kind room :</label>
                <select id="kindroom">
                    <%
                        if (listRegion != null) {
                            for (int i = 0; i < listKindRoom.size(); i++) {


                    %>
                    <option value="<%=listKindRoom.get(i).getKindroom_id()%>"><%=listKindRoom.get(i).getName_vi()%>
                    </option>
                    <%
                            }
                        }%>

                </select>
            </div>
            <div class="content-img">
                <div class="array-img">
                    <div class="div-array-img">

                    </div>
                    <div class="btn-upload-img">
                        <span><i class="fas fa-plus"></i></span>
                    </div>
                </div>
                <div class="ui modal" id="myModal">


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


            <button type="submit" class="btn btn-primary" id="btn-img-room">Cập nhật</button>
            <div class="error" id="result-img-room"></div>
        </div>

        <!--Thêm dữ liệu dịch vụ -->
        <div class="ui bottom attached tab segment" data-tab="service_data" id="serviceModal">
            <div class="form-group">
                <label for="name_service_vi"> Thêm tên dịch vụ tiếng việt :</label>
                <input type="text" class="form-control" placeholder="Nhập tên dịch vụ tiếng việt"
                       id="name_service_vi"
                       name="name_service">
            </div>
            <div class="form-group">
                <label for="name_service_en"> Thêm tên dịch vụ tiếng anh :</label>
                <input type="text" class="form-control" placeholder="Nhập tên dịch vụ tiếng anh"
                       id="name_service_en"
                       name="name_service">
            </div>
            <div class="form-group">
                <label for="content_service_vi"> Thêm nội dung dịch vụ tiếng việt:</label>
                <textarea id="content_service_vi">

        </textarea>
            </div>
            <div class="form-group">
                <label for="content_service_en"> Thêm nội dung dịch vụ tiếng anh:</label>
                <textarea id="content_service_en">

        </textarea>
            </div>
            <div class="form-group">
                <label for="en_name"> Thêm image dịch vụ:</label>
                <div class="img-service-div" style="text-align:center">

                </div>
                <button class="btn btn-primary" id="insert-service">Insert</button>
            </div>
            <div class="ui modal" id="myModal_service">


                <!-- Modal Header -->
                <div class="header">
                    <h4 class="modal-title">Thêm ảnh</h4>
                    <button type="button" class="close  ui ok">&times;</button>
                </div>

                <!-- Modal body -->
                <div class="image content">

                    <input type="file" id="input-file-service" class="dropify"/>
                </div>

                <!-- Modal footer -->
                <div class="actions">
                    <button type="button" class="btn btn-primary" id="insert-img-service">Insert</button>
                    <button type="button" class="btn btn-primary ui ok ">Close</button>
                </div>


            </div>


        </div>

        <!--Thêm dữ liệu dịch vụ cho từng loại phòng-->
        <div class="ui bottom attached tab segment" data-tab="service_room">
            <!--service-->
            <div class="form-group">

                <label for="service"> Chọn dịch vụ:</label>
                <select id="service" multiple>
                    <%
                        if (listServiceTO != null && listServiceTO.size() > 0) {
                            for (int i = 0; i < listServiceTO.size(); i++) {


                    %>
                    <option value="<%=listServiceTO.get(i).getId_service()%>"><%=listServiceTO.get(i).getService_name_vi()%>
                    </option>
                    <%
                            }
                        }
                    %>
                </select>
            </div>
            <!--type price-->
            <div class="form-group">

                <label for="type_price"> Chọn của kiểu giá phòng nào:</label>
                <select id="type_price">
                    <%
                        if (listPriceRoom != null && listPriceRoom.size() > 0) {
                            for (int i = 0; i < listPriceRoom.size(); i++) {


                    %>
                    <option value="<%=listPriceRoom.get(i).getPrice_id()%>"><%=listPriceRoom.get(i).getType_price_room_vi()%>
                    </option>
                    <%
                            }
                        }
                    %>
                </select>
            </div>
            <button class="btn btn-primary" id="btn-service-room">Thêm</button>
        </div>
        <!---->

        <!--promotion-->
        <div class="ui bottom attached tab segment" data-tab="promotion">
            <div class="form-group">
                <label for="en_name"> Code giảm giá:</label>
                <input type="text" class="form-control" placeholder="Enter code promote" id="code_promote"
                       name="type_vi">
            </div>
            <div class="form-group">
                <label for="en_name"> Giá trị giảm giá:</label>
                <input type="text" class="form-control" placeholder="Enter value promote" id="value_promote"
                       name="type_vi">
            </div>
            <div class="form-group">
                <label for="en_name"> Ngày hết hạn:</label>
                <input type="text" class="form-control" placeholder="Enter expried_date" id="expried_date"
                       name="expried_date">
            </div>
            <button class="btn btn-primary" id="btn-promotion">Thêm</button>
        </div>
        <!---->

        <!--promote price-->
        <div class="ui bottom attached tab segment" data-tab="promote-price">
            <div class="form-group">
                <label for="en_name"> Code giảm giá:</label>
                <select id="promote_id">
                    <%
                        if (listPromote != null && listPromote.size() > 0) {
                            for (int i = 0; i < listPromote.size(); i++) {


                    %>
                    <option value="<%=listPromote.get(i).getPromte_id()%>"><%=listPromote.get(i).getPro_code()%>
                    </option>
                    <%
                            }
                        }
                    %>

                </select>
            </div>
            <div class="form-group">
                <label for="en_name"> Kiểu giá phòng:</label>
                <select id="price_id">
                    <%
                        if (listPriceRoom != null && listPriceRoom.size() > 0) {
                            for (int i = 0; i < listPriceRoom.size(); i++) {


                    %>
                    <option value="<%=listPriceRoom.get(i).getPrice_id()%>"><%=listPriceRoom.get(i).getType_price_room_vi()%>
                    </option>
                    <%
                            }
                        }
                    %>

                </select>
                <button class="btn btn-primary" id="btn-promote-price">Thêm</button>
            </div>
        </div>
    </div>
    <!---->
</div>
<jsp:include page="SideBar.jsp"></jsp:include>
<script>
    tinymce.init({
        selector: '#content_service_vi',
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
    tinymce.init({
        selector: '#content_service_en',
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
<script src="./scripts/Admin/InsertHotelManager.js"></script>


<script>
    $(document).ready(function () {

        $(".menu_insertData .item").tab();
    });
</script>
<%--<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>--%>
<script src="./scripts/dropify/dist/js/dropify.min.js"></script>
<script>
    $(document).ready(function () {
        $('#input-file-now').dropify();
        $('#input-file-service').dropify();
        $('#input-file-region').dropify();
    });

</script>
<script>
    $(document).ready(function () {

        var service = new SlimSelect({
            select: '#service'
        });
        var type_price = new SlimSelect({
            select: '#type_price'
        });

        var select_kind_room_id = new SlimSelect({
            select: '#select-kind-room-id'
        });
        var select_kind_room = new SlimSelect({
            select: '#select-kind-room'
        });
        var select_price_room_id_2 = new SlimSelect({
            select: '#select-price-room-id-2'
        });
        var select_region = new SlimSelect({
            select: '#select-region'
        });
        var kindroom = new SlimSelect({
            select: '#kindroom'
        });


        $(".img-service-div").click(function () {

            $("#myModal_service").modal('show');
        });
        $(".close").click(function () {
            $("#myModal_service").modal('hide');
            $("#myModal").modal('hide');
            $("#regionModal").modal('hide');
        });
        $(".btn-upload-img").click(function () {
            $("#myModal").modal('show');
        });
        $(".div-img-region-insert").click(function () {
            $("#regionModal").modal('show');
        });


    });
</script>
<script>
    $(function () {
        $("#expried_date").datepicker();
    });
</script>

</body>
</html>
