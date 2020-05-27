<%@ page import="DTO.EmployeeTO" %>
<%@ page import="DTO.PositionEmployeeTO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="DTO.StaticTO" %><%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 3/31/2020
  Time: 11:21 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Danh sách nhân viên</title>
    <jsp:include page="../Library.jsp"></jsp:include>
</head>
<body>
<jsp:include page="HeaderAdmin.jsp"></jsp:include>
<%
    ArrayList<PositionEmployeeTO> listPos = (ArrayList<PositionEmployeeTO>) request.getAttribute("listPos");
    ArrayList<EmployeeTO> listEmployeeTO = (ArrayList<EmployeeTO>) request.getAttribute("listEmployeeTO");
    String pos = request.getAttribute("position") != null ? (String) request.getAttribute("position") : "";
    String checkSuccess=request.getParameter("checkSuccess")!=null?(String)request.getParameter("checkSuccess"):"";


%>
<div class="main-listing-hr" style="padding: 10px;">
    <!--search-->

    <%
        if (pos.equals("")) {
    %>
<%--    <div>--%>
<%--        <h2>Tìm kiếm nhân viên</h2>--%>
<%--        <div id="search-listing-hr">--%>
<%--            <div class="item-search">--%>
<%--                <label for="name-hr">Tên :</label>--%>
<%--                <input type="text" name="name-hr" id="name-hr" value="">--%>

<%--            </div>--%>
<%--            <div class="item-search">--%>
<%--                <label for="region">Khu vực :</label>--%>
<%--                <select id="region">--%>
<%--                    <option></option>--%>
<%--                </select>--%>

<%--            </div>--%>
<%--            <div class="item-search">--%>
<%--                <label for="pos">Vị trí :</label>--%>
<%--                <select id="pos">--%>
<%--                    <%--%>
<%--                        if (listPos != null) {--%>
<%--                            for (int i = 0; i < listPos.size(); i++) {--%>


<%--                    %>--%>
<%--                    <option value="<%=listPos.get(i).getId()%>"><%=listPos.get(i).getName()%>--%>
<%--                    </option>--%>
<%--                    <%--%>
<%--                            }--%>
<%--                        }--%>
<%--                    %>--%>
<%--                </select>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
    <!--detail about -->
    <h2>Danh sách nhân viên</h2>
    <table class="table">
        <thead>
        <th>STT</th>
        <th>Họ</th>
        <th>Tên</th>
        <th>Tên đăng nhập</th>
        <th>Ngày làm việc</th>
        <th>Vị trí làm việc</th>
        <th>Hành động</th>
        </thead>
        <tbody>
        <%
            if (listEmployeeTO != null) {
                int count = 1;
                for (int i = 0; i < listEmployeeTO.size(); i++) {
        %>
        <tr>
            <td><%=count%>
            </td>
            <td><%=listEmployeeTO.get(i).getFirstName()%>
            </td>
            <td><%=listEmployeeTO.get(i).getLastName()%>
            </td>
            <td><%=listEmployeeTO.get(i).getLoginName()%>
            </td>
            <td>
                <%=listEmployeeTO.get(i).getStart_date()%>
            </td>
            <td><%=listEmployeeTO.get(i).getPostionName()%>
            </td>
            <td>
                <A href="ListingHR?type=edit-user&id=<%=listEmployeeTO.get(i).getId()%>"><button class="btn btn-primary" >Chỉnh sửa</button></A>
                <button class="btn btn-danger btn-delete" data-id="<%=listEmployeeTO.get(i).getId()%>">Xóa</button>
            </td>

        </tr>
        <%
                    count++;
                }
            }%>
        </tbody>
    </table>
    <%
    } else {
    %>
    <!--cho vi tri employement-->
    <H2>Danh sách vị trí của nhân viên</H2>
    <table class="table">
        <thead>
        <th>STT</th>
        <th>Tên</th>
        <th>Status</th>
        <th>Hành động</th>
        </thead>
        <tbody>
        <%
            if(listPos!=null){
                int count_pos=1;
                for (int i = 0; i <listPos.size() ; i++) {


        %>
        <tr>
            <td><%=count_pos%></td>
            <td><%=listPos.get(i).getName()%></td>
            <td><%=
            listPos.get(i).getStatus().equals(StaticTO.ACTIVE_STATUS)?"Đang hoạt động":"Đã xóa"
            %></td>
            <td>
                <a href="ListingHR?type=edit-position&id=<%=listPos.get(i).getId()%>"><button class="btn btn-primary" >Cập nhật</button></a>
                <button class="btn btn-danger delete-position" data-id="<%=listPos.get(i).getId()%>" >Xóa</button>
            </td>
        </tr>
        <%
                    count_pos++;
                }
            }
        %>
        </tbody>
    </table>
    <%}%>

</div>


<jsp:include page="SideBar.jsp"></jsp:include>
<script>
    $(document).ready(function(){

  $(".delete-position").click(function(){
      var id=$(this).data("id");
      var r=confirm("Bạn có chắc muốn xóa vị trí  này");
      if(r==true) {
          $.ajax({
              url: 'ListingHR',
              type: 'POST',
              dataType: 'JSON',
              data: {
                  id: id,
                  type: "delete-position"
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
    $(".btn-delete").click(function(){
       var id=$(this).data("id");
       var r=confirm("Bạn có chắc muốn xóa nhân viên này");
       if(r==true) {
           $.ajax({
               url: 'ListingHR',
               type: 'POST',
               dataType: 'JSON',
               data: {
                   id: id,
                   type: "delete"
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
    <%
    if(!checkSuccess.equals("")){
    %>
    alert("Xóa/Chỉnh sửa thành công");
    <%
    }
    %>
    });
</script>
</body>
</html>
