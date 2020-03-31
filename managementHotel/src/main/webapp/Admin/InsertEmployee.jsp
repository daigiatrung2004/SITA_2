<%@ page import="java.util.ArrayList" %>
<%@ page import="DTO.PositionEmployeeTO" %>
<%@ page import="DTO.RegionTO" %><%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 3/5/2020
  Time: 12:27 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Thêm dữ liệu nhân viên</title>
    <jsp:include page="../Library.jsp"></jsp:include>
</head>
<body>
<%
    ArrayList<PositionEmployeeTO> listPosEm = (ArrayList<PositionEmployeeTO>) request.getAttribute("listPosEm");
    ArrayList<RegionTO> listRegion = (ArrayList<RegionTO>) request.getAttribute("listRegion");

    String addPositionStatus = request.getAttribute("addPositionStatus") != null ? (String) request.getAttribute("addPositionStatus") : "false";
%>
<div class="admin">
    <jsp:include page="HeaderAdmin.jsp"></jsp:include>

    <div class="ui top attached tabular menu">
        <a class="item active" data-tab="first">Thêm vị trí nhân viên làm việc</a>
        <a class="item" data-tab="second">Thêm nhân viên mới</a>

    </div>
    <div class="ui bottom attached tab segment active" data-tab="first">
        <div class="home-admin col-md-12" style="margin-top: 10px;">

            <h2>Thêm vị trí công việc</h2>
            <div class="form-group">
                <label for="name">Vị trí làm việc:</label>
                <input type="text" name="name" class="form-control" placeholder="Vị trí cộng việc" id="name">
            </div>
            <button type="submit" class="btn btn-primary" id="insertPositionEmployee" name="1">Thêm</button>


            <div class="error-position" style="color: red"></div>

        </div>
    </div>
    <div class="ui bottom attached tab segment" data-tab="second">
        <div class="col-md-12 " id="insert-employee">
            <h2>Thêm thông tin nhân viên</h2>
            <div>
                <div class="form-group">
                    <label for="position">Vị trí làm việc:</label>
                    <select id="position">
                        <%for (int i = 0; i < listPosEm.size(); i++) {%>
                        <option value="<%=listPosEm.get(i).getId()%>"><%=listPosEm.get(i).getName()%>
                        </option>
                        <%
                            }
                        %>
                    </select>
                </div>
                <div class="form-group">
                    <label for="firstname">First Name:</label>
                    <input type="text" name="name" class="form-control" placeholder="Tên " id="firstname">
                </div>
                <div class="form-group">
                    <label for="lastname">Last Name:</label>
                    <input type="text" name="name" class="form-control" placeholder="Tên lót" id="lastname">
                </div>
                <div class="form-group">
                    <label for="username">Tên đăng nhập:</label>
                    <input type="text" name="username" class="form-control" placeholder="Tên đăng nhập" id="username">
                </div>
                <div class="form-group">
                    <label for="pwd">Mật khẩu:</label>
                    <input type="password" name="password" class="form-control" placeholder="Mật khẩu" id="pwd">
                </div>
                <div class="form-group">
                    <label for="address">Địa chỉ:</label>
                    <input type="text" name="address" class="form-control" placeholder="Địa chỉ" id="address">
                </div>
                <div class="form-group">
                    <label for="country">Thành phố:</label>
                    <input type="text" name="country" class="form-control" placeholder="Thành phố" id="country">
                </div>
                <div class="form-group">
                    <label for="phone">Điện thoại:</label>
                    <input type="text" name="password" class="form-control" placeholder="Điện thoại" id="phone">
                </div>
                <div class="form-group">
                    <label for="email">Email:</label>
                    <input type="email" name="email" class="form-control" placeholder="Địa chỉ Email" id="email">
                </div>

                <div class="form-group">
                    <label for="salary">Lương:</label>
                    <input type="number" name="salary" class="form-control" placeholder="Lương bổng" id="salary">
                </div>
                <div class="form-group">
                    <label for="region">Khu vực:</label>
                   <select name="region" id="region">
                       <%if(listRegion!=null){
                           for (int i = 0; i <listRegion.size() ; i++) {


                       %>
                       <option value="<%=listRegion.get(i).getRegion_id()%>"><%=listRegion.get(i).getName_vi()%></option>
                       <%
                           }
                           }
                       %>
                   </select>
                </div>
                <button type="submit" class="btn btn-primary" id="insertEmployee" name="2">Thêm</button>

                <div class="error" style="color: red"></div>

            </div>
        </div>
    </div>

    <jsp:include page="SideBar.jsp"></jsp:include>

    <script src="./scripts/Admin/InsertEmployee.js?ver=1.4"></script>
</body>
</html>
