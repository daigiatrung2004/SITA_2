<%@ page import="Language.LanguageControl" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="DTO.RegionTO" %><%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 22/04/2020
  Time: 7:54 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%LanguageControl lang = (LanguageControl) session.getAttribute("LanguageControl");%>
<%
    String language = session.getAttribute("language") != null ? (String) session.getAttribute("language") : LanguageControl.VN_LAN;
    ArrayList<RegionTO> listRegion = (ArrayList<RegionTO>) request.getAttribute("listRegion");
    String checkSuccess = request.getAttribute("checkSuccess") != null ? (String) request.getAttribute("checkSuccess") : "";
%>

<!DOCTYPE html>
<html>
<head>
    <title><%=lang.readXMl("contact_us")%>
    </title>
    <jsp:include page="Library.jsp"></jsp:include>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/home-css.css"/>
    <style>
        .header-div-main {
            position: relative !important;
        }

        .title-contact {
            padding: 100px;
            margin-bottom: 100px;
            background: white;
        }
    </style>
</head>
<body style="background-color:#DEE1E6">
<jsp:include page="header-not-slide.jsp"></jsp:include>
<div>
    <div class="title-contact">
        <h2 style="text-align: center"><%=lang.readXMl("enow_header")%>
        </h2>
    </div>

    <div class="form-report container" style="background-color: white;padding: 10px;display: flex;">
        <form id="frm" action="<%=request.getContextPath() %>/FooterControl" method="post" style="display: flex;">
            <input type="hidden" name="type" value="updateContactus">
            <div class="col-md-4">
                <%
                    if (language.equals(LanguageControl.VN_LAN)) {
                %>
                <p>Vui lòng liên hệ với chúng tôi bất kỳ lúc nào qua mẫu email bên dưới. Chúng tôi sẽ trả lời trong vòng
                    24 giờ làm việc.</p>

                <%
                } else {
                %>
                <p>Please feel free to contact us any time, using our email contact form. We will reply within 24
                    working hours.</p>
                <%
                    }
                %>
                <div class="form-group">
                    <label for="hotel">
                        <%if (language.equals(LanguageControl.VN_LAN)) {%>
                        Khách sạn *:
                        <%} else {%>
                        Hotel *:
                        <%}%>
                    </label>
                    <select id="hotel" name="region" class="form-control">
                        <%
                            if (listRegion != null) {
                                for (int i = 0; i < listRegion.size(); i++) {


                        %>
                        <%if (language.equals(LanguageControl.VN_LAN)) {%>
                        <option value="<%=listRegion.get(i).getRegion_id()%>>"><%=listRegion.get(i).getName_vi()%>
                        </option>
                        <%} else {%>
                        <option value="<%=listRegion.get(i).getRegion_id()%>>"><%=listRegion.get(i).getName_en()%>
                        </option>
                        <%}%>
                        <%
                                }
                            }%>
                    </select>
                </div>
                <div class="form-group">
                    <label for="room">
                        <%if (language.equals(LanguageControl.VN_LAN)) {%>
                        Phòng ban *:
                        <%}else{%>
                        Department *:
                        <%}%>
                    </label>
                    <select id="room" name="room" class="form-control">
                        <%if (language.equals(LanguageControl.VN_LAN)) {%>
                        <option value="Maketing">Phòng maketing</option>
                        <option value="Reservation">Phỏng đặt phòng</option>
                        <%} else {%>
                        <option value="Maketing">Maketing</option>
                        <option value="Reservation">Reservation</option>
                        <%}%>
                    </select>
                </div>
                <div>
                    <%if (language.equals(LanguageControl.VN_LAN)) {%>
                    <span>Điện thoại:1800 599 955</span>
                    <%} else {%>
                    <span>Phone:1800 599 955</span>
                    <%}%>
                </div>
            </div>
            <div class="col-md-8">
                    <%if(language.equals(LanguageControl.VN_LAN)){%>
                <p>VUI LÒNG ĐIỀN NỘI DUNG CỦA BẠN BÊN DƯỚI</p>
                    <%}else{%>
                <p>PLEASE FILL YOUR CONTENT BELOW</p>
                    <%}%>

                <div class="col-md-12 row">
                    <%if (language.equals(LanguageControl.VN_LAN)) {%>
                    <div class="col-md-6">

                        <label for="name">Họ và tên *</label>
                        <input type="text" class="form-control" name="nameuser" id="name" value="" required="required">
                    </div>
                    <div class="col-md-6">
                        <label for="address">Địa chỉ mail *</label>
                        <input type="email" class="form-control" name="email" id="address" value="" required="required">
                    </div>
                    <div class="col-md-6">
                        <label>Quốc tịch *</label>
                        <jsp:include page="NationalDefault.jsp"></jsp:include>
                    </div>
                    <div class="col-md-6">
                        <label for="title">Tiêu đề *</label>
                        <input type="text" id="title" name="title" class="form-control" value="" required="required">
                    </div>
                    <div class="col-md-12">
                        <label for="content">Nội dung *</label>
                        <textarea name="content" id="content">

                 </textarea>
                    </div>
                    <div style="padding: 10px;">
                        <button class="btn btn-static-2">Gửi</button>
                    </div>
                    <%} else {%>
                    <div class="col-md-6">

                        <label for="name">Your Name *</label>
                        <input type="text" name="nameuser" class="form-control" id="name" value="" required="required">
                    </div>
                    <div class="col-md-6">
                        <label for="address">Your Email Address *</label>
                        <input type="email" name="email" id="address" class="form-control" value="" required="required">
                    </div>
                    <div class="col-md-6">
                        <label>Your Country *</label>
                        <jsp:include page="NationalDefault.jsp"></jsp:include>
                    </div>
                    <div class="col-md-6">
                        <label for="title">Subject *</label>
                        <input type="text" id="title" name="title" value="" class="form-control" required="required">
                    </div>
                    <div class="col-md-12">
                        <label for="content">Message *</label>
                        <textarea id="content">

                 </textarea>
                    </div>
                    <div style="padding: 10px;">
                        <button class="btn btn-static-2">SEND</button>
                    </div>
                    <%}%>
                </div>
        </form>

    </div>

</div>
</div>

<jsp:include page="loading.jsp"></jsp:include>
<jsp:include page="./Footer.jsp"></jsp:include>
<script>
    tinymce.init({
        selector: '#content',
        menu: {
            file: {title: 'File', items: 'newdocument'},
            edit: {title: 'Edit', items: 'undo redo | cut copy paste pastetext | selectall'},
            insert: {title: 'Insert', items: 'link media | template hr'},
            view: {title: 'View', items: 'visualaid'},
            format: {
                title: 'Format',
                items: 'bold italic underline strikethrough superscript subscript | formats | removeformat'
            },
            table: {title: 'Table', items: 'inserttable tableprops deletetable | cell row column'},
            tools: {title: 'Tools', items: 'spellchecker code'}
        }
    });
</script>
<script>
    <%if(checkSuccess.equals("true")){%>
    alert("Thành công");
    <%}else if(checkSuccess.equals("false")){%>
    alert("Thất bại");
    <%}%>
</script>
</body>
</html>
