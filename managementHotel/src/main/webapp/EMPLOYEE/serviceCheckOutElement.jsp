<%@ page import="DTO.ProductTO" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 15/04/2020
  Time: 7:25 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    ArrayList<ProductTO> listProduct = (ArrayList<ProductTO>) request.getAttribute("listProduct");
%>
<%
    if (listProduct != null && listProduct.size() > 0) {
        for (int i = 0; i < listProduct.size(); i++) {


%>
<div class="main-item-service-check-out div-main-item-check-out"  data-price="<%=listProduct.get(i).getPRICE()%>"
     data-name="<%=listProduct.get(i).getNAME()%>" data-id="<%=listProduct.get(i).getID()%>">

    <div class="item-service-checkout">
        <span><%=listProduct.get(i).getNAME()%></span>
    </div>
</div>
<%
    }
} else {
%>
<div>
    <h4 style="font-weight: bold;color: black;">Không sản phẩm nào!!!</h4>
</div>

<%
    }
%>

