<%@ page import="Utils.TextCustomizeFormat" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="DTO.*" %>
<%@ page import="javax.xml.soap.Text" %><%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 15/04/2020
  Time: 4:56 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    RoomTO roomTO = (RoomTO) request.getAttribute("roomTO");
    BookingTO bookingTO = (BookingTO) request.getAttribute("bookingTO");
    long tong = 0;
    long tongsangpham = 0;
    long tongthue = 0;
    ArrayList<TransportTO> listTax = (ArrayList<TransportTO>) request.getAttribute("listTax");
    ArrayList<ProductTO> listProduct = (ArrayList<ProductTO>) request.getAttribute("listProduct");
    CustomerTO customer = (CustomerTO) request.getAttribute("customer");
    PriceRoomTO priceRoomTO = (PriceRoomTO) request.getAttribute("priceRoomTO");
    String success=request.getAttribute("checkOutSuccess")!=null?(String)request.getAttribute("checkOutSuccess"):"false";


%>
<html>
<head>
    <title>Trả phòng</title>
    <jsp:include page="../Library.jsp"></jsp:include>
    <link rel="stylesheet" href="./css/Employeee/index.css">
    <link rel="stylesheet" href="./css/Employeee/checkOut-css.css">
</head>
<body>
<jsp:include page="/EMPLOYEE/Header-employee.jsp"></jsp:include>


