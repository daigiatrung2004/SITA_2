<%@ page import="DTO.RegionTO" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 29/04/2020
  Time: 7:34 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    ArrayList<RegionTO> listRegion=(ArrayList<RegionTO>) request.getAttribute("listRegion");


%>
<html>
<head>
    <title>Thêm dữ liệu khách sạn</title>
    <link rel="stylesheet" href="./scripts/dropify/dist/css/dropify.min.css"/>
    <link rel="stylesheet" href="./scripts/dropify/dist/fonts/*">
    <jsp:include page="../Library.jsp"></jsp:include>
    <link rel="stylesheet" href="./css/Admin/initManagerHotel.css">

</head>
<body>
<jsp:include page="HeaderAdmin.jsp"></jsp:include>
<div class="div-insert-img-hotel" style="padding: 20px;">
    <h2>Thêm hình ảnh  khách sạn</h2>
     <form action="InsertImageHotel" method="post" id="frm-img" enctype="multipart/form-data">
         <input type="hidden" name="listsrc" id="listsrc" value="">
         <input type="hidden" name="listomgorgin" id="listomgorgin" value="">
         <input type="hidden" name="type" value="insert">
         <div class="form-control">
             <select id="region" name="region">
                 <%
                     if(listRegion!=null&&listRegion.size()>0){
                         for (int i = 0; i <listRegion.size() ; i++) {


                 %>
                 <option value="<%=listRegion.get(i).getRegion_id()%>"><%=listRegion.get(i).getName_vi()%></option>
                 <%
                         }
                     }
                 %>
             </select>

         </div>
         <div class="listImg col-lg-12">
             <div class="array-img col-lg-12" >
                 <div class="div-array-img col-md-12 row">
                     <div class="btn-upload-img ">
                         <span><i class="fas fa-plus"></i></span>
                     </div>
                 </div>

             </div>
             <div class="ui modal" id="myModal">


                 <!-- Modal Header -->
                 <div class="header">
                     <h4 class="modal-title">Thêm ảnh</h4>
                     <button type="button" class="close ui ok">&times;</button>
                 </div>

                 <!-- Modal body -->
                 <div class="content">

                     <input type="file" id="input-file-now" class="dropify"/>
                 </div>

                 <!-- Modal footer -->
                 <div class="actions">
                     <button type="button" class="btn btn-primary" id="insert-img-resource">Insert</button>
                     <button type="button" class="btn btn-primary ui ok">Close</button>
                 </div>


             </div>
         </div>
         <button type="button" class="btn btn-primary" id="btn-img-room" style="margin: 20px;">Cập nhật</button>
     </form>
</div>
<script src="./scripts/Admin/insertImgHotel-js.js"></script>
<script src="./scripts/dropify/dist/js/dropify.min.js"></script>
<script>
    $(document).ready(function () {
        $('#input-file-now').dropify();
    });
    var region = new SlimSelect({
        select: '#region'
    });
    $(".close").click(function () {
        $("#myModal").modal('hide');
    });
    $(".btn-upload-img").click(function () {
        $("#myModal").modal('show');
    });

</script>
<jsp:include page="SideBar.jsp"></jsp:include>
</body>
</html>
