<%@ page import="DTO.AdvertisementTO" %>
<%@ page import="DTO.StaticTO" %><%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 21/05/2020
  Time: 1:58 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    AdvertisementTO advertisementTO=(AdvertisementTO) request.getAttribute("advertisementTO");
    if(advertisementTO!=null){
%>
<style>
    td{
        width: 50%;
    }
</style>
<table >
    <tbody>
    <tr>
        <td>Tiêu đề:</td>
        <td><%=advertisementTO.getTITLE()%></td>
    </tr>
    <tr>
        <td>Tóm tắt:</td>
        <td><%=advertisementTO.getSHORT_DESCRIPTION()%></td>
    </tr>
    <tr>
        <td>Mô tả chi tiết:</td>
        <td><%=advertisementTO.getDESCRIPTION()%></td>
    </tr>
    <tr>
        <td>Hình ảnh:</td>
        <td>
            <div>
                <%if(advertisementTO.getFILE_URL_IMG()!=null&&!advertisementTO.getFILE_URL_IMG().equals("")){%>
            <img src="<%=advertisementTO.getFILE_URL_IMG().replace(StaticTO.STATIC_PATH,"")%>" style="height: 100px;width: 200px;margin: 10px;">
                <%
                    }else{
                %>
                <img src="./img/img_default.png" style="height: 100px;width: 100px;margin: 10px;">
                <%
                    }
                %>
            </div>
        </td>
    </tr>
    <tr>
        <td style="height: 100px">Ngày bắt đầu:</td>
        <td><%=advertisementTO.getSTART_DATE()%></td>
    </tr>
    <tr>
        <td style="height: 100px;">Ngày kết thúc:</td>
        <td><%=advertisementTO.getEND_DATE()%></td>
    </tr>
    </tbody>
</table>
<%
    }
%>