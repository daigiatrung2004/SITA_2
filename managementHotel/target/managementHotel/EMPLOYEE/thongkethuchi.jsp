<%@ page import="Utils.TextCustomizeFormat" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="javax.xml.soap.Text" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.Set" %>
<%@ page import="java.util.Date" %>
<%@ page import="DTO.*" %><%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 19/04/2020
  Time: 5:05 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String tongThuTatCaRegion = request.getAttribute("tongThuTatCaRegion") != null ? (String) request.getAttribute("tongThuTatCaRegion") : "";
    String quy = request.getParameter("quy") != null ? (String) request.getParameter("quy") : "0";
    String year = request.getParameter("year") != null ? (String) request.getParameter("year") : "0";
    long tongtatcaluong = 0, tongtatcachiservice = 0, tongtatcachidichvu = 0;
    int yearInt, quyInt;
    try {
        yearInt = Integer.parseInt(year);
    } catch (NumberFormatException e) {
        yearInt = 0;
    }
    try {
        quyInt = Integer.parseInt(quy);
    } catch (NumberFormatException e) {
        quyInt = 0;
    }
    ArrayList<BookingTO> listBookingAll = (ArrayList<BookingTO>) request.getAttribute("listBookingAll");
    ArrayList<RoomTO> listRoomTO = (ArrayList<RoomTO>) request.getAttribute("listRoomTO");
    ArrayList<RegionTO> listRegionTO = (ArrayList<RegionTO>) request.getAttribute("listRegionTO");
    ArrayList<RegionTO> listRegion = (ArrayList<RegionTO>) request.getAttribute("listRegion");
    long tongdoanhthuLong;
    try {
        tongdoanhthuLong = Long.parseLong(tongThuTatCaRegion);
    } catch (NumberFormatException e) {
        tongdoanhthuLong = 0;
    }
    Map<Integer, Long> listTongBooking = (Map<Integer, Long>) request.getAttribute("listTongBooking");// theo từng khu vực
    Date date = new Date();
    int yearCurrent = StaticTO.YEAR_STATIC + date.getYear();

    // danh muc chi
    ArrayList<Long> listTongLuong = (ArrayList<Long>) request.getAttribute("listTongLuong");
    ArrayList<EmployeeTO> listEmployeeNew = (ArrayList<EmployeeTO>) request.getAttribute("listEmployeeNew");
    ArrayList<Integer> listNumofMonth = (ArrayList<Integer>) request.getAttribute("listNumofMonth");
    String tongtienluongStr = request.getAttribute("tongtienluong") != null ? (String) request.getAttribute("tongtienluong") : "0";
    ArrayList<RegionTO> listRegionOrigin = (ArrayList<RegionTO>) request.getAttribute("listRegionOrigin");
    long tongtienluong;
    try {
        tongtienluong = Long.parseLong(tongtienluongStr);
    } catch (NumberFormatException e) {
        tongtienluong = 0;
    }

    Map<Integer, Long> listServiceMap = (Map<Integer, Long>) request.getAttribute("listServiceMap");
    Map<Integer, Long> listdichvuMap = (Map<Integer, Long>) request.getAttribute("listdichvuMap");

    // tính tong cac khoan chi
    long tongkhoanchi=0;
    String tongtienchidichvuStr=request.getAttribute("tongtatcachidichvu") != null ? (String) request.getAttribute("tongtatcachidichvu") : "0";
    String tongtatcachiserviceStr=request.getAttribute("tongtatcachiservice") != null ? (String) request.getAttribute("tongtatcachiservice") : "0";
    long tongdichvu,tongservice;
    try {
        tongdichvu=Long.parseLong(tongtienchidichvuStr);
    } catch (NumberFormatException e) {
        tongdichvu=0;
    }
    try {
        tongservice=Long.parseLong(tongtatcachiserviceStr);
    } catch (NumberFormatException e) {
        tongservice=0;
    }
    if(yearInt>0||quyInt>0){
        tongkhoanchi=tongdichvu+tongservice;
    }else{
        tongkhoanchi=tongdichvu+tongservice+tongtienluong;
    }

