<%@ page import="Language.LanguageControl" %>
<%@ page import="DAO.RegionDA" %>
<%@ page import="DTO.RegionTO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Utils.TextCustomizeFormat" %><%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 2/26/2020
  Time: 1:57 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    LanguageControl lang = (LanguageControl) request.getSession().getAttribute("LanguageControl");
    String language = session.getAttribute("language") != null ? (String) session.getAttribute("language") : LanguageControl.VN_LAN;
%>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/footer-css.css">
<footer>
    <div class="div-footer col-md-12">
        <div class="info-footer-represent-hotel col-md-12 row">
            <div style="margin: 50px 0px;width: 100%;display:flex">
                <div class="col-md-4" id="img-footer">
                    <img src="<%=request.getContextPath() %>/img/logo-footer.png"/>
                </div>
                <div class="col-md-8">
                    <ul>
                        <li><%=lang.readXMl("name_respentation")%>̃</li>
                        <li><%=lang.readXMl("address_res")%>
                        </li>
                        <li><%=lang.readXMl("country_res")%>
                        </li>

                    </ul>
                    <ul>
                        <li><%=lang.readXMl("phone_res")%>
                        </li>
                        <li><%=lang.readXMl("fax_res")%>
                        </li>
                        <li><%=lang.readXMl("email_res")%>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="info-footer-hard col-md-12">
            <div class="row" style="margin: 50px;">
                <div class="col-md-4">
                    <div>
                        <h3 class="h3-footer"><%=lang.readXMl("more_contact")%>
                        </h3>
                        <ul>
                            <li>
                                <a href="<%=request.getContextPath() %>/<%=language%>/contact-us.html"><%=lang.readXMl("contact_us")%>
                                </a>
                            </li>
                            <li>
                                <a href="<%=request.getContextPath() %>/<%=language%>/legal-information.html"><%=lang.readXMl("info_legal")%>
                                </a>
                            </li>
                            <li>
                                <a href="<%=request.getContextPath() %>/<%=language%>/career.html"><%=lang.readXMl("career")%>
                                </a>
                            </li>
                            <li>
                                <a href="<%=request.getContextPath() %>/<%=language%>/our-partners.html"><%=lang.readXMl("coordinator")%>
                                </a>
                            </li>
                        </ul>
                    </div>
                    <div>
                        <h3 class="h3-footer"><%=lang.readXMl("transportation_media")%>
                        </h3>
                        <ul>
                            <li>
                                <a href="<%=request.getContextPath() %>/<%=language%>/brochures.html"><%=lang.readXMl("brochures")%>
                                </a>
                            </li>
                            <li>
                                <a href="https://www.victoriahotels.asia/blog/"><%=lang.readXMl("Blog")%>
                                </a>
                            </li>


                        </ul>
                    </div>
                    <div class="social">
                        <div>
                            <ul>
                                <li class="social-link" style="display: inline; padding-right: 15px">
                                    <a style="font-size: 25px" href="https://www.facebook.com/victoria.hotels.resorts"
                                       target="_blank" ref="nofollow">
                                        <i class="facebook square icon"></i>
                                    </a>

                                </li>
                                <li class="social-link" style="display: inline; padding-right: 15px">
                                    <a style="font-size: 25px" href="https://www.instagram.com/victoriahotels"
                                       ref="nofollow" target="_blank">
                                        <i class="instagram icon"></i>
                                    </a>
                                </li>
                                <li class="social-link" style="display: inline; padding-right: 15px">
                                    <a style="font-size: 25px" href="https://www.youtube.com/user/VictoriaHotels"
                                       ref="nofollow" target="_blank">
                                        <i class="youtube icon"></i>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div>
                        <h3 class="h3-footer"><%=lang.readXMl("go_aboad")%>
                        </h3>
                        <ul>
                            <%
                                RegionDA regionDA = new RegionDA();
                                ArrayList<RegionTO> listRegionTO = regionDA.retrieveAllRegion();
                                if (listRegionTO != null && listRegionTO.size() > 0) {
                                    for (int i = 0; i <listRegionTO.size() ; i++) {


                            %>
                            <li>
                                <a href="<%=request.getContextPath() %>/<%=language%>/<%=listRegionTO.get(i).getRegion_id()%>/<%=TextCustomizeFormat.convertTextToString(listRegionTO.get(i).getName_en())%>.html">
                                    <%if(language.equals(LanguageControl.VN_LAN)){
                                        %>
                                    <%=listRegionTO.get(i).getName_vi()%>
                                    <%
                                    }else{%>
                                    <%=listRegionTO.get(i).getName_en()%>
                                    <%}%>
                                </a>
                            </li>
                            <%}
                            }
                            %>
                            <%--                        <li>--%>
                            <%--                            <a href="<%=request.getContextPath() %>/<%=language%>/hotels-resorts/sapa.html"><%=lang.readXMl("resort_1")%> </a>--%>
                            <%--                        </li>--%>
                            <%--                        <li>--%>
                            <%--                            <a href="<%=request.getContextPath() %>/<%=language%>/hotels-resorts/hoian.html"><%=lang.readXMl("resort_2")%> </a>--%>
                            <%--                        </li>--%>
                            <%--                        <li>--%>
                            <%--                            <a href="<%=request.getContextPath() %>/<%=language%>/hotels-resorts/phanthiet.html"><%=lang.readXMl("resort_3")%> </a>--%>
                            <%--                        </li>--%>
                            <%--                        <li>--%>
                            <%--                            <a href="<%=request.getContextPath() %>/<%=language%>/hotels-resorts/cantho.html"><%=lang.readXMl("resort_4")%></a>--%>
                            <%--                        </li>--%>
                            <%--                        <li>--%>
                            <%--                            <a href="<%=request.getContextPath() %>/<%=language%>/hotels-resorts/chaudoc.html"><%=lang.readXMl("resort_5")%> </a>--%>
                            <%--                        </li>--%>
                            <%--                        <li>--%>
                            <%--                            <a href="<%=request.getContextPath() %>/<%=language%>/hotels-resorts/nuisam.html"><%=lang.readXMl("resort_6")%>  </a>--%>
                            <%--                        </li>--%>
                            <%--                        <li>--%>
                            <%--                            <a href="<%=request.getContextPath() %>/<%=language%>/hotels-resorts/xiengthong.html"><%=lang.readXMl("resort_7")%></a>--%>
                            <%--                        </li>--%>
                            <%--                        <li>--%>
                            <%--                            <a href="<%=request.getContextPath() %>/<%=language%>/hotels-resorts/victoria-cruises.html"><%=lang.readXMl("resort_8")%></a>--%>
                            <%--                        </li>--%>
                        </ul>
                    </div>
                </div>

                <div class="col-md-4">
                    <div>
                        <h3 class="h3-footer"><%=lang.readXMl("experience")%>
                        </h3>
                        <ul>

                            <li>
                                <a href="<%=request.getContextPath() %>/<%=language%>/victoria-train.html"><%=lang.readXMl("experience")%>
                                </a>
                            </li>
                            <li>
                                <a href="<%=request.getContextPath() %>/<%=language%>/victoria-speedboat.html"><%=lang.readXMl("train_1")%>
                                </a>
                            </li>
                            <li>
                                <a href="https://victoriavoyages.com/" target="_blank"><%=lang.readXMl("train_2")%>
                                </a>
                            </li>
                        </ul>
                    </div>
                    <div>

                    </div>
                </div>


            </div>
        </div>
    </div>
</footer>

