<%@ page import="DTO.BookingTO" %>
<%@ page import="DTO.RoomTO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="DTO.KindRoomTO" %>
<%@ page import="DTO.CustomerTO" %><%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 3/29/2020
  Time: 6:54 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    ArrayList<RoomTO> listRoomTO = (ArrayList<RoomTO>) request.getAttribute("listRoomTO");
    ArrayList<BookingTO> listBooking = (ArrayList<BookingTO>) request.getAttribute("listBooking");

%>
<div class="detail-booking col-md-12">
    <%
        if (listBooking != null) {
            for (int i = 0; i <listBooking.size() ; i++) {
                BookingTO bookingTO=listBooking.get(i);
                RoomTO roomTO=listRoomTO.get(i);
                RoomTO roomTO1=null;
                KindRoomTO kindRoomTO=null;
                CustomerTO customer=null;
                if(roomTO!=null){
                    roomTO1=roomTO.getRoomTO();
                    kindRoomTO=roomTO.getKindRoomTO();
                    customer=roomTO.getCustomerTO();
                }

    %>
    <div class="booking-item col-md-12" style="min-height:250px;display:flex;align-items: center;">
         <div class="img-house col-md-3">
             <img src="./img/employee/house-3d.jpg" style="height: 100px">
         </div>
        <div class="col-md-6 info-room" >
        <span>Tên phòng:<%=roomTO1.getName()%></span><br/>
        <span>Loại phòng:<%=kindRoomTO.getName_vi()%></span><br/>
        <span>Check in:<%=bookingTO.getCheck_in_date()%></span><br/>
        <span>Check out:<%=bookingTO.getCheck_out_date()%></span><br/>

        </div>
        <div class="col-md-3 info-booked">
       <span>Người đặt phòng:<%=customer.getFirstname() + customer.getLastname()%></span>
        </div>
    </div>
    <%
            }
        }else{
    %>
    <h4 style="text-align: center">Không tìm thấy dữ liệu nào</h4>
    <%}%>
</div>
