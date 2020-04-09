<%@ page import="DTO.RoomTO" %>
<%@ page import="DTO.TransportTO" %>
<%@ page import="Utils.TextCustomizeFormat" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="DTO.PriceRoomTO" %><%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 3/15/2020
  Time: 11:18 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String price = request.getParameter("price") != null ? (String) request.getParameter("price") : "0";
    String kind_room_id = request.getParameter("kind_room_id") != null ? (String) request.getParameter("kind_room_id") : "0";
    String region_id = request.getParameter("region_id") != null ? (String) request.getParameter("region_id") : "0";
    String price_id = request.getParameter("price_id") != null ? (String) request.getParameter("price_id") : "0";
    String numberOfPeo = request.getParameter("numberOfPeo") != null ? (String) request.getParameter("numberOfPeo") : "0";
    String checkin = request.getParameter("checkin") != null ? (String) request.getParameter("checkin") : "";
    String checkout = request.getParameter("checkout") != null ? (String) request.getParameter("checkout") : "";
    RoomTO roomTO = (RoomTO) request.getAttribute("roomSelected");
    ArrayList<TransportTO> listFeeOther = (ArrayList<TransportTO>) request.getAttribute("listFeeOther");
    ArrayList<TransportTO> listTrans = (ArrayList<TransportTO>) request.getAttribute("listTrans");
    PriceRoomTO priceRoomTO = (PriceRoomTO) request.getAttribute("priceRoomTO");
    String totalTemp=request.getAttribute("totalTemp")!=null?(String)request.getAttribute("totalTemp"):"0";
    String price_type = request.getParameter("price_type") != null ? (String) request.getParameter("price_type") : "OFFLINE";

    String totalTempStr=request.getAttribute("totalTempLong")!=null?(String)request.getAttribute("totalTempLong"):"0";
      long totalTempLong=Long.parseLong(totalTempStr);


%>

