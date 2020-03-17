<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 3/15/2020
  Time: 12:53 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <div class="col-md-12 payment-end-point" >
        <div class="info-end-point">
            <h2>Hoàn tất dịp lưu trú của quý khách</h2>
            <b>Quý khách sẽ được đặt phòng ở mức giá tốt nhất</b>do không phải qua đơn vị trung gian: Quý khách đang ghé thăm trang web của khách sạn.
        </div>

        <!--detail info -->

        <div class="col-xs-12 container">
            <div class="col-xs-12 fb-container fb-block-header fb-dark-bg">
                <div class="col-xs-10 col-sm-12 fb-dark-bg fb-results-acc-title">
                    <span class="fb-translate" data-key="validate-summary-header" data-mode="-1" data-fallback="" data-disablehtmlclean="false" data-nodefaultlanguagefallback="false" data-placeholders="[]">Đặt phòng của quý khách</span> -
                    <span class="fb-translate" data-key="date-from-to" data-mode="-1" data-fallback="" data-disablehtmlclean="false" data-nodefaultlanguagefallback="false" data-placeholders="[&quot;
				<span class=\&quot;fb-date\&quot; data-date=\&quot;2020-03-15\&quot; data-format=\&quot;full\&quot;>15 Tháng Ba 2020</span>&quot;,&quot;
				<span class=\&quot;fb-date\&quot; data-date=\&quot;2020-03-16\&quot; data-format=\&quot;full\&quot;>16 Tháng Ba 2020</span>&quot;]">từ
				<span class="fb-date" data-date="2020-03-15" data-format="full">15 Tháng Ba 2020</span> đến
				<span class="fb-date" data-date="2020-03-16" data-format="full">16 Tháng Ba 2020</span>
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
                    <span class="fb-translate" data-key="vnpha30475:hoteltitle" data-mode="-1" data-fallback="Victoria Phan Thiet Beach Resort &amp; Spa" data-disablehtmlclean="false" data-nodefaultlanguagefallback="false" data-placeholders="[]">Khu nghỉ dưỡng biển &amp; spa Victoria Phan Thiết</span>
                </div>
                <div id="fb-recap-hotel-details">
                    <dl class="col-xs-12 dl-horizontal">
                        <dt class="fb-dark-gray">
                            <span class="fb-translate" data-key="property-address" data-mode="-1" data-fallback="" data-disablehtmlclean="false" data-nodefaultlanguagefallback="false" data-placeholders="[]">Địa chỉ</span>
                        </dt>
                        <dd>
                            <span class="fb-translate" data-key="vnpha30475:hoteladdress" data-mode="-1" data-fallback="Km 9, Phu Hai, Mui Ne, Phan Thiet City, Vietnam" data-disablehtmlclean="false" data-nodefaultlanguagefallback="false" data-placeholders="[]">Km số 9, Phú Hải</span>,
                            <span class="fb-translate" data-key="vnpha30475:hotelzip" data-mode="-1" data-fallback="" data-disablehtmlclean="false" data-nodefaultlanguagefallback="false" data-placeholders="[]"></span>,
                            <span class="fb-translate" data-key="vnpha30475:hotelcity" data-mode="-1" data-fallback="Phan Thiet" data-disablehtmlclean="false" data-nodefaultlanguagefallback="false" data-placeholders="[]">Thành Phố Phan Thiết</span>, Việt Nam
                        </dd>
                        <dt class="fb-dark-gray">
                            <span class="fb-translate" data-key="property-reception-hours" data-mode="-1" data-fallback="" data-disablehtmlclean="false" data-nodefaultlanguagefallback="false" data-placeholders="[]">Lễ tân đang làm việc</span>
                        </dt>
                        <dd>
                            <span class="fb-translate" data-key="property-reception-24" data-mode="-1" data-fallback="" data-disablehtmlclean="false" data-nodefaultlanguagefallback="false" data-placeholders="[]">24/7</span>
                        </dd>
                        <dt class="fb-dark-gray">
                            <span class="fb-translate" data-key="property-checking-time" data-mode="-1" data-fallback="" data-disablehtmlclean="false" data-nodefaultlanguagefallback="false" data-placeholders="[]">Nhận phòng từ</span>
                        </dt>
                        <dd>
                            <div>14:00</div>
                        </dd>
                        <dt class="fb-dark-gray">
                            <span class="fb-translate" data-key="property-checkout-time" data-mode="-1" data-fallback="" data-disablehtmlclean="false" data-nodefaultlanguagefallback="false" data-placeholders="[]">Trả phòng trước</span>
                        </dt>
                        <dd>
                            <div>12:00</div>
                        </dd>
                        <dt class="fb-dark-gray">
                            <span class="fb-translate" data-key="property-languages" data-mode="-1" data-fallback="" data-disablehtmlclean="false" data-nodefaultlanguagefallback="false" data-placeholders="[]">Ngôn ngữ</span>
                        </dt>
                        <dd>Tiếng Anh, Tiếng Việt</dd>
                        <dt class="fb-dark-gray">
                            <span class="fb-translate" data-key="property-contact" data-mode="-1" data-fallback="" data-disablehtmlclean="false" data-nodefaultlanguagefallback="false" data-placeholders="[]">Liên hệ</span>
                        </dt>
                        <dd>+84 252 3 813 000</dd>
                        <dt class="fb-dark-gray">
                            <span class="fb-translate" data-key="property-url" data-mode="-1" data-fallback="" data-disablehtmlclean="false" data-nodefaultlanguagefallback="false" data-placeholders="[]">Trang web</span>
                        </dt>
                        <dd>
                            <a href="https://www.victoriahotels.asia/en/hotels-resorts/phanthiet.html" class="theme-link dont-break-out" target="_blank">https://www.victoriahotels.asia/en/hotels-resorts/phanthiet.html</a>
                        </dd>
                    </dl>
                </div>
            </div>
        </div>


        <!--today offer-->
        <div id="fb-recap-container" class="container">
            <div id="fb-recap-sub-container" class="container fb-container fb-light-bg">
                <div class="col-xs-12 col-md-8 fb-campaign-name-banner">
                    <span class="fb-translate" data-key="campaign-5535" data-mode="-1" data-fallback="" data-disablehtmlclean="false" data-nodefaultlanguagefallback="false" data-placeholders="[]">Today's offer!</span>
                </div>
                <div style="display: flex">
                <div id="fb-recap-booking" class="col-xs-12 col-md-8">
                    <div class="container fb-container fb-recap-accommodation fb-light-bg">
                        <div class="col-xs-6 col-sm-3 fb-container">
                            <div class="col-xs-12 fb-font-bold fb-room-title">
                                <span class="fb-translate" data-key="room-number" data-mode="-1" data-fallback="" data-disablehtmlclean="false" data-nodefaultlanguagefallback="false" data-placeholders="[1]">Phòng&nbsp;1</span>
                            </div>
                            <div class="col-xs-12 fb-dark-gray">
                                <span class="fb-translate" data-key="adult" data-mode="2" data-fallback="" data-disablehtmlclean="false" data-nodefaultlanguagefallback="false" data-placeholders="[2]">2 người lớn</span>
                            </div>
                        </div>
                        <div class="hidden-xs col-sm-6" style="white-space: normal; padding-right: 0px;">
                            <p>
                                <span class="fb-translate" data-key="vnpha30475:roomtitle:Garden-View-Bungalow" data-mode="-1" data-fallback="Garden-View-Bungalow" data-disablehtmlclean="false" data-nodefaultlanguagefallback="false" data-placeholders="[]">Garden-View-Bungalow</span>
                            </p>
                            <p>
						<span>
							<span class="fb-translate" data-key="room-bed-types" data-mode="-1" data-fallback="Bedding" data-disablehtmlclean="false" data-nodefaultlanguagefallback="false" data-placeholders="[]">Lựa chọn giường</span>:
							<span class="fb-translate" data-key="__TypeOfBeds___Double" data-mode="-1" data-fallback="Double" data-disablehtmlclean="false" data-nodefaultlanguagefallback="false" data-placeholders="[]">Giường đôi</span>
						</span>
                            </p>
                            <p>
						<span class="bed-type-tooltip">(
							<span class="fb-translate" data-key="room-bed-types-tooltip" data-mode="-1" data-fallback="" data-disablehtmlclean="false" data-nodefaultlanguagefallback="false" data-placeholders="[]">tùy thuộc vào tình trạng sẵn có</span>)
						</span>
                            </p>
                            <p>
                                <span class="fb-translate" data-key="vnpha30475:promotiontitle:Online-Exclusive-Rate" data-mode="-1" data-fallback="Online Exclusive Rate" data-disablehtmlclean="false" data-nodefaultlanguagefallback="false" data-placeholders="[]">Online Exclusive Rate</span>
                            </p>
                            <p>
						<span>
							<span class="fb-translate" data-key="results-rate-meal-type-breakfast" data-mode="-1" data-fallback="" data-disablehtmlclean="false" data-nodefaultlanguagefallback="false" data-placeholders="[]">Bao gồm bữa sáng</span>:
							<span class="fb-translate" data-key="vnpha30475:mealtitle:Breakfast" data-mode="-1" data-fallback="Breakfast" data-disablehtmlclean="false" data-nodefaultlanguagefallback="false" data-placeholders="[]">Breakfast</span>
						</span>
                            </p>
                            <div class="mtm">
                                <a href="#" class="theme-link">
                                    <span class="fb-translate fb-font-bold" data-key="basket-room-remove" data-mode="-1" data-fallback="" data-disablehtmlclean="false" data-nodefaultlanguagefallback="false" data-placeholders="[]">Bỏ</span>
                                </a>
                            </div>
                        </div>
                        <div class="col-xs-6 col-sm-3">
                            <p class="fb-price-amount">
						<span class="fb-price campaign-price-barred" data-price="101.16137027145" data-symbol="true">
							<span>2.605.540&nbsp;
								<span class="fb-price-currency">₫</span>
							</span>
						</span>
                            </p>
                            <p class="fb-price-amount">
						<span class="fb-price price-new" data-price="91.045233244308" data-symbol="true" data-pricepoint="0">
							<span>2.344.986&nbsp;
								<span class="fb-price-currency">₫</span>
							</span>
						</span>
                            </p>
                        </div>
                        <div class="col-xs-12 hidden-sm hidden-md hidden-lg">
                            <p>
                                <span class="fb-translate" data-key="vnpha30475:roomtitle:Garden-View-Bungalow" data-mode="-1" data-fallback="Garden-View-Bungalow" data-disablehtmlclean="false" data-nodefaultlanguagefallback="false" data-placeholders="[]">Garden-View-Bungalow</span>
                            </p>
                            <p>
                                <span class="fb-translate" data-key="vnpha30475:promotiontitle:Online-Exclusive-Rate" data-mode="-1" data-fallback="Online Exclusive Rate" data-disablehtmlclean="false" data-nodefaultlanguagefallback="false" data-placeholders="[]">Online Exclusive Rate</span>
                            </p>
                            <div class="mtm">
                                <a href="#" class="theme-link">
                                    <span class="fb-translate fb-font-bold" data-key="basket-room-remove" data-mode="-1" data-fallback="" data-disablehtmlclean="false" data-nodefaultlanguagefallback="false" data-placeholders="[]">Bỏ</span>
                                </a>
                            </div>
                        </div>
                    </div>
                    <div id="fb-total-discount" class="fb-total-recap-discount container fb-container fb-light-bg row">
                        <div class="col-xs-6 fb-container mcm-discount-total">
                            <span class="fb-translate col-xs-12 fb-basket-header-total" data-key="mcm-basket-total-discount-applied" data-mode="-1" data-fallback="" data-disablehtmlclean="false" data-nodefaultlanguagefallback="false" data-placeholders="[]">Tổng giảm giá được áp dụng</span>
                        </div>
                        <div class="col-xs-6 fb-container mcm-discount-total-value" style="padding-left:20px;">
                            <div class="col-xs-12 fb-price-amount">
						<span class="fb-price" data-price="10.116137027142003" data-symbol="true">
							<span>260.554&nbsp;
								<span class="fb-price-currency">₫</span>
							</span>
						</span>
                            </div>
                        </div>
                    </div>
                    <div id="fb-recap-total" class="container fb-container fb-light-bg row">
                        <div class="col-xs-12 hidden-sm hidden-md hidden-lg">
                            <hr>
                        </div>
                        <div class="col-xs-5 col-sm-3 fb-total-title">
                            <span class="fb-translate" data-key="Total" data-mode="-1" data-fallback="" data-disablehtmlclean="false" data-nodefaultlanguagefallback="false" data-placeholders="[]">Tổng</span>
                        </div>
                        <div class="col-xs-7 col-sm-9 fb-price-amount">
						<span class="fb-price" data-price="91.045233244308" data-symbol="true" data-pricepoint="0">
							<span>2.344.986&nbsp;
								<span class="fb-price-currency">₫</span>
							</span>
						</span>
                        </div>
                        <div class="col-xs-12 col-sm-offset-2 col-sm-10">
                            <hr>
                        </div>
                        <div class="col-xs-6 col-sm-offset-2 col-sm-7 fb-dark-gray">
                            <span class="fb-translate" data-key="price-not-included-title" data-mode="-1" data-fallback="" data-disablehtmlclean="false" data-nodefaultlanguagefallback="false" data-placeholders="[]">Không bao gồm</span>:
                            <span class="fb-translate" data-key="taxes-services" data-mode="-1" data-fallback="" data-disablehtmlclean="false" data-nodefaultlanguagefallback="false" data-placeholders="[]">Phí dịch vụ</span>
                        </div>
                        <div class="col-xs-6 col-sm-3 fb-price-amount fb-price-tax">
							<span class="fb-price" data-price="4.5522616622154" data-symbol="true">
								<span>117.249&nbsp;
									<span class="fb-price-currency">₫</span>
								</span>
							</span>
                        </div>
                        <div class="col-xs-12 col-sm-offset-2 col-sm-10">
                            <hr>
                        </div>
                        <div class="col-xs-6 col-sm-offset-2 col-sm-7 fb-dark-gray">
                            <span class="fb-translate" data-key="price-not-included-title" data-mode="-1" data-fallback="" data-disablehtmlclean="false" data-nodefaultlanguagefallback="false" data-placeholders="[]">Không bao gồm</span>:
                            <span class="fb-translate" data-key="government-tax" data-mode="-1" data-fallback="" data-disablehtmlclean="false" data-nodefaultlanguagefallback="false" data-placeholders="[]">Thuế VAT</span>
                        </div>
                        <div class="col-xs-6 col-sm-3 fb-price-amount fb-price-tax">
								<span class="fb-price" data-price="9.5597494906523" data-symbol="true">
									<span>246.224&nbsp;
										<span class="fb-price-currency">₫</span>
									</span>
								</span>
                        </div>
                        <div class="col-xs-12 col-sm-10 col-sm-offset-2 recap-final-price">
                            <div class="fb-gray-bg col-xs-12 recap-final-price-box row">
                                <div class="col-xs-12 col-sm-8 fb-dark-gray recap-final-price-sentence">
                                    <span class="fb-translate" data-key="recap-final-price-to-be-paid-hotel" data-mode="-1" data-fallback="" data-disablehtmlclean="false" data-nodefaultlanguagefallback="false" data-placeholders="[]">The taxes which are not included are to be paid to the hotel. The total amount is:</span>
                                </div>
                                <div class="col-sm-4 col-xs-12 fb-price-amount fb-light-gray recap-final-price-price">
										<span class="fb-price" data-price="105.15724439717569" data-symbol="true">
											<span style="font-size:30px;">2.708.459&nbsp;
												<span class="fb-price-currency">₫</span>
											</span>
										</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="fb-recap-warrants" class="col-xs-12 col-md-4">
                    <div id="fb-widget-container" class="col-xs-12 col-sm-12 col-md-12 fb-container fb-light-bg"></div>
                    <div class="col-xs-12 col-sm-12 col-md-12 fb-warrant fb-container fb-light-bg">
                        <div class="col-xs-2 hidden-sm hidden-md hidden-lg fb-warrant-xspicto">
                            <img src="./img/zoom/icon-package-mealplan-breakfast.png" width="17" height="17" border="0" >
                        </div>
                        <div class="hidden-xs col-sm-12">
                            <img src="./img/zoom/icon-package-mealplan-breakfast.png" width="33" height="33" border="0" >
                        </div>
                        <div class="col-xs-10 col-sm-12 fb-font-bold fb-warrant-title">
                            <span class="fb-translate" data-key="results-rate-meal-type-breakfast" data-mode="-1" data-fallback="" data-disablehtmlclean="false" data-nodefaultlanguagefallback="false" data-placeholders="[]">Bao gồm bữa sáng</span>
                        </div>
                        <div class="col-xs-12 fb-dark-gray">
                            <span class="fb-translate" data-key="vnpha30475:mealtitle:Breakfast" data-mode="-1" data-fallback="Breakfast" data-disablehtmlclean="false" data-nodefaultlanguagefallback="false" data-placeholders="[]">Breakfast</span>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-12 col-md-12 fb-warrant fb-container fb-light-bg">
                        <div class="col-xs-2 hidden-sm hidden-md hidden-lg fb-warrant-xspicto">
                            <img src="./img/zoom/icon-package-salesterms-payment-online.png" width="17" height="17" border="0" >
                        </div>
                        <div class="hidden-xs col-sm-12">
                            <img src="./img/zoom/icon-package-salesterms-payment-online.png" width="33" height="33" border="0">
                        </div>
                        <div class="col-xs-10 col-sm-12 fb-font-bold fb-warrant-title">
                            <span class="fb-translate" data-key="results-rate-payment-internet" data-mode="-1" data-fallback="" data-disablehtmlclean="false" data-nodefaultlanguagefallback="false" data-placeholders="[]">Thanh toán ngay</span>
                        </div>
                        <div class="col-xs-12 fb-dark-gray">
                            <span class="fb-translate" data-key="warrant-prepaid-notice" data-mode="-1" data-fallback="" data-disablehtmlclean="false" data-nodefaultlanguagefallback="false" data-placeholders="[]">Vui lòng thanh toán toàn bộ tiền đặt phòng trực tuyến trên một giao diện an toàn.</span>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-12 col-md-12 fb-warrant fb-container fb-light-bg">
                        <div class="col-xs-2 hidden-sm hidden-md hidden-lg fb-warrant-xspicto">
                            <img src="./img/zoom/icon-package-salesterms-cross.png" width="17" height="17" border="0">
                        </div>
                        <div class="hidden-xs col-sm-12">
                            <img src="./img/zoom/icon-package-salesterms-cross.png" width="33" height="33" border="0" >
                        </div>
                        <div class="col-xs-10 col-sm-12 fb-font-bold fb-warrant-title">
                            <span class="fb-translate" data-key="warrant-cancellable-not-amendable" data-mode="-1" data-fallback="" data-disablehtmlclean="false" data-nodefaultlanguagefallback="false" data-placeholders="[]">Không thể hủy và thay đổi</span>
                        </div>
                        <div class="col-xs-12 fb-dark-gray" style="min-height:20px;"></div>
                    </div>
                </div>
            </div>
            </div>
            <div id="fb-recap-extras-container" class="container fb-container fb-light-bg">
                <div id="fb-extras-request" class="col-xs-12 fb-light-bg" style="padding-top: 20px;">
                    <label class="fb-font-light">
                        <span class="fb-translate" data-key="collect-special-request" data-mode="-1" data-fallback="" data-disablehtmlclean="false" data-nodefaultlanguagefallback="false" data-placeholders="[]">Yêu cầu đặc biệt</span>
                    </label>
                    <form class="col-xs-12 bound" novalidate="novalidate">
                        <div class="fb-comment-block-container">
                            <label>
                                <span class="fb-translate" data-key="extras-request-placeholder" data-mode="-1" data-fallback="" data-disablehtmlclean="false" data-nodefaultlanguagefallback="false" data-placeholders="[]">Vui lòng cung cấp thêm thông tin: thời gian đến, dị ứng đồ ăn...</span>
                            </label>
                            <textarea class="form-control" rows="6" name="fb-comment-block" maxlength="500"></textarea>
                            <span class="fb-dark-gray">0/500</span>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!---->
