package servlet.Employee;

import DAO.SystemDA;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

public class StatisAnalyzt extends  WebServletEmployee{

    @Override
    protected void process(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        try {
            // thông kê lượt view
            SystemDA systemDA=new SystemDA();
            int count=systemDA.countViews();
            request.setAttribute("count",String.valueOf(count));
            forward("EMPLOYEE/statisAnalyzt.jsp",request,response);

        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
