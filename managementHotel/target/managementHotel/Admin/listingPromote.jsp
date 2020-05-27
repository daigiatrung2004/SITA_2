<%@ page import="DTO.PromoteTO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="DTO.PriceRoomTO" %>
<%@ page import="java.util.Map" %><%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 4/4/2020
  Time: 11:20 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    ArrayList<PriceRoomTO> listPriceRoom = (ArrayList<PriceRoomTO>) request.getAttribute("listPriceRoom");
    ArrayList<PromoteTO> listPromote = (ArrayList<PromoteTO>) request.getAttribute("listPromote");
    ArrayList<Map<PriceRoomTO, PromoteTO>> listCodePrice = (ArrayList<Map<PriceRoomTO, PromoteTO>>) request.getAttribute("listCodePrice");
%>
<html>
<head>
    <title>Danh sách các mã giảm giá</title>
    <jsp:include page="../Library.jsp"></jsp:include>
</head>
<body>
<jsp:include page="HeaderAdmin.jsp"></jsp:include>
<div class="ui top attached tabular menu menu_insertPromote">
    <a class="item active" data-tab="promotion">Tạo mã giảm giá</a>
    <a class="item" data-tab="promote-price">Cập nhật mã giảm cho từng kiểu giá</a>
    <a class="item" data-tab="listpromote">Danh sách các mã giảm giá</a>
    <a class="item" data-tab="listpromotePrice">Danh sách các mã giảm giá cho từng kiểu giá</a>

</div>
<!--promotion-->
<div class="ui bottom attached tab segment active" data-tab="promotion">
    <div class="form-group">
        <label for="code_promote"> Code giảm giá:</label>
        <input type="text" class="form-control" placeholder="Enter code promote" id="code_promote" name="type_vi">
    </div>
    <div class="form-group">
        <label for="value_promote"> Giá trị giảm giá:</label>
        <input type="text" class="form-control" placeholder="Enter value promote" id="value_promote" name="type_vi">
    </div>
    <div class="form-group">
        <label for="expried_date"> Ngày hết hạn:</label>
        <input type="text" class="form-control" placeholder="Enter expried_date" id="expried_date"
               name="expried_date">
    </div>
    <button class="btn btn-primary" id="btn-promotion">Thêm</button>
</div>

<!---->

<!--promote price-->
<div class="ui bottom attached tab segment" data-tab="promote-price">
    <div class="form-group">
        <label for="promote_id"> Code giảm giá:</label>
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
        <label for="price_id"> Kiểu giá phòng:</label>
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
<!--Danh sach cac mã giảm giá-->
<div class="ui bottom attached tab segment" data-tab="listpromote">
    <h2 style="text-align: center;margin-bottom: 14px;">DANH SÁCH CÁC MÃ GIẢM GIÁ</h2>
    <table class="table">
        <thead>
        <th>Mã khuyến mãi</th>
        <th>Giá trị mã khuyến mãi</th>
        <th>Ngày hết hạn</th>
        <th>Hành động</th>
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
            <td>
                <%=listPromote.get(i).getExpired_date()%>
            </td>
            <td>
                <a href="ListingPromote?type=edit-code&promoteid=<%=listPromote.get(i).getPromte_id()%>"><button class="btn btn-primary">Chỉnh sửa</button></a>
            </td>
        </tr>
        <%
                }
            }
        %>
        </tbody>
    </table>
</div>
<!---->

<!--danh sách cho từng kiểu giá -->
<div class="ui bottom attached tab segment" data-tab="listpromotePrice">
    <h2 style="text-align: center;margin-bottom: 14px;">DANH SÁCH CÁC MÃ GIẢM GIÁ THEO TỪNG KIỂU GIÁ</h2>
    <table class="table">
        <thead>
        <th>Kiểu giá phòng</th>
        <th>Mã giảm giá</th>
        <th>Giá trị mã giảm giá</th>
        <th>Hành động</th>
        </thead>
        <tbody>
        <%
            if (listCodePrice != null && listCodePrice.size() > 0) {
                for (int i = 0; i <listCodePrice.size() ; i++) {
                    Map<PriceRoomTO,PromoteTO> map=listCodePrice.get(i);
                    for(Map.Entry m:map.entrySet()){
                   PriceRoomTO priceRoomTO=(PriceRoomTO) m.getKey();
                   PromoteTO promoteTO=(PromoteTO)m.getValue();
                    if(priceRoomTO!=null&&promoteTO!=null){
        %>
         <tr>
             <td><%=priceRoomTO.getType_price_room_vi()%></td>
             <td><%=promoteTO.getPro_code()%></td>
             <td><%=promoteTO.getPro_value()%></td>
             <td><a href="ListingPromote?type=edit&priceId=<%=priceRoomTO.getPrice_id()%>&promoteId=<%=promoteTO.getPromte_id()%>"><button class="btn btn-primary edit" >Chỉnh sửa</button></a></td>
         </tr>
        <%
                        }
                    }
                }
            }
        %>
        </tbody>
    </table>
</div>

<!---->
<jsp:include page="SideBar.jsp"></jsp:include>
<!---->
<script src="./scripts/Admin/InsertHotelManager.js"></script>


<script>
    $(document).ready(function () {

        $(".menu_insertPromote .item").tab();
    });
    var promote_id = new SlimSelect({
        select: '#promote_id'
    });
    var price_id = new SlimSelect({
        select: '#price_id'
    });
</script>
<%--<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>--%>
<script src="./scripts/dropify/dist/js/dropify.min.js"></script>
<script>
    $(document).ready(function () {
        $('#input-file-now').dropify();
        $('#input-file-service').dropify();
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

    });
</script>
<script>
    $(function () {
        $("#expried_date").datepicker();
    });
</script>

</body>
</html>
