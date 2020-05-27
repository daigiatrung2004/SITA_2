<%@ page import="DTO.TransportTO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Utils.TextCustomizeFormat" %>
<%@ page import="DTO.StaticTO" %><%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 20/05/2020
  Time: 12:04 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    ArrayList<TransportTO> listtransport = (ArrayList<TransportTO>) request.getAttribute("listtransport");
%>
<html>
<head>
    <title>Danh sách các vận chuyển</title>
    <jsp:include page="../Library.jsp"></jsp:include>
    <style>
        .btn{
            width: 150px;
            margin-bottom: 14px;
        }
    </style>
</head>
<body>
<jsp:include page="HeaderAdmin.jsp"></jsp:include>
<div class="main-transportALL" style="padding: 20px;">
    <%
        if (listtransport != null && listtransport.size() > 0) {

    %>
    <h2 style="text-align: center;">
        Danh sách dữ liệu vận chuyển
    </h2>
    <table class="table">
        <thead>
        <th>Tên vận chuyển</th>
        <th>Chi tiết về vận chuyển</th>
        <th>Giá vận chuyển</th>
        <th>Trạng thái</th>
        <th>Hành động</th>
        </thead>
        <tbody>
        <%
            for (int i = 0; i < listtransport.size(); i++) {
        %>
        <tr>
            <td><%=listtransport.get(i).getName_vi()%></td>
            <td><p style="word-break: break-word"><%=listtransport.get(i).getDetails_vi()%></p></td>
            <td>
                <%=TextCustomizeFormat.currency_format(listtransport.get(i).getPrice())%>
            </td>
            <td>
                <%
                    if(listtransport.get(i).getStatus().equals(StaticTO.ACTIVE_STATUS)){
                %>
                Đang hoạt động
                <%
                    }else{
                %>
                Đã xóa
                <%
                    }
                %>
            </td>
            <td>
                <a href="ListingTransport?type=edit&transportid=<%=listtransport.get(i).getTransport_id()%>"><button class="btn btn-primary">Cập nhật thông tin </button></a>
                <button class="btn btn-danger delete" data-transportid="<%=listtransport.get(i).getTransport_id()%>" >Xóa</button>

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
<script>
    $(document).ready(function(){
          $(".delete").click(function(){
             var transportid=$(this).data("transportid");
             var r=confirm("Bạn có chắc muốn xóa dữ liệu này không?");
              if(r==true){

                  $.ajax({
                      url: 'ListingTransport',
                      type: 'POST',
                      dataType: 'JSON',
                      data: {

                          transportid:transportid,
                          type:"delete"
                      },
                      success: function (data) {
                          if (data['success']) {
                              alert("xóa thành công");
                              location.reload();
                          } else {
                              alert("xóa thất bại");

                          }
                      }
                  });
              }
          });
    });
</script>
<jsp:include page="SideBar.jsp"></jsp:include>
</body>
</html>
