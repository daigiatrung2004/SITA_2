<%@ page import="DTO.RoomTO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="DTO.StaticTO" %><%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 4/3/2020
  Time: 7:27 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    ArrayList<RoomTO> listRoomTO = (ArrayList<RoomTO>) request.getAttribute("listRoomTO");
%>
<html>
<head>
    <title>Danh sách các phòng </title>
    <jsp:include page="../Library.jsp"></jsp:include>
    <link rel="stylesheet" href="./css/Employeee/listingRoom.css"/>
    <style>
        .lds-dual-ring {
            display: inline-block;
            width: 80px;
            height: 80px;
        }
        .lds-dual-ring:after {
            content: " ";
            display: block;
            width: 64px;
            height: 64px;
            margin: 8px;
            border-radius: 50%;
            border: 6px solid #007bff;
            border-color: #007bff transparent #007bff transparent;
            animation: lds-dual-ring 1.2s linear infinite;
        }
        @keyframes lds-dual-ring {
            0% {
                transform: rotate(0deg);
            }
            100% {
                transform: rotate(360deg);
            }
        }
        .loading{
            display: none;
            position: absolute;
            top:0;
            right: 0;
            bottom: 0;
            left: 0;
            height: 100%;
            width: 100%;
        }

    </style>
</head>
<body>
<jsp:include page="Header-employee.jsp"></jsp:include>
<div style="text-align: right;margin: 10px;margin-right: 100px;">
    <label>Trạng thái phòng:</label>
    <select id="select-status" >
        <option value="0">Tất cả</option>
        <option value="1">Đang trống</option>
        <option value="2">Đang sử dụng</option>
    </select>
</div>
<div>
    <div class="main-room row">
        <%
            for (int i = 0; i < listRoomTO.size(); i++) {


        %>
        <div class="item-room">
            <%
                if (listRoomTO.get(i).getStatus().equals(StaticTO.ACTIVE_STATUS)) {
            %>
            <a href="DetailsRoom?roomId=<%=listRoomTO.get(i).getRoom_id()%>" style="color: black;">
                <%
                    }else{
                %>
                <a href="CheckOut?roomId=<%=listRoomTO.get(i).getRoom_id()%>" style="color: black;">
                <%
                    }
                %>
                <div class="img-item">
                    <img src="./img/employee/img-daidien-room.jpg" style="height: 150px;width: 100%">
                </div>
                <div class="footer-item">
                    <div class="footer-div">Số giường:2</div>
                    <div class="footer-div">Số người tối đa:<%=listRoomTO.get(i).getMax_people()%>
                    </div>
                    <div class="footer-div">Trạng thái phòng:<span class="error">
                        <%if(listRoomTO.get(i).getStatus().equals(StaticTO.ACTIVE_STATUS)){%>
                        Đang trống
                        <%}else if(listRoomTO.get(i).getStatus().equals(StaticTO.COMPLETE_STATUS)){%>
                        Đang được sử dụng
                        <%}else{%>
                        Đang sữa chữa
                        <%}%>
                    </span></div>

                </div>
            </a>
        </div>
        <%
            }
        %>
    </div>
    <div class="loading">
        <div style="display: flex;justify-content: center;align-items: center;height: inherit">
            <div class="lds-dual-ring"></div>
        </div>
    </div>
</div>
<script>
    $(".main-room .item-room").transition("fade in");
</script>
<jsp:include page="../Footer.jsp"></jsp:include>
<script>
    $(document).ready(function(){
        $("#select-status").change(function(){
           var id=$("#select-status").val();
            // $(".main-room").html("");
           $(".loading").show();
            $.ajax({
                url: 'ListingRoom',
                type: 'POST',
                dataType: 'html',
                data: {
                    id:id,
                    type:"search"
                },
                success: function (data) {
                    $(".loading").hide();
                       $(".main-room").html(data);

                }
            });

        });
    });
</script>
</body>
</html>
