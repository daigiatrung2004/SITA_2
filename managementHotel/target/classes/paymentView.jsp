<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 3/11/2020
  Time: 8:53 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="css/home-css.css"/>
    <link rel="stylesheet" href="css/payment-view.css">
    <jsp:include page="Library.jsp"></jsp:include>
    <style>
        .header-div-main {
            position: relative !important;
        }
    </style>
    <title>Payment</title>
</head>
<body>
<jsp:include page="header-not-slide.jsp"></jsp:include>
<div class="main"
     style="background: url('./img/136290873.jpg') no-repeat;background-size: cover;min-height:700px;background-position: center;">
    <div class="container main-payment">
        <div class="col-md-12">

            <div class="processing-payment col-md-12" style="padding-top: 20px!important;">
                <!--cac buoc trong thanh toan (processing)-->
                <div  class="processing-display-flex" style="margin-left: 200px;">
                    <!--label cho tung muc-->
                    <div class="label-item-payment">Chọn phòng</div>
                    <div class="label-item-payment" >Chọn lựa bổ sung</div>
                    <div class="label-item-payment" >Đặt phòng</div>

                </div>
                <div class="processing-display-flex">
                <div class="circle active">1</div>
                <div class="straight"></div>
                <div class="circle">2</div>
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
                        <div class="carousel slide slide-room" data-ride="carousel" id="slide-gardens">
                            <!-- Indicators -->
                            <ul class="carousel-indicators">
                                <li data-target="#slide-gardens" data-slide-to="0" class="active"></li>
                                <li data-target="#slide-gardens" data-slide-to="1"></li>
                                <li data-target="#slide-gardens" data-slide-to="2"></li>

                            </ul>

                            <!-- The slideshow -->
                            <div class="carousel-inner">
                                <div class="carousel-item active">
                                    <img src="./img/zoom/gadens/423c534d84d060e12cdc19ba2f78bf4b-w704-scale.jpg"
                                         class="img-slide-zoom">
                                </div>
                                <div class="carousel-item">
                                    <img src="./img/zoom/gadens/b4209857280ac0d8f9b3c401b9426a2e-w704-scale.jpg"
                                         class="img-slide-zoom">
                                </div>
                                <div class="carousel-item">
                                    <img src="./img/zoom/gadens/caa8c196f48e17bc9b580b9e1c7d2808-w704-scale.jpg"
                                         class="img-slide-zoom">
                                </div>
                            </div>

                            <!-- Left and right controls -->
                            <a class="carousel-control-prev" href="#slide-gardens" data-slide="prev">
                                <span class="carousel-control-prev-icon"></span>
                            </a>
                            <a class="carousel-control-next" href="#slide-gardens" data-slide="next">
                                <span class="carousel-control-next-icon"></span>
                            </a>
                        </div>
                        <div class="detail-room">
                            <!--gadens online-->
                            <div id="vnpha30475-pack-100-Online-Exclusive-Rate-Garden-View-Bungalow"
                                 class="col-xs-12 fb-results-rate fb-light-bg">
                                <div class="fb-results-rate--left">
                                    <div>
                                        <div class="fb-results-rate-title">
				<span class="details">
					<a href="#" data-key="Details">
						<i class="fa fa-caret-down"></i>
						<span class="fb-translate rate-title">placeholder="Online Exclusive Rate">Online Exclusive Rate</span>
					</a>
				</span>
                                        </div>
                                        <div style="padding-left: 12px;">
				<span style="font-size: 13px; color: red;">
					<span class="fb-translate" data-key="Only-x-accommodations-left" data-mode="-1" data-fallback=""
                          data-disablehtmlclean="false" data-nodefaultlanguagefallback="false" data-placeholders="[3]"
                          placeholder="Chỉ còn 3 phòng nghỉ!">Chỉ còn 3 phòng nghỉ!</span>
				</span>
                                        </div>
                                    </div>
                                    <div class="fb-results-rate-labels-container">
			<span class="fb-discount-tag rate-badge-container" title="Chỉ cung cấp tại phòng">
				<span class="fb-discount-tag-price">
					<span class="fb-translate">-10%</span>
				</span>
			</span>
                                        <span class="fb-translate campaign-text-color campaign-title"
                                              placeholder="Today's offer!">Today's offer!</span>
                                    </div>
                                    <div style="margin-top: auto;display: flex">
                                        <div class="fb-results-ratekeys fb-container" style="display: flex;">
                                            <div class="col-xs-4 fb-dark-gray fb-container">
                                            <span class="col-xs-12 col-sm-2 fb-container">
                                                 <img src="./img/zoom/icon-package-mealplan-breakfast.png" border="0"/>
                                            </span>
                                            </div>
                                            <div class="col-xs-12 col-sm-10 fb-results-ratekey">
                                                <span class="fb-translate"
                                                      placeholder="Bao gồm bữa sáng">Bao gồm bữa sáng</span>
                                            </div>
                                        </div>
                                        <div class="col-sm-4 fb-dark-gray fb-container fb-ratekey-clickable">
                                            <div class="col-xs-12 col-sm-1 fb-container">
                                                <img src="./img/zoom/icon-package-salesterms-cross.png" border="0">
                                            </div>
                                            <div class="col-xs-12 col-sm-11 fb-results-ratekey">
                                                <span class="fb-translate" data-key="warrant-cancellable-not-amendable"
                                                      data-mode="-1" data-fallback="" data-disablehtmlclean="false"
                                                      data-nodefaultlanguagefallback="false" data-placeholders="[]"
                                                      placeholder="Không thể hủy và thay đổi">Không thể hủy và thay đổi</span>
                                            </div>
                                        </div>
                                        <div class="col-sm-4 fb-dark-gray fb-container fb-ratekey-clickable">
                                            <div class="col-xs-12 col-sm-2 fb-container">
                                                <img src="./img/zoom/icon-package-salesterms-payment-online.png"
                                                     border="0">
                                            </div>
                                            <div class="col-xs-12 col-sm-10 fb-results-ratekey">
                                                <span class="fb-translate" data-key="results-rate-payment-internet"
                                                      data-mode="-1" data-fallback="" data-disablehtmlclean="false"
                                                      data-nodefaultlanguagefallback="false" data-placeholders="[]"
                                                      placeholder="Thanh toán ngay">Thanh toán ngay</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div style="margin-top: 10px; margin-left: -15px"></div>

                                <div class="fb-results-rate--right">
                                    <div>
						<span class="fb-dark-gray fb-price-small-text">
							<span class="fb-translate" placeholder="1 đêm">1 đêm</span>
							<span class="fb-price-params-separator">, </span>
							<span placeholder="2 người">2 người</span>
						</span>
                                    </div>
                                    <div style="padding-right: 5px; padding-bottom: 5px;">
                                        <div>
							<span class="fb-price barred-price last-barred-price" data-price="109.19624192459"
                                  data-symbol="true">
								<span>2.857.541&nbsp;
									<span class="fb-price-currency">₫</span>
								</span>
							</span>
                                        </div>
                                        <div class="new-price campaign-text-color">
							<span class="fb-price" data-price="98.276617732135" data-symbol="true">
								<span>2.571.787&nbsp;
									<span class="fb-price-currency">₫</span>
								</span>
							</span>
                                        </div>
                                    </div>
                                    <button class="btn btn-static fb-font-bold btn--price-select">
                                    <span class="fb-translate "
                                          placeholder="Chọn" style="text-transform: uppercase;">Chọn</span>
                                    </button>
                                </div>
                            </div>
                            <!--gadens standard-->
                            <div id="vnpha30475-pack-101-Standard-Rate-Garden-View-Bungalow"
                                 class="col-xs-12 fb-results-rate fb-light-bg">
                                <div class="fb-results-rate--left">
                                    <div>
                                        <div class="fb-results-rate-title">
				<span class="details">
					<a href="#" data-key="Details">
						<i class="fa fa-caret-right"></i>
						<span class="fb-translate rate-title" placeholder="Standard Rate">Standard Rate</span>
					</a>
				</span>
                                        </div>
                                        <div style="padding-left: 12px;">
				<span style="font-size: 13px; color: red;">
					<span class="fb-translate" data-key="Only-x-accommodations-left" data-mode="-1" data-fallback=""
                          data-disablehtmlclean="false" data-nodefaultlanguagefallback="false" data-placeholders="[3]"
                          placeholder="Chỉ còn 3 phòng nghỉ!">Chỉ còn 3 phòng nghỉ!</span>
				</span>
                                        </div>
                                    </div>
                                    <div style="margin-top: auto;display: flex">
                                        <div class="fb-results-ratekeys fb-container" style="display: flex">
                                            <div class="col-xs-4 fb-dark-gray fb-container">
                                                <div class="col-xs-12 col-sm-2 fb-container">
                                                    <img src="./img/zoom/icon-package-mealplan-breakfast.png"
                                                         border="0">
                                                </div>
                                                <div class="col-xs-12 col-sm-10 fb-results-ratekey">
                                                <span class="fb-translate"
                                                      placeholder="Bao gồm bữa sáng">Bao gồm bữa sáng</span>
                                                </div>
                                            </div>
                                            <div class="col-sm-4 fb-dark-gray fb-container fb-ratekey-clickable">
                                                <div class="col-xs-12 col-sm-1 fb-container">
                                                    <img src="./img/zoom/icon-package-salesterms-cross.png" border="0">
                                                </div>
                                                <div class="col-xs-12 col-sm-11 fb-results-ratekey">
                                                <span class="fb-translate"
                                                      placeholder="Không thể hủy và thay đổi">Không thể hủy và thay đổi</span>
                                                </div>
                                            </div>
                                            <div class="col-sm-4 fb-dark-gray fb-container fb-ratekey-clickable">
                                                <div class="col-xs-12 col-sm-2 fb-container">
                                                    <img src="./img/zoom/icon-package-salesterms-payment-checkout.png"
                                                         border="0">
                                                </div>
                                                <div class="col-xs-12 col-sm-10 fb-results-ratekey">
                                                <span class="fb-translate"
                                                      placeholder="Thanh toán sau">Thanh toán sau</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div style="margin-top: 10px; margin-left: -15px"></div>
                                </div>
                                <div class="fb-results-rate--right">
                                    <div>
						<span class="fb-dark-gray fb-price-small-text">
							<span class="fb-translate" data-key="night" data-mode="1" data-fallback=""
                                  data-disablehtmlclean="false" data-nodefaultlanguagefallback="false"
                                  data-placeholders="[1]" placeholder="1 đêm">1 đêm</span>
							<span class="fb-price-params-separator">, </span>
							<span class="fb-translate" data-key="person" data-mode="2" data-fallback=""
                                  data-disablehtmlclean="false" data-nodefaultlanguagefallback="false"
                                  data-placeholders="[2]" placeholder="2 người">2 người</span>
						</span>
                                    </div>
                                    <div style="padding-right: 5px; padding-bottom: 5px;">
                                        <div class="new-price">
							<span class="fb-price" data-price="136.49530240574" data-symbol="true">
								<span>3.571.927&nbsp;
									<span class="fb-price-currency">₫</span>
								</span>
							</span>
                                        </div>
                                    </div>
                                    <button class="btn btn-static fb-action fb-font-bold btn--price-select">
                                    <span class="fb-translate "
                                          placeholder="Chọn" style="text-transform: uppercase;">Chọn</span>
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>


                    <div>
                        <div class="carousel slide slide-room" data-ride="carousel" id="slide-family">
                            <!-- Indicators -->
                            <ul class="carousel-indicators">
                                <li data-target="#slide-family" data-slide-to="0" class="active"></li>
                                <li data-target="#slide-family" data-slide-to="1"></li>
                                <li data-target="#slide-family" data-slide-to="2"></li>
                                <li data-target="#slide-gardens" data-slide-to="3"></li>
                            </ul>

                            <!-- The slideshow -->
                            <div class="carousel-inner">
                                <div class="carousel-item active">
                                    <img src="./img/zoom/family/2b43c01cb12aba95f3dd1007f2ad7f53-w704-scale.jpg"
                                         class="img-slide-zoom">
                                </div>
                                <div class="carousel-item">
                                    <img src="./img/zoom/family/6cd64c8e30d2c04b88794752533baeb8-w704-scale.jpg"
                                         class="img-slide-zoom">
                                </div>
                                <div class="carousel-item">
                                    <img src="./img/zoom/family/85884fa101dd6dfc2abd49facc02a25a-w704-scale.jpg"
                                         class="img-slide-zoom">
                                </div>
                                <div class="carousel-item">
                                    <img src="./img/zoom/family/d3aed162fa8afaa8dae98ddfb37fa692-w704-scale.jpg"
                                         class="img-slide-zoom">
                                </div>
                            </div>

                            <!-- Left and right controls -->
                            <a class="carousel-control-prev" href="#slide-family" data-slide="prev">
                                <span class="carousel-control-prev-icon"></span>
                            </a>
                            <a class="carousel-control-next" href="#slide-family" data-slide="next">
                                <span class="carousel-control-next-icon"></span>
                            </a>
                        </div>
                        <div class="detail-room">
                            <!--online family-->
                            <div id="vnpha30475-pack-102-Online-Exclusive-Rate-Family-Bungalows"
                                 class="col-xs-12 fb-results-rate fb-light-bg">
                                <div class="fb-results-rate--left">
                                    <div>
                                        <div class="fb-results-rate-title">
				<span class="details">
					<a href="#" data-key="Details">
						<i class="fa fa-caret-right"></i>
						<span class="fb-translate rate-title" data-key="vnpha30475:promotiontitle:Online-Exclusive-Rate"
                              data-mode="-1" data-fallback="Online Exclusive Rate" data-disablehtmlclean="false"
                              data-nodefaultlanguagefallback="false" data-placeholders="[]">Online Exclusive Rate</span>
					</a>
				</span>
                                        </div>
                                        <div style="padding-left: 12px;">
				<span style="font-size: 13px; color: red;">
					<span class="fb-translate" data-key="Only-x-accommodations-left" data-mode="-1" data-fallback=""
                          data-disablehtmlclean="false" data-nodefaultlanguagefallback="false" data-placeholders="[2]">Chỉ còn 2 phòng nghỉ!</span>
				</span>
                                        </div>
                                    </div>
                                    <div class="fb-results-rate-labels-container">
			<span class="fb-discount-tag rate-badge-container" title="Chỉ cung cấp tại phòng">
				<span class="fb-discount-tag-price">
					<span class="fb-translate" data-key="mcm-results-discount-value" data-mode="-1" data-fallback=""
                          data-disablehtmlclean="false" data-nodefaultlanguagefallback="false"
                          data-placeholders="[&quot;-10%&quot;]">-10%</span>
				</span>
			</span>
                                        <span class="fb-translate campaign-text-color campaign-title"
                                              data-key="campaign-5535" data-mode="-1" data-fallback=""
                                              data-disablehtmlclean="false" data-nodefaultlanguagefallback="false"
                                              data-placeholders="[]">Today's offer!</span>
                                    </div>
                                    <div style="margin-top: auto;">
                                        <div class="fb-results-ratekeys fb-container" style="display: flex;">
                                            <div class="col-xs-4 fb-dark-gray fb-container">
                                                <div class="col-xs-12 col-sm-2 fb-container">
                                                    <img src="./img/zoom/icon-package-mealplan-breakfast.png"
                                                         border="0">
                                                </div>
                                                <div class="col-xs-12 col-sm-10 fb-results-ratekey">
                                                <span class="fb-translate" data-key="results-rate-meal-type-breakfast"
                                                      data-mode="-1" data-fallback="" data-disablehtmlclean="false"
                                                      data-nodefaultlanguagefallback="false" data-placeholders="[]">Bao gồm bữa sáng</span>
                                                </div>
                                            </div>
                                            <div class="col-sm-4 fb-dark-gray fb-container fb-ratekey-clickable">
                                                <div class="col-xs-12 col-sm-1 fb-container">
                                                    <img src="./img/zoom/icon-package-salesterms-cross.png" border="0">
                                                </div>
                                                <div class="col-xs-12 col-sm-11 fb-results-ratekey">
                                                <span class="fb-translate" data-key="warrant-cancellable-not-amendable"
                                                      data-mode="-1" data-fallback="" data-disablehtmlclean="false"
                                                      data-nodefaultlanguagefallback="false" data-placeholders="[]">Không thể hủy và thay đổi</span>
                                                </div>
                                            </div>
                                            <div class="col-sm-4 fb-dark-gray fb-container fb-ratekey-clickable">
                                                <div class="col-xs-12 col-sm-2 fb-container">
                                                    <img src="./img/zoom/icon-package-salesterms-payment-online.png"
                                                         border="0">
                                                </div>
                                                <div class="col-xs-12 col-sm-10 fb-results-ratekey">
                                                <span class="fb-translate" data-key="results-rate-payment-internet"
                                                      data-mode="-1" data-fallback="" data-disablehtmlclean="false"
                                                      data-nodefaultlanguagefallback="false" data-placeholders="[]">Thanh toán ngay</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div style="margin-top: 10px; margin-left: -15px"></div>
                                </div>
                                <div class="fb-results-rate--right">
                                    <div>
						<span class="fb-dark-gray fb-price-small-text">
							<span class="fb-translate" data-key="night" data-mode="1" data-fallback=""
                                  data-disablehtmlclean="false" data-nodefaultlanguagefallback="false"
                                  data-placeholders="[1]">1 đêm</span>
							<span class="fb-price-params-separator">, </span>
							<span class="fb-translate" data-key="person" data-mode="2" data-fallback=""
                                  data-disablehtmlclean="false" data-nodefaultlanguagefallback="false"
                                  data-placeholders="[2]">2 người</span>
						</span>
                                    </div>
                                    <div style="padding-right: 5px; padding-bottom: 5px;">
                                        <div>
							<span class="fb-price barred-price last-barred-price" data-price="122.69240675499"
                                  data-symbol="true">
								<span>3.210.721&nbsp;
									<span class="fb-price-currency">₫</span>
								</span>
							</span>
                                        </div>
                                        <div class="new-price campaign-text-color">
							<span class="fb-price" data-price="110.42316607949" data-symbol="true">
								<span>2.889.649&nbsp;
									<span class="fb-price-currency">₫</span>
								</span>
							</span>
                                        </div>
                                    </div>
                                    <button class="btn btn-static fb-action fb-font-bold btn--price-select">
                                    <span class="fb-translate" data-key="results-rate-choose" data-mode="-1"
                                          data-fallback="" data-disablehtmlclean="false"
                                          data-nodefaultlanguagefallback="false" data-placeholders="[]"
                                          style="text-transform: uppercase;">Chọn</span>
                                    </button>
                                </div>
                            </div>
                            <!-- standard family-->
                            <div id="vnpha30475-pack-103-Standard-Rate-Family-Bungalows"
                                 class="col-xs-12 fb-results-rate fb-light-bg">
                                <div class="fb-results-rate--left">
                                    <div>
                                        <div class="fb-results-rate-title">
				<span class="details">
					<a href="#" data-key="Details">
						<i class="fa fa-caret-right"></i>
						<span class="fb-translate rate-title" data-key="vnpha30475:promotiontitle:Standard-Rate"
                              data-mode="-1" data-fallback="Standard Rate" data-disablehtmlclean="false"
                              data-nodefaultlanguagefallback="false" data-placeholders="[]">Standard Rate</span>
					</a>
				</span>
                                        </div>
                                        <div style="padding-left: 12px;">
				<span style="font-size: 13px; color: red;">
					<span class="fb-translate" data-key="Only-x-accommodations-left" data-mode="-1" data-fallback=""
                          data-disablehtmlclean="false" data-nodefaultlanguagefallback="false" data-placeholders="[2]">Chỉ còn 2 phòng nghỉ!</span>
				</span>
                                        </div>
                                    </div>
                                    <div style="margin-top: auto;">
                                        <div class="fb-results-ratekeys fb-container" style="display: flex">
                                            <div class="col-xs-4 fb-dark-gray fb-container">
                                                <div class="col-xs-12 col-sm-2 fb-container">
                                                    <img src="./img/zoom/icon-package-mealplan-breakfast.png"
                                                         border="0">
                                                </div>
                                                <div class="col-xs-12 col-sm-10 fb-results-ratekey">
                                                <span class="fb-translate" data-key="results-rate-meal-type-breakfast"
                                                      data-mode="-1" data-fallback="" data-disablehtmlclean="false"
                                                      data-nodefaultlanguagefallback="false" data-placeholders="[]">Bao gồm bữa sáng</span>
                                                </div>
                                            </div>
                                            <div class="col-sm-4 fb-dark-gray fb-container fb-ratekey-clickable">
                                                <div class="col-xs-12 col-sm-1 fb-container">
                                                    <img src="./img/zoom/icon-package-salesterms-cross.png" border="0">
                                                </div>
                                                <div class="col-xs-12 col-sm-11 fb-results-ratekey">
                                                <span class="fb-translate" data-key="warrant-cancellable-not-amendable"
                                                      data-mode="-1" data-fallback="" data-disablehtmlclean="false"
                                                      data-nodefaultlanguagefallback="false" data-placeholders="[]">Không thể hủy và thay đổi</span>
                                                </div>
                                            </div>
                                            <div class="col-sm-4 fb-dark-gray fb-container fb-ratekey-clickable">
                                                <div class="col-xs-12 col-sm-2 fb-container">
                                                    <img src="./img/zoom/icon-package-salesterms-payment-checkout.png"
                                                         border="0">
                                                </div>
                                                <div class="col-xs-12 col-sm-10 fb-results-ratekey">
                                                <span class="fb-translate" data-key="results-rate-payment-hotel"
                                                      data-mode="-1" data-fallback="" data-disablehtmlclean="false"
                                                      data-nodefaultlanguagefallback="false" data-placeholders="[]">Thanh toán sau</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div style="margin-top: 10px; margin-left: -15px"></div>
                                </div>
                                <div class="fb-results-rate--right">
                                    <div>
						<span class="fb-dark-gray fb-price-small-text">
							<span class="fb-translate" data-key="night" data-mode="1" data-fallback=""
                                  data-disablehtmlclean="false" data-nodefaultlanguagefallback="false"
                                  data-placeholders="[1]">1 đêm</span>
							<span class="fb-price-params-separator">, </span>
							<span class="fb-translate" data-key="person" data-mode="2" data-fallback=""
                                  data-disablehtmlclean="false" data-nodefaultlanguagefallback="false"
                                  data-placeholders="[2]">2 người</span>
						</span>
                                    </div>
                                    <div style="padding-right: 5px; padding-bottom: 5px;">
                                        <div class="new-price">
							<span class="fb-price" data-price="153.36550844374" data-symbol="true">
								<span>4.013.401&nbsp;
									<span class="fb-price-currency">₫</span>
								</span>
							</span>
                                        </div>
                                    </div>
                                    <button class="btn btn-static fb-action fb-font-bold btn--price-select">
                                    <span class="fb-translate" data-key="results-rate-choose" data-mode="-1"
                                          data-fallback="" data-disablehtmlclean="false"
                                          data-nodefaultlanguagefallback="false" data-placeholders="[]"
                                          style="text-transform: uppercase;">Chọn</span>
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>

                <!--thanh toan-->
                <div class="col-md-3" style="padding: 25px;padding-top: 110px;">
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
					<span class="fb-price" data-price="0" data-symbol="true" data-pricepoint="0">
						<span>0&nbsp;
							<span class="fb-price-currency">₫</span>
						</span>
					</span>
                                    </div>
                                </div>
                            </div>
                            <div id="fb-basket-header-price-details" class="col-xs-12"></div>
                            <div id="fb-basket-body" class="container col-xs-12 fb-container fb-light-bg"
                                 style="max-height: 432px; overflow-y: auto;">
                                <div class="col-xs-12 fb-basket-remain fb-gray">
                                    <span class="fb-translate">Chọn phòng 1</span>
                                </div>
                            </div>
                        </div>
                        <div id="fb-basket-checkout" class="hidden-xs hidden-sm">
                            <button class="btn  btn-continue-payment" disabled="disabled">
                                <span class="fb-translate">TIẾP</span>
                            </button>
                            <div id="fb-widget-container"
                                 class="col-xs-12 col-sm-12 col-md-12 fb-container fb-light-bg"></div>
                        </div>
                        <div id="fb-basket-sticky" class="container fb-dark-bg hidden-md hidden-lg">
                            <div class="col-xs-6 col-sm-7 hidden-md hidden-lg">
                                <div class="visible-sm col-sm-6">
                                    <span class="fb-translate">Tổng</span>
                                </div>
                                <div class="col-xs-12 col-sm-6 hidden-md hidden-lg fb-price-amount">
				<span class="fb-price" data-price="0" data-symbol="true">
					<span>0&nbsp;
						<span class="fb-price-currency">₫</span>
					</span>
				</span>
                                </div>
                                <div class="visible-sm col-sm-6">
                                    <a href="#" onclick="return false;">Details
                                        <span class="fb-basket-sticky-toggle">
						<i class="fa fa-caret-down"></i>
					</span>
                                    </a>
                                </div>
                                <div class="col-xs-12 col-sm-6 hidden-md hidden-lg fb-price-params"></div>
                            </div>
                            <div class="col-xs-2 visible-xs fb-basket-sticky-toggle">
                                <i class="fa fa-caret-down"></i>
                            </div>
                            <div class="col-xs-4 col-sm-5 hidden-md hidden-lg fb-basket-sticky-checkout">
                                <button class="btn btn-block fb-action fb-action-flat fb-font-bold theme-btn">
                                <span class="fb-translate" data-key="basket-validate" data-mode="-1" data-fallback=""
                                      data-disablehtmlclean="false" data-nodefaultlanguagefallback="false"
                                      data-placeholders="[]">TIẾP</span>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="scripts/payment.js"></script>
<jsp:include page="./Footer.jsp"></jsp:include>
</body>
</html>
