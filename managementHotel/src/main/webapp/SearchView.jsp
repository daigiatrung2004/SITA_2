<%@ page import="java.util.ArrayList" %>
<%@ page import="DTO.*" %><%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 3/19/2020
  Time: 3:12 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    ArrayList<SearchTO> listSearchNew =(ArrayList<SearchTO>)request.getAttribute("listSearchNew");
%>
<html>
<head>

    <jsp:include page="Library.jsp"></jsp:include>
    <style>
        .header-div-main {
            position: relative !important;
        }
    </style>
    <title>Kết quả tìm kiếm</title>
</head>
<body>
<div class="main-timkiem col-md-12">
<%if(listSearchNew!=null){
    for (int i = 0; i <listSearchNew.size() ; i++) {
        UploadResourceTO uploadResourceTO=listSearchNew.get(i).getUploadResourceTO();
        KindRoomTO kindRoomTO=listSearchNew.get(i).getKindRoomTO();
        RegionTO regionTO=listSearchNew.get(i).getRegionTO();
        String path= StaticTO.STATIC_PATH;
    %>
    <div class="item-search">
        <div class="col-md-4 img-gallery">
               <img src="<%=uploadResourceTO.getFile_url().replace(path,".\\")%>">
        </div>
        <div class="col-md-8">
            <h2 class="h2-kind-room"><%=kindRoomTO.getName_vi()%></h2>
            <h5>Location:<%=regionTO.getName_vi()%></h5>
        </div>
    </div>
    <%
            }
    }
    %>
</div>
</body>
</html>
