<%@ page import="DTO.RegionTO" %>
<%@ page import="DTO.TransportTO" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 3/25/2020
  Time: 11:11 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    ArrayList<RegionTO> region = (ArrayList<RegionTO>) request.getAttribute("region");
    ArrayList<TransportTO> transport = (ArrayList<TransportTO>) request.getAttribute("transport");
%>
<html>
<head>
    <title>Thêm dữ liệu vận chuyển</title>
    <jsp:include page="../Library.jsp"></jsp:include>
</head>
<body>
<jsp:include page="HeaderAdmin.jsp"></jsp:include>
<div class="ui top attached tabular menu menu_insertDataTrans">
    <a class="item active" data-tab="transport">Thêm dữ liệu vận chuyển</a>
    <a class="item " data-tab="other">Thêm dữ liệu khác</a>
    <a class="item " data-tab="trans_region">Thêm dữ liệu vận chuyển cho từng khu vực</a>


</div>

<div class="ui bottom attached tab segment active" data-tab="transport">

    <div class="form-group">
        <label for="name_trans_vi">Tên vận chuyển tiếng việt</label>
        <input type="text" class="form-control" placeholder="Enter name vietnamese " id="name_trans_vi"
               name="name_trans_vi">
    </div>
    <div class="form-group">
        <label for="name_trans_en">Tên vận chuyển tiếng anh</label>
        <input type="text" class="form-control" placeholder="Enter name english " id="name_trans_en"
               name="name_trans_en">
    </div>
    <div class="form-group">
        <label for="detail_trans_vi">Nội dung chi tiết tiếng việt </label>
        <textarea id="detail_trans_vi"></textarea>

    </div>
    <div class="form-group">
        <label for="detail_trans_en">Nội dung chi tiết tiếng anh </label>
        <textarea id="detail_trans_en"></textarea>

    </div>
    <div class="form-group">
        <label for="price_trans">Giá:</label>
        <input type="text" class="form-control" placeholder="Enter price " id="price_trans" name="price_trans">
    </div>
    <button class="btn btn-primary" id="btn-trans">Thêm</button>
</div>

<!--other-->
<div class="ui bottom attached tab segment " data-tab="other">

    <div class="form-group">
        <label for="name_fee_other_vi">Tên phí tiếng việt</label>
        <input type="text" class="form-control" placeholder="Enter name vietnamese " id="name_fee_other_vi"
               name="name_fee_other_vi">
    </div>
    <div class="form-group">
        <label for="name_fee_other_en">Tên phí tiếng anh</label>
        <input type="text" class="form-control" placeholder="Enter name english " id="name_fee_other_en"
               name="name_fee_other_en">
    </div>
    <div class="form-group">
        <label for="price_trans">Giá:</label>
        <input type="text" class="form-control" placeholder="Enter name english " id="price-fee-other"
               name="price_trans">
    </div>
    <button class="btn btn-primary" id="btn-fee-other">Thêm</button>
</div>
<!---->

<!--dữ liệu vận chuyển cho từng khu vực-->
<div class="ui bottom attached tab segment " data-tab="trans_region">
    <div class="form-group">
        <label for="region-trans">Chọn khu vực </label>
        <select id="region-trans">
            <%
                if (region != null) {
                    for (int i = 0; i < region.size(); i++) {
            %>
            <option value="<%=region.get(i).getRegion_id()%>"><%=region.get(i).getName_vi()%>
            </option>
            <%
                    }
                }
            %>
        </select>
    </div>
    <div class="form-group">
        <label for="trans-select">Chọn vận chuyển</label>

        <select id="trans-select" multiple>
            <%
                if (transport != null) {
                    for (int i = 0; i < transport.size(); i++) {
            %>
            <option value="<%=transport.get(i).getTransport_id()%>"><%=transport.get(i).getName_vi()%>
            </option>
            <%
                    }
                }
            %>
        </select>
    </div>
    <button class="btn btn-primary" id="btn-trans-region">Cập nhật</button>
</div>
<!---->
<jsp:include page="SideBar.jsp"></jsp:include>
<script src="./scripts/Admin/Inserttransport.js"></script>
<script>
    $(document).ready(function () {
        $(".menu_insertDataTrans .item").tab();
    });
</script>

<script>
    $(document).ready(function () {
        var service = new SlimSelect({
            select: '#trans-select'
        });
        var type_price = new SlimSelect({
            select: '#region-trans'
        });

    });
</script>

</body>
</html>
