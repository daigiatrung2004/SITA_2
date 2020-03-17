package servlet.Admin;

import DAO.EmployeeDA;
import DTO.PositionEmployeeTO;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

public class InsertEmployee extends WebServletAdmin {
    @Override
    protected void process(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        try {
            EmployeeDA employeeDA=new EmployeeDA();
            ArrayList<PositionEmployeeTO> listPosEm=employeeDA.retreiveAllPositionEmployee();
            request.setAttribute("listPosEm",listPosEm);
            forward("/Admin/InsertEmployee.jsp",request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


}
