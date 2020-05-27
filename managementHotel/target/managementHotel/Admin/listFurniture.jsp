<%@ page import="DTO.FurnitureTO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Utils.TextCustomizeFormat" %><%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 17/05/2020
  Time: 1:59 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    ArrayList<FurnitureTO> listFurnitureTO = (ArrayList<FurnitureTO>) request.getAttribute("listFurnitureTO");
    String kindroomStr=request.getAttribute("kindroomInt")!=null?(String)request.getAttribute("kindroomInt"):"0";
    int kindroomInt;
    try {
        kindroomInt=Integer.parseInt(kindroomStr);
    } catch (NumberFormatException e) {
        kindroomInt=0;
    }

%>
<%
    if (listFurnitureTO != null) {



%>
<h2 style="text-align: center;margin-bottom: 30px">Danh sách thiết bị theo loại phòng</h2>
<table class='table' style="margin: 50px;">
    <thead>
    <th>Tên tiếng việt</th>
    <th>Tên tiếng anh</th>
    <th>Đơn vị tính</th>
    <th>Giá</th>
    <th>Chi tiết </th>
    <th>Hành động</th>
    </thead>
    <tbody>
    <%  for (int i = 0; i <listFurnitureTO.size() ; i++) {%>
    <tr>
        <td><%=listFurnitureTO.get(i).getName_vi()%></td>
        <td><%=listFurnitureTO.get(i).getName_en()%></td>
        <td><%=listFurnitureTO.get(i).getType()%></td>
        <td><%=TextCustomizeFormat.currency_format(listFurnitureTO.get(i).getPrice())%></td>
        <td><p><%=listFurnitureTO.get(i).getDetails()%></p></td>
        <td><button class="btn btn-danger delete-service-2"  data-id="<%=listFurnitureTO.get(i).getId_furniture()%>" data-kind="<%=kindroomInt%>">Xóa</button></td>
    </tr>
    <%
        }
    %>
    </tbody>
</table>
<script>
    $(document).ready(function(){
        $(".delete-service-2").click(function(){

            var id_furniture=$(this).data("id");
            var kind=$(this).data("kind");
            $.ajax({
                url: 'AjaxListingFurniture',
                type: 'POST',
                dataType: 'JSON',
                data: {
                    id_furniture:id_furniture,
                    kind:kind,
                    type:"delete"
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
        });
    });

</script>
<%

    }
%>

