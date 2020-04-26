package servlet.Employee;

import DAO.Product;
import DTO.CategoriesTO;
import DTO.StaticTO;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

public class Warehouse extends WebServletEmployee {

    @Override
    protected void process(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        try {
            String type = request.getParameter("type") != null ? (String) request.getParameter("type") : "";
            String nameCate = request.getParameter("nameCate") != null ? (String) request.getParameter("nameCate") : "";
            Product product = new Product();
            if (type.equals("")) {

                ArrayList<CategoriesTO> listCategory = product.listCategory();
                request.setAttribute("listCategory", listCategory);
                forward("EMPLOYEE/warehouse.jsp", request, response);
            } else {
                boolean checkSuccess = false;
                CategoriesTO categoriesTO = new CategoriesTO(0, nameCate, StaticTO.ACTIVE_STATUS, "");
                checkSuccess = product.addCategory(categoriesTO);
                ArrayList<CategoriesTO> listCategory = product.listCategory();
                request.setAttribute("listCategory", listCategory);
                forward("EMPLOYEE/warehouse.jsp?checkSuccess="+checkSuccess, request, response);
            }
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
