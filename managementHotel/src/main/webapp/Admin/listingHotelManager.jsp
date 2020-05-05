<%@ page import="DTO.RegionTO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="DTO.StaticTO" %><%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 30/04/2020
  Time: 8:42 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Danh sách dữ liệu khách sạn</title>
    <jsp:include page="../Library.jsp"></jsp:include>
    <%
        ArrayList<RegionTO> listRegion=(ArrayList<RegionTO>) request.getAttribute("listregion");
    %>
</head>
<body>
<jsp:include page="HeaderAdmin.jsp"></jsp:include>
<div class="div-main-listing-hotel" style="padding: 20px;">
    <h2>Danh sách các khách sạn</h2>
    <div>
        <table class="table">
            <thead>
            <th>Tên </th>
            <th>Địa chỉ</th>
            <th>Hành động</th>

            </thead>
            <tbody>
<%
    if(listRegion!=null){
        for (int i = 0; i <listRegion.size() ; i++) {


%>
            <tr>
                <td><%=listRegion.get(i).getName_vi()%></td>
                <td><%=listRegion.get(i).getAddress()%></td>
                <td><a href="UpdateRegion?type=update&id=<%=listRegion.get(i).getRegion_id()%>"><button class="btn btn-primary update" style="margin: 5px;margin-top:1px;" data-id="<%=listRegion.get(i).getRegion_id()%>">Cập nhật</button></a><button class="btn btn-danger delete" data-id="<%=listRegion.get(i).getRegion_id()%>" style="margin: 5px;margin-top:1px;">Xóa</button><button class="btn btn-success detail" style="margin: 5px;margin-top:1px;" name="item-<%=listRegion.get(i).getRegion_id()%>">Xem chi tiết</button></td>
            </tr>
 <%
         }
     }
 %>
            </tbody>
        </table>
    </div>
</div>
<%
    if(listRegion!=null){
        for (int i = 0; i < listRegion.size() ; i++) {


%>
<div class="ui modal" id="item-<%=listRegion.get(i).getRegion_id()%>">
    <div class="header">Thông tin chi tiết
        <span style="position: absolute;top: 10px;right: 10px;z-index: 2;" class="close"><i class="close icon"></i></span>
    </div>
    <div class="content">
        <table class="table">
           <tbody>
           <tr>
               <td>Tên tiếng việt:</td>
               <td><%=listRegion.get(i).getName_vi()%></td>
           </tr>
           <tr>
               <td>Tên tiềng anh:</td>
               <td><%=listRegion.get(i).getName_vi()%></td>
           </tr>
           <tr>
               <td>Ảnh đại diện:</td>
               <td>
                   <%if(!listRegion.get(i).getFile_url_img().equals("")){%>
                   <img src="<%=listRegion.get(i).getFile_url_img().replace(StaticTO.STATIC_PATH,"").replace("\\","//")%>" style="height: 50px;width: 50px;">
                   <%}%>
               </td>
           </tr>
           <tr>
               <td>Địa chỉ:</td>
               <td><%=listRegion.get(i).getAddress()%></td>
           </tr>
           <tr>
               <td>Số điện thoại:</td>
               <td><%=listRegion.get(i).getContact_phone()%></td>
           </tr>
           <tr>
               <td>Trạng thái:</td>
               <td>
                   <%
                       String status=listRegion.get(i).getStatus();
                       if(status.equals(StaticTO.ACTIVE_STATUS)){
                   %>
                   Đang hoạt động
                   <%
                       }else if(status.equals(StaticTO.PENDING_STATUS)){
                           %>
                   Đang sửa chữa
                   <%
                       }else{
                   %>
                   Ngưng hoạt động
                   <%
                       }
                   %>
               </td>
           </tr>
           <tr>
               <td>Ghi chú:</td>
               <td><%=listRegion.get(i).getRemark()%></td>
           </tr>
           </tbody>
        </table>
    </div>
</div>
<%
        }
    }
%>
<script src="./scripts/Admin/listingHotelmanager-js.js"></script>
<script>
    $(document).ready(function(){
$(".close").click(function(){
   $(".modal").modal("hide");
});
    });
</script>
<jsp:include page="SideBar.jsp"></jsp:include>
</body>
</html>
