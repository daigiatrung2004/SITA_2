<%@ page import="DTO.RegionTO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="DTO.StaticTO" %><%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 26/04/2020
  Time: 7:25 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String checkIn = request.getParameter("checkIn") != null ? (String) request.getParameter("checkIn") : "";
    String checkOut = request.getParameter("checkOut") != null ? (String) request.getParameter("checkOut") : "";
    String numOfPeo = request.getParameter("numOfPeo") != null ? (String) request.getParameter("numOfPeo") : "0";
    String promote = request.getParameter("promote") != null ? (String) request.getParameter("promote") : "";
    ArrayList<RegionTO> listRegion = (ArrayList<RegionTO>) request.getAttribute("listRegion");
    ArrayList<Integer> listCheckRoom = (ArrayList<Integer>) request.getAttribute("listCheckRoom");
%>
<html>
<head>
    <title></title>
    <jsp:include page="Library.jsp"></jsp:include>
    <link rel="stylesheet" href="css/listSearchAll-css.css">
    <link rel="stylesheet" href="css/home-css.css"/>
    <style>
        .header-div-main {
            position: relative !important;
        }
        .input-item:hover{
            cursor: pointer;
        }
    </style>
</head>
<body>
<jsp:include page="header-not-slide.jsp"></jsp:include>
<div class="main-select-region container">

    <div class="col-lg-12" style="padding: 50px;padding-bottom: 14px;">
        <h2 style="color: rgba(124, 37, 41, 0.9);">Rất tiếc,không có phòng phù hợp với tiêu chí tìm kiếm của quý khách!!!</h2>
        <h3>Vui lòng chọn một ngày khác</h3>
        <form class="col-md-12 " style="display: flex;align-items: center;" action="SearchControl" method="get">


         <div class="col-md-5">
           <label for="checkIn">Chọn ngày đến:</label>
             <input type="text" name="checkIn" class="form-control input-item" id="checkIn"  readonly>

         </div>
        <div class="col-md-5">
            <label for="checkOut">Chọn ngày đi</label>
            <input type="text" name="checkOut" class="form-control input-item" id="checkOut"  readonly>
        </div>
            <input type="hidden" name="location" value="">
            <input type="hidden" name="numOfPeo" value="">
            <input type="hidden" name="promote" value="">
        <div class="col-md-5" style="padding-top: 30px;">
            <button class="btn btn-static-2" style="width: 100px;">Tìm kiếm</button>
        </div>

        </form>
    </div>

    <div class="div-list-search-all ">
        <h2>Chọn khách sạn</h2>
        <%
            if (listRegion != null&&listCheckRoom!=null) {
                for (int i = 0; i < listRegion.size(); i++) {
                    int checkExistRoom=listCheckRoom.get(i);
                    if(checkExistRoom==0){
                        continue;
                    }


        %>
        <div class="div-item-search col-lg-12 " >

            <div class="body-search-item">
                <div class="div-name-region">
                    <h4><%=listRegion.get(i).getName_vi()%>
                    </h4>
                </div>
                <%if (!listRegion.get(i).getFile_url_img().equals("")) {%>
                <div class="div-img-region"
                     style="background:url('<%=listRegion.get(i).getFile_url_img().replace(StaticTO.STATIC_PATH,"").replace("\\","//")%>') no-repeat">
                    <%if(checkExistRoom==0){%>
                    <div class="NotEmptyRoom">
                        Không còn phòng chống
                    </div>
                    <%}%>
                </div>
                <%} else {%>
                <div class="div-img-region" style="background:url('./img/employee/cantho-daidien.jpg') no-repeat">
                    <%if(checkExistRoom==0){%>
                    <div class="NotEmptyRoom">
                        Không còn phòng chống
                    </div>
                    <%}%>
                </div>
                <%}%>
            </div>
            <div class="div-footer-item col-lg-12">
                <div class="col-lg-8">
                    <p>Địa chỉ:<%=listRegion.get(i).getAddress()%></p>
                    <p>Hotline:<%=listRegion.get(i).getContact_phone()%></p>
                </div>
                <div class="col-lg-4">
                    <%if(checkExistRoom==0){%>
                    <button class="btn btn-static">Chọn ngày khả dụng</button>
                    <%}else{%>
                    <button class="btn btn-static search"  data-region="<%=listRegion.get(i).getRegion_id()%>" data-enable="<%=checkExistRoom%>">Xem tất cả các phòng</button>
                    <%}%>
                </div>

            </div>
        </div>
        <%
                }
            }
        %>
    </div>
    <form id="form_search" action="SearchControl">
        <input type="hidden" name="location" id="location" value="">
        <input type="hidden" name="checkOut" value="<%=checkOut%>">
        <input type="hidden" name="numOfPeo" value="<%=numOfPeo%>">
        <input type="hidden" name="promote" value="<%=promote%>">
        <input type="hidden" name="checkIn" value="<%=checkIn%>">
    </form>
    <script>
        $(document).ready(function(){
            $(".search").click(function(){

                var location=$(this).data('region');
                $("#location").val(location);
                var enable=$(this).data('enable');
                if(enable=="1"){
                    $("#form_search").submit();
                }
                // alert("xin chao"+location);
            });
        });
    </script>
    <script>
        $( function() {
            $( "#checkIn" ).datepicker({
                format: 'dd/mm/yyyy',
                changeMonth: true,
                minDate: 0

            });
        } );
        $( function() {
            $( "#checkOut" ).datepicker({
                format: 'dd/mm/yyyy',
                changeMonth: true,
                minDate: 0
            });
        } );
    </script>
</div>
<jsp:include page="loading.jsp"></jsp:include>
<jsp:include page="./Footer.jsp"></jsp:include>
</body>
</html>