%>
<html>
<head>
    <title>Thống kê thu chi</title>
    <jsp:include page="../Library.jsp"></jsp:include>
    <link rel="stylesheet" href="./css/Employeee/statis-css.css">
    <style>
        .h5-item {
            color: red;
            margin: 20px;
        }
    </style>
</head>
<body>
<jsp:include page="/EMPLOYEE/Header-employee.jsp"></jsp:include>
<div class="menu-statis col-md-12">
    <ul class="col-md-12">
        <li><a class="item-menu-statis" href="StatisAnalyzt" style="color: #bdbbbb;">Thống kê lượt view</a></li>
        <li><a class="item-menu-statis  statis-active" href="ThongKeThuChi">Thống kê thu chi</a></li>
    </ul>
</div>
<div class="main-thongkethuchi container">
    <div class="search-tatca-thongkethuchi"
         style="margin-bottom: 14px;border-bottom: 3px solid #46a2e4;padding-bottom: 14px;">
        <form action="ThongKeThuChi" method="post">
            <h2>Tìm kiếm thông kê doanh thu,chi </h2>
            <div class="col-md-12" style="display: flex;align-items: center;justify-content: center;">
                <div class="col-md-4">
                    <select id="quy" name="quy">
                        <option value="0" <%if(quyInt==0){%>selected<%}%>>Tất cả</option>
                        <option value="1" <%if(quyInt==1){%>selected<%}%>>Quý 1</option>
                        <option value="2" <%if(quyInt==2){%>selected<%}%> >Quý 2</option>
                        <option value="3" <%if(quyInt==3){%>selected<%}%> >Quý 3</option>
                        <option value="4" <%if(quyInt==4){%>selected<%}%> >Quý 4</option>
                    </select>
                </div>
                <div class="col-md-4">
                    <select id="year" name="year">
                        <option value="0">Tất cả</option>
                        <%
                            for (int i = 1990; i < (yearCurrent + 10); i++) {

                                if (i == yearInt) {
                        %>
                        <option value="<%=i%>" selected><%=i%>
                        </option>
                        <%} else {%>
                        <option value="<%=i%>"><%=i%>
                        </option>
                        <%}%>
                        <%}%>
                    </select>
                </div>
                <div class="col-md-3">
                    <button class="btn btn-primary">Tìm kiếm</button>
                </div>

            </div>
        </form>
    </div>
    <div>
        <table class="short-tongdoanhthu" style="margin-bottom: 14px;margin-bottom: 30px;border:1px solid black;">
            <tr>
                <td>Tổng chi phí đầu tư:</td>
                <td><%=TextCustomizeFormat.currency_format(StaticTO.INVESTER)%> VNĐ</td>
            </tr>
            <tr>
                <td>Tổng doanh thu:</td>
                <td><%=TextCustomizeFormat.currency_format(tongdoanhthuLong)%> VNĐ</td>
            </tr>
            <tr>
                <td>Tổng các khoản chi:</td>
                <td><%=TextCustomizeFormat.currency_format(tongkhoanchi)%></td>
            </tr>
        </table>
    </div>
    <div>
        <div>
            <span class="span-static">Chi tiết Doanh thu</span>
        </div>
        <div style="padding-bottom: 14px;margin-bottom: 14px;max-height: 700px;overflow: auto;">
            <table class="table" style="height: 532px;overflow: auto;">
                <thead>
                <th>Booking ID</th>
                <th>Ngày nhận phòng</th>
                <th>Ngày trả phòng</th>
                <th>Khu vực khách sạn</th>
                <th>Phòng</th>
                <th>Tổng tiền phòng(VNĐ)</th>
                <th>Tổng tiền dịch vụ(VNĐ)</th>
                <th>Tổng tiền đền bù hư hại(VNĐ)</th>
                <th>Tổng tiền(VNĐ)</th>
                </thead>
                <tbody>
                <%
                    if (listBookingAll != null && listRegionTO != null && listRoomTO != null) {
                        for (int i = 0; i < listBookingAll.size(); i++) {
                            long tongtienbooking = 0;
                            tongtienbooking = listBookingAll.get(i).getTongtiendichvu() + listBookingAll.get(i).getTongtienservice() + listBookingAll.get(i).getTienphong();

                %>
                <tr>
                    <td><%=listBookingAll.get(i).getBooking_id()%>
                    </td>
                    <td><%=listBookingAll.get(i).getCheck_in_date()%>
                    </td>
                    <td><%=listBookingAll.get(i).getCheck_out_date()%>
                    </td>
                    <td><%=listRegionTO.get(i).getName_vi()%>
                    </td>
                    <td><%=listRoomTO.get(i).getName()%>
                    </td>
                    <td><%=TextCustomizeFormat.currency_format(listBookingAll.get(i).getTienphong())%>
                    </td>
                    <td><%=TextCustomizeFormat.currency_format(listBookingAll.get(i).getTongtiendichvu())%>
                    </td>
                    <td><%=TextCustomizeFormat.currency_format(listBookingAll.get(i).getTongtienservice())%>
                    </td>
                    <td><%=TextCustomizeFormat.currency_format(tongtienbooking)%>
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
    <!--biểu đồ doanh thu-->
    <div>
        <span class="span-static">Biểu đồ doanh thu theo từng khu vực</span>
        <div class="statis--detail">
            <canvas id="myChart" width="300" height="100"></canvas>
        </div>
    </div>

    <div class="main-thongkechi" style="margin-top: 14px;border-top:3px solid #46a2e4;padding-top: 14px;">

        <span class="span-static">Chi tiết về các khoản chi</span>
        <div>
            <%
                if(quyInt<=0&&yearInt<=0){
            %>
            <h5 class="h5-item">*Các khoản chi về lương </h5>
            <table class="table">
                <thead>
                <th>Tên nhân viên</th>
                <th>Tiền lượng mỗi tháng</th>
                <th>Số tháng làm</th>
                <th>Tổng tiền chi</th>
                </thead>
                <tbody>
                <%
                    if (listEmployeeNew != null && listNumofMonth != null && listTongLuong != null) {
                        for (int i = 0; i < listEmployeeNew.size(); i++) {
                            tongtatcaluong += listTongLuong.get(i);

                %>
                <tr>
                    <td><%=listEmployeeNew.get(i).getFirstName() + " " + listEmployeeNew.get(i).getLastName()%>
                    </td>
                    <td><%=TextCustomizeFormat.currency_format(listEmployeeNew.get(i).getSalary())%>
                    </td>
                    <td><%=listNumofMonth.get(i)%>
                    </td>
                    <td><%=TextCustomizeFormat.currency_format(listTongLuong.get(i))%>
                    </td>
                </tr>
                <%
                        }
                    }
                %>
                </tbody>
            </table>
            <%}%>
        </div>
        <div>
            <h5 class="h5-item">*Các khoản chi các thiết bị hư hại</h5>
            <table class="table">
                <thead>
                <th>Khu vực</th>
                <th>Tổng tiền chi các thiết bị hư hại</th>
                </thead>
                <tbody>
                <%
                    if (listRegionOrigin != null) {
                        for (int i = 0; i < listRegionOrigin.size(); i++) {
                            tongtatcachiservice += listServiceMap.get(listRegionOrigin.get(i).getRegion_id()).longValue();

                %>
                <tr>
                    <td><%=listRegionOrigin.get(i).getName_vi()%>
                    </td>
                    <td><%=TextCustomizeFormat.currency_format(listServiceMap.get(listRegionOrigin.get(i).getRegion_id()).longValue())
                    %>
                    </td>

                </tr>
                <%
                        }
                    }
                %>
                </tbody>
            </table>
        </div>
        <div>
            <h5 class="h5-item">*Các khoản chi về nguyên vật liệu</h5>
            <table class="table">
                <thead>
                <th>Khu vực</th>
                <th>Tổng tiền chi Nguyên vật liệu</th>
                </thead>
                <tbody>
                <%
                    if (listRegionOrigin != null) {
                        for (int i = 0; i < listRegionOrigin.size(); i++) {
                            tongtatcachidichvu += listdichvuMap.get(listRegionOrigin.get(i).getRegion_id()).longValue();

                %>
                <tr>
                    <td><%=listRegionOrigin.get(i).getName_vi()%>
                    </td>
                    <td><%=TextCustomizeFormat.currency_format(listdichvuMap.get(listRegionOrigin.get(i).getRegion_id()).longValue())
                    %>
                    </td>

                </tr>
                <%
                        }
                    }
                %>
                </tbody>
            </table>
        </div>
        <!--biểu đồ các khoản chi-->
        <div>
            <span class="span-static">Biểu đồ các khoản chi</span>
            <div class="statis--detail-chi">
                <canvas id="chartChi" width="300" height="100"></canvas>
            </div>
        </div>
    </div>
</div>
<script>
    function random_rgba() {
        var o = Math.round, r = Math.random, s = 255;
        return 'rgba(' + o(r() * s) + ',' + o(r() * s) + ',' + o(r() * s) + ',1)';
    }

    // biểu đồ cho doanh thu
    var backgroundCl = new Array();
    var data = new Array();
    var labelArray = new Array();
    <%
    int i=0;
    Set<Integer> set = listTongBooking.keySet();
        for (Integer key : set) {

            %>
    backgroundCl[<%=i%>] = random_rgba();
    data[<%=i%>] =<%=listTongBooking.get(key)%>;
    labelArray[<%=i%>] = '<%=listRegion.get(i).getName_vi()%>';
    <%
    i++;
        }
    %>
    // alert(labelArray);

    var ctx = document.getElementById('myChart');
    var myChart = new Chart(ctx, {
        type: 'pie',
        data: {
            labels: labelArray,
            datasets: [{
                backgroundColor: backgroundCl,
                data: data
            }]
        },
        options: {
            scales: {
                yAxes: [{
                    ticks: {
                        beginAtZero: true
                    }
                }]
            }
        }
    });
    //

    // biểu đồ cho các khoản chi
    var i = 0;
    var labelArrayChi = Array();
    var datachi = Array();
    var backgroundChi = Array();
    <%
    if(yearInt<=0&&quyInt<=0){
    %>
    labelArrayChi[i] = "Lương nhân viên";
    datachi[i] =<%=tongtatcaluong%>;
    backgroundChi[i] = backgroundCl[<%=i%>] = random_rgba();
    i++;
    <%}%>
    labelArrayChi[i] = "Thiết bị hư hỏng";
    datachi[i] =<%=tongservice%>;

    backgroundChi[i] = backgroundCl[<%=i%>] = random_rgba();
    i++;
    labelArrayChi[i] = "Nguyên vật liệu";
    datachi[i] = <%=tongdichvu%>;
    backgroundChi[i] = random_rgba();
    var ctx1 = document.getElementById('chartChi');
    var myChart1 = new Chart(ctx1, {
        type: 'pie',
        data: {
            labels: labelArrayChi,
            datasets: [{
                backgroundColor: backgroundChi,
                data: datachi
            }]
        },
        options: {
            scales: {
                yAxes: [{
                    ticks: {
                        beginAtZero: true
                    }
                }]
            }
        }
    });


    //
    var quy = new SlimSelect({
        select: '#quy'
    });
    var year = new SlimSelect({
        select: '#year'
    });

</script>
<jsp:include page="../Footer.jsp"></jsp:include>
</body>
</html>