<div class="div-check-out-main col-md-12">
    <input type="hidden" id="roomId" value="<%=roomTO.getRoom_id()%>" name="roomId">
    <input type="hidden" id="bookingId" value="<%=bookingTO.getBooking_id()%>" name="bookingId">
    <h2 class="h2-check-out" style="text-align: center">Hóa đơn phòng</h2>
    <div class="body-check-out col-md-12">
        <div class="col-md-5 invoice">
            <div style="display: flex;padding: 10px;">
                <div class="col-md-6">
                    <h4>Hóa đơn phòng <%=roomTO.getName()%>
                    </h4>
                </div>
                <div class="col-md-6" style="display: flex;justify-content: flex-end">
                    <div class="container">
                        <div class="spinner-border"></div>
                    </div>
                    <button class="btn btn-primary" id="saveCheckOut">Lưu Hóa đơn</button>
                </div>
            </div>
            <div class="div-invoice-table">
                <table class="table table-invoice" style="background-color:white;">
                    <thead>

                    <th>Sản phẩm</th>
                    <th>Giá</th>
                    <th>SL</th>
                    <th>Tổng</th>
                    <th>Hành động</th>
                    </thead>
                    <tbody>
                    <%
                        if (listProduct != null && listProduct.size() > 0) {
                            for (int i = 0; i < listProduct.size(); i++) {
                                long pay = listProduct.get(i).getPay();
                                tong += pay;
                                tongsangpham += pay;


                    %>
                    <tr class='item-<%=listProduct.get(i).getID()%>' name='<%=listProduct.get(i).getID()%>'>
                        <td><%=listProduct.get(i).getNAME()%>
                        </td>
                        <td><%=TextCustomizeFormat.currency_format(listProduct.get(i).getPRICE())%>
                        </td>
                        <td>
                            <div style='display: flex'>
                                <div class='item-action '>
                                    <button class='sub' name='SL-<%=listProduct.get(i).getID()%>'
                                            data-price='<%=listProduct.get(i).getPRICE()%>' disabled='true'>-
                                    </button>
                                </div>
                                <div class=''><input type='number' value='<%=listProduct.get(i).getAmount()%>' readonly
                                                     class='SL' id='SL-<%=listProduct.get(i).getID()%>'
                                                     name='SL-<%=listProduct.get(i).getID()%>' style='margin:0px 10px;'
                                                     min='1'></div>
                                <div class='item-action '>
                                    <button class='plus' name='SL-<%=listProduct.get(i).getID()%>'
                                            data-price='<%=listProduct.get(i).getPRICE()%>'>+
                                    </button>
                                </div>
                            </div>
                        </td>
                        <td><span class='price-product' data-price='<%=listProduct.get(i).getPRICE()%>'
                                  id='product-SL-<%=listProduct.get(i).getID()%>'><%=TextCustomizeFormat.currency_format(listProduct.get(i).getPay())%></span>
                        </td>
                        <td style='display: flex;justify-content: center'><span class='close item-close'
                                                                                name='item-<%=listProduct.get(i).getID()%>'
                                                                                data-price='<%=listProduct.get(i).getPRICE()%>'><i
                                class="fas fa-times-circle"></i></span></td>
                    </tr>
                    <%
                            }
                        }
                    %>
                    </tbody>
                </table>
                <script>
                    $('.table-invoice tbody tr td').on('click', '.close', function () {
                        alert("xin chao");
                        $(this).remove();
                    });
                </script>
            </div>
            <div class="sum-invoice">
                <table>
                    <tbody>
                    <tr>
                        <td>Tổng sản phẩm sử dụng:</td>
                        <td><span class="sumProduct"
                                  data-product="0"><%=TextCustomizeFormat.currency_format(tongsangpham)%></span><span
                                style="text-decoration: underline"> đ</span></td>
                    </tr>
                    <tr>
                        <td>Tổng tiền phòng:</td>
                        <td>
                            <span>
                                 <%
                                     if (priceRoomTO != null) {
                                         tong += priceRoomTO.getPrice_1_night();
                                 %>
                            <%=TextCustomizeFormat.currency_format(priceRoomTO.getPrice_1_night())%>
                            <%
                                }
                            %>
                            </span>
                            <span style="text-decoration: underline">
                                   đ
                            </span>

                        </td>
                    </tr>
                    <tr>
                        <td>Thuế:</td>
                        <td>
                            <%
                                if (listTax != null) {
                                    for (int i = 0; i < listTax.size(); i++) {
                                        tong += listTax.get(i).getPrice();
                                        tongthue += listTax.get(i).getPrice();

                            %>
                            <span><%=listTax.get(i).getName_vi()%>:<%=TextCustomizeFormat.currency_format(listTax.get(i).getPrice())%></span></br>
                            <%
                                    }
                                }
                            %>
                        </td>
                    </tr>
                    <tr>
                        <td>Tổng:</td>
                        <td><span class="tong"
                                  data-price="<%=tong%>"><%=TextCustomizeFormat.currency_format(tong)%></span><span
                                style="text-decoration: underline">  đ</span></td>
                    </tr>
                    </tbody>
                </table>
                <div style="margin-top: 10px;display: flex;justify-content: flex-end">

                    <button class="btn btn-primary itembtn" id="cancelBooking">Hủy phòng</button>

                    <button class="btn btn-primary itembtn" id="traphongbtn">Trả phòng</button>
                </div>
            </div>
        </div>
        <div class="col-md-6 addItem">
            <div class="ui top attached tabular menu menuAdd">
                <a class="active item" data-tab="food">Thực phẩm</a>
                <a class="item" data-tab="serviceError">Thiết bị hư hoặc mất mát</a>

            </div>
            <div class="ui bottom attached active tab segment food" data-tab="food"
                 style="height: inherit;padding-bottom: 0;">
                <div class="form-group">

                    <input type="text" class="form-control" placeholder="Tìm kiếm" id="searchFood">
                </div>

                <div class="content-food">

                </div>
                <div class="ui dimmer" id="spinerfood">
                    <div class="ui massive text loader">
                        <h3>Loading</h3>
                    </div>
                </div>

            </div>
            <div class="ui bottom attached tab segment" data-tab="serviceError"
                 style="height: inherit;padding-bottom: 0;">
                <div class="form-group">

                    <input type="text" class="form-control" placeholder="Tìm kiếm" id="searchService">
                </div>

                <div class="content-service">

                </div>
                <div class="ui dimmer" id="spiner">
                    <div class="ui massive text loader">
                        <h3>Loading</h3>
                    </div>
                </div>

            </div>

        </div>

    </div>
    <!---->
    <div class="ui modal small" id="invoiceModal">
        <div class="header">Hóa đơn thanh toán</div>
        <div class="content">
            <table>
                <tbody>
                <%
                    if (customer != null) {
                %>
                <tr>
                    <td>Họ và tên khách đặt phòng:</td>
                    <td><%=customer.getLastname()%>+" "+"<%=customer.getFirstname()%>
                    </td>
                </tr>
                <tr>
                    <td>Số điện thoại:</td>
                    <td><%=customer.getContact_person()%>
                    </td>
                </tr>
                <tr>
                    <td>Địa chỉ email:</td>
                    <td><%=customer.getEmail()%>
                    </td>
                </tr>
                <tr>
                    <td>CMND:</td>
                    <td><%=customer.getVerify_person()%></td>
                </tr>
                <tr>
                    <td>Tổng tiền sử dụng dịch vụ :</td>
                    <td><%=TextCustomizeFormat.currency_format(tongsangpham)%>
                    </td>
                </tr>
                <tr>
                    <td>Thuế:</td>
                    <td><%=TextCustomizeFormat.currency_format(tongthue)%>
                    </td>
                </tr>
                <tr>
                    <td>Tổng tiền phòng:</td>
                    <td>
                        <%
                            if (priceRoomTO != null) {
                        %>
                        <%=TextCustomizeFormat.currency_format(priceRoomTO.getPrice_1_night())%>
                        <%
                            }
                        %>
                    </td>
                </tr>

                <%
                    }
                %>
                </tbody>
            </table>
            <span id="viewDetail">Chi tiết</span>
            <div>
                <h5>Tổng:   <%=TextCustomizeFormat.currency_format(tong)%> đ</h5>
            </div>
        </div>
        <div class="actions" style="display: flex;">
            <form action="CheckOut" id="frm-checkout" method="post">
                <%if(bookingTO!=null&&roomTO!=null&&customer!=null){%>
                <input type="hidden" name="bookingId" value="<%=bookingTO.getBooking_id()%>">
                <input type="hidden" name="customerId" value="<%=customer.getCustomer_id()%>">
                <input type="hidden" name="roomId" value="<%=roomTO.getRoom_id()%>">
                <input type="hidden" name="tongtiensanpham" value="<%=tongsangpham%>">
                <input type="hidden" name="tongtienthue" value="<%=tongthue%>">
                <input type="hidden" name="tong" value="<%=tong%>">
                <input type="hidden" name="type" value="checkOut">


                <%}%>
            </form>
            <button type="submit" class="ui button" id="checkOutNow">Trả phòng ngay</button>
            <button class="ui button" id="inHoaDon red">Xuất hóa đơn và trả phòng</button>
            <button class="ui cancel button" id="cancel">Hủy</button>
        </div>
    </div>
     <!--announce check out-->
    <div class="ui modal small" id="announceSuccess">
        <div class="header">Trả phòng </div>
        <div class="content">
            Thực hiện trả phòng thành công
        </div>
        <div class="actions">
            <a href="ListingRoom" class="ui approve button">OK</a>
        </div>
    </div>

    <jsp:include page="../Footer.jsp"></jsp:include>
    <script>
       $("#traphongbtn").click(function(){
           // alert("xin chao");
           $('#invoiceModal').modal('show');
       });
       <%if(success.equals("true")){%>
       $('#announceSuccess').modal('show');
       <%
       }
       %>
        $("#checkOutNow").click(function(){
             $("#frm-checkout").submit();
        });

    </script>
    <script>
        $('.menuAdd .item').tab();
        $('#spinerfood').dimmer('hide');
        $('#spiner').dimmer('hide');
    </script>
    <script src="./scripts/Employee/checkOut-js.js"></script>
</body>
</html>
