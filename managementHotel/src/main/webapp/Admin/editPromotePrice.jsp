<%@ page import="DTO.PromoteTO" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 17/05/2020
  Time: 6:32 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    PromoteTO promoteTO = (PromoteTO) request.getAttribute("promoteTO");
    ArrayList<PromoteTO> listPromote = (ArrayList<PromoteTO>) request.getAttribute("listpromoteTO");
    String priceId = request.getParameter("priceId") != null ? (String) request.getParameter("priceId") : "0";
    String type = request.getAttribute("type") != null ? (String) request.getAttribute("type") : "";


%>
<html>
<head>
    <title>Cập nhật danh sách các mã giảm giá</title>
    <jsp:include page="../Library.jsp"></jsp:include>
</head>
<body>
<jsp:include page="HeaderAdmin.jsp"></jsp:include>
<%
    if (type.equals("")) {
%>
<form action="ListingPromote" method="post">
    <input type="hidden" name="type" value="edited"/>
    <input type="hidden" name="priceId" value="<%=priceId%>"/>
    <div class="edit" style="margin: 30px;">
        <h2>Cập nhật khuyến mãi theo giá</h2>
        <div>
            <select name="promoteid" style="padding-top: 10px;padding-bottom: 10px;width: 200px;margin-bottom: 30px;">
                <%
                    if (listPromote != null && promoteTO != null) {
                        for (int i = 0; i < listPromote.size(); i++) {


                %>
                <option value="<%=listPromote.get(i).getPromte_id()%>"  <%=listPromote.get(i).getPromte_id() == promoteTO.getPromte_id() ? "selected" : ""%>><%=listPromote.get(i).getPro_code()%>
                </option>
                <%
                        }
                    }
                %>
            </select>
        </div>
        <div>
            <button class="btn btn-primary" id="update">Cập nhật giảm giá</button>
            <button type="button" class="btn btn-success" id="viewPromote">Xem bảng mã giảm giá</button>
        </div>
    </div>
    <div class="ui modal" id="promote">
        <div class="header">
            <span>Bảng giảm giá</span>
            <span class="close" style="position: absolute;top: 10px;right: 10px;"><i class="fa fa-window-close"
                                                                                     aria-hidden="true"></i></span>
        </div>
        <div class="content">
            <table class="table">
                <thead>
                <th>Mã giảm giá</th>
                <th>Giá trị mã giảm giá</th>
                <th>Ngày hết hạn</th>
                </thead>
                <tbody>
                <%
                    if (listPromote != null) {
                        for (int i = 0; i < listPromote.size(); i++) {


                %>
                <tr>
                    <td><%=listPromote.get(i).getPro_code()%>
                    </td>
                    <td><%=listPromote.get(i).getPro_value()%>
                    </td>
                    <td><%=listPromote.get(i).getExpired_date()%>
                    </td>
                </tr>
                <%
                        }
                    }
                %>
                </tbody>
            </table>
        </div>
    </div>
</form>
<script>
    $(document).ready(function () {
        $("#viewPromote").click(function () {
            $("#promote").modal("show");

        });
        $(".close").click(function () {
            $(".modal").modal("hide");
        });
    });
</script>
<%} else {

        if(promoteTO!=null){
            String expiredate=promoteTO.getExpired_date();
            String []splitexpiredate=expiredate.split(" ");
            if(splitexpiredate.length>0){
                expiredate=splitexpiredate[0];
                splitexpiredate=expiredate.split("-");
                if(splitexpiredate.length>1){
                    expiredate=splitexpiredate[2]+"/"+splitexpiredate[1]+"/"+splitexpiredate[0];

                }
            }
%>
<h2>Cập nhật mã khuyến mãi</h2>
<form action="ListingPromote" method="post">
    <input type="hidden" name="type" value="edited-code">
    <input type="hidden" name="promoteid" value="<%=promoteTO.getPromte_id()%>">
    <div class="form-group">
        <label for="code_promote"> Code giảm giá:</label>
        <input type="text" class="form-control" value="<%=promoteTO.getPro_code()%>" placeholder="Enter code promote" id="code_promote" name="code_promote">
    </div>
    <div class="form-group">
        <label for="value_promote"> Giá trị giảm giá:</label>
        <input type="text" class="form-control" value="<%=promoteTO.getPro_value()%>" placeholder="Enter value promote" id="value_promote" name="value_promote">
    </div>
    <div class="form-group">
        <label for="expried_date"> Ngày hết hạn:</label>
        <input type="text" class="form-control" value="<%=expiredate%>" placeholder="Enter expried_date" id="expried_date"
               name="expried_date">
    </div>
    <button class="btn btn-primary" id="btn-promotion">Cập nhật</button>
</form>
<script>
    $( function() {
        $( "#expried_date" ).datepicker({
            dateFormat:'dd/mm/yy'
        });
    } );
</script>
<%
        }
        }
%>
<jsp:include page="SideBar.jsp"></jsp:include>
</body>
</html>