<div class="col-md-12">
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
            <div class="straight"></div>
            <div class="circle">3</div>
        </div>
    </div>
    <div class="col-md-12" style="display: flex">
        <div class="col-md-9" style="padding:25px;">
            <div>
                <div class="intro-booking-room">
                    <h2>Chọn buồng đầu tiên của bạn</h2>
                    <b>Quý khách sẽ được đặt phòng ở mức giá tốt nhất</b> do không phải qua đơn vị trung gian:
                    Quý khách đang ghé thăm trang web của khách sạn.
                </div>
                <!--lua chon dieu kien bo sung-->
                <%
                    if (listTrans != null) {
                        for (int i = 0; i < listTrans.size(); i++) {

                %>
                <div id="extras-stay" class="col-xs-12 fb-gray-bg">
                    <div class="col-xs-12 fb-dark-bg fb-block-header">
                        <span class="fb-translate" data-key="extras-stay" data-mode="-1" data-fallback=""
                              data-disablehtmlclean="false" data-nodefaultlanguagefallback="false"
                              data-placeholders="[]" placeholder="Lựa chọn bổ sung cho lưu trú của quý khách">Lựa chọn bổ sung cho lưu trú của quý khách</span>
                    </div>
                    <div id="Private-car-from-Resort-to-Tan-Son-Nhat-airport"
                         name="Private-car-from-Resort-to-Tan-Son-Nhat-airport"
                         class="col-xs-12 fb-container fb-extras-item fb-light-bg">
                        <div class="hidden-xs col-sm-3"></div>
                        <div class="col-xs-7 col-sm-5 fb-extras-infos">
                            <div class="col-xs-12 fb-container fb-extras-item-title fb-font-bold">
                                <span class="fb-translate"
                                      data-key="vnpha30475:optiontitle:Private-car-from-Resort-to-Tan-Son-Nhat-airport"
                                      data-mode="-1" data-fallback="Private-car-from-Resort-to-Tan-Son-Nhat-airport"
                                      data-disablehtmlclean="false" data-nodefaultlanguagefallback="false"
                                      data-placeholders="[]"
                                      placeholder="Private car from Resort to Tan Son Nhat airport / HCMC downtown"><%=listTrans.get(i).getName_vi()%></span>
                            </div>
                            <div class="col-xs-12 fb-container fb-dark-gray">
                                <a href="#" class="theme-link">
                                    <span class="fb-translate" data-key="Details" data-mode="-1" data-fallback=""
                                          data-disablehtmlclean="false" data-nodefaultlanguagefallback="false"
                                          data-placeholders="[]" placeholder="Chi tiết">Chi tiết</span>
                                    <i class="fa fa-caret-right"></i>
                                </a>
                            </div>
                            <div id="fb-extra-desc-Private-car-from-Resort-to-Tan-Son-Nhat-airport"
                                 class="col-xs-12 fb-extra-description fb-container fb-font-light">
				<span class="fb-translate"
                      data-key="vnpha30475:optiondesc:Private-car-from-Resort-to-Tan-Son-Nhat-airport" data-mode="-1"
                      data-fallback="Private vehicle - Distance 200km - Duration 4 hours - Price: VND 2,750,000/ vehicle/ way - Maximum 04 persons"
                      data-disablehtmlclean="true" data-nodefaultlanguagefallback="false" data-placeholders="[]"
                      placeholder="Private vehicle - Distance 200km - Duration 4 hours - Price: VND 3,118,500/ vehicle/ way - Maximum 04 persons">
					<p><%=listTrans.get(i).getDetails_vi()%></p>
				</span>
                            </div>
                            <div class="col-xs-12 fb-container fb-price-amount">
				<span class="fb-price" data-price="106.77010399039" data-symbol="true" data-alternate="null">
					<span><%=TextCustomizeFormat.currency_format(listTrans.get(i).getPrice())%>
						<span class="fb-price-currency">₫</span>
					</span>
				</span>
                            </div>
                        </div>
                        <div class="col-xs-5 col-sm-4 fb-container">
                            <div id="fb-extras-select" class="col-xs-12 col-sm-12" align="right" style="height: 29px;">
                                <div class="ui checkbox">
                                    <input type="checkbox" class="checkbox-trans" data-price="<%=listTrans.get(i).getPrice()%>" data-transport="<%=listTrans.get(i).getTransport_id()%>">
                                    <label>Lựa chọn</label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <%
                        }
                    }
                %>
            </div>


            <!--request customer-->
            <div id="extras-requests" class="col-xs-12 fb-gray-bg">
                <div class="col-xs-12 fb-dark-bg fb-block-header">
                        <span class="fb-translate" data-key="extras-request" data-mode="-1" data-fallback=""
                              data-disablehtmlclean="false" data-nodefaultlanguagefallback="false"
                              data-placeholders="[]" placeholder="Yêu cầu đặc biệt cho lựa chọn bổ sung của quý khách">Yêu cầu đặc biệt cho lựa chọn bổ sung của quý khách</span>
                </div>
                <div class="col-xs-12 fb-container fb-extras-request">
                    <form class="col-xs-12 bound" novalidate="novalidate">
                        <div class="fb-comment-block-container">
                            <label>
                                    <span class="fb-translate" data-key="extras-request-placeholder" data-mode="-1"
                                          data-fallback="" data-disablehtmlclean="false"
                                          data-nodefaultlanguagefallback="false" data-placeholders="[]"
                                          placeholder="Vui lòng cung cấp thêm thông tin: thời gian đến, dị ứng đồ ăn...">Vui lòng cung cấp thêm thông tin: thời gian đến, dị ứng đồ ăn...</span>
                            </label>
                            <textarea class="form-control" id="comment-block" rows="6" name="fb-comment-block"
                                      maxlength="500"  style="margin: 20px;"></textarea>
                            <span class="fb-dark-gray">0/500</span>
                        </div>
                    </form>
                    <div class="col-xs-12 fb-dark-gray">
                            <span class="fb-translate" data-key="extras-request-notice" data-mode="-1" data-fallback=""
                                  data-disablehtmlclean="false" data-nodefaultlanguagefallback="false"
                                  data-placeholders="[]"
                                  placeholder="Yêu cầu đặc biệt của quý khách sẽ được xem xét cẩn thận, chúng tôi sẽ cố gắng hết sức để đáp ứng những yêu cầu đó.">Yêu cầu đặc biệt của quý khách sẽ được xem xét cẩn thận, chúng tôi sẽ cố gắng hết sức để đáp ứng những yêu cầu đó.</span>
                    </div>
                </div>
            </div>

        </div>

        <!--thanh toan-->
        <div class="col-md-3" style="padding: 25px;padding-top: 123px;">
            <div id="fb-basket" class="fb-basket-empty stick">
                <div id="fb-basket-header-and-body"
                     class="container fb-container fb-light-bg hidden-xs hidden-sm">
                    <div id="fb-basket-header" class="container fb-container fb-light-bg">
                        <div class="col-xs-4 fb-container">
                            <span class="fb-translate col-xs-12 fb-basket-header-total">Tổng</span>
                            <div class="hidden-xs hidden-sm col-md-12 fb-basket-header-details nowrap"></div>
                        </div>
                        <div class="col-xs-8 fb-container">
                            <div class="col-xs-12 fb-price-amount">
					<span class="fb-price">
						<span class="span-price" data-price="<%=totalTempLong%>"><%=totalTemp%>

						</span>
                        <span class="fb-price-currency">₫</span>
					</span>
                            </div>
                        </div>
                    </div>
                    <div id="fb-basket-header-price-details" class="col-xs-12"></div>
                    <div id="fb-basket-body" class="container col-xs-12 fb-container fb-light-bg"
                         style="max-height: 432px; overflow-y: auto;">
                        <div class="col-xs-12 fb-basket-remain fb-gray">
                            <span class="fb-translate"><%=roomTO.getName()%></span>
                        </div>
                    </div>
                    <div class="Additional">
                        <h5>Chi tiết thanh toán</h5>
                        <p>
                         Tiền phòng:<%=price%><br/>
                         Loại thanh toán:<%=priceRoomTO.getType_price_room_vi()%><br/>
                         <%
                             if(listFeeOther!=null){
                             for (int i = 0; i <listFeeOther.size(); i++) {
                                 %>
                                <%=listFeeOther.get(i).getName_vi()%>:<%=TextCustomizeFormat.currency_format(listFeeOther.get(i).getPrice())%><br/>
                            <%
                             }
                                }
                         %>
                        </p>
                    </div>
                    <div class="Additional">
                        <h5>Chi tiết lựa chọn bổ sung</h5>
                        <div class="Additional-div-main">

                        </div>
                    </div>
                </div>
                <div id="fb-basket-checkout" class="hidden-xs hidden-sm">
                    <button class="btn  btn-continue-payment" id="step-payment-finish" data-price="<%=price%>"
                            data-kindroom="<%=kind_room_id%>" data-region="<%=region_id%>"
                            data-typeprice="<%=price_id%>" data-numberofpeople="<%=numberOfPeo%>"
                            data-checkin="<%=checkin%>" data-checkout="<%=checkout%>"
                            data-room="<%=roomTO.getRoom_id()%>"
                            data-price-type="<%=price_type%>"
                    >
                        <span class="fb-translate">TIẾP</span>
                    </button>
                    <div id="fb-widget-container"
                         class="col-xs-12 col-sm-12 col-md-12 fb-container fb-light-bg"></div>
                </div>
