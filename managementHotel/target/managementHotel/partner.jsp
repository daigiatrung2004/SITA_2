<%@ page import="Language.LanguageControl" %><%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 24/04/2020
  Time: 8:51 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    LanguageControl lang = (LanguageControl) session.getAttribute("LanguageControl");
    String language = session.getAttribute("language") != null ? (String) session.getAttribute("language") : LanguageControl.VN_LAN;
%>
<html>
<head>
    <title><%=lang.readXMl("coordinator")%></title>
    <jsp:include page="Library.jsp"></jsp:include>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/home-css.css"/>
    <style>
        .header-div-main {
            position: relative !important;
        }


    </style>
</head>
<body style="background-color:#DEE1E6">
<jsp:include page="header-not-slide.jsp"></jsp:include>
<div class="header-career title-footer">
    <h2 style="text-align: center">our partners</h2>
</div>
<div>
<div class="container">
    <div class="uk-grid uk-grid-collapse" style="padding: 20px; margin-bottom: 10px; background-color: white;">
        <div class="uk-width-medium-1-6" style="padding: 10px 0; display: flex; justify-content: center; flex-direction: column;">
            <img style="max-width: 150px; max-height: 100px; margin: 0 auto;" src="<%=request.getContextPath() %>/img/EMM_hotels.jpg" alt="Victoria Hotels and Resorts Logo" width="100%" height="100%">
        </div>
        <div class="uk-width-medium-5-6" style="font-family: arial, helvetica, sans-serif;">
            <div style="padding: 0px 20px;">
                <p style="font-size: 13pt;">
                    <strong>ÊMM HOTELS &amp; RESORTS</strong>
                </p>
                <p>ÊMM Hotels &amp; Resorts is Vietnam's newest international-quality brand, bringing a new level of product, consistency and standards to the Vietnamese market. The collection now includes three hotels: ÊMM Hotel Saigon (3 stars), ÊMM Hotel Hoi An and ÊMM Hotel Hue (4 stars). The brand will be expanding into other major cities across the country.</p>
                See more at
                <a href="/www.emmhotels.com" target="_blank" rel="noopener noreferrer" style=" color:#397!important;">www.emmhotels.com</a>
            </div>
        </div>
    </div>
    <div class="uk-grid uk-grid-collapse" style="padding: 20px; margin-bottom: 10px; background-color: white;">
        <div class="uk-width-medium-1-6" style="padding: 10px 0; display: flex; justify-content: center; flex-direction: column;">
            <img style="max-width: 150px; max-height: 100px; margin: 0 auto;" src="<%=request.getContextPath() %>/img/Mai-Chau-Lodge_Logo.jpg" alt="Mai Chau Lodge Logo" width="100%" height="100%">
        </div>
        <div class="uk-width-medium-5-6" style="font-family: arial, helvetica, sans-serif;">
            <div style="padding: 0px 20px;">
                <p style="font-size: 13pt;">
                    <strong> MAI CHAU LODGE </strong>
                </p>
                <p>Located 135 km southwest of Hanoi, set amongst tribal villages, Mai Chau Lodge (www.maichaulodge.com) offers spectacular vistas of the famed Mai Chau valley, surrounded by lush green mountains and stilt houses inhabited largely by the White Thai ethnic group. With 16 rooms, Mai Chau Lodge is ideal for travelers who are looking for authenticity along with the comfort, rooms and facilities of an international 3* hotel.</p>
                See more at
                <a href="http://www.maichaulodge.com" target="_blank" rel="noopener noreferrer" style=" color:#397!important;">www.maichaulodge.com</a>
            </div>
        </div>
    </div>
    <div class="uk-grid uk-grid-collapse" style="padding: 20px; margin-bottom: 10px; background-color: white;">
        <div class="uk-width-medium-1-6" style="padding: 10px 0; display: flex; justify-content: center; flex-direction: column;">
            <img style="max-width: 150px; max-height: 100px; margin: 0 auto;" src="<%=request.getContextPath() %>/img/Emeraude_logo.jpg" alt="Emeraude logo" width="100%" height="100%">
        </div>
        <div class="uk-width-medium-5-6" style="font-family: arial, helvetica, sans-serif;">
            <div style="padding: 0px 20px;">
                <p style="font-size: 13pt;">
                    <strong> EMERAUDE CRUISES </strong>
                </p>
                <p>Emeraude Classic Cruises is famous for its long and storied history, starting as a paddle steamer owned by the Roque family in 1910 and reborn by Eric Merlin in 2003 as a luxury cruise ship plying the emerald waters of the UNESCO World Heritage Site of Halong Bay. Emeraude Classic Cruises features a total of 37 cabins designed to evoke the nostalgic charm of colonial Indochina, offering an elegant overnight cruise experience and charter service. Under the management of TMG Hospitality along with its well-trained staff, Emeraude is proud to relive the resplendent past of a bygone era, providing guests with a magical cruise experience highlighted by a wide range of cuisines and activities on board.</p>
                See more at
                <a href="http://emeraude-cruises.com/" target="_blank" rel="noopener noreferrer" style=" color:#397!important;"> www.emeraude-cruises.com </a>
            </div>
        </div>
    </div>
    <div class="uk-grid uk-grid-collapse" style="padding: 20px; margin-bottom: 10px; background-color: white;">
        <div class="uk-width-medium-1-6" style="padding: 10px 0; display: flex; justify-content: center; flex-direction: column;">
            <img style="max-width: 150px; max-height: 100px; margin: 0 auto;" src="<%=request.getContextPath() %>/img/Lazalee-cruise_logo.jpg" alt="Lazalee cruise logo" width="100%" height="100%">
        </div>
        <div class="uk-width-medium-5-6" style="font-family: arial, helvetica, sans-serif;">
            <div style="padding: 0px 20px;">
                <p style="font-size: 13pt;">
                    <strong> L'AZALÉE CRUISES </strong>
                </p>
                <p>Established in 2015, L’Azalée Cruises operates six vessels which comprise one of the most modern, comfortable fleets in Halong Bay, a UNESCO-listed World Heritage Site. L’Azalée Cruises provide a wide range of services including: Day Cruises, Private Cruises and Overnight Cruises to explore stunning Halong Bay.</p>
                See more at
                <a href="http://www.lazaleecruises.vn" target="_blank" rel="noopener noreferrer" style=" color:#397!important;">www.lazaleecruises.vn</a>
            </div>
        </div>
    </div>
    <div class="uk-grid uk-grid-collapse" style="padding: 20px; margin-bottom: 10px; background-color: white;">
        <div class="uk-width-medium-1-6" style="padding: 10px 0; display: flex; justify-content: center; flex-direction: column;">
            <img style="max-width: 150px; max-height: 100px; margin: 0 auto;" src="<%=request.getContextPath() %>/img/Hai_Au_Logo.jpg" alt="Hai Au Logo" width="100%" height="100%">
        </div>
        <div class="uk-width-medium-5-6" style="font-family: arial, helvetica, sans-serif;">
            <div style="padding: 0px 20px;">
                <p style="font-size: 13pt;">
                    <strong> HAI AU AVIATION </strong>
                </p>
                <p>Established in 2011, Hai Au Aviation is proud to be the pioneer in commercial seaplane service in Vietnam, bringing a fresh and unique travel and sightseeing experience to Vietnam’s most beautiful destinations. Hai Au Aviation currently offers three deluxe service packages: scheduled flight – transport customers between Hanoi – Ha Long, Hue – Da Nang &amp; Dong Hoi – Da Nang; scenic flight – take visitors on a tour to enjoy scenic views of Ha Long Bay, Hue &amp; Da Nang from bird’s eye view; and charter flight – providing a private and high-end experience to customers.</p>
                See more at
                <a href="http://www.seaplanes.vn" target="_blank" rel="noopener noreferrer" style=" color:#397!important;">www.seaplanes.vn</a>
            </div>
        </div>
    </div>
    <div class="uk-grid uk-grid-collapse" style="padding: 20px; margin-bottom: 10px; background-color: white;">
        <div class="uk-width-medium-1-6" style="padding: 10px 0; display: flex; justify-content: center; flex-direction: column;">
            <img style="max-width: 150px; max-height: 100px; margin: 0 auto;" src="<%=request.getContextPath() %>/img/Buffalo_logo.jpg" alt="Buffalo logo" width="100%" height="100%">
        </div>
        <div class="uk-width-medium-5-6" style="font-family: arial, helvetica, sans-serif;">
            <div style="padding: 0px 20px;">
                <p style="font-size: 13pt;">
                    <strong> BUFFALO TOURS </strong>
                </p>
                <p>Established in 1994, Buffalo Tours is a leading destination management company in Asia with its own operational offices in Vietnam, Thailand, Indonesia, China, Hong Kong, Singapore, Malaysia, Cambodia, Laos, Myanmar (Burma), and Japan. Buffalo Tours offers customised guided private and group tours, accommodation, transfers, flights, cruises, day trips and excursions across Asia.</p>
                See more at
                <a href="http://www.buffalotours.com" target="_blank" rel="noopener noreferrer" style=" color:#397!important;">www.buffalotours.com</a>
            </div>
        </div>
    </div>
    <div class="uk-grid uk-grid-collapse" style="padding: 20px; margin-bottom: 10px; background-color: white;">
        <div class="uk-width-medium-1-6" style="padding: 10px 0; display: flex; justify-content: center; flex-direction: column;">
            <img style="max-width: 150px; margin: 0 auto;" src="<%=request.getContextPath() %>/img/VMK_Logo_FA-02.png" alt="Victoria Mekong Cruise logo" width="100%" height="100%">
        </div>
        <div class="uk-width-medium-5-6" style="font-family: arial, helvetica, sans-serif;">
            <div style="padding: 0px 20px;">
                <p style="font-size: 13pt;">
                    <strong>VICTORIA MEKONG CRUISES </strong>
                </p>
                <p>Cruise the waters of Southeast Asia’s mightiest river aboard the Victoria Mekong, a sleek 35-cabin ship traveling between Vietnam’s lush Mekong Delta and Cambodia’s enchanting capital city of Phnom Penh. The Victoria Mekong offers her passengers an authentic insight into the life of the River, combined with four-star comfort and superior service. The itinerary has a uniquely scenic focus, passing from the lush, green landscapes of Vietnam up to Cambodia’s enchanting capital, Phnom Penh. Shore excursions are designed with an emphasis on experiencing local life, with plenty of opportunities to interact with local people and their fascinating culture.</p>
                See more at
                <a href="https://victoriamekong.com" target="_blank" rel="noopener noreferrer" style=" color:#397!important;">www.victoriamekong.com</a>
            </div>
        </div>
    </div>
</div>
</div>
<jsp:include page="loading.jsp"></jsp:include>
<jsp:include page="./Footer.jsp"></jsp:include>
</body>
</html>
