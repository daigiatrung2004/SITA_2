package servlet.Employee;

import DAO.Product;
import DTO.CategoriesTO;
import DTO.EmployeeTO;
import DTO.ProductTO;
import DTO.StaticTO;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

public class ListProduct extends WebServletEmployee {

    @Override
    protected void process(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        try {
            String type = request.getParameter("type") != null ? (String) request.getParameter("type") : "";
            String NAME = request.getParameter("NAME") != null ? (String) request.getParameter("NAME") : "";
            String DESCRIPTION = request.getParameter("DESCRIPTION") != null ? (String) request.getParameter("DESCRIPTION") : "";
            String price = request.getParameter("price") != null ? (String) request.getParameter("price") : "0";
            String UNIT = request.getParameter("UNIT") != null ? (String) request.getParameter("UNIT") : "";
            String AMOUNT = request.getParameter("AMOUNT") != null ? (String) request.getParameter("AMOUNT") : "0";
            String cate_id = request.getParameter("cate_id") != null ? (String) request.getParameter("cate_id") : "0";
            Product product = new Product();
            EmployeeTO employeeTO = (EmployeeTO) session.getAttribute("mem_sid");
            if (type.equals("")) {

                ArrayList<ProductTO> listProduct = product.listProduct();
                ArrayList<CategoriesTO> listCategory = product.listCategory();
                request.setAttribute("listProduct", listProduct);
                request.setAttribute("listCategory", listCategory);
                forward("/EMPLOYEE/listProduct.jsp", request, response);
            } else {
                int AMOUNTINT, CATEINT;
                long PRICElONG;
                if (employeeTO != null) {
                    try {
                        AMOUNTINT = Integer.parseInt(AMOUNT);
                    } catch (NumberFormatException e) {
                        AMOUNTINT = 0;
                    }
                    try {
                        CATEINT = Integer.parseInt(cate_id);
                    } catch (NumberFormatException e) {
                        CATEINT = 0;
                    }


                    try {
                        PRICElONG = Long.parseLong(price);
                    } catch (NumberFormatException e) {
                        PRICElONG = 0;
                    }
                    ProductTO productTO = new ProductTO(0, NAME, DESCRIPTION, "", StaticTO.ACTIVE_STATUS, "", PRICElONG, UNIT, AMOUNTINT, CATEINT, employeeTO.getRegion_id());
                    boolean checkSuccess=product.addProduct(productTO);
                    forward("/EMPLOYEE/listProduct.jsp?checkSuccess="+checkSuccess, request, response);
                }
            }

        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