<%--                <div id="fb-basket-sticky" class="container fb-dark-bg hidden-md hidden-lg">--%>
<%--                    <div class="col-xs-6 col-sm-7 hidden-md hidden-lg">--%>
<%--                        <div class="visible-sm col-sm-6">--%>
<%--                            <span class="fb-translate">Tổng</span>--%>
<%--                        </div>--%>
<%--                        <div class="col-xs-12 col-sm-6 hidden-md hidden-lg fb-price-amount">--%>
<%--				<span class="fb-price" data-price="0" data-symbol="true">--%>
<%--					<span>0&nbsp;--%>
<%--						<span class="fb-price-currency">₫</span>--%>
<%--					</span>--%>
<%--				</span>--%>
<%--                        </div>--%>
<%--                        <div class="visible-sm col-sm-6">--%>
<%--                            <a href="#" onclick="return false;">Details--%>
<%--                                <span class="fb-basket-sticky-toggle">--%>
<%--						<i class="fa fa-caret-down"></i>--%>
<%--					</span>--%>
<%--                            </a>--%>
<%--                        </div>--%>
<%--                        <div class="col-xs-12 col-sm-6 hidden-md hidden-lg fb-price-params"></div>--%>
<%--                    </div>--%>
<%--                    <div class="col-xs-2 visible-xs fb-basket-sticky-toggle">--%>
<%--                        <i class="fa fa-caret-down"></i>--%>
<%--                    </div>--%>
<%--                    <div class="col-xs-4 col-sm-5 hidden-md hidden-lg fb-basket-sticky-checkout">--%>
<%--                        <button class="btn btn-block fb-action fb-action-flat fb-font-bold theme-btn">--%>
<%--                            <span class="fb-translate">Thanh toán</span>--%>
<%--                        </button>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--                s--%>
            </div>
        </div>
    </div>
</div>
<div>

</div>

</div>
<script src="scripts/payment.js"></script>
<script>
    $(document).ready(function(){
        const formatter = new Intl.NumberFormat('en-US', {
            style: 'currency',
            currency: 'USD',
            minimumFractionDigits: 0
        });
        $(".checkbox-trans").click(function(){

            var data=$(".span-price").data('price');

            if($(this).prop("checked")){

               data=data+$(this).data('price');
            }else{

                data=data-$(this).data('price');
            }
           ;
            $(".span-price").text(formatter.format(data).replace("$",""));
            $(".span-price").data('price',data);
        });
    });

</script>
<script>
    tinymce.init({
        selector: '#comment-block',
        menu: {
            format: {
                title: 'Format',
                items: 'bold italic underline'
            },


        }
    });

</script>
