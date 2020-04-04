<%@ page import="DTO.*" %>
<%@ page import="Utils.TextCustomizeFormat" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 4/4/2020
  Time: 12:35 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    RoomTO roomTO = (RoomTO) request.getAttribute("roomTO");
    KindRoomTO kindRoomTO = (KindRoomTO) request.getAttribute("kindRoomTO");
    PriceRoomTO priceRoomTO = (PriceRoomTO) request.getAttribute("priceRoomTO");
    ArrayList<ServiceTO> listServiceTO = (ArrayList<ServiceTO>) request.getAttribute("listServiceTO");
    ArrayList<UploadResourceTO> listUploadResourceto = (ArrayList<UploadResourceTO>) request.getAttribute("listUploadResourceto");

%>
<html>
<head>
    <title>Chi tiết về phòng</title>
    <jsp:include page="../Library.jsp"></jsp:include>
    <link rel="stylesheet" href="./css/Employeee/detailRoom-css.css">
</head>
<body>
<jsp:include page="Header-employee.jsp"></jsp:include>
<!--thông tin phòng-->
<div class="main-detail-room col-md-12 row">
    <div class="col-md-6 img-details-room">
        <div id="imgRoom" class="carousel slide" data-ride="carousel">

            <!-- Indicators -->
            <ul class="carousel-indicators">
                <%
                    if (listUploadResourceto != null) {
                        for (int i = 0; i < listUploadResourceto.size(); i++) {

                            if (i == 0) {
                %>
                <li data-target="#imgRoom" data-slide-to="<%=i%>" class="active">
                    <img src="<%=listUploadResourceto.get(i).getFile_url().replace(StaticTO.STATIC_PATH,".\\")%>"
                         class="item-img">
                </li>
                <%
                } else {
                %>
                <li data-target="#imgRoom" data-slide-to="<%=i%>">
                    <img src="<%=listUploadResourceto.get(i).getFile_url().replace(StaticTO.STATIC_PATH,".\\")%>"
                         class="item-img">
                </li>
                <%
                            }
                        }
                    }
                %>

            </ul>

            <!-- The slideshow -->
            <div class="carousel-inner">
                <%
                    if (listUploadResourceto != null) {
                        for (int i = 0; i < listUploadResourceto.size(); i++) {

                            if (i == 0) {
                %>
                <div class="carousel-item active">
                    <img src="<%=listUploadResourceto.get(i).getFile_url().replace(StaticTO.STATIC_PATH,".\\")%>"
                         class="item-main-img">
                </div>
                <%
                } else {
                %>
                <div class="carousel-item">
                    <img src="<%=listUploadResourceto.get(i).getFile_url().replace(StaticTO.STATIC_PATH,".\\")%>"
                         class="item-main-img"/>
                </div>
                <%
                            }
                        }
                    }
                %>

            </div>

            <!-- Left and right controls -->
            <a class="carousel-control-prev" href="#imgRoom" data-slide="prev">
                <span class="carousel-control-prev-icon"></span>
            </a>
            <a class="carousel-control-next" href="#imgRoom" data-slide="next">
                <span class="carousel-control-next-icon"></span>
            </a>

        </div>
    </div>
    <div class="col-md-5 info-detail-room">
        <%if (roomTO != null) {%>
        <h2 class="h2-nameroom"><%=roomTO.getName()%>
            <%}%>
        </h2>
        <div class="detail">
            <%if (kindRoomTO != null && priceRoomTO != null) {%>
            <span class="item-span">Loại phòng:<%=kindRoomTO.getName_vi()%></span><br>
            <span class="item-span">Giá phòng(VNĐ):<%=TextCustomizeFormat.currency_format(priceRoomTO.getPrice_1_night())%></span><br>
            <span class="item-span">Giá phòng($):<%=TextCustomizeFormat.currency_format(priceRoomTO.getPrice_1_night())%></span><br>
            <%}%>
        </div>
        <h3>Các dịch vụ được hưởng:</h3>
        <div class="detail services-room">

            <%
                if (listServiceTO != null) {
                    for (int i = 0; i < listServiceTO.size(); i++) {


            %>
            <div class="item-service">

                <label><%=listServiceTO.get(i).getService_name_vi()%>
                </label>
                <div>
                    <img src="<%=listServiceTO.get(i).getFile_img_url().replace(StaticTO.STATIC_PATH,".\\")%>"
                         style="height: 40px;width: 40px;">
                </div>
            </div>
            <%
                    }
                }
            %>
        </div>
        <button class="btn" id="btn-pre-booking">
            Đặt phòng
        </button>

    </div>
</div>
<!--booking-->
<div class="booking-detail container" style="display: none;">
    <h2>Đặt phòng trực tiếp
        <span><i class="fas fa-caret-down"></i></span>
    </h2>
    <form action="BookingDirection" method="post">
        <%
            if (roomTO != null) {
        %>
        <input type="hidden" name="roomId" value="<%=roomTO.getRoom_id()%>">
        <%
            }
        %>
        <div class="form-group">
            <label for="firstname">Họ:</label>
            <input type="text" class="form-control" placeholder="Vui lòng nhập họ " id="firstname"
                   name="firstname" required="required" autocomplete="true">
        </div>
        <div class="form-group">
            <label for="lastname">Họ:</label>
            <input type="text" class="form-control" placeholder="Vui lòng nhập tên " id="lastname"
                   name="lastname" required="required" autocomplete="true">
        </div>
        <div class="form-group">
            <label for="CMND">Số CMND:</label>
            <input type="text" class="form-control" placeholder="Vui lòng nhập tên " id="CMND"
                   name="CMND" required="required" autocomplete="true">
        </div>
        <div class="form-group">
            <label for="phone">Số điện thoại:</label>
            <input type="text" class="form-control" placeholder="Vui lòng nhập số điện thoại " id="phone"
                   name="phone" required="required" autocomplete="true">
        </div>
        <div class="form-group">
            <label for="email">Email:</label>
            <input type="text" class="form-control" placeholder="Vui lòng nhập địa chỉ email " id="email"
                   name="email" required="required" autocomplete="true">
        </div>
        <div class="form-group">
            <label for="checkout">Ngảy trả phòng(check out):</label>
            <input type="text" class="form-control" id="checkout"
                   name="checkout" readonly>
        </div>
        <button type="submit" class="btn " id="btn-booking" style="background-color:  #7d3036;color: white">
            Đặt phòng
        </button>
    </form>
</div>
<!--thông tin cho booking-->
<jsp:include page="../Footer.jsp"></jsp:include>
<script>
    $(function () {
        $("#checkout").datepicker({
            dateFormat: 'dd/mm/yy'
        });
    });


</script>
<script>
    $(document).ready(function () {
        var d = new Date();

        var month = d.getMonth();
        var month_check_out = d.getMonth()+1 ;
        var day = d.getDate() + 1;


        var checkOut = (('' + day).length < 2 ? '0' : '') + day + '/' + (('' + month_check_out).length < 2 ? '0' : '') + month_check_out + '/' + d.getFullYear();
        $("#checkout").val(checkOut);


        $("#btn-pre-booking").click(function () {
            $(".booking-detail").toggle();
        });
    });

</script>
</body>
</html>