<div class="container" id="div-payment-end"style="display: flex">
          <!--thông tin người dùng-->
        <div id="fb-datacollect">
            <div class="fb-inner-container">
                <div class="col-xs-12 col-md-6 fb-collect-half fb-container fb-datacollect-container" style="height: 900px;max-width: 100%!important;">
                    <div class="col-sm-offset-2 col-sm-8 col-md-10 col-md-offset-1 fb-container">
                        <div class="col-xs-12 fb-welcome fb-font-light">
                            <span class="fb-translate" data-key="traveller-title" data-mode="-1" data-fallback="" data-disablehtmlclean="false" data-nodefaultlanguagefallback="false" data-placeholders="[]">Thông tin khách</span>
                        </div>
                        <div class="col-xs-12 fb-font-bold input-language-suggestion" style="color: green; padding-bottom:15px;">
                            <span class="fb-translate" data-key="input-language-suggestion" data-mode="-1" data-fallback="" data-disablehtmlclean="false" data-nodefaultlanguagefallback="false" data-placeholders="[]">Vui lòng nhập thông tin cá nhân của quý khách bằng tiếng Anh</span>
                        </div>
                        <form role="form" name="buyerForm" method="post" onsubmit="event.preventDefault();return false;" class="bound" novalidate="novalidate">
                            <div class="form-group container">
                                <label for="buyer-email">
                                    <span class="fb-translate" data-key="traveller-email" data-mode="-1" data-fallback="" data-disablehtmlclean="false" data-nodefaultlanguagefallback="false" data-placeholders="[]">Địa chỉ email</span>
                                    <span class="mandatory-field-asterisk">*</span>
                                </label>
                                <input type="email" class="form-control" id="buyer-email" name="email" required="required" value="" placeholder="abc@xyz.com">
                            </div>
                            <div class="form-group container">
                                <label for="buyer-title" class="col-xs-12 fb-container">
                                    <span class="fb-translate" data-key="traveller-honorific" data-mode="-1" data-fallback="" data-disablehtmlclean="false" data-nodefaultlanguagefallback="false" data-placeholders="[]">Danh xưng</span>
                                    <span class="mandatory-field-asterisk">*</span>
                                </label>
                                <div class="btn-group" data-toggle="buttons">
                                    <label class="btn btn-default active">
                                        <input type="radio" name="buyer-honorific-prefix" value="Mr." autocomplete="buyer-honorific-prefix" id="buyer-honorific-Mr." checked="checked">
                                        <span class="fb-translate" data-key="honorific-mr" data-mode="-1" data-fallback="Mr." data-disablehtmlclean="false" data-nodefaultlanguagefallback="false" data-placeholders="[]">Ông</span>
                                    </label>
                                    <label class="btn btn-default">
                                        <input type="radio" name="buyer-honorific-prefix" value="Ms." autocomplete="buyer-honorific-prefix" id="buyer-honorific-Ms.">
                                        <span class="fb-translate" data-key="honorific-ms" data-mode="-1" data-fallback="Ms." data-disablehtmlclean="false" data-nodefaultlanguagefallback="false" data-placeholders="[]">Cô</span>
                                    </label>
                                    <label class="btn btn-default">
                                        <input type="radio" name="buyer-honorific-prefix" value="Mrs." autocomplete="buyer-honorific-prefix" id="buyer-honorific-Mrs.">
                                        <span class="fb-translate" data-key="honorific-mrs" data-mode="-1" data-fallback="Mrs." data-disablehtmlclean="false" data-nodefaultlanguagefallback="false" data-placeholders="[]">Bà</span>
                                    </label>
                                    <label class="btn btn-default">
                                        <input type="radio" name="buyer-honorific-prefix" value="Dr." autocomplete="buyer-honorific-prefix" id="buyer-honorific-Dr.">
                                        <span class="fb-translate" data-key="honorific-dr" data-mode="-1" data-fallback="Dr." data-disablehtmlclean="false" data-nodefaultlanguagefallback="false" data-placeholders="[]">Tiến sĩ</span>
                                    </label>
                                </div>
                            </div>
                            <div class="form-group container">
                                <label for="buyer-firstname">
                                    <span class="fb-translate" data-key="traveller-firstname" data-mode="-1" data-fallback="" data-disablehtmlclean="false" data-nodefaultlanguagefallback="false" data-placeholders="[]">Tên</span>
                                </label>
                                <span class="mandatory-field-asterisk">*</span>
                                <input type="text" class="form-control fb-translate" id="buyer-firstname" name="buyer-given-name" required="required" autocomplete="buyer-given-name" value="" placeholder="">
                            </div>
                            <div class="form-group container">
                                <label for="buyer-lastname">
                                    <span class="fb-translate" data-key="traveller-lastname" data-mode="-1" data-fallback="" data-disablehtmlclean="false" data-nodefaultlanguagefallback="false" data-placeholders="[]">Họ</span>
                                </label>
                                <span class="mandatory-field-asterisk">*</span>
                                <input type="text" class="form-control fb-translate" id="buyer-lastname" name="buyer-family-name" required="required" autocomplete="buyer-family-name" value="" placeholder="">
                            </div>
                            <div class="form-group container">
                                <label for="buyer-address">
                                    <span class="fb-translate" data-key="traveller-address" data-mode="-1" data-fallback="" data-disablehtmlclean="false" data-nodefaultlanguagefallback="false" data-placeholders="[]">Địa chỉ</span>
                                    <span class="mandatory-field-asterisk">*</span>
                                </label>
                                <input type="text" class="form-control" id="buyer-address" name="buyeraddress" required="required">
                            </div>
                            <div class="form-group container">
                                <label for="buyer-zip-code">
                                    <span class="fb-translate" data-key="traveller-zip-code" data-mode="-1" data-fallback="" data-disablehtmlclean="false" data-nodefaultlanguagefallback="false" data-placeholders="[]">Mã bưu chính</span>
                                    <span class="mandatory-field-asterisk">*</span>
                                </label>
                                <input type="text" class="form-control" id="buyer-zip-code" name="buyerzipcode" required="required">
                            </div>
                            <div class="form-group container">
                                <label for="buyer-city">
                                    <span class="fb-translate" data-key="traveller-city" data-mode="-1" data-fallback="" data-disablehtmlclean="false" data-nodefaultlanguagefallback="false" data-placeholders="[]">Thành phố</span>
                                    <span class="mandatory-field-asterisk">*</span>
                                </label>
                                <input type="text" class="form-control" id="buyer-city" name="buyercity" required="required">
                            </div>
                            <div class="form-group container">
                                <label for="buyer-country" class="col-xs-12 fb-container">
                                    <span class="fb-translate" data-key="quicksearch-country" data-mode="-1" data-fallback="" data-disablehtmlclean="false" data-nodefaultlanguagefallback="false" data-placeholders="[]">Quốc gia / Vùng</span>
                                    <span class="mandatory-field-asterisk">*</span>
                                </label>
                                <div class="col-xs-5 fb-container">
                                    <select class="form-control" name="buyer-country" id="buyer-country" required="required" autocomplete="country-code">
                                        <option value="">&nbsp;</option>
                                        <option value="AF" data-country="AF">Afghanistan</option>
                                        <option value="EG" data-country="EG">Ai Cập</option>
                                        <option value="IE" data-country="IE">Ai-len</option>
                                        <option value="AL" data-country="AL">Albani</option>
                                        <option value="DZ" data-country="DZ">Algeria</option>
                                        <option value="AD" data-country="AD">Andorra</option>
                                        <option value="AO" data-country="AO">Angola</option>
                                        <option value="AI" data-country="AI">Anguilla</option>
                                        <option value="AG" data-country="AG">Antigua và Barbuda</option>
                                        <option value="AR" data-country="AR">Argentina</option>
                                        <option value="AM" data-country="AM">Armenia</option>
                                        <option value="AW" data-country="AW">Aruba</option>
                                        <option value="AZ" data-country="AZ">Azerbaijan</option>
                                        <option value="PL" data-country="PL">Ba Lan</option>
                                        <option value="BS" data-country="BS">Bahamas</option>
                                        <option value="BH" data-country="BH">Bahrain</option>
                                        <option value="BD" data-country="BD">Bangladesh</option>
                                        <option value="BB" data-country="BB">Barbados</option>
                                        <option value="BY" data-country="BY">Belarus</option>
                                        <option value="BZ" data-country="BZ">Belize</option>
                                        <option value="BJ" data-country="BJ">Benin</option>
                                        <option value="BM" data-country="BM">Bermuda</option>
                                        <option value="BT" data-country="BT">Bhutan</option>
                                        <option value="BO" data-country="BO">Bolivia</option>
                                        <option value="BA" data-country="BA">Bosnia và Herzegovina</option>
                                        <option value="BW" data-country="BW">Botswana</option>
                                        <option value="BR" data-country="BR">Brazil</option>
                                        <option value="BN" data-country="BN">Brunei</option>
                                        <option value="BG" data-country="BG">Bungari</option>
                                        <option value="BF" data-country="BF">Burkina Faso</option>
                                        <option value="BI" data-country="BI">Burundi</option>
                                        <option value="BE" data-country="BE">Bỉ</option>
                                        <option value="PT" data-country="PT">Bồ Đào Nha</option>
                                        <option value="CM" data-country="CM">Cameroon</option>
                                        <option value="KH" data-country="KH">Campuchia</option>
                                        <option value="CA" data-country="CA">Canada</option>
                                        <option value="CV" data-country="CV">Cape Verde</option>
                                        <option value="TD" data-country="TD">Chad</option>
                                        <option value="CL" data-country="CL">Chile</option>
                                        <option value="CO" data-country="CO">Colombia</option>
                                        <option value="KM" data-country="KM">Comoros</option>
                                        <option value="CG" data-country="CG">Congo - Brazzaville</option>
                                        <option value="CD" data-country="CD">Congo - Kinshasa</option>
                                        <option value="CR" data-country="CR">Costa Rica</option>
                                        <option value="HR" data-country="HR">Croatia</option>
                                        <option value="CU" data-country="CU">Cuba</option>
                                        <option value="AE" data-country="AE">Các Tiểu Vương quốc Ả Rập Thống nhất</option>
                                        <option value="UM" data-country="UM">Các đảo nhỏ xa trung tâm thuộc Mỹ</option>
                                        <option value="KW" data-country="KW">Cô-oét</option>
                                        <option value="CI" data-country="CI">Côte d’Ivoire</option>
                                        <option value="DO" data-country="DO">Cộng hòa Dominica</option>
                                        <option value="CZ" data-country="CZ">Cộng hòa Séc</option>
                                        <option value="CF" data-country="CF">Cộng hòa Trung Phi</option>
                                        <option value="DJ" data-country="DJ">Djibouti</option>
                                        <option value="DM" data-country="DM">Dominica</option>
                                        <option value="EC" data-country="EC">Ecuador</option>
                                        <option value="SV" data-country="SV">El Salvador</option>
                                        <option value="ER" data-country="ER">Eritrea</option>
                                        <option value="EE" data-country="EE">Estonia</option>
                                        <option value="ET" data-country="ET">Ethiopia</option>
                                        <option value="FJ" data-country="FJ">Fiji</option>
                                        <option value="GA" data-country="GA">Gabon</option>
                                        <option value="GM" data-country="GM">Gambia</option>
                                        <option value="GE" data-country="GE">Georgia</option>
                                        <option value="GH" data-country="GH">Ghana</option>
                                        <option value="GI" data-country="GI">Gibraltar</option>
                                        <option value="GL" data-country="GL">Greenland</option>
                                        <option value="GD" data-country="GD">Grenada</option>
                                        <option value="GP" data-country="GP">Guadeloupe</option>
                                        <option value="GU" data-country="GU">Guam</option>
                                        <option value="GT" data-country="GT">Guatemala</option>
                                        <option value="GG" data-country="GG">Guernsey</option>
                                        <option value="GN" data-country="GN">Guinea</option>
                                        <option value="GQ" data-country="GQ">Guinea Xích Đạo</option>
                                        <option value="GW" data-country="GW">Guinea-Bissau</option>
                                        <option value="GY" data-country="GY">Guyana</option>
                                        <option value="HT" data-country="HT">Haiti</option>
                                        <option value="US" data-country="US">Hoa Kỳ</option>
                                        <option value="HN" data-country="HN">Honduras</option>
                                        <option value="HU" data-country="HU">Hungari</option>
                                        <option value="GR" data-country="GR">Hy Lạp</option>
                                        <option value="NL" data-country="NL">Hà Lan</option>
                                        <option value="KR" data-country="KR">Hàn Quốc</option>
                                        <option value="IQ" data-country="IQ">I-rắc</option>
                                        <option value="IS" data-country="IS">Iceland</option>
                                        <option value="ID" data-country="ID">Indonesia</option>
                                        <option value="IR" data-country="IR">Iran</option>
                                        <option value="IL" data-country="IL">Israel</option>
                                        <option value="JM" data-country="JM">Jamaica</option>
                                        <option value="JO" data-country="JO">Jordan</option>
                                        <option value="KZ" data-country="KZ">Kazakhstan</option>
                                        <option value="KE" data-country="KE">Kenya</option>
                                        <option value="KI" data-country="KI">Kiribati</option>
                                        <option value="KG" data-country="KG">Kyrgyzstan</option>
                                        <option value="LR" data-country="LR">LIberia</option>
                                        <option value="LV" data-country="LV">Latvia</option>
                                        <option value="LS" data-country="LS">Lesotho</option>
                                        <option value="LY" data-country="LY">Li-bi</option>
                                        <option value="LB" data-country="LB">Li-băng</option>
                                        <option value="LI" data-country="LI">Liechtenstein</option>
                                        <option value="LU" data-country="LU">Luxembourg</option>
                                        <option value="LA" data-country="LA">Lào</option>
                                        <option value="PS" data-country="PS">Lãnh thổ Palestine</option>
                                        <option value="LT" data-country="LT">Lít-va</option>
                                        <option value="MA" data-country="MA">Ma-rốc</option>
                                        <option value="MK" data-country="MK">Macedonia</option>
                                        <option value="MG" data-country="MG">Madagascar</option>
                                        <option value="MW" data-country="MW">Malawi</option>
                                        <option value="MY" data-country="MY">Malaysia</option>
                                        <option value="MV" data-country="MV">Maldives</option>
                                        <option value="ML" data-country="ML">Mali</option>
                                        <option value="MT" data-country="MT">Malta</option>
                                        <option value="MQ" data-country="MQ">Martinique</option>
                                        <option value="MR" data-country="MR">Mauritania</option>
                                        <option value="MU" data-country="MU">Mauritius</option>
                                        <option value="YT" data-country="YT">Mayotte</option>
                                        <option value="MX" data-country="MX">Mexico</option>
                                        <option value="FM" data-country="FM">Micronesia</option>
                                        <option value="MD" data-country="MD">Moldova</option>
                                        <option value="MC" data-country="MC">Monaco</option>
                                        <option value="ME" data-country="ME">Montenegro</option>
                                        <option value="MS" data-country="MS">Montserrat</option>
                                        <option value="MZ" data-country="MZ">Mozambique</option>
                                        <option value="MM" data-country="MM">Myanmar (Miến Điện)</option>
                                        <option value="MN" data-country="MN">Mông Cổ</option>
                                        <option value="NO" data-country="NO">Na Uy</option>
                                        <option value="AQ" data-country="AQ">Nam Cực</option>
                                        <option value="ZA" data-country="ZA">Nam Phi</option>
                                        <option value="NA" data-country="NA">Namibia</option>
                                        <option value="NR" data-country="NR">Nauru</option>
                                        <option value="NP" data-country="NP">Nepal</option>
                                        <option value="NC" data-country="NC">New Caledonia</option>
                                        <option value="NZ" data-country="NZ">New Zealand</option>
                                        <option value="RU" data-country="RU">Nga</option>
                                        <option value="JP" data-country="JP">Nhật Bản</option>
                                        <option value="NI" data-country="NI">Nicaragua</option>
                                        <option value="NE" data-country="NE">Niger</option>
                                        <option value="NG" data-country="NG">Nigeria</option>
                                        <option value="NU" data-country="NU">Niue</option>
                                        <option value="OM" data-country="OM">Oman</option>
                                        <option value="PK" data-country="PK">Pakistan</option>
                                        <option value="PW" data-country="PW">Palau</option>
                                        <option value="PA" data-country="PA">Panama</option>
                                        <option value="PG" data-country="PG">Papua New Guinea</option>
                                        <option value="PY" data-country="PY">Paraguay</option>
                                        <option value="PE" data-country="PE">Peru</option>
                                        <option value="PH" data-country="PH">Philippin</option>
                                        <option value="FR" data-country="FR">Pháp</option>
                                        <option value="FI" data-country="FI">Phần Lan</option>
                                        <option value="PF" data-country="PF">Polynesia thuộc Pháp</option>
                                        <option value="PR" data-country="PR">Puerto Rico</option>
                                        <option value="QA" data-country="QA">Qatar</option>
                                        <option value="GF" data-country="GF">Quiana thuộc Pháp</option>
                                        <option value="MP" data-country="MP">Quần đảo Bắc Mariana</option>
                                        <option value="KY" data-country="KY">Quần đảo Cayman</option>
                                        <option value="CC" data-country="CC">Quần đảo Cocos</option>
                                        <option value="CK" data-country="CK">Quần đảo Cook</option>
                                        <option value="FK" data-country="FK">Quần đảo Falkland</option>
                                        <option value="FO" data-country="FO">Quần đảo Faroe</option>
                                        <option value="MH" data-country="MH">Quần đảo Marshall</option>
                                        <option value="GS" data-country="GS">Quần đảo Nam Georgia và Nam Sandwich</option>
                                        <option value="PN" data-country="PN">Quần đảo Pitcairn</option>
                                        <option value="SB" data-country="SB">Quần đảo Solomon</option>
                                        <option value="TC" data-country="TC">Quần đảo Turk và Caicos</option>
                                        <option value="VG" data-country="VG">Quần đảo Virgin thuộc Anh</option>
                                        <option value="VI" data-country="VI">Quần đảo Virgin thuộc Mỹ</option>
                                        <option value="RO" data-country="RO">Romania</option>
                                        <option value="RW" data-country="RW">Rwanda</option>
                                        <option value="RE" data-country="RE">Réunion</option>
                                        <option value="BL" data-country="BL">Saint Barthélemy</option>
                                        <option value="SH" data-country="SH">Saint Helena</option>
                                        <option value="KN" data-country="KN">Saint Kitts và Nevis</option>
                                        <option value="LC" data-country="LC">Saint Lucia</option>
                                        <option value="MF" data-country="MF">Saint Martin</option>
                                        <option value="PM" data-country="PM">Saint Pierre và Miquelon</option>
                                        <option value="VC" data-country="VC">Saint Vincent và Grenadines</option>
                                        <option value="WS" data-country="WS">Samoa</option>
                                        <option value="SM" data-country="SM">San Marino</option>
                                        <option value="SN" data-country="SN">Senegal</option>
                                        <option value="RS" data-country="RS">Serbia</option>
                                        <option value="SC" data-country="SC">Seychelles</option>
                                        <option value="SL" data-country="SL">Sierra Leone</option>
                                        <option value="SG" data-country="SG">Singapore</option>
                                        <option value="SK" data-country="SK">Slovakia</option>
                                        <option value="SI" data-country="SI">Slovenia</option>
                                        <option value="SO" data-country="SO">Somali</option>
                                        <option value="LK" data-country="LK">Sri Lanka</option>
                                        <option value="SD" data-country="SD">Sudan</option>
                                        <option value="SR" data-country="SR">Suriname</option>
                                        <option value="SZ" data-country="SZ">Swaziland</option>
                                        <option value="SY" data-country="SY">Syria</option>
                                        <option value="ST" data-country="ST">São Tomé và Príncipe</option>
                                        <option value="CY" data-country="CY">Síp</option>
                                        <option value="TJ" data-country="TJ">Tajikistan</option>
                                        <option value="TZ" data-country="TZ">Tanzania</option>
                                        <option value="TF" data-country="TF">Thuộc địa Miền Nam của Pháp</option>
                                        <option value="VA" data-country="VA">Thành Vatican</option>
                                        <option value="TH" data-country="TH">Thái Lan</option>
                                        <option value="TR" data-country="TR">Thổ Nhĩ Kỳ</option>
                                        <option value="CH" data-country="CH">Thụy Sĩ</option>
                                        <option value="SE" data-country="SE">Thụy Điển</option>
                                        <option value="TL" data-country="TL">Timor-Leste</option>
                                        <option value="TG" data-country="TG">Togo</option>
                                        <option value="TK" data-country="TK">Tokelau</option>
                                        <option value="TO" data-country="TO">Tonga</option>
                                        <option value="TT" data-country="TT">Trinidad và Tobago</option>
                                        <option value="KP" data-country="KP">Triều Tiên</option>
                                        <option value="CN" data-country="CN">Trung Quốc</option>
                                        <option value="TN" data-country="TN">Tunisia</option>
                                        <option value="TM" data-country="TM">Turkmenistan</option>
                                        <option value="TV" data-country="TV">Tuvalu</option>
                                        <option value="ES" data-country="ES">Tây Ban Nha</option>
                                        <option value="AN" data-country="AN">Tây Ấn Hà Lan</option>
                                        <option value="UG" data-country="UG">Uganda</option>
                                        <option value="UA" data-country="UA">Ukraina</option>
                                        <option value="UY" data-country="UY">Uruguay</option>
                                        <option value="UZ" data-country="UZ">Uzbekistan</option>
                                        <option value="VU" data-country="VU">Vanuatu</option>
                                        <option value="VE" data-country="VE">Venezuela</option>
                                        <option value="VN" data-country="VN" selected="selected">Việt Nam</option>
                                        <option value="GB" data-country="GB">Vương quốc Anh</option>
                                        <option value="WF" data-country="WF">Wallis và Futuna</option>
                                        <option value="YE" data-country="YE">Yemen</option>
                                        <option value="ZM" data-country="ZM">Zambia</option>
                                        <option value="ZW" data-country="ZW">Zimbabwe</option>
                                        <option value="AT" data-country="AT">Áo</option>
                                        <option value="AU" data-country="AU">Úc</option>
                                        <option value="IT" data-country="IT">Ý</option>
                                        <option value="DK" data-country="DK">Đan Mạch</option>
                                        <option value="TW" data-country="TW">Đài Loan</option>
                                        <option value="CX" data-country="CX">Đảo Giáng Sinh</option>
                                        <option value="HM" data-country="HM">Đảo Heard và Quần đảo McDonald</option>
                                        <option value="IM" data-country="IM">Đảo Man</option>
                                        <option value="NF" data-country="NF">Đảo Norfolk</option>
                                        <option value="AS" data-country="AS">Đảo Somoa thuộc Mỹ</option>
                                        <option value="HK" data-country="HK">Đặc khu hành chính Hồng Kông - Trung Quốc</option>
                                        <option value="MO" data-country="MO">Đặc khu hành chính Macao - Trung Quốc</option>
                                        <option value="DE" data-country="DE">Đức</option>
                                        <option value="SA" data-country="SA">Ả Rập Xê-út</option>
                                        <option value="IN" data-country="IN">Ấn Độ</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group container">
                                <label for="buyer-phone" class="col-xs-12 fb-container">
                                    <span class="fb-translate" data-key="traveller-phone" data-mode="-1" data-fallback="" data-disablehtmlclean="false" data-nodefaultlanguagefallback="false" data-placeholders="[]">Số điện thoại</span>
                                    <span class="mandatory-field-asterisk">*</span>
                                </label>
                                <div class="col-xs-5 fb-container">
                                    <select class="form-control" name="buyer-phone-ext" id="buyer-phone-ext" required="required" autocomplete="tel-country-code">
                                        <option value="">&nbsp;</option>
                                        <option value="93" data-country="AF">Afghanistan (+93)</option>
                                        <option value="20" data-country="EG">Ai Cập (+20)</option>
                                        <option value="353" data-country="IE">Ai-len (+353)</option>
                                        <option value="355" data-country="AL">Albani (+355)</option>
                                        <option value="213" data-country="DZ">Algeria (+213)</option>
                                        <option value="376" data-country="AD">Andorra (+376)</option>
                                        <option value="244" data-country="AO">Angola (+244)</option>
                                        <option value="1264" data-country="AI">Anguilla (+1264)</option>
                                        <option value="1268" data-country="AG">Antigua và Barbuda (+1268)</option>
                                        <option value="54" data-country="AR">Argentina (+54)</option>
                                        <option value="374" data-country="AM">Armenia (+374)</option>
                                        <option value="297" data-country="AW">Aruba (+297)</option>
                                        <option value="994" data-country="AZ">Azerbaijan (+994)</option>
                                        <option value="48" data-country="PL">Ba Lan (+48)</option>
                                        <option value="1242" data-country="BS">Bahamas (+1242)</option>
                                        <option value="973" data-country="BH">Bahrain (+973)</option>
                                        <option value="880" data-country="BD">Bangladesh (+880)</option>
                                        <option value="1246" data-country="BB">Barbados (+1246)</option>
                                        <option value="375" data-country="BY">Belarus (+375)</option>
                                        <option value="501" data-country="BZ">Belize (+501)</option>
                                        <option value="229" data-country="BJ">Benin (+229)</option>
                                        <option value="1441" data-country="BM">Bermuda (+1441)</option>
                                        <option value="975" data-country="BT">Bhutan (+975)</option>
                                        <option value="591" data-country="BO">Bolivia (+591)</option>
                                        <option value="387" data-country="BA">Bosnia và Herzegovina (+387)</option>
                                        <option value="267" data-country="BW">Botswana (+267)</option>
                                        <option value="55" data-country="BR">Brazil (+55)</option>
                                        <option value="673" data-country="BN">Brunei (+673)</option>
                                        <option value="359" data-country="BG">Bungari (+359)</option>
                                        <option value="226" data-country="BF">Burkina Faso (+226)</option>
                                        <option value="257" data-country="BI">Burundi (+257)</option>
                                        <option value="32" data-country="BE">Bỉ (+32)</option>
                                        <option value="351" data-country="PT">Bồ Đào Nha (+351)</option>
                                        <option value="237" data-country="CM">Cameroon (+237)</option>
                                        <option value="855" data-country="KH">Campuchia (+855)</option>
                                        <option value="1" data-country="CA">Canada (+1)</option>
                                        <option value="238" data-country="CV">Cape Verde (+238)</option>
                                        <option value="235" data-country="TD">Chad (+235)</option>
                                        <option value="56" data-country="CL">Chile (+56)</option>
                                        <option value="57" data-country="CO">Colombia (+57)</option>
                                        <option value="269" data-country="KM">Comoros (+269)</option>
                                        <option value="242" data-country="CG">Congo - Brazzaville (+242)</option>
                                        <option value="243" data-country="CD">Congo - Kinshasa (+243)</option>
                                        <option value="506" data-country="CR">Costa Rica (+506)</option>
                                        <option value="385" data-country="HR">Croatia (+385)</option>
                                        <option value="53" data-country="CU">Cuba (+53)</option>
                                        <option value="971" data-country="AE">Các Tiểu Vương quốc Ả Rập Thống nhất (+971)</option>
                                        <option value="1" data-country="UM">Các đảo nhỏ xa trung tâm thuộc Mỹ (+1)</option>
                                        <option value="965" data-country="KW">Cô-oét (+965)</option>
                                        <option value="225" data-country="CI">Côte d’Ivoire (+225)</option>
                                        <option value="1809" data-country="DO">Cộng hòa Dominica (+1809)</option>
                                        <option value="420" data-country="CZ">Cộng hòa Séc (+420)</option>
                                        <option value="236" data-country="CF">Cộng hòa Trung Phi (+236)</option>
                                        <option value="253" data-country="DJ">Djibouti (+253)</option>
                                        <option value="1767" data-country="DM">Dominica (+1767)</option>
                                        <option value="593" data-country="EC">Ecuador (+593)</option>
                                        <option value="503" data-country="SV">El Salvador (+503)</option>
                                        <option value="291" data-country="ER">Eritrea (+291)</option>
                                        <option value="372" data-country="EE">Estonia (+372)</option>
                                        <option value="251" data-country="ET">Ethiopia (+251)</option>
                                        <option value="679" data-country="FJ">Fiji (+679)</option>
                                        <option value="241" data-country="GA">Gabon (+241)</option>
                                        <option value="220" data-country="GM">Gambia (+220)</option>
                                        <option value="995" data-country="GE">Georgia (+995)</option>
                                        <option value="233" data-country="GH">Ghana (+233)</option>
                                        <option value="350" data-country="GI">Gibraltar (+350)</option>
                                        <option value="299" data-country="GL">Greenland (+299)</option>
                                        <option value="1473" data-country="GD">Grenada (+1473)</option>
                                        <option value="590" data-country="GP">Guadeloupe (+590)</option>
                                        <option value="1671" data-country="GU">Guam (+1671)</option>
                                        <option value="502" data-country="GT">Guatemala (+502)</option>
                                        <option value="44" data-country="GG">Guernsey (+44)</option>
                                        <option value="224" data-country="GN">Guinea (+224)</option>
                                        <option value="240" data-country="GQ">Guinea Xích Đạo (+240)</option>
                                        <option value="245" data-country="GW">Guinea-Bissau (+245)</option>
                                        <option value="592" data-country="GY">Guyana (+592)</option>
                                        <option value="509" data-country="HT">Haiti (+509)</option>
                                        <option value="1" data-country="US">Hoa Kỳ (+1)</option>
                                        <option value="504" data-country="HN">Honduras (+504)</option>
                                        <option value="36" data-country="HU">Hungari (+36)</option>
                                        <option value="30" data-country="GR">Hy Lạp (+30)</option>
                                        <option value="31" data-country="NL">Hà Lan (+31)</option>
                                        <option value="82" data-country="KR">Hàn Quốc (+82)</option>
                                        <option value="964" data-country="IQ">I-rắc (+964)</option>
                                        <option value="354" data-country="IS">Iceland (+354)</option>
                                        <option value="62" data-country="ID">Indonesia (+62)</option>
                                        <option value="98" data-country="IR">Iran (+98)</option>
                                        <option value="972" data-country="IL">Israel (+972)</option>
                                        <option value="1876" data-country="JM">Jamaica (+1876)</option>
                                        <option value="962" data-country="JO">Jordan (+962)</option>
                                        <option value="7" data-country="KZ">Kazakhstan (+7)</option>
                                        <option value="254" data-country="KE">Kenya (+254)</option>
                                        <option value="686" data-country="KI">Kiribati (+686)</option>
                                        <option value="996" data-country="KG">Kyrgyzstan (+996)</option>
                                        <option value="231" data-country="LR">LIberia (+231)</option>
                                        <option value="371" data-country="LV">Latvia (+371)</option>
                                        <option value="266" data-country="LS">Lesotho (+266)</option>
                                        <option value="218" data-country="LY">Li-bi (+218)</option>
                                        <option value="961" data-country="LB">Li-băng (+961)</option>
                                        <option value="423" data-country="LI">Liechtenstein (+423)</option>
                                        <option value="352" data-country="LU">Luxembourg (+352)</option>
                                        <option value="856" data-country="LA">Lào (+856)</option>
                                        <option value="970" data-country="PS">Lãnh thổ Palestine (+970)</option>
                                        <option value="370" data-country="LT">Lít-va (+370)</option>
                                        <option value="212" data-country="MA">Ma-rốc (+212)</option>
                                        <option value="389" data-country="MK">Macedonia (+389)</option>
                                        <option value="261" data-country="MG">Madagascar (+261)</option>
                                        <option value="265" data-country="MW">Malawi (+265)</option>
                                        <option value="60" data-country="MY">Malaysia (+60)</option>
                                        <option value="960" data-country="MV">Maldives (+960)</option>
                                        <option value="223" data-country="ML">Mali (+223)</option>
                                        <option value="356" data-country="MT">Malta (+356)</option>
                                        <option value="596" data-country="MQ">Martinique (+596)</option>
                                        <option value="222" data-country="MR">Mauritania (+222)</option>
                                        <option value="230" data-country="MU">Mauritius (+230)</option>
                                        <option value="262" data-country="YT">Mayotte (+262)</option>
                                        <option value="52" data-country="MX">Mexico (+52)</option>
                                        <option value="691" data-country="FM">Micronesia (+691)</option>
                                        <option value="373" data-country="MD">Moldova (+373)</option>
                                        <option value="377" data-country="MC">Monaco (+377)</option>
                                        <option value="382" data-country="ME">Montenegro (+382)</option>
                                        <option value="1664" data-country="MS">Montserrat (+1664)</option>
                                        <option value="258" data-country="MZ">Mozambique (+258)</option>
                                        <option value="95" data-country="MM">Myanmar (Miến Điện) (+95)</option>
                                        <option value="976" data-country="MN">Mông Cổ (+976)</option>
                                        <option value="47" data-country="NO">Na Uy (+47)</option>
                                        <option value="672" data-country="AQ">Nam Cực (+672)</option>
                                        <option value="27" data-country="ZA">Nam Phi (+27)</option>
                                        <option value="264" data-country="NA">Namibia (+264)</option>
                                        <option value="674" data-country="NR">Nauru (+674)</option>
                                        <option value="977" data-country="NP">Nepal (+977)</option>
                                        <option value="687" data-country="NC">New Caledonia (+687)</option>
                                        <option value="64" data-country="NZ">New Zealand (+64)</option>
                                        <option value="7" data-country="RU">Nga (+7)</option>
                                        <option value="81" data-country="JP">Nhật Bản (+81)</option>
                                        <option value="505" data-country="NI">Nicaragua (+505)</option>
                                        <option value="227" data-country="NE">Niger (+227)</option>
                                        <option value="234" data-country="NG">Nigeria (+234)</option>
                                        <option value="683" data-country="NU">Niue (+683)</option>
                                        <option value="968" data-country="OM">Oman (+968)</option>
                                        <option value="92" data-country="PK">Pakistan (+92)</option>
                                        <option value="680" data-country="PW">Palau (+680)</option>
                                        <option value="507" data-country="PA">Panama (+507)</option>
                                        <option value="675" data-country="PG">Papua New Guinea (+675)</option>
                                        <option value="595" data-country="PY">Paraguay (+595)</option>
                                        <option value="51" data-country="PE">Peru (+51)</option>
                                        <option value="63" data-country="PH">Philippin (+63)</option>
                                        <option value="33" data-country="FR">Pháp (+33)</option>
                                        <option value="358" data-country="FI">Phần Lan (+358)</option>
                                        <option value="689" data-country="PF">Polynesia thuộc Pháp (+689)</option>
                                        <option value="1" data-country="PR">Puerto Rico (+1)</option>
                                        <option value="974" data-country="QA">Qatar (+974)</option>
                                        <option value="594" data-country="GF">Quiana thuộc Pháp (+594)</option>
                                        <option value="1670" data-country="MP">Quần đảo Bắc Mariana (+1670)</option>
                                        <option value="1345" data-country="KY">Quần đảo Cayman (+1345)</option>
                                        <option value="61" data-country="CC">Quần đảo Cocos (+61)</option>
                                        <option value="682" data-country="CK">Quần đảo Cook (+682)</option>
                                        <option value="500" data-country="FK">Quần đảo Falkland (+500)</option>
                                        <option value="298" data-country="FO">Quần đảo Faroe (+298)</option>
                                        <option value="692" data-country="MH">Quần đảo Marshall (+692)</option>
                                        <option value="500" data-country="GS">Quần đảo Nam Georgia và Nam Sandwich (+500)</option>
                                        <option value="870" data-country="PN">Quần đảo Pitcairn (+870)</option>
                                        <option value="677" data-country="SB">Quần đảo Solomon (+677)</option>
                                        <option value="1649" data-country="TC">Quần đảo Turk và Caicos (+1649)</option>
                                        <option value="1284" data-country="VG">Quần đảo Virgin thuộc Anh (+1284)</option>
                                        <option value="1340" data-country="VI">Quần đảo Virgin thuộc Mỹ (+1340)</option>
                                        <option value="40" data-country="RO">Romania (+40)</option>
                                        <option value="250" data-country="RW">Rwanda (+250)</option>
                                        <option value="262" data-country="RE">Réunion (+262)</option>
                                        <option value="590" data-country="BL">Saint Barthélemy (+590)</option>
                                        <option value="290" data-country="SH">Saint Helena (+290)</option>
                                        <option value="1869" data-country="KN">Saint Kitts và Nevis (+1869)</option>
                                        <option value="1758" data-country="LC">Saint Lucia (+1758)</option>
                                        <option value="590" data-country="MF">Saint Martin (+590)</option>
                                        <option value="508" data-country="PM">Saint Pierre và Miquelon (+508)</option>
                                        <option value="1784" data-country="VC">Saint Vincent và Grenadines (+1784)</option>
                                        <option value="685" data-country="WS">Samoa (+685)</option>
                                        <option value="378" data-country="SM">San Marino (+378)</option>
                                        <option value="221" data-country="SN">Senegal (+221)</option>
                                        <option value="381" data-country="RS">Serbia (+381)</option>
                                        <option value="248" data-country="SC">Seychelles (+248)</option>
                                        <option value="232" data-country="SL">Sierra Leone (+232)</option>
                                        <option value="65" data-country="SG">Singapore (+65)</option>
                                        <option value="421" data-country="SK">Slovakia (+421)</option>
                                        <option value="386" data-country="SI">Slovenia (+386)</option>
                                        <option value="252" data-country="SO">Somali (+252)</option>
                                        <option value="94" data-country="LK">Sri Lanka (+94)</option>
                                        <option value="249" data-country="SD">Sudan (+249)</option>
                                        <option value="597" data-country="SR">Suriname (+597)</option>
                                        <option value="268" data-country="SZ">Swaziland (+268)</option>
                                        <option value="963" data-country="SY">Syria (+963)</option>
                                        <option value="239" data-country="ST">São Tomé và Príncipe (+239)</option>
                                        <option value="357" data-country="CY">Síp (+357)</option>
                                        <option value="992" data-country="TJ">Tajikistan (+992)</option>
                                        <option value="255" data-country="TZ">Tanzania (+255)</option>
                                        <option value="235" data-country="TF">Thuộc địa Miền Nam của Pháp (+235)</option>
                                        <option value="379" data-country="VA">Thành Vatican (+379)</option>
                                        <option value="66" data-country="TH">Thái Lan (+66)</option>
                                        <option value="90" data-country="TR">Thổ Nhĩ Kỳ (+90)</option>
                                        <option value="41" data-country="CH">Thụy Sĩ (+41)</option>
                                        <option value="46" data-country="SE">Thụy Điển (+46)</option>
                                        <option value="670" data-country="TL">Timor-Leste (+670)</option>
                                        <option value="228" data-country="TG">Togo (+228)</option>
                                        <option value="690" data-country="TK">Tokelau (+690)</option>
                                        <option value="676" data-country="TO">Tonga (+676)</option>
                                        <option value="1868" data-country="TT">Trinidad và Tobago (+1868)</option>
                                        <option value="850" data-country="KP">Triều Tiên (+850)</option>
                                        <option value="86" data-country="CN">Trung Quốc (+86)</option>
                                        <option value="216" data-country="TN">Tunisia (+216)</option>
                                        <option value="993" data-country="TM">Turkmenistan (+993)</option>
                                        <option value="688" data-country="TV">Tuvalu (+688)</option>
                                        <option value="34" data-country="ES">Tây Ban Nha (+34)</option>
                                        <option value="599" data-country="AN">Tây Ấn Hà Lan (+599)</option>
                                        <option value="256" data-country="UG">Uganda (+256)</option>
                                        <option value="380" data-country="UA">Ukraina (+380)</option>
                                        <option value="598" data-country="UY">Uruguay (+598)</option>
                                        <option value="998" data-country="UZ">Uzbekistan (+998)</option>
                                        <option value="678" data-country="VU">Vanuatu (+678)</option>
                                        <option value="58" data-country="VE">Venezuela (+58)</option>
                                        <option value="84" data-country="VN" selected="selected">Việt Nam (+84)</option>
                                        <option value="44" data-country="GB">Vương quốc Anh (+44)</option>
                                        <option value="681" data-country="WF">Wallis và Futuna (+681)</option>
                                        <option value="967" data-country="YE">Yemen (+967)</option>
                                        <option value="260" data-country="ZM">Zambia (+260)</option>
                                        <option value="263" data-country="ZW">Zimbabwe (+263)</option>
                                        <option value="43" data-country="AT">Áo (+43)</option>
                                        <option value="61" data-country="AU">Úc (+61)</option>
                                        <option value="39" data-country="IT">Ý (+39)</option>
                                        <option value="45" data-country="DK">Đan Mạch (+45)</option>
                                        <option value="886" data-country="TW">Đài Loan (+886)</option>
                                        <option value="61" data-country="CX">Đảo Giáng Sinh (+61)</option>
                                        <option value="672" data-country="HM">Đảo Heard và Quần đảo McDonald (+672)</option>
                                        <option value="44" data-country="IM">Đảo Man (+44)</option>
                                        <option value="672" data-country="NF">Đảo Norfolk (+672)</option>
                                        <option value="1684" data-country="AS">Đảo Somoa thuộc Mỹ (+1684)</option>
                                        <option value="852" data-country="HK">Đặc khu hành chính Hồng Kông - Trung Quốc (+852)</option>
                                        <option value="853" data-country="MO">Đặc khu hành chính Macao - Trung Quốc (+853)</option>
                                        <option value="49" data-country="DE">Đức (+49)</option>
                                        <option value="966" data-country="SA">Ả Rập Xê-út (+966)</option>
                                        <option value="91" data-country="IN">Ấn Độ (+91)</option>
                                    </select>
                                </div>
                                <div class="col-xs-6 col-xs-offset-1 fb-container">
                                    <input type="tel" class="form-control" id="buyer-phone" name="buyer-phone" required="required" autocomplete="tel-local" value="">
                                </div>
                            </div>
                            <div class="fb-container fb-font-bold">
                                <input type="checkbox" id="payerWanted" value="1">&nbsp;
                                <span class="fb-translate" data-key="traveller-payer-enabled" data-mode="-1" data-fallback="" data-disablehtmlclean="false" data-nodefaultlanguagefallback="false" data-placeholders="[]">Họ</span>
                            </div>
                            <div class="form-group container payerInput" style="padding-left:0;padding-top:15px;margin-top:15px;display:none;border-top: 1px solid #C4C4C4;">
                                <div class="col-xs-12 fb-welcome fb-font-light">
                                    <span class="fb-translate" data-key="payer-title" data-mode="-1" data-fallback="" data-disablehtmlclean="false" data-nodefaultlanguagefallback="false" data-placeholders="[]">Thông tin người thanh toán</span>
                                </div>
                                <div class="form-group container">
                                    <label for="payer-title" class="col-xs-12 fb-container">
                                        <span class="fb-translate" data-key="traveller-honorific" data-mode="-1" data-fallback="" data-disablehtmlclean="false" data-nodefaultlanguagefallback="false" data-placeholders="[]">Danh xưng</span>
                                        <span class="mandatory-field-asterisk">*</span>
                                    </label>
                                    <div class="btn-group" data-toggle="buttons">
                                        <label class="btn btn-default active">
                                            <input type="radio" name="payer-honorific-prefix" value="Mr." autocomplete="payer-honorific-prefix" id="payer-honorific-Mr." checked="checked">
                                            <span class="fb-translate" data-key="honorific-mr" data-mode="-1" data-fallback="Mr." data-disablehtmlclean="false" data-nodefaultlanguagefallback="false" data-placeholders="[]">Ông</span>
                                        </label>
                                        <label class="btn btn-default">
                                            <input type="radio" name="payer-honorific-prefix" value="Ms." autocomplete="payer-honorific-prefix" id="payer-honorific-Ms.">
                                            <span class="fb-translate" data-key="honorific-ms" data-mode="-1" data-fallback="Ms." data-disablehtmlclean="false" data-nodefaultlanguagefallback="false" data-placeholders="[]">Cô</span>
                                        </label>
                                        <label class="btn btn-default">
                                            <input type="radio" name="payer-honorific-prefix" value="Mrs." autocomplete="payer-honorific-prefix" id="payer-honorific-Mrs.">
                                            <span class="fb-translate" data-key="honorific-mrs" data-mode="-1" data-fallback="Mrs." data-disablehtmlclean="false" data-nodefaultlanguagefallback="false" data-placeholders="[]">Bà</span>
                                        </label>
                                        <label class="btn btn-default">
                                            <input type="radio" name="payer-honorific-prefix" value="Dr." autocomplete="payer-honorific-prefix" id="payer-honorific-Dr.">
                                            <span class="fb-translate" data-key="honorific-dr" data-mode="-1" data-fallback="Dr." data-disablehtmlclean="false" data-nodefaultlanguagefallback="false" data-placeholders="[]">Tiến sĩ</span>
                                        </label>
                                    </div>
                                </div>
                                <div class="form-group container">
                                    <label for="payer-firstname">
                                        <span class="fb-translate" data-key="traveller-firstname" data-mode="-1" data-fallback="" data-disablehtmlclean="false" data-nodefaultlanguagefallback="false" data-placeholders="[]">Tên</span>
                                    </label>
                                    <span class="mandatory-field-asterisk">*</span>
                                    <input type="text" class="form-control fb-translate" id="payer-firstname" name="payer-given-name" required="required" autocomplete="payer-given-name" value="" placeholder="">
                                </div>
                                <div class="form-group container">
                                    <label for="payer-lastname">
                                        <span class="fb-translate" data-key="traveller-lastname" data-mode="-1" data-fallback="" data-disablehtmlclean="false" data-nodefaultlanguagefallback="false" data-placeholders="[]">Họ</span>
                                    </label>
                                    <span class="mandatory-field-asterisk">*</span>
                                    <input type="text" class="form-control fb-translate" id="payer-lastname" name="payer-family-name" required="required" autocomplete="payer-family-name" value="" placeholder="">
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!---->


        <!--thông tin  thanh toan thẻ thanh toán-->
        <div class="fb-inner-container">
            <div class="col-xs-12 col-md-6 fb-container fb-guarantee-container" style="height: 830px;max-width:100%;">
                <div class=" col-sm-offset-2 col-sm-8 col-md-10 col-md-offset-1 fb-container">
                    <div class="col-xs-12 fb-welcome fb-font-light">
                        <span class="fb-translate" data-key="guarantee-title" data-mode="-1" data-fallback="" data-disablehtmlclean="false" data-nodefaultlanguagefallback="false" data-placeholders="[]" placeholder="Đảm bảo đặt phòng">Đảm bảo đặt phòng</span>
                    </div>
                    <div class="col-xs-12 fb-font-bold fb-guarantee-text">
                        <span class="fb-translate" data-key="guarantee-full-payment" data-mode="-1" data-fallback="" data-disablehtmlclean="false" data-nodefaultlanguagefallback="false" data-placeholders="[]" placeholder="Thanh toán toàn bộ sẽ được khấu trừ vào thẻ tín dụng của quý khách khi đặt phòng.">Thanh toán toàn bộ sẽ được khấu trừ vào thẻ tín dụng của quý khách khi đặt phòng.</span>
                    </div>
                    <div class="col-xs-12 fb-guarantee-text">
                        <span class="fb-translate" data-key="guarantee-secured" data-mode="-1" data-fallback="" data-disablehtmlclean="false" data-nodefaultlanguagefallback="false" data-placeholders="[]" placeholder="Hệ thống đặt phòng của chúng tôi được bảo mật an toàn.">Hệ thống đặt phòng của chúng tôi được bảo mật an toàn.</span>
                    </div>
                    <form role="form" class="fb-container bound" name="ccForm" method="post" onsubmit="event.preventDefault();return false;"  novalidate="novalidate">
                        <div class="form-group container">
                            <label for="guarantee-type" class="col-xs-12 fb-container">
                                <span class="fb-translate" data-key="guarantee-card-type" data-mode="-1" data-fallback="" data-disablehtmlclean="false" data-nodefaultlanguagefallback="false" data-placeholders="[]" placeholder="Loại thẻ tín dụng">Loại thẻ tín dụng</span>
                            </label>
                            <select name="cc-type" id="guarantee-type" class="form-control" autocomplete="cc-type" required="required">
                                <option value="amex" selected="selected">AMEX</option>
                                <option value="mastercard">MASTERCARD</option>
                                <option value="visa">VISA</option>
                            </select>
                        </div>
                        <div class="form-group container">
                            <label for="guarantee-number" class="col-xs-12 fb-container">
                                <span class="fb-translate" data-key="guarantee-card-number" data-mode="-1" data-fallback="" data-disablehtmlclean="false" data-nodefaultlanguagefallback="false" data-placeholders="[]" placeholder="Số thẻ tín dụng">Số thẻ tín dụng</span>
                            </label>
                            <input type="tel" class="form-control" id="guarantee-number" name="cc-number" required="required">
                        </div>
                        <div class="form-group container">
                            <label for="guarantee-holder" class="col-xs-12 fb-container">
                                <span class="fb-translate" data-key="guarantee-card-name" data-mode="-1" data-fallback="" data-disablehtmlclean="false" data-nodefaultlanguagefallback="false" data-placeholders="[]" placeholder="Tên chủ thẻ">Tên chủ thẻ</span>
                            </label>
                            <input type="text" class="form-control" id="guarantee-holder" name="cc-name" required="required" autocomplete="cc-name">
                        </div>
                        <div class="form-group container">
                            <label for="guarantee-exp-month" class="col-xs-12 fb-container">
                                <span class="fb-translate" data-key="guarantee-expire-date" data-mode="-1" data-fallback="" data-disablehtmlclean="false" data-nodefaultlanguagefallback="false" data-placeholders="[]" placeholder="Ngày hết hạn">Ngày hết hạn</span>
                            </label>
                            <div class="col-xs-4 fb-container">
                                <select class="form-control" name="cc-exp-month" id="guarantee-exp-month" required="required" autocomplete="cc-exp-month">
                                    <option value="01">Tháng Giêng</option>
                                    <option value="02">Tháng Hai</option>
                                    <option value="03">Tháng Ba</option>
                                    <option value="04">Tháng Tư</option>
                                    <option value="05">Tháng Năm</option>
                                    <option value="06">Tháng Sáu</option>
                                    <option value="07">Tháng Bảy</option>
                                    <option value="08">Tháng Tám</option>
                                    <option value="09">Tháng Chín</option>
                                    <option value="10">Tháng Mười</option>
                                    <option value="11">Tháng Mười Một</option>
                                    <option value="12">Tháng Mười Hai</option>
                                </select>
                            </div>
                            <div class="col-xs-4 col-xs-offset-1 fb-container">
                                <select class="form-control" name="cc-exp-year" id="guarantee-exp-year" required="required" autocomplete="cc-exp-year">
                                    <option value="2020" selected="selected">2020</option>
                                    <option value="2021">2021</option>
                                    <option value="2022">2022</option>
                                    <option value="2023">2023</option>
                                    <option value="2024">2024</option>
                                    <option value="2025">2025</option>
                                    <option value="2026">2026</option>
                                    <option value="2027">2027</option>
                                    <option value="2028">2028</option>
                                    <option value="2029">2029</option>
                                    <option value="2030">2030</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group container">
                            <label for="guarantee-cvv" class="col-xs-12 fb-container">
                                <span class="fb-translate" data-key="guarantee-security-code" data-mode="-1" data-fallback="" data-disablehtmlclean="false" data-nodefaultlanguagefallback="false" data-placeholders="[]" placeholder="Mã bảo mật">Mã bảo mật</span>
                            </label>
                            <div class="col-xs-12 fb-container">
                                <div id="fb-cc-cvv-notice" class="col-xs-8 fb-container fb-dark-gray" style="float: right; height: 34px;">
                                    <span class="fb-translate" data-key="guarantee-4digits-amex-notice" data-mode="-1" data-fallback="" data-disablehtmlclean="false" data-nodefaultlanguagefallback="false" data-placeholders="[]" placeholder="4 ký tự mặt trước thẻ">4 ký tự mặt trước thẻ</span>
                                </div>
                                <input type="tel" class="form-control col-xs-3" style="width: 25%;" id="guarantee-cvv" name="cc-csc" required="required" autocomplete="cc-csc">
                            </div>
                        </div>
                    </form>
                </div>
                <div class=" col-sm-offset-2 col-sm-8 col-md-10 col-md-offset-1 fb-container">
                    <iframe id="pciIframe" onload="window.$fb.guarantee.pciIframeOnload();" src="https://pci-services-payment.fastbooking.com/Frame?rand=0.15214164862991164" style="border: none; overflow-y: hidden; height: 415px;" scrolling="no" seamless="seamless" width="100%" height="415px" marginheight="0" marginwidth="0" frameborder="0" horizontalscrolling="no" verticalscrolling="no"></iframe>
                </div>
            </div>
        </div>
