package servlet.Employee;

import DAO.SystemDA;
import DTO.StaticTO;
import Utils.TextCustomizeFormat;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

public class StatisAnalyzt extends WebServletEmployee {

    @Override
    protected void process(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        try {
            String search = request.getParameter("search") != null ? (String) request.getParameter("search") : "";
            // thông kê lượt view
            SystemDA systemDA = new SystemDA();
            // tính tổng tất cả lượt views
            int count = systemDA.countViews();
            //Tính tổng lượt views trong tháng
            ArrayList<String> listDateOfMonth = TextCustomizeFormat.getDateAllOfMonthNow();
            ArrayList<String> listDateOfMonthNew = new ArrayList<>();
            DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            DateFormat dateFormatNew = new SimpleDateFormat("dd-MM-yyyy");
            ArrayList<Integer> listCountViewOfMonth = new ArrayList<Integer>();
            Date dateTemp = new Date();
            String month = String.valueOf(dateTemp.getMonth()+1);
            String year = String.valueOf(StaticTO.YEAR_STATIC + dateTemp.getYear());

            if (!search.equals("")) {
                month = request.getParameter("month") != null ? (String) request.getParameter("month") : "1";
                year = request.getParameter("year") != null ? (String) request.getParameter("year") : "1990";
                int monthInt, yearInt;
                try {
                    monthInt = Integer.parseInt(month);
                } catch (NumberFormatException e) {
                    monthInt = 1;
                }
                try {
                    yearInt = Integer.parseInt(year);
                } catch (NumberFormatException e) {
                    yearInt = 1;
                }
                listDateOfMonth = TextCustomizeFormat.getDateAllOfMonth(monthInt, yearInt);
            }
            for (int i = 0; i < listDateOfMonth.size(); i++) {
                Date date = null;
                try {
                    date = dateFormat.parse(listDateOfMonth.get(i));
                } catch (ParseException e) {
                    date = null;
                }
                if (date != null) {
                    listDateOfMonthNew.add(dateFormatNew.format(date));
                }

                String startDate = listDateOfMonth.get(i) + " 00:00:00";
                String endDate = listDateOfMonth.get(i) + " 23:59:00";
                int countView = systemDA.countViewsOfDay(startDate, endDate);
                listCountViewOfMonth.add(countView);
            }

            request.setAttribute("listCountViewOfMonth", listCountViewOfMonth);
            request.setAttribute("listDateOfMonthNew", listDateOfMonthNew);
            request.setAttribute("count", String.valueOf(count));
            request.setAttribute("month", month);
            request.setAttribute("year", year);

            forward("EMPLOYEE/statisAnalyzt.jsp", request, response);

        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
