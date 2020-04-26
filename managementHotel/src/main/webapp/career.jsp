<%@ page import="Language.LanguageControl" %>
<%@ page import="DTO.RegionTO" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 24/04/2020
  Time: 7:18 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    LanguageControl lang = (LanguageControl) session.getAttribute("LanguageControl");
    ArrayList<RegionTO> listRegion = (ArrayList<RegionTO>) request.getAttribute("listRegion");
    String language = session.getAttribute("language") != null ? (String) session.getAttribute("language") : LanguageControl.VN_LAN;
    String checkSuccess = request.getAttribute("checkSuccess") != null ? (String) request.getAttribute("checkSuccess") : "";

%>
<html>
<head>
    <title><%=lang.readXMl("career")%>
    </title>
    <jsp:include page="Library.jsp"></jsp:include>
    <link rel="stylesheet" href="css/home-css.css"/>
    <style>
        .header-div-main {
            position: relative !important;
        }

    </style>
</head>
<body>
<div style="background-color:#DEE1E6">
    <jsp:include page="header-not-slide.jsp"></jsp:include>
    <div class="main-career">
        <div class="header-career title-footer">
            <h2 style="text-align: center"><%=lang.readXMl("career")%>
            </h2>
            <%if (language.equals(LanguageControl.VN_LAN)) {%>
            <span style="font-size: 16px;text-align: center;">
                Victoria Hotels & Resort là tập đoàn khách sạn hàng đầu và đang phát triển nhanh chóng, hoạt động bảy khách sạn quyến rũ trên khắp Việt Nam và Lào.<br/>
Là một công ty quản lý khách sạn, Tập đoàn Victoria Việt Nam đã đóng một vai trò quan trọng trong sự phát triển của ngành công nghiệp khách sạn và du lịch trong các lĩnh vực này.
            </span>
            <%} else {%>
            <span style="font-size: 16px;text-align: center;">
               Victoria Hotels & Resorts is a recognized leading and fast growing hotel group, operating seven charming properties throughout Vietnam and Laos.<br/>
As a hotel management company, Victoria Vietnam Group has played a significant part in the development of the hospitality and tourism industries in these areas.
            </span>
            <%}%>
        </div>
        <div class="body-career container">
            <div class="col-md-12">

            </div>
            <div class="col-md-12">
                <%if (language.equals(LanguageControl.VN_LAN)) {%>
                <h2 style="color: #7C2529;font-size: 28px;text-align: center;">CƠ HỘI NGHỀ NGHIỆP</h2>
                <p>
                    Tôi dám bạn dám. Tại Khách sạn TMG, chúng tôi dám biến những ý tưởng táo bạo thành hiện thực và
                    truyền cảm hứng cho mọi người bằng niềm đam mê của chúng tôi để tận dụng tối đa hành trình của riêng
                    họ. Cam kết của chúng tôi đối với các hoạt động kinh doanh có trách nhiệm và dịch vụ khách hàng xuất
                    sắc có nghĩa là chúng tôi có thể tiếp tục phát triển nhóm của chúng tôi trong tương lai.<br/>
                    Nếu như chúng tôi, bạn đam mê nghề nghiệp và môi trường làm việc của bạn và nếu bạn dám đưa con
                    đường sự nghiệp của mình vào tay bạn, hãy liên hệ với chúng tôi.
                </p>
                <form action="SubmitCareer" method="post" enctype="multipart/form-data">
                    <input type="hidden" name="type" value="upload-career">
                    <div class="row">
                        <div class="col-md-6 form-group">
                            <label>Vui lòng chọn các thuộc tính bạn đang tìm kiếm *</label>
                            <select class="form-control" name="region">
                                <%
                                    if (listRegion != null) {
                                        for (int i = 0; i < listRegion.size(); i++) {


                                %>
                                <option value="<%=listRegion.get(i).getRegion_id()%>"><%=listRegion.get(i).getName_vi()%>
                                </option>
                                <%
                                        }
                                    }
                                %>
                            </select>
                        </div>
                        <div class="col-md-6 form-group">
                            <label>Chủ đề *</label>
                            <input type="text" class="form-control" name="subject">
                        </div>
                        <div class="col-md-12 form-group" style="padding:15px!important;">
                            <label>Sơ yếu lý lịch của bạn *</label>
                            <input type="file" class="form-control" name="file">
                        </div>
                        <div class="col-md-12" style="padding:15px!important;">
                            <button class="btn btn-static-2">Xin việc</button>
                        </div>


                    </div>
                </form>
                <%} else {%>
                <h2 style="color: #7C2529;font-size: 28px;text-align: center;">JOB OPPORTUNITIES</h2>
                <p>
                    I Dare You Dare. At TMG Hospitality, we dare to turn bold ideas into reality, and inspire people
                    with our passion to make the most of their own journey. Our commitment to responsible business
                    practices and outstanding customer service means we are well placed to continue our group’s growth
                    into the future.<br/>
                    If like us you are passionate about your profession and your work environment and if you dare to
                    take your career path into your own hands, contact us.
                </p>
                <form action="SubmitCareer" method="post" enctype="multipart/form-data">
                    <input type="hidden" name="type" value="upload-career">
                    <div class="row">
                        <div class="col-md-6 form-group">
                            <label>Please select properties you're looking for *</label>
                            <select class="form-control" name="region">
                                <%
                                    if (listRegion != null) {
                                        for (int i = 0; i < listRegion.size(); i++) {


                                %>
                                <option value="<%=listRegion.get(i).getRegion_id()%>"><%=listRegion.get(i).getName_en()%>
                                </option>
                                <%
                                        }
                                    }
                                %>
                            </select>
                        </div>
                        <div class="col-md-6 form-group">
                            <label>Subject *</label>
                            <input type="text" class="form-control" name="subject">
                        </div>
                        <div class="col-md-12 form-group" style="padding:15px!important;">
                            <label>Your résumé (Word or PDF file) *</label>
                            <input type="file" class="form-control" name="file">
                        </div>
                        <div clas="col-md-12" style="padding:15px!important;">
                            <button class="btn btn-static-2">Apply</button>
                        </div>


                    </div>
                </form>
                <%}%>

            </div>
        </div>
    </div>
    <jsp:include page="loading.jsp"></jsp:include>
    <jsp:include page="./Footer.jsp"></jsp:include>
</div>
<script>
    <%if(checkSuccess.equals("true")){%>
    alert("Application success!!");
    <%}%>
</script>
</body>
</html>
