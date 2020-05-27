<%@ page import="DTO.RegionTO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="DTO.TransportTO" %>
<%@ page import="Utils.TextCustomizeFormat" %><%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 20/05/2020
  Time: 10:50 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    ArrayList<RegionTO> listRegionTO = (ArrayList<RegionTO>) request.getAttribute("listRegionTO");
    ArrayList listAllTransport = (ArrayList) request.getAttribute("listAllTransport");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Danh sách các dịch vụ vận chuyển</title>
    <jsp:include page="../Library.jsp"></jsp:include>
</head>
<body>
<jsp:include page="HeaderAdmin.jsp"></jsp:include>
<div class="main-transport" style="padding: 20px;">
    <h2>Danh sách các dịch vụ vận chuyển theo từng khu vực</h2>
    <%
        if (listRegionTO != null && listAllTransport != null) {
            for (int i = 0; i <listRegionTO.size() ; i++) {
              ArrayList<TransportTO> listtransport=(ArrayList<TransportTO>)listAllTransport.get(i);
              if(listtransport!=null&&listtransport.size()>0){

    %>
     <div class="item-transport-region">
         <div>
             <span class="span-static"><%=listRegionTO.get(i).getName_vi()%></span>
         </div>
         <div>

           <table class="table">
               <thead>
               <th>Tên vận chuyển</th>
               <th>Chi tiết về vận chuyển</th>
               <th>Giá vận chuyển</th>
               <th>Hành động</th>
               </thead>
               <tbody>
<%
    for (int j = 0; j <listtransport.size() ; j++) {


%>
               <tr>
                   <td><%=listtransport.get(j).getName_vi()%></td>
                   <td><%=listtransport.get(j).getDetails_vi()%></td>
                   <td><%=TextCustomizeFormat.currency_format(listtransport.get(j).getPrice())%></td>
                   <td>

                       <button class="btn btn-danger delete"  data-regionid="<%=listRegionTO.get(i).getRegion_id()%>" data-transportid="<%=listtransport.get(j).getTransport_id()%>">Xóa</button>
                   </td>
               </tr>
<%
    }
%>
               </tbody>
           </table>
         </div>
     </div>
    <%

                }
            }
        }
    %>
</div>
<jsp:include page="SideBar.jsp"></jsp:include>
<script>
    $(document).ready(function(){
       $(".delete").click(function(){

           var regionid=$(this).data("regionid");
           var transportid=$(this).data("transportid");
          var r=confirm("Bạn có chắc muốn xóa thông tin này");
          if(r==true){

              $.ajax({
                  url: 'AjaxInsertTransport',
                  type: 'POST',
                  dataType: 'JSON',
                  data: {
                      regionid:regionid,
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
</body>
</html>
