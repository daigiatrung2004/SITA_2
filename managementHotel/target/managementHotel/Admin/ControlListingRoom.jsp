<%@ page import="DTO.RegionTO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="DTO.RoomTO" %><%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 24/05/2020
  Time: 11:26 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Thông tin phòng</title>
    <jsp:include page="../Library.jsp"></jsp:include>
    <%
     ArrayList<RegionTO> listRegionTO=(ArrayList<RegionTO>)request.getAttribute("listRegionTO");
     RegionTO regionTO=(RegionTO) request.getAttribute("regionTO");
     ArrayList<RoomTO> listRoomTO=(ArrayList<RoomTO>)request.getAttribute("listRoomTO");
    %>
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
            border: 6px solid #0588e4;
            border-color: #0588e4 transparent #0588e4 transparent;
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
        }

    </style>
</head>
<body>
<jsp:include page="HeaderAdmin.jsp"></jsp:include>
<div class="search" style="padding:10px;">
<h2>Tìm kiếm</h2>
 <label>Chọn phòng:</label>
    <select id="room">
        <%
            if(listRoomTO!=null){
                for (int i = 0; i <listRoomTO.size() ; i++) {


        %>
        <option value="<%=listRoomTO.get(i).getRoom_id()%>"><%=listRoomTO.get(i).getName()%></option>
        <%
                }
            }
        %>
    </select>
    <div style="margin-top: 10px;">
    <button class="btn btn-primary edit"  style="margin-left:10px;">Chỉnh sửa</button>
    <button class="btn btn-danger delete">Xóa</button>
    </div>

</div>
<div class="content-room">

</div>
<div class="loading">
    <div style="display: flex;justify-content: center;align-items: center;">
    <div class="lds-dual-ring"></div>
    </div>
</div>
<jsp:include page="SideBar.jsp"></jsp:include>
<script>
    var room = new SlimSelect({
        select: '#room'
    });
    $(".edit").click(function(){
        var id=$("#room").val();
        $(".loading").show();
        $.ajax({
            url: 'ListingHotelManager',
            type: 'POST',
            dataType: 'html',
            data: {
                id:id,
                type:'edit-room'
            },
            success: function (data) {
                $(".loading").hide();
                $(".content-room").html(data);
            }
        });
    });
    $(".delete").click(function(){
          var r=confirm("Bạn có chắc muốn xóa phòng!!");
        if(r){
            var id=$("#room").val();
            $.ajax({
                url: 'ListingHotelManager',
                type: 'POST',
                dataType: 'JSON',
                data: {
                    id:id,
                    type:'delete-room'
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
</script>
</body>
</html>
