<%@ page import="java.util.ArrayList" %>
<%@ page import="DTO.UploadResourceTO" %>
<%@ page import="DTO.StaticTO" %><%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 29/04/2020
  Time: 7:09 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    ArrayList listImg=(ArrayList) request.getAttribute("listImg");
%>
<html>
<head>
    <title>Danh sách hình ảnh khách sạn</title>
    <jsp:include page="../Library.jsp"></jsp:include>
    <link rel="stylesheet" href="./css/Admin/ListImageHotel.css">
</head>
<body>
<jsp:include page="HeaderAdmin.jsp"></jsp:include>
<div class="div-main-listing-hotel">
<div class="div-insert col-lg-12" style="margin:20px">
    <button class="btn btn-primary"><a href="InsertImageHotel">Thêm hình ảnh khách sạn</a></button>
</div>
<div class="div-listing col-lg-12" style="padding: 0px;">
    <div class="col-lg-12" style=";border-top: 1px solid #ccc;border-bottom: 1px solid #ccc;padding: 10px;">
    <h3 style="text-align: center;color:black">Danh sách hình ảnh</h3>
    </div>
    <div style="display: flex;padding: 20px;height: 100%;background: #e6e8e7">
<%
    if(listImg!=null&&listImg.size()>0){
        for (int i = 0; i <listImg.size() ; i++) {

           ArrayList<UploadResourceTO> listResource=(ArrayList<UploadResourceTO>) listImg.get(i);
           if(listResource!=null){
               for (int j = 0; j <listResource.size() ; j++) {


%>
<div class="item-img " style="display: flex;margin: 10px;" id="item-<%=listResource.get(j).getId()%>">
<img src="<%=listResource.get(j).getFile_url().replace(StaticTO.STATIC_PATH,".\\")%>" style="height: 100px;width: 100px;">
<span class="close-item-img" data-id="<%=listResource.get(j).getId()%>">
<i class="fas fa-times-circle"></i>
</span>
</div>
    <%
                    }
                }
            }
        }
    %>
    </div>
</div>
</div>
<script src="./scripts/Admin/listImageHotel-js.js">
</script>
<jsp:include page="SideBar.jsp"></jsp:include>
</body>
</html>
