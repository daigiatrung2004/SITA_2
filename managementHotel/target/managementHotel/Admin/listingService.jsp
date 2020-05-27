<%@ page import="DTO.ServiceTO" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 22/05/2020
  Time: 8:18 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    ArrayList<ServiceTO> listService=(ArrayList<ServiceTO>)request.getAttribute("listService");
%>
<html>
<head>
    <title>Danh sách các thiết bị</title>
    <jsp:include page="../Library.jsp"></jsp:include>
</head>
<body>
<jsp:include page="HeaderAdmin.jsp"></jsp:include>
<div class="listing-service" style="padding: 20px;">
    <%
        if(listService!=null){

    %>
    <h2>Danh sách các dịch vụ,thiết bị</h2>
    <table class="table">
        <thead>
        <th>Tên dịch vụ</th>
        <th>Chi tiết về các dịch vụ</th>
        <th>Hành động</th>
        </thead>
        <tbody>
         <%
             for (int i = 0; i <listService.size() ; i++) {
                 %>
         <tr>
             <td><%=listService.get(i).getService_name_vi()%></td>
             <td><%=listService.get(i).getService_details_vi()%></td>
             <td>
                 <a href="ListingService?type=edit-service&id=<%=listService.get(i).getId_service()%>"><button class="btn btn-primary">Chỉnh sửa</button></a>
                 <button class="btn btn-danger delete" data-id="<%=listService.get(i).getId_service()%>">Xóa</button>
             </td>
         </tr>
         <%
             }
         %>
        </tbody>
    </table>
<%
    }
%>
</div>
<jsp:include page="SideBar.jsp"></jsp:include>
<script>
    $(document).ready(function(){
        $(".delete").click(function(){
            var r=confirm("Bạn có chắc muốn xóa phòng!!");
            if(r){
                var id=$(this).data("id");
                $.ajax({
                    url: 'ListingService',
                    type: 'POST',
                    dataType: 'JSON',
                    data: {
                        id:id,
                        type:"delete-service"
                    },
                    success: function (data) {
                        if (data['success']) {
                            alert("Thành công");
                            location.reload();
                        } else {
                            alert("Thất bại");
                        }
                    }
                });
            }
        });
    });
</script>
</body>
</html>
