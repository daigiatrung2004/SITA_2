<%@ page import="DTO.*" %>
<%@ page import="Utils.TextCustomizeFormat" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 3/15/2020
  Time: 12:53 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String total = request.getAttribute("total") != null ? (String) request.getAttribute("total") : "";
    String countPaymentStr = request.getAttribute("countPayment") != null ? (String) request.getAttribute("countPayment") : "0";
    String countBookingStr = request.getAttribute("countBooking") != null ? (String) request.getAttribute("countBooking") : "0";
    String price = request.getAttribute("price") != null ? (String) request.getAttribute("price") : "";
    String checkin = request.getAttribute("checkin") != null ? (String) request.getAttribute("checkin") : "";
    String checkout = request.getAttribute("checkout") != null ? (String) request.getAttribute("checkout") : "";
    String numberOfPeo = request.getAttribute("numberOfPeo") != null ? (String) request.getAttribute("numberOfPeo") : "";
    String arraySelectAddition = request.getParameter("arraySelectAddition") != null ? (String) request.getParameter("arraySelectAddition") : "";
    ArrayList<ServiceTO> listServiceTO = (ArrayList<ServiceTO>) request.getAttribute("listServiceTO");
    ArrayList<TransportTO> listFeesOther = (ArrayList<TransportTO>) request.getAttribute("listFeesOther");
    String price_id = request.getParameter("price_id") != null ? (String) request.getParameter("price_id") : "0";
    String price_type = request.getParameter("price_type") != null ? (String) request.getParameter("price_type") : "OFFLINE";
    int countPayment,countBooking;
    try {
        countPayment = Integer.parseInt(countPaymentStr);
    } catch (NumberFormatException e) {
        countPayment=0;
    }
    try {
        countBooking=Integer.parseInt(countPaymentStr);
    } catch (NumberFormatException e) {
        countBooking=0;
    }
    KindRoomTO kindRoomTO = (KindRoomTO) request.getAttribute("kindRoomTO");
    PriceRoomTO priceRoomTO = (PriceRoomTO) request.getAttribute("priceRoomTO");
    RoomTO roomTO = (RoomTO) request.getAttribute("roomTO");
    RegionTO regionTO = (RegionTO) request.getAttribute("regionTO");

