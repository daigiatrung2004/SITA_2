<%@ page import="Language.LanguageControl" %><%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 3/11/2020
  Time: 9:00 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%LanguageControl lang = (LanguageControl) session.getAttribute("LanguageControl");%>
<% String language = session.getAttribute("language") != null ? (String) session.getAttribute("language") : LanguageControl.VN_LAN;%>
<div class="header-div-main ">
    <div class="heaader-home col-md-10">
        <div class="header-div-home">
            <a href="Home">
                <img src="./img/viclogo.png" style="height: 80px">
            </a>
        </div>
        <div class="menu-header">
            <ul style="display: flex;color: white">
                <li><%=lang.readXMl("destination_header")%>
                </li>
                <li><%=lang.readXMl("experience_header")%>
                </li>
                <li><%=lang.readXMl("voyages_header")%>
                </li>
                <li><%=lang.readXMl("enow_header")%>
                </li>
                <li><%=lang.readXMl("image_header")%>
                </li>
                <li><%=lang.readXMl("about_header")%>
                </li>
                <li>
                    <a href="<%="./"+language+"/contact-us.html"%>">
                    <%=lang.readXMl("contact_header")%>
                    </a>
                </li>
            </ul>
        </div>
    </div>
    <div class="col-md-2 contact-header-home">

        <p>Hotline: 1800 599 955</p>
        <div class="language-header">
                <span>
                    <%if (language.equals(LanguageControl.VN_LAN)) {%>
                Tiếng Việt
                <%} else {%>
                English
                <%}%>
                </span>

            <span><i class="fas fa-caret-down"></i></span>
        </div>
        <div class="lang-pos">
            <%if (language.equals(LanguageControl.VN_LAN)) {%>
            Tiếng Anh
            <input type="hidden"  id="langVal" value="<%=LanguageControl.EN_LAN%>"/>
            <%} else {%>
            VietNamese
            <input type="hidden" id="langVal" value="<%=LanguageControl.VN_LAN%>"/>
            <%}%>
        </div>

    </div>
</div>
<script src="scripts/header-home.js"></script>