<%@ page import="Language.LanguageControl" %>
<%@ page import="DAO.RegionDA" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="DTO.RegionTO" %>
<%@ page import="DTO.StaticTO" %>
<%@ page import="Utils.TextCustomizeFormat" %><%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 3/11/2020
  Time: 9:00 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%LanguageControl lang = (LanguageControl) session.getAttribute("LanguageControl");%>
<% String language = session.getAttribute("language") != null ? (String) session.getAttribute("language") : LanguageControl.VN_LAN;
    RegionDA regionDA=new RegionDA();
    ArrayList<RegionTO> listRegionTO=regionDA.retrieveAllRegion();
%>
<style>
    .ul-menu-header li:hover{
         color: goldenrod!important;
        cursor: pointer;
        text-decoration: underline;
    }
    .ul-menu-header li a:hover{
        color: goldenrod!important;
        cursor: pointer;
        text-decoration: underline;
    }
    .listregion{
        position: absolute;
        background: white;
        top: 125px;
        max-width: 750px;
        line-height: 3em;
    }
    .listregion{
        display: none;
    }
    .li-region:hover .listregion{
         display: flex!important;
    }


</style>
<div class="header-div-main ">
    <div class="heaader-home col-md-10">
        <div class="header-div-home">
            <a href="<%=request.getContextPath() %>/Home">
                <img src="<%=request.getContextPath() %>/img/viclogo.png" style="height: 80px">
            </a>
        </div>
        <div class="menu-header">
            <ul class="ul-menu-header" style="display: flex;color: white;margin: 0;height: 46px;">
                <li class="li-region">
                    <div>
                        <%=lang.readXMl("destination_header")%>
                    </div>

                    <div class="col-md-12 listregion row">
                        <%
                            if(listRegionTO!=null){
                                for (int i = 0; i <listRegionTO.size() ; i++) {



                        %>
                            <div class="col-md-6 item-region">
                                <a href="<%=StaticTO.WEB_STATIC%>/vi/<%=listRegionTO.get(i).getRegion_id()%>/<%=TextCustomizeFormat.convertTextToString(listRegionTO.get(i).getName_en())%>.html" style="color:black;font-size: 18px;"><%=listRegionTO.get(i).getName_vi()%></a>
                            </div>
                        <%
                                }
                            }
                        %>
                    </div>

                </li>
                <li><%=lang.readXMl("experience_header")%>
                </li>
<%--                <li><%=lang.readXMl("voyages_header")%>--%>
                </li>
                <li><%=lang.readXMl("enow_header")%>
                </li>
                <li><a href="<%=request.getContextPath()%>/ListingImgRegion"><%=lang.readXMl("image_header")%>
                </a>
                </li>
                <li><a href="<%=request.getContextPath() +"/"+language+"/about-victoria.html"%>"><%=lang.readXMl("about_header")%></a>
                </li>
                <li>
                    <a href="<%=request.getContextPath() +"/"+language+"/contact-us.html"%>">
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
<script src="<%=request.getContextPath() %>/scripts/header-home.js"></script>