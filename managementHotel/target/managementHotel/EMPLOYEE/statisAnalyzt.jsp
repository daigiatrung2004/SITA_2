<%@ page import="java.util.ArrayList" %>
<%@ page import="Utils.TextCustomizeFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="DTO.StaticTO" %><%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 18/04/2020
  Time: 3:33 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String count = request.getAttribute("count") != null ? (String) request.getAttribute("count") : "0";
    String month = request.getAttribute("month") != null ? (String) request.getAttribute("month") : "1";
    String year = request.getAttribute("year") != null ? (String) request.getAttribute("year") : "1990";
    int countInt;
    try {
        countInt = Integer.parseInt(count);
    } catch (NumberFormatException e) {
        countInt = 0;
    }
    ArrayList<Integer> listCountViewOfMonth = (ArrayList<Integer>) request.getAttribute("listCountViewOfMonth");
    ArrayList<String> listDateOfMonthNew = (ArrayList<String>) request.getAttribute("listDateOfMonthNew");
    Date date = new Date();
    int yearCurrent = StaticTO.YEAR_STATIC + date.getYear();
    int monthReq, yearReq;
    try {
        monthReq = Integer.parseInt(month);
    } catch (NumberFormatException e) {
        monthReq = 1;
    }
    try {
        yearReq = Integer.parseInt(year);
    } catch (NumberFormatException e) {
        yearReq = 1990;
    }


%>
<html>
<head>
    <title>Thông kê</title>
    <jsp:include page="../Library.jsp"></jsp:include>
    <link rel="stylesheet" href="./css/Employeee/statis-css.css">
</head>
<body>
<jsp:include page="/EMPLOYEE/Header-employee.jsp"></jsp:include>
<div class="menu-statis col-md-12">
    <ul class="col-md-12">
        <li><a class="item-menu-statis statis-active" href="StatisAnalyzt">Thống kê lượt view</a></li>
        <li><a class="item-menu-statis " href="ThongKeThuChi" style="color: #bdbbbb;">Thống kê thu chi</a></li>
    </ul>
</div>
<div class="container">
    <div id="search-views">
        <span style="padding: 10px;font-size: 20px">Tìm thông kê lượt view</span>

        <form action="StatisAnalyzt" method="post">
            <input type="hidden" value="search" name="search">
            <div style="display: flex;align-items: center;" class="col-md-12">
                <div class="col-md-4 select-item">
                    <select name="month" id="month-views">
                        <%
                            for (int i = 1; i <= 12; i++) {
                                if (i == monthReq) {
                        %>
                        <option value="<%=i%>" selected>Tháng <%=i%>
                        </option>
                        <%
                        } else {
                        %>
                        <option value="<%=i%>">Tháng <%=i%>
                        </option>
                        <%
                                }
                            }%>
                    </select>
                </div>
                <div class="col-md-4 select-item">
                    <select name="year" id="year-views">
                        <%
                            for (int i = 1990; i <= (yearCurrent + 10); i++) {
                                if (i == yearCurrent) {
                        %>

                        <option value="<%=i%>" selected>Năm <%=i%>
                        </option>
                        <%
                        } else {
                        %>
                        <option value="<%=i%>">Năm <%=i%>
                        </option>
                        <%
                                }
                            }%>
                    </select>
                </div>
                <div class="col-md-4" style="margin: 10px;">
                    <button type="submit" class="btn btn-primary">Tìm kiếm</button>
                </div>
            </div>
        </form>

    </div>
    <div>
        <div class=" header-statis-views
        ">
            <span><i class="chart bar icon"></i></span><span>Thông kê lượt view</span>
        </div>
        <div class="statis-views-detail">
            <canvas id="myChart" width="300" height="100"></canvas>
        </div>
    </div>
    <div class="list-views">
        <span>Chi tiết lượt lượt view mỗi ngày</span>
        <table class="table-views table">
            <thead>
            <th>Ngày</th>
            <th>Số lượt xem</th>
            </thead>
            <tbody>
            <%
                if (listCountViewOfMonth != null && listDateOfMonthNew != null) {
                    for (int i = 0; i < listCountViewOfMonth.size(); i++) {
                        System.out.println(listDateOfMonthNew.get(i));
            %>
            <tr>
                <td><span><%=listDateOfMonthNew.get(i)%></span></td>
                <td><span><%=listCountViewOfMonth.get(i)%></span></td>
            </tr>
            <%
                    }
                }
            %>
            </tbody>
        </table>
    </div>
</div>
<script>
    var ctx = document.getElementById('myChart');
    var ArrayCount = new Array();
    var ArrayDateMonth = new Array();
    var ArrayColor = new Array();
    var ArrayBackground = new Array();
    <%
    if(listCountViewOfMonth!=null&&listDateOfMonthNew!=null){
    for(int i = 0; i <listCountViewOfMonth.size() ; i++) {
        System.out.println(listDateOfMonthNew.get(i));

     %>
    ArrayCount[<%=i%>] =<%=listCountViewOfMonth.get(i)%>;

    ArrayDateMonth[<%=i%>] = '<%=listDateOfMonthNew.get(i)%>';

    ArrayColor[<%=i%>] = 'rgba(60, 141, 188,1)';
    ArrayBackground[<%=i%>] = 'rgba(0, 0, 0,0)';
    <%
    }
   %>
    // var bgOther=listCountViewOfMonth.size();
    // ArrayDateMonth[bgOther++]= pattern.draw('triangle', '#ffce56');
    <%
   }
   %>
    // alert(ArrayCount);
    var myChart = new Chart(ctx, {

        type: 'line',
        data: {
            labels: ArrayDateMonth,
            datasets: [{
                label: 'Views:',
                data: ArrayCount,
                pointBackgroundColor: ArrayColor,
                borderColor: ArrayColor,
                backgroundColor: ArrayBackground,
                borderWidth: 1
            }]
        },
        options: {
            bezierCurve: false,
            elements: {
                line: {
                    tension: 0
                }
            },
            scales: {
                yAxes: [{
                    ticks: {
                        beginAtZero: true,
                        min: 0,
                        max:<%=countInt%>,
                        stepSize: 1

                    }
                }],
                xAxes: [{
                    ticks: {
                        beginAtZero: true,
                        min: 0,
                        max:<%=listCountViewOfMonth.size()%>,
                        stepSize: 3
                    }
                }]
            }
        }
    });
    var month = new SlimSelect({
        select: '#month-views'
    });
    var year = new SlimSelect({
        select: '#year-views'
    });
</script>
<jsp:include page="../Footer.jsp"></jsp:include>
</body>
</html>
