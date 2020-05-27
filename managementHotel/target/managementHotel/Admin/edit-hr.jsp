<%@ page import="DTO.PositionEmployeeTO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="DTO.RegionTO" %>
<%@ page import="DTO.EmployeeTO" %>
<%@ page import="Utils.EncryptDecryptPassword" %><%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 20/05/2020
  Time: 9:04 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    ArrayList<PositionEmployeeTO> listPosEm = (ArrayList<PositionEmployeeTO>) request.getAttribute("listPosEm");
        ArrayList<RegionTO> listRegion = (ArrayList<RegionTO>) request.getAttribute("listRegion");
    EmployeeTO employeeTO=(EmployeeTO) request.getAttribute("employeeTO");

    String addPositionStatus = request.getAttribute("addPositionStatus") != null ? (String) request.getAttribute("addPositionStatus") : "false";
%>
<!DOCTYPE html>
<html>
<head>
    <title>Cập nhật thông tin nhân viên</title>
    <jsp:include page="../Library.jsp"></jsp:include>
</head>
<body>
<jsp:include page="HeaderAdmin.jsp"></jsp:include>

<div class="edit-employee" style="margin: 20px;">
    <div class="col-md-12 " id="insert-employee">
        <%
            if(employeeTO!=null){
        %>
        <form action="ListingHR" method="post">
        <h2>Cập nhật thông tin nhân viên</h2>
        <div>
            <input type="hidden" name="type" value="edited-user">
            <input type="hidden" name="id" value="<%=employeeTO.getId()%>">
            <div class="form-group">
                <label for="position">Vị trí làm việc:</label>
                <select id="position" name="position">
                    <%for (int i = 0; i < listPosEm.size(); i++) {%>
                    <option value="<%=listPosEm.get(i).getId()%>" <%=listPosEm.get(i).getId()==employeeTO.getId()?"selected":""%>><%=listPosEm.get(i).getName()%>
                    </option>
                    <%
                        }
                    %>
                </select>
            </div>
            <div class="form-group">
                <label for="firstname">First Name:</label>
                <input type="text" name="firstname" class="form-control" value="<%=employeeTO.getFirstName()%>" placeholder="Tên " id="firstname">
            </div>
            <div class="form-group">
                <label for="lastname">Last Name:</label>
                <input type="text" name="lastname" class="form-control" value="<%=employeeTO.getLastName()%>" placeholder="Tên lót" id="lastname">
            </div>
            <div class="form-group">
                <label for="username">Tên đăng nhập:</label>
                <input type="text" name="username" class="form-control" value="<%=employeeTO.getLoginName()%>" placeholder="Tên đăng nhập" id="username">
            </div>
            <%
                EncryptDecryptPassword encryptDecryptPassword=new EncryptDecryptPassword(employeeTO.getSankey());

            %>
            <div class="form-group">
                <label for="pwd">Mật khẩu:</label>
                <input type="password" name="password" class="form-control" value="<%=encryptDecryptPassword.decrypt(employeeTO.getEncryptpass())%>" placeholder="Mật khẩu" id="pwd">
            </div>
            <div class="form-group">
                <label for="address">Địa chỉ:</label>
                <input type="text" name="address" class="form-control" placeholder="Địa chỉ" value="<%=employeeTO.getAddress()%>" id="address">
            </div>
            <div class="form-group">
                <label for="country">Thành phố:</label>
                <input type="text" name="country" class="form-control" placeholder="Thành phố" value="<%=employeeTO.getCountry()%>" id="country">
            </div>
            <div class="form-group">
                <label for="phone">Điện thoại:</label>
                <input type="text" name="phone" class="form-control" placeholder="Điện thoại" value="<%=employeeTO.getContact_person()%>" id="phone">
            </div>
            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" name="email" class="form-control" placeholder="Địa chỉ Email" value="<%=employeeTO.getContact_email()%>" id="email">
            </div>

            <div class="form-group">
                <label for="salary">Lương:</label>
                <input type="number" name="salary" class="form-control" placeholder="Lương bổng" value="<%=employeeTO.getSalary()%>" id="salary">
            </div>
            <div class="form-group">
                <label for="region">Khu vực:</label>
                <select name="region" id="region">
                    <%
                        if (listRegion != null) {
                            for (int i = 0; i < listRegion.size(); i++) {


                    %>
                    <option value="<%=listRegion.get(i).getRegion_id()%>" <%=listRegion.get(i).getRegion_id()==employeeTO.getRegion_id()?"selected":""%>><%=listRegion.get(i).getName_vi()%>
                    </option>
                    <%
                            }
                        }
                    %>
                </select>
            </div>
            <button type="submit" class="btn btn-primary" id="insertEmployee" name="2">Cập nhật</button>

            <div class="error" style="color: red"></div>

        </div>
        </form>
        <%
            }
        %>
    </div>
</div>

<jsp:include page="SideBar.jsp"></jsp:include>


<script>
    var position = new SlimSelect({
        select: '#position'
    });
    var region = new SlimSelect({
        select: '#region'
    });
</script>
</body>
</html>
