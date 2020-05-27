<%@ page import="DTO.AdvertisementTO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="DTO.StaticTO" %><%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 14/05/2020
  Time: 1:31 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    ArrayList<AdvertisementTO> listAdvertisementTO = (ArrayList<AdvertisementTO>) request.getAttribute("listAdvertisementTO");

%>
<html>
<head>
    <title>Quảng cáo victoria</title>
    <jsp:include page="../Library.jsp"></jsp:include>
    <style>
        .btn {
            width: 150px;
            margin-bottom: 14px;
        }

        .lds-ring {
            display: inline-block;
            position: relative;
            width: 80px;
            height: 80px;
        }

        .lds-ring div {
            box-sizing: border-box;
            display: block;
            position: absolute;
            width: 64px;
            height: 64px;
            margin: 8px;
            border: 8px solid #007bff;
            border-radius: 50%;
            animation: lds-ring 1.2s cubic-bezier(0.5, 0, 0.5, 1) infinite;
            border-color: #007bff transparent transparent transparent;
        }

        .lds-ring div:nth-child(1) {
            animation-delay: -0.45s;
        }

        .lds-ring div:nth-child(2) {
            animation-delay: -0.3s;
        }

        .lds-ring div:nth-child(3) {
            animation-delay: -0.15s;
        }

        @keyframes lds-ring {
            0% {
                transform: rotate(0deg);
            }
            100% {
                transform: rotate(360deg);
            }
        }
        #div-loading{
            display: none;
        }
        #loading {
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100%;
        }

    </style>
</head>
<body>
<jsp:include page="/EMPLOYEE/Header-employee.jsp"></jsp:include>
<div class="main-advertisement">
    <jsp:include page="taskbar-advertisement.jsp">
        <jsp:param name="type" value="offer"/>
    </jsp:include>
    <div style="min-height: 400px;">
        <div style="border-bottom: 1px solid #ccc;">
            <A href="CreateOffer" class="btn btn-primary" style="margin: 50px;">Tạo ưu đãi</A>
        </div>
        <div class="ListOffer" style="padding: 50px;">
            <h2 style="margin-bottom: 20px;text-align: center;">Danh sách các ưu đãi</h2>
            <%if (listAdvertisementTO != null && listAdvertisementTO.size() > 0) {%>
            <table class="table">
                <thead>
                <th>Tiêu đề</th>
                <th>Tóm tắt</th>
                <th>Ngày kết thúc</th>
                <th>Trạng thái</th>
                <th>Hành động</th>
                </thead>
                <tbody>
                <%
                    for (int i = 0; i < listAdvertisementTO.size(); i++) {

                %>
                <tr>
                    <td><%=listAdvertisementTO.get(i).getTITLE()%>
                    </td>
                    <td><%=listAdvertisementTO.get(i).getSHORT_DESCRIPTION()%>
                    </td>
                    <td><%=listAdvertisementTO.get(i).getEND_DATE()%>
                    </td>
                    <td><%=(listAdvertisementTO.get(i).getSTATUS().equals(StaticTO.ACTIVE_STATUS) ? "Đang hoạt động" : "Đã đóng")%>
                    </td>
                    <td>
                        <button class="btn btn-primary view" data-id="<%=listAdvertisementTO.get(i).getID()%>">Xem chi
                            tiết
                        </button>
                        <button class="btn btn-danger delete" data-id="<%=listAdvertisementTO.get(i).getID()%>">Xóa</button>
                      <a href="Advertisement?type=edit&id=<%=listAdvertisementTO.get(i).getID()%>"><button class="btn btn-success">Cập nhật</button></a>
                    </td>
                </tr>
                <%
                    }
                %>
                </tbody>
            </table>
            <%
            } else {
            %>
            <h2>Không có dữ liệu về ưu đãi</h2>
            <%
                }
            %>
        </div>
        <div class="ui modal" id="view-detail">
            <div class="header">
                <span>
                Thông tin chi tiết ưu đãi
                    </span>
                <span class="close" style="position: absolute;top: 10px;right: 10px;">
<i class="fa fa-window-close" aria-hidden="true"></i>
                </span>
            </div>
            <div class="content" style="overflow: auto;height: 100%;">
                <div id="div-loading">
                    <div id="loading">
                        <div class="lds-ring">
                            <div></div>
                            <div></div>
                            <div></div>
                            <div></div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>
<script>
    $(document).ready(function () {
        $(".close").click(function(){
             $(".modal").modal("hide");
        });
        $(".view").click(function () {

            $("#view-detail").modal("show");
            $("#div-loading").show();
            var id = $(this).data("id");

            $.ajax({
                url: 'AjaxAdvertisement',
                type: 'POST',
                dataType: 'html',
                data: {
                    id: id,
                    type: "getcontent"
                },
                success: function (data) {

                    $(".content").html(data);
                    $("#div-loading").hide();

                }
            });
        });
        $(".delete").click(function(){
            var id = $(this).data("id");
            var r=confirm("Có chắc muốn xóa dữ liệu này?");
            if(r==true){
                $.ajax({
                    url: 'AjaxAdvertisement',
                    type: 'POST',
                    dataType: 'json',
                    data: {
                        id: id,
                        type: "delete"
                    },
                    success: function (data) {

                        if (data["success"]) {
                            // alert(data['success']);
                            alert("Chỉnh sửa /xóa thành công");
                            location.reload();
                        } else {
                            alert("Thất bại");
                        }

                    }
                });
            }
        });
    });
</script>
<jsp:include page="../Footer.jsp"></jsp:include>
</body>
</html>