%>
<div class="col-md-12" style="padding-bottom: 15px!important;">
    <div class="processing-payment col-md-12" style="padding-top: 20px!important;">
        <!--cac buoc trong thanh toan (processing)-->
        <div class="processing-display-flex" style="margin-left: 200px;">
            <!--label cho tung muc-->
            <div class="label-item-payment">Chọn phòng</div>
            <div class="label-item-payment">Chọn lựa bổ sung</div>
            <div class="label-item-payment">Đặt phòng</div>

        </div>
        <div class="processing-display-flex">
            <div class="circle active">1</div>
            <div class="straight  active "></div>
            <div class="circle active ">2</div>
            <div class="straight active"></div>
            <div class="circle active">3</div>
        </div>
    </div>
    <div class="col-md-12 payment-end-point">
        <div class="info-end-point">
            <h2>Hoàn tất dịp lưu trú của quý khách</h2>
            <b>Quý khách sẽ được đặt phòng ở mức giá tốt nhất</b>do không phải qua đơn vị trung gian: Quý khách đang ghé
            thăm trang web của khách sạn.
        </div>

        <!--detail info -->

        <div class="col-xs-12 container">
            <div class="col-xs-12 fb-container fb-block-header fb-dark-bg">
                <div class="col-xs-10 col-sm-12 fb-dark-bg fb-results-acc-title" style="padding:20px;">
                    <span class="fb-translate" data-key="validate-summary-header" data-mode="-1" data-fallback=""
                          data-disablehtmlclean="false" data-nodefaultlanguagefallback="false" data-placeholders="[]">Đặt phòng của quý khách</span>
                    -
                    <span class="fb-translate" data-key="date-from-to" data-mode="-1" data-fallback=""
                          data-disablehtmlclean="false" data-nodefaultlanguagefallback="false"
                          data-placeholders="[&quot;
				<span class=\&quot;fb-date\&quot; data-date=\&quot;2020-03-15\&quot; data-format=\&quot;full\&quot;>15 Tháng Ba 2020</span>&quot;,&quot;
				<span class=\&quot;fb-date\&quot; data-date=\&quot;2020-03-16\&quot; data-format=\&quot;full\&quot;>16 Tháng Ba 2020</span>&quot;]">từ
				<span class="fb-date" data-date="<%=checkin%>" data-format="full"><%=checkin%></span> đến
				<span class="fb-date" data-date="<%=checkout%>" data-format="full"><%=checkout%></span>
			</span>
                </div>
                <div class="col-xs-2 hidden-sm hidden-md hidden-lg fb-dark-bg fb-results-acc-title">
                    <a class="theme-link" href="#">
                        <img src="./img/zoom/icon-triangle-wh-up.png" border="0" width="15" height="15">
                    </a>
                </div>
            </div>
            <div id="fb-recap-hotel" class="col-xs-12 fb-gray-bg">
                <div class="fb-title">
                    <span class="fb-translate" data-key="vnpha30475:hoteltitle" data-mode="-1"
                          data-fallback="Victoria Phan Thiet Beach Resort &amp; Spa" data-disablehtmlclean="false"
                          data-nodefaultlanguagefallback="false"
                          data-placeholders="[]"><%=regionTO.getName_vi()%></span>
                </div>
                <div id="fb-recap-hotel-details">
                    <dl class="col-xs-12 dl-horizontal">
                        <dt class="fb-dark-gray">
                            <span class="fb-translate" data-key="property-address" data-mode="-1" data-fallback=""
                                  data-disablehtmlclean="false" data-nodefaultlanguagefallback="false"
                                  data-placeholders="[]">Địa chỉ</span>
                        </dt>
                        <dd>
                           <span><%=regionTO.getAddress()%></span>
                        </dd>
                        <dt class="fb-dark-gray">
                            <span class="fb-translate" data-key="property-reception-hours" data-mode="-1"
                                  data-fallback="" data-disablehtmlclean="false" data-nodefaultlanguagefallback="false"
                                  data-placeholders="[]">Lễ tân đang làm việc</span>
                        </dt>
                        <dd>
                            <span class="fb-translate" data-key="property-reception-24" data-mode="-1" data-fallback=""
                                  data-disablehtmlclean="false" data-nodefaultlanguagefallback="false"
                                  data-placeholders="[]">24/7</span>
                        </dd>
                        <dt class="fb-dark-gray">
                            <span class="fb-translate" data-key="property-checking-time" data-mode="-1" data-fallback=""
                                  data-disablehtmlclean="false" data-nodefaultlanguagefallback="false"
                                  data-placeholders="[]">Nhận phòng từ</span>
                        </dt>
                        <dd>
                            <div>14:00</div>
                        </dd>
                        <dt class="fb-dark-gray">
                            <span class="fb-translate" data-key="property-checkout-time" data-mode="-1" data-fallback=""
                                  data-disablehtmlclean="false" data-nodefaultlanguagefallback="false"
                                  data-placeholders="[]">Trả phòng trước</span>
                        </dt>
                        <dd>
                            <div>12:00</div>
                        </dd>
                        <dt class="fb-dark-gray">
                            <span class="fb-translate" data-key="property-languages" data-mode="-1" data-fallback=""
                                  data-disablehtmlclean="false" data-nodefaultlanguagefallback="false"
                                  data-placeholders="[]">Ngôn ngữ</span>
                        </dt>
                        <dd>Tiếng Anh, Tiếng Việt</dd>
                        <dt class="fb-dark-gray">
                            <span class="fb-translate" data-key="property-contact" data-mode="-1" data-fallback=""
                                  data-disablehtmlclean="false" data-nodefaultlanguagefallback="false"
                                  data-placeholders="[]">Liên hệ</span>
                        </dt>
                        <dd><%=regionTO.getContact_phone()%></dd>
                        <dt class="fb-dark-gray">
                            <span class="fb-translate" data-key="property-url" data-mode="-1" data-fallback=""
                                  data-disablehtmlclean="false" data-nodefaultlanguagefallback="false"
                                  data-placeholders="[]">Trang web</span>
                        </dt>
                        <dd>
                            <a href="https://www.victoriahotels.asia/en/hotels-resorts/phanthiet.html"
                               class="theme-link dont-break-out" target="_blank">https://www.victoriahotels.asia/en/hotels-resorts/phanthiet.html</a>
                        </dd>
                    </dl>
                </div>
            </div>
        </div>


        <!--today offer-->
        <div id="fb-recap-container" class="container">
            <div id="fb-recap-sub-container" class="container fb-container fb-light-bg" style="padding: 0px;">
                <%if(price_type.equals("OFFLINE")){%>
                <div class="col-xs-12 col-md-12 fb-campaign-name-banner" style="padding:10px!important">
                    <span class="fb-translate" data-key="campaign-5535" data-mode="-1" data-fallback=""
                          data-disablehtmlclean="false" data-nodefaultlanguagefallback="false" data-placeholders="[]">Today's offer!</span>
                </div>
                <%}%>
                <div style="display: flex">
                    <div id="fb-recap-booking" class="col-xs-12 col-md-12" style="padding: 0px;">
                        <div class="container fb-container fb-recap-accommodation fb-light-bg">
                            <div class="col-xs-6 col-sm-3 fb-container">
                                <div class="col-xs-12 fb-font-bold fb-room-title">
                                    <span class="fb-translate" data-key="room-number" data-mode="-1" data-fallback=""
                                          data-disablehtmlclean="false" data-nodefaultlanguagefallback="false"
                                          data-placeholders="[1]"><%=roomTO.getName()%></span>
                                </div>
                                <div class="col-xs-12 fb-dark-gray">
                                    <span class="fb-translate" data-key="adult" data-mode="2" data-fallback=""
                                          data-disablehtmlclean="false" data-nodefaultlanguagefallback="false"
                                          data-placeholders="[2]">2 người lớn</span>
                                </div>
                            </div>
                            <div class="hidden-xs col-sm-6" style="white-space: normal; padding-right: 0px;">
                                <p>
                                    <span class="fb-translate" data-key="vnpha30475:roomtitle:Garden-View-Bungalow"
                                          data-mode="-1" data-fallback="Garden-View-Bungalow"
                                          data-disablehtmlclean="false" data-nodefaultlanguagefallback="false"
                                          data-placeholders="[]"><%=kindRoomTO.getName_vi()%></span>
                                </p>
                                <p>
						<span>
							<span class="fb-translate" data-key="room-bed-types" data-mode="-1" data-fallback="Bedding"
                                  data-disablehtmlclean="false" data-nodefaultlanguagefallback="false"
                                  data-placeholders="[]">Lựa chọn giường</span>:
							<span class="fb-translate" data-key="__TypeOfBeds___Double" data-mode="-1"
                                  data-fallback="Double" data-disablehtmlclean="false"
                                  data-nodefaultlanguagefallback="false" data-placeholders="[]">Giường đôi</span>
						</span>
                                </p>
                                <p>
						<span class="bed-type-tooltip">(
							<span class="fb-translate" data-key="room-bed-types-tooltip" data-mode="-1" data-fallback=""
                                  data-disablehtmlclean="false" data-nodefaultlanguagefallback="false"
                                  data-placeholders="[]">tùy thuộc vào tình trạng sẵn có</span>)
						</span>
                                </p>
                                <p>
                                    <span class="fb-translate"
                                          data-key="vnpha30475:promotiontitle:Online-Exclusive-Rate" data-mode="-1"
                                          data-fallback="Online Exclusive Rate" data-disablehtmlclean="false"
                                          data-nodefaultlanguagefallback="false"
                                          data-placeholders="[]"><%=priceRoomTO.getType_price_room_vi()%></span>
                                </p>
                                <p>
						<span>
							<span class="fb-translate" data-key="results-rate-meal-type-breakfast" data-mode="-1"
                                  data-fallback="" data-disablehtmlclean="false" data-nodefaultlanguagefallback="false"
                                  data-placeholders="[]">Bao gồm bữa sáng</span>:
							<span class="fb-translate" data-key="vnpha30475:mealtitle:Breakfast" data-mode="-1"
                                  data-fallback="Breakfast" data-disablehtmlclean="false"
                                  data-nodefaultlanguagefallback="false" data-placeholders="[]">Breakfast</span>
						</span>
                                </p>
                                <div class="mtm">
                                    <a href="#" class="theme-link">
                                        <span class="fb-translate fb-font-bold" data-key="basket-room-remove"
                                              data-mode="-1" data-fallback="" data-disablehtmlclean="false"
                                              data-nodefaultlanguagefallback="false" data-placeholders="[]">Bỏ</span>
                                    </a>
                                </div>
                            </div>
                            <div class="col-xs-6 col-sm-3">
                                <p class="fb-price-amount">
						<span class="fb-price campaign-price-barred" data-price="101.16137027145" data-symbol="true">
                            <%if(!price_type.equals("OFFLINE")) {%>
							<span><%=TextCustomizeFormat.currency_format(priceRoomTO.getPrice_1_night())%>
								<span class="fb-price-currency">₫</span>
                                <%}%>
							</span>
						</span>
                                </p>
                                <p class="fb-price-amount">
						<span class="fb-price price-new" data-price="91.045233244308" data-symbol="true"
                              data-pricepoint="0">
							<span><%=price%>
								<span class="fb-price-currency">₫</span>
							</span>
						</span>
                                </p>
                            </div>

                        </div>
                        <%if(!price_type.equals("OFFLINE")) {%>
                        <div id="fb-total-discount"
                             class="fb-total-recap-discount container fb-container fb-light-bg row" style="margin: 0px;display: flex;align-items: center;">
                            <div class="col-xs-6 fb-container mcm-discount-total" >
                                <span class="fb-translate col-xs-12 fb-basket-header-total"
                                      data-key="mcm-basket-total-discount-applied" data-mode="-1" data-fallback=""
                                      data-disablehtmlclean="false" data-nodefaultlanguagefallback="false"
                                      data-placeholders="[]">Tổng giảm giá được áp dụng</span>
                            </div>
                            <div class="col-xs-6 fb-container mcm-discount-total-value" style="padding-left:20px;">
                                <div class="col-xs-12 fb-price-amount">
						<span class="fb-price" data-price="10.116137027142003" data-symbol="true">
							<span><%=price%>
								<span class="fb-price-currency">₫</span>
							</span>
						</span>
                                </div>
                            </div>
                        </div>
                        <%}%>
                        <div id="fb-recap-total" class="container fb-container fb-light-bg row" style="margin:0px;">
                             <h2>Chi tiết thanh toán:</h2>
                            <table id="table-price" style="margin:50px;margin-left:10px;width: 100%">
                                <tbody>
                                <tr>
                                    <td><h4>Tổng tiền phòng:</h4></td>
                                    <td><span><%=price%></span>
                                        <span class="fb-price-currency">₫</span>
                                    </td>
                                </tr>
                                <%if (listFeesOther != null) {%>
                                <%for (int i = 0; i < listFeesOther.size(); i++) {%>
                                <tr>
                                    <td><h4>Bao gồm <%=listFeesOther.get(i).getName_vi()%>:</h4></td>
                                    <td>
                                        <span><%=TextCustomizeFormat.currency_format(listFeesOther.get(i).getPrice())%></span>
                                        <span class="fb-price-currency">₫</span>
                                    </td>
                                </tr>
                                <%
                                    }
                                    }
                                %>
                                <tr>
                                    <td><h3>Tổng cộng:</h3></td>
                                    <td>
                                        <span style="font-size:30px;"><%=TextCustomizeFormat.currency_format(Long.parseLong(total))%>
                                            <span class="fb-price-currency">₫</span>
                                    </td>
                                </tr>

                                </tbody>
                            </table>
                        </div>
                        <h2 style="padding: 20px;">Các dịch vụ được hưởng:</h2>
                        <div id="fb-recap-warrants" class="col-xs-12 col-md-4" style="display: flex;margin-bottom: 14px;">

                            <%
                                for (int i = 0; i < listServiceTO.size(); i++) {


                            %>
                            <div class="col-xs-12 col-sm-12 col-md-12 fb-warrant fb-container fb-light-bg">

                                <div class="hidden-xs col-sm-12">
                                    <img src="<%=listServiceTO.get(i).getFile_img_url().replace(StaticTO.STATIC_PATH,".\\")%>"
                                         width="33" height="33"
                                         border="0">
                                </div>
                                <div class="col-xs-10 col-sm-12 fb-font-bold fb-warrant-title">
                                <span class="fb-translate" data-key="results-rate-meal-type-breakfast" data-mode="-1"
                                      data-fallback="" data-disablehtmlclean="false"
                                      data-nodefaultlanguagefallback="false"
                                      data-placeholders="[]"><%=listServiceTO.get(i).getService_name_vi()%></span>
                                </div>
                                <div class="col-xs-12 fb-dark-gray">
                                <span class="fb-translate" data-key="warrant-prepaid-notice" data-mode="-1"
                                      data-fallback="" data-disablehtmlclean="false"
                                      data-nodefaultlanguagefallback="false"
                                      data-placeholders="[]"><%=listServiceTO.get(i).getService_details_vi()%></span>
                                </div>

                            </div>
                            <%}%>
                        </div>
                    </div>
                </div>
                <div id="fb-recap-extras-container" class="container fb-container fb-light-bg">
                    <div id="fb-extras-request" class="col-xs-12 fb-light-bg" style="padding-top: 20px;">
                        <label class="fb-font-light">
                        <span class="fb-translate" data-key="collect-special-request" data-mode="-1" data-fallback=""
                              data-disablehtmlclean="false" data-nodefaultlanguagefallback="false"
                              data-placeholders="[]">Yêu cầu đặc biệt</span>
                        </label>
                        <form class="col-xs-12 bound" novalidate="novalidate">
                            <div class="fb-comment-block-container">
                                <label>
                                <span class="fb-translate" data-key="extras-request-placeholder" data-mode="-1"
                                      data-fallback="" data-disablehtmlclean="false"
                                      data-nodefaultlanguagefallback="false" data-placeholders="[]">Vui lòng cung cấp thêm thông tin: thời gian đến, dị ứng đồ ăn...</span>
                                </label>
                                <textarea class="form-control" rows="6" id="info-food" name="fb-comment-block"
                                          maxlength="500"></textarea>
                                <span class="fb-dark-gray">0/500</span>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <!---->
            <% %>
            <form action="<%if (price_type.equals("OFFLINE")){%>PaymentAutoReturn<%}else{%><%=StaticTO.PAYPAL_URL%><%}%>" method="post" id="form_payment">
                 <%if(price_type.equals("OFFLINE")){%>
                <input type="hidden" name="checkin" value="<%=checkin%>">
                <input type="hidden" name="total" value="<%=total%>">
                <input type="hidden" name="checkout" value="<%=checkout%>">
                <input type="hidden" name="kind_room_id" value="<%=kindRoomTO.getKindroom_id()%>">
                <input type="hidden" name="region_id" value="<%=regionTO.getRegion_id()%>">
                <input type="hidden" name="room_id" value="<%=roomTO.getRoom_id()%>">
                <input type="hidden" name="price_id" value="<%=price_id%>">
                <input type="hidden" name="listTrans" value="<%=arraySelectAddition%>">
                <%}else{%>
                <input type="hidden" name="cmd" value="_xclick">
                <input type="hidden" name="business" value="<%=StaticTO.PAYPAL_ID%>">
                <input type="hidden" name="item_name" value="Booking online">
                <input type="hidden" name="item_number" value="<%=countBooking%>">
                <input type="hidden" name="amount" value="5.00">
                <%--    <input type="hidden" name="custom" value="c1120510110300101280-coins">--%>
                <input type="hidden" name="invoice" value="IDABC<%=countPayment%>-EMP1120510110300101223">
                <input type="hidden" name="currency_code" value="SGD">
                <input type="hidden" name="test_ipn" value="1">
                <input type="hidden" name="txn_type" value="express_checkout">
                <input type="hidden" name="no_shipping" value="1">
                <input type="hidden" name="no_note" value="1">
                <input type="hidden" name="return" id="return" value="">
                <input type="hidden" name="cancel_return" value="<%=StaticTO.PAYPAL_AUTORETURN%>">
                <input type="hidden" name="image_url"
                       value="https://www.victoriahotels.asia/templates/hoang-template/images/Victoria.png" style="height:100px;">
                <input type="hidden" name="rm" value="1">
                <input type="hidden" name="on0" value="Transaction Signature">
                <input type="hidden" name="notify_url" value="<%=StaticTO.PAYPAL_AUTORETURN+"?xinchao=3"%>">

                <input type="hidden" name="os0" value="bfcc887ae618b8c21556487cf95fe15b">
                <%--    <input type="hidden" name="on1" value="Combo coins after purchased">--%>

                <%--    <input type="hidden" name="os1" value="400 combo coins">--%>

                <input type="hidden" name="first_name" value="">
                <input type="hidden" name="last_name" value="">
                <input type="hidden" name="address_override" value="0">
                <input type="hidden" name="address1" value="vietnam">
                <input type="hidden" name="country" value="VN">
                <input type="hidden" name="city" value="HCM">
                <input type="hidden" name="cbt" value="Complete and Back to Victoria hotel">
                <input type="hidden" name="cs" value="1">
                <input type="hidden" name="zip" value="70000">
                <input type="hidden" name="page_style" value="primary">
                <%}%>

                <div class="container" id="div-payment-end">
                    <!--thông tin người dùng-->
                    <div id="fb-datacollect">
                        <div class="fb-inner-container">
                            <div class="col-xs-12 col-md-6 fb-collect-half fb-container fb-datacollect-container"
                                 style="height: 900px;max-width: 100%!important;">
                                <div class="col-sm-offset-2 col-sm-8 col-md-10 col-md-offset-1 fb-container">
                                    <div class="col-xs-12 fb-welcome fb-font-light">
                                    <h2 class="fb-translate" data-key="traveller-title" data-mode="-1"
                                          data-fallback="" data-disablehtmlclean="false"
                                          data-nodefaultlanguagefallback="false"
                                          data-placeholders="[]" style="margin-top: 14px;">Thông tin khách</h2>
                                    </div>
                                    <div class="form-group container">
                                        <label for="buyer-email">
                                            <span class="fb-translate" data-key="traveller-email" data-mode="-1"
                                                  data-fallback="" data-disablehtmlclean="false"
                                                  data-nodefaultlanguagefallback="false" data-placeholders="[]">Địa chỉ email</span>
                                            <span class="mandatory-field-asterisk">*</span>
                                        </label>
                                        <input type="email" class="form-control" id="buyer-email" name="email"
                                               required="required" value="" placeholder="abc@xyz.com">
                                    </div>
                                    <div class="form-group container">
                                        <label class="col-xs-12 fb-container">
                                            <span class="fb-translate" data-key="traveller-honorific" data-mode="-1"
                                                  data-fallback="" data-disablehtmlclean="false"
                                                  data-nodefaultlanguagefallback="false" data-placeholders="[]">Danh xưng</span>
                                            <span class="mandatory-field-asterisk">*</span>
                                        </label>
                                        <div class="btn-group" data-toggle="buttons">
                                            <label class="btn btn-default active">
                                                <input type="radio" name="buyer-honorific-prefix" value="Mr."
                                                       autocomplete="buyer-honorific-prefix" id="buyer-honorific-Mr."
                                                       checked="checked">
                                                <span class="fb-translate" data-key="honorific-mr" data-mode="-1"
                                                      data-fallback="Mr." data-disablehtmlclean="false"
                                                      data-nodefaultlanguagefallback="false"
                                                      data-placeholders="[]">Ông</span>
                                            </label>
                                            <label class="btn btn-default">
                                                <input type="radio" name="buyer-honorific-prefix" value="Ms."
                                                       autocomplete="buyer-honorific-prefix" id="buyer-honorific-Ms.">
                                                <span class="fb-translate" data-key="honorific-ms" data-mode="-1"
                                                      data-fallback="Ms." data-disablehtmlclean="false"
                                                      data-nodefaultlanguagefallback="false"
                                                      data-placeholders="[]">Cô</span>
                                            </label>
                                            <label class="btn btn-default">
                                                <input type="radio" name="buyer-honorific-prefix" value="Mrs."
                                                       autocomplete="buyer-honorific-prefix" id="buyer-honorific-Mrs.">
                                                <span class="fb-translate" data-key="honorific-mrs" data-mode="-1"
                                                      data-fallback="Mrs." data-disablehtmlclean="false"
                                                      data-nodefaultlanguagefallback="false"
                                                      data-placeholders="[]">Bà</span>
                                            </label>
                                            <label class="btn btn-default">
                                                <input type="radio" name="buyer-honorific-prefix" value="Dr."
                                                       autocomplete="buyer-honorific-prefix" id="buyer-honorific-Dr.">
                                                <span class="fb-translate" data-key="honorific-dr" data-mode="-1"
                                                      data-fallback="Dr." data-disablehtmlclean="false"
                                                      data-nodefaultlanguagefallback="false"
                                                      data-placeholders="[]">Tiến sĩ</span>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="form-group container">
                                        <label for="buyer-firstname">
                                            <span class="fb-translate" data-key="traveller-firstname" data-mode="-1"
                                                  data-fallback="" data-disablehtmlclean="false"
                                                  data-nodefaultlanguagefallback="false"
                                                  data-placeholders="[]">Tên</span>
                                        </label>
                                        <span class="mandatory-field-asterisk">*</span>
                                        <input type="text" class="form-control fb-translate" id="buyer-firstname"
                                               name="buyer-given-name" required="required"
                                               autocomplete="buyer-given-name" value="" placeholder="">
                                    </div>
                                    <div class="form-group container">
                                        <label for="buyer-lastname">
                                            <span class="fb-translate" data-key="traveller-lastname" data-mode="-1"
                                                  data-fallback="" data-disablehtmlclean="false"
                                                  data-nodefaultlanguagefallback="false"
                                                  data-placeholders="[]">Họ</span>
                                        </label>
                                        <span class="mandatory-field-asterisk">*</span>
                                        <input type="text" class="form-control fb-translate" id="buyer-lastname"
                                               name="buyer-family-name" required="required"
                                               autocomplete="buyer-family-name" value="" placeholder="">
                                    </div>
                                    <div class="form-group container">
                                        <label for="buyer-address">
                                            <span class="fb-translate" data-key="traveller-address" data-mode="-1"
                                                  data-fallback="" data-disablehtmlclean="false"
                                                  data-nodefaultlanguagefallback="false"
                                                  data-placeholders="[]">Địa chỉ</span>
                                            <span class="mandatory-field-asterisk">*</span>
                                        </label>
                                        <input type="text" class="form-control" id="buyer-address" name="buyeraddress"
                                               required="required">
                                    </div>
                                    <div class="form-group container">
                                        <label for="buyer-zip-code">
                                            <span class="fb-translate" data-key="traveller-zip-code" data-mode="-1"
                                                  data-fallback="" data-disablehtmlclean="false"
                                                  data-nodefaultlanguagefallback="false" data-placeholders="[]">Mã bưu chính</span>
                                            <span class="mandatory-field-asterisk">*</span>
                                        </label>
                                        <input type="text" class="form-control" id="buyer-zip-code" name="buyerzipcode"
                                               required="required">
                                    </div>
                                    <div class="form-group container">
                                        <label for="buyer-city">
                                            <span class="fb-translate" data-key="traveller-city" data-mode="-1"
                                                  data-fallback="" data-disablehtmlclean="false"
                                                  data-nodefaultlanguagefallback="false" data-placeholders="[]">Thành phố</span>
                                            <span class="mandatory-field-asterisk">*</span>
                                        </label>
                                        <input type="text" class="form-control" id="buyer-city" name="buyercity"
                                               required="required">
                                    </div>
                                    <div class="form-group container">
                                        <label class="col-xs-12 fb-container">
                                            <span class="fb-translate" data-key="quicksearch-country" data-mode="-1"
                                                  data-fallback="" data-disablehtmlclean="false"
                                                  data-nodefaultlanguagefallback="false" data-placeholders="[]">Quốc gia / Vùng</span>
                                            <span class="mandatory-field-asterisk">*</span>
                                        </label>
                                        <div class="col-xs-5 fb-container">
                                            <!--national -->
                                            <jsp:include page="NationalDefault.jsp"></jsp:include>
                                        </div>
                                    </div>
                                    <div class="form-group container">
                                        <label for="buyer-phone" class="col-xs-12 fb-container">
                                            <span class="fb-translate" data-key="traveller-phone" data-mode="-1"
                                                  data-fallback="" data-disablehtmlclean="false"
                                                  data-nodefaultlanguagefallback="false" data-placeholders="[]">Số điện thoại</span>
                                            <span class="mandatory-field-asterisk">*</span>
                                        </label>
                                        <div class="col-xs-5 fb-container">
                                            <!--contact national -->
                                            <jsp:include page="PhoneNational.jsp"></jsp:include>
                                        </div>
                                        <div class="col-xs-6 col-xs-offset-1 fb-container">
                                            <input type="tel" class="form-control" id="buyer-phone" name="buyer-phone"
                                                   required="required" autocomplete="tel-local" value="">
                                        </div>
                                        <div>
                                            <label>Chứng minh nhân dân</label>
                                            <input type="text" class="form-control" name="verify_person" id="verify_person"
                                                   required="required">
                                        </div>
                                    </div>

                                    <div class="form-group container payerInput"
                                         style="padding-left:0;padding-top:15px;margin-top:15px;display:none;border-top: 1px solid #C4C4C4;">
                                        <div class="col-xs-12 fb-welcome fb-font-light">
                                            <span class="fb-translate" data-key="payer-title" data-mode="-1"
                                                  data-fallback="" data-disablehtmlclean="false"
                                                  data-nodefaultlanguagefallback="false" data-placeholders="[]">Thông tin người thanh toán</span>
                                        </div>
                                        <div class="form-group container">
                                            <label class="col-xs-12 fb-container">
                                                <span class="fb-translate" data-key="traveller-honorific" data-mode="-1"
                                                      data-fallback="" data-disablehtmlclean="false"
                                                      data-nodefaultlanguagefallback="false" data-placeholders="[]">Danh xưng</span>
                                                <span class="mandatory-field-asterisk">*</span>
                                            </label>
                                            <div class="btn-group" data-toggle="buttons">
                                                <label class="btn btn-default active">
                                                    <input type="radio" name="payer-honorific-prefix" value="Mr."
                                                           autocomplete="payer-honorific-prefix"
                                                           id="payer-honorific-Mr." checked="checked">
                                                    <span class="fb-translate" data-key="honorific-mr" data-mode="-1"
                                                          data-fallback="Mr." data-disablehtmlclean="false"
                                                          data-nodefaultlanguagefallback="false"
                                                          data-placeholders="[]">Ông</span>
                                                </label>
                                                <label class="btn btn-default">
                                                    <input type="radio" name="payer-honorific-prefix" value="Ms."
                                                           autocomplete="payer-honorific-prefix"
                                                           id="payer-honorific-Ms.">
                                                    <span class="fb-translate" data-key="honorific-ms" data-mode="-1"
                                                          data-fallback="Ms." data-disablehtmlclean="false"
                                                          data-nodefaultlanguagefallback="false"
                                                          data-placeholders="[]">Cô</span>
                                                </label>
                                                <label class="btn btn-default">
                                                    <input type="radio" name="payer-honorific-prefix" value="Mrs."
                                                           autocomplete="payer-honorific-prefix"
                                                           id="payer-honorific-Mrs.">
                                                    <span class="fb-translate" data-key="honorific-mrs" data-mode="-1"
                                                          data-fallback="Mrs." data-disablehtmlclean="false"
                                                          data-nodefaultlanguagefallback="false"
                                                          data-placeholders="[]">Bà</span>
                                                </label>
                                                <label class="btn btn-default">
                                                    <input type="radio" name="payer-honorific-prefix" value="Dr."
                                                           autocomplete="payer-honorific-prefix"
                                                           id="payer-honorific-Dr.">
                                                    <span class="fb-translate" data-key="honorific-dr" data-mode="-1"
                                                          data-fallback="Dr." data-disablehtmlclean="false"
                                                          data-nodefaultlanguagefallback="false" data-placeholders="[]">Tiến sĩ</span>
                                                </label>
                                            </div>
                                        </div>
                                        <div class="form-group container">
                                            <label for="payer-firstname">
                                                <span class="fb-translate" data-key="traveller-firstname" data-mode="-1"
                                                      data-fallback="" data-disablehtmlclean="false"
                                                      data-nodefaultlanguagefallback="false"
                                                      data-placeholders="[]">Tên</span>
                                            </label>
                                            <span class="mandatory-field-asterisk">*</span>
                                            <input type="text" class="form-control fb-translate" id="payer-firstname"
                                                   name="payer-given-name"
                                                   value="" placeholder="">
                                        </div>
                                        <div class="form-group container">

                                            <span class="mandatory-field-asterisk">*</span>
                                            <input type="text" class="form-control fb-translate" id="payer-lastname"
                                                   name="payer-family-name" value="" placeholder="">
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                    <!---->

                    <%if(price_type.equals("OFFLINE")){%>
                    <!--tien hanh thanh toan-->
                    <div class="container col-xs-12 text-center fb-confirmbutton-container">

                        <div class="col-xs-12 fb-light-bg">
                            <div class="form-group fb-confirmbutton-terms-container">
				<span id="fb-confirmbutton-TCCheckbox" class="fb-input theme-checkbox fb-checkbox fb-unchecked">
					<i class="fa fa-check"></i>
				</span>
                                <span class="fb-translate" data-key="booking-notice" data-mode="-1" data-fallback=""
                                      data-disablehtmlclean="false" data-nodefaultlanguagefallback="false"
                                      data-placeholders="[&quot;
					<a href=\&quot;#\&quot; id=\&quot;termsLink\&quot; class=\&quot;theme-link\&quot;>
						<span class=\&quot;fb-translate\&quot; data-key=\&quot;booking-sales-conditions\&quot; data-mode=\&quot;-1\&quot; data-fallback=\&quot;\&quot; data-disablehtmlclean=\&quot;false\&quot; data-nodefaultlanguagefallback=\&quot;false\&quot; data-placeholders=\&quot;[]\&quot;>điều khoản và điều kiện</span>
					</a>&quot;,&quot;
					<a href=\&quot;#\&quot; id=\&quot;privacyLink\&quot; class=\&quot;theme-link\&quot;>
						<span class=\&quot;fb-translate\&quot; data-key=\&quot;booking-privacy-policy\&quot; data-mode=\&quot;-1\&quot; data-fallback=\&quot;\&quot; data-disablehtmlclean=\&quot;false\&quot; data-nodefaultlanguagefallback=\&quot;false\&quot; data-placeholders=\&quot;[]\&quot;>chính sách bảo mật</span>
					</a>&quot;]"
                                      placeholder="Bằng việc lựa chọn đặt phòng, tôi xác nhận đã đọc và đồng ý với điều khoản và điều kiện và chính sách bảo mật.">Bằng việc lựa chọn đặt phòng, tôi xác nhận đã đọc và đồng ý với
					<a href="#" id="termsLink" class="theme-link">
						<span class="fb-translate" data-key="booking-sales-conditions" data-mode="-1" data-fallback=""
                              data-disablehtmlclean="false" data-nodefaultlanguagefallback="false"
                              data-placeholders="[]"
                              placeholder="điều khoản và điều kiện">điều khoản và điều kiện</span>
					</a> và
					<a href="#" id="privacyLink" class="theme-link">
						<span class="fb-translate" data-key="booking-privacy-policy" data-mode="-1" data-fallback=""
                              data-disablehtmlclean="false" data-nodefaultlanguagefallback="false"
                              data-placeholders="[]" placeholder="chính sách bảo mật">chính sách bảo mật</span>
					</a>.
				</span>
                                <input type="checkbox" name="check-terms"
                                       style="width: 0; visibility: hidden; position: absolute; left: -300000px;">
                            </div>
                        </div>
                        <div class="col-xs-12 fb-light-bg" id="fb-confirmbutton-button-block">
                            <button type="submit" id="fb-confirmbutton-button"
                                    class="theme-btn btn fb-action fb-font-bold col-xs-12 col-sm-offset-4 col-sm-4">
                        <span class="fb-translate" data-key="booking-confirm-action" data-mode="-1" data-fallback=""
                              data-disablehtmlclean="false" data-nodefaultlanguagefallback="false"
                              data-placeholders="[]" placeholder="ĐẶT PHÒNG">ĐẶT PHÒNG</span>
                            </button>
                        </div>
                        <div class="col-xs-12 fb-confirmbutton-notice fb-dark-gray">&nbsp;</div>
                        <div id="fb-basket-spacer" class="hidden-md hidden-lg"></div>

                    </div>
                    <%}%>
                </div>
            </form>
            <%if(!price_type.equals("OFFLINE")){%>
            <div class="div-paypal">
                <button type="button" class="btn" id="payment-paypal">
              <span>
                  <i class="cc paypal icon" style="font-size: 40px"></i>
              </span>
                    <br/>
                    <span>Thanh toán bằng paypal</span>
                </button>
            </div>
            <%}%>



            <!---->
            <!-- Set up a container element for the button -->


        </div>
    </div>
    <script>
        tinymce.init({
            selector: '#info-food',
            menu: {
                format: {
                    title: 'Format',
                    items: 'bold italic underline'
                },


            }
        });
        $(document).ready(function(){
             $("#payment-paypal").click(function(){
                 var email=$("#buyer-email").val();
                 var firtname=$("#buyer-firstname").val();
                 var lastname=$("#buyer-lastname").val();
                 var address=$("#buyer-address").val();
                 var zip=$("#buyer-zip-code").val();
                 var city=$("#buyer-city").val();
                 var buyercountry=$("#buyer-country").val();
                 var phone=$("#buyer-phone").val();
                 var CMND=$("#verify_person").val();
                var url='<%=StaticTO.PAYPAL_AUTORETURN+"?checkin="+checkin+"&total="+total+"&checkout="+checkout+"&kind_room_id="+kindRoomTO.getKindroom_id()+"&region_id="+regionTO.getRegion_id()+"&room_id="+roomTO.getRoom_id()+"&price_id="+price_id+"&listTrans="+arraySelectAddition%>'
                url+='&email='+email+'&buyer-given-name='+firtname+'&buyer-family-name='+lastname+'&buyeraddress='+address+'&buyerzipcode='+zip+'&buyercity='+city+'&buyer-country='+buyercountry+'&buyer-phone='+phone+'&verify_person='+CMND+'&type_payment=paypal';
                alert(url);
                $("#return").val(url);
                $("#form_payment").submit();

             });
        });
    </script>
</div>