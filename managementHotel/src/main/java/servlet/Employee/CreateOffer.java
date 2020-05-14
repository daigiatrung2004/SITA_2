package servlet.Employee;

import DAO.PromoteDA;
import DAO.RegionDA;
import DTO.PromoteTO;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

public class CreateOffer extends WebServletEmployee {

    @Override
    protected void process(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        try {
            PromoteDA promoteDA=new PromoteDA();
            ArrayList<PromoteTO> listPromote=promoteDA.retreiveAllPromote();
            request.setAttribute("listPromote",listPromote);
            forward("/EMPLOYEE/createOffer.jsp",request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