</div>

    <!--tien hanh thanh toan-->
    <div class="container col-xs-12 text-center fb-confirmbutton-container">
        <form role="form" novalidate="novalidate">
            <div class="col-xs-12 fb-light-bg">
                <div class="form-group fb-confirmbutton-terms-container">
				<span id="fb-confirmbutton-TCCheckbox" class="fb-input theme-checkbox fb-checkbox fb-unchecked">
					<i class="fa fa-check"></i>
				</span>
                    <span class="fb-translate" data-key="booking-notice" data-mode="-1" data-fallback="" data-disablehtmlclean="false" data-nodefaultlanguagefallback="false" data-placeholders="[&quot;
					<a href=\&quot;#\&quot; id=\&quot;termsLink\&quot; class=\&quot;theme-link\&quot;>
						<span class=\&quot;fb-translate\&quot; data-key=\&quot;booking-sales-conditions\&quot; data-mode=\&quot;-1\&quot; data-fallback=\&quot;\&quot; data-disablehtmlclean=\&quot;false\&quot; data-nodefaultlanguagefallback=\&quot;false\&quot; data-placeholders=\&quot;[]\&quot;>điều khoản và điều kiện</span>
					</a>&quot;,&quot;
					<a href=\&quot;#\&quot; id=\&quot;privacyLink\&quot; class=\&quot;theme-link\&quot;>
						<span class=\&quot;fb-translate\&quot; data-key=\&quot;booking-privacy-policy\&quot; data-mode=\&quot;-1\&quot; data-fallback=\&quot;\&quot; data-disablehtmlclean=\&quot;false\&quot; data-nodefaultlanguagefallback=\&quot;false\&quot; data-placeholders=\&quot;[]\&quot;>chính sách bảo mật</span>
					</a>&quot;]" placeholder="Bằng việc lựa chọn đặt phòng, tôi xác nhận đã đọc và đồng ý với điều khoản và điều kiện và chính sách bảo mật.">Bằng việc lựa chọn đặt phòng, tôi xác nhận đã đọc và đồng ý với
					<a href="#" id="termsLink" class="theme-link">
						<span class="fb-translate" data-key="booking-sales-conditions" data-mode="-1" data-fallback="" data-disablehtmlclean="false" data-nodefaultlanguagefallback="false" data-placeholders="[]" placeholder="điều khoản và điều kiện">điều khoản và điều kiện</span>
					</a> và
					<a href="#" id="privacyLink" class="theme-link">
						<span class="fb-translate" data-key="booking-privacy-policy" data-mode="-1" data-fallback="" data-disablehtmlclean="false" data-nodefaultlanguagefallback="false" data-placeholders="[]" placeholder="chính sách bảo mật">chính sách bảo mật</span>
					</a>.
				</span>
                    <input type="checkbox" name="check-terms" style="width: 0; visibility: hidden; position: absolute; left: -300000px;">
                </div>
            </div>
            <div class="col-xs-12 fb-light-bg" id="fb-confirmbutton-button-block">
                <button id="fb-confirmbutton-button" class="theme-btn btn fb-action fb-font-bold col-xs-12 col-sm-offset-4 col-sm-4">
                    <span class="fb-translate" data-key="booking-confirm-action" data-mode="-1" data-fallback="" data-disablehtmlclean="false" data-nodefaultlanguagefallback="false" data-placeholders="[]" placeholder="ĐẶT PHÒNG">ĐẶT PHÒNG</span>
                </button>
            </div>
            <div class="col-xs-12 fb-confirmbutton-notice fb-dark-gray">&nbsp;</div>
            <div id="fb-basket-spacer" class="hidden-md hidden-lg"></div>
        </form>
    </div>

        <!---->

    </div>
</div>
