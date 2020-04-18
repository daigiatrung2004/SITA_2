package servlet.Ajax;

import DAO.Product;
import DTO.ProductTO;
import servlet.Employee.WebServletEmployee;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

public class AjaxServiceCheckOut extends WebServletEmployee {

    @Override
    protected void process(HttpServletRequest request, HttpServletResponse response) throws SQLException {

        try {
            String cate_id = request.getParameter("cate_id") != null ? (String) request.getParameter("cate_id") : "0";
            String keyword=request.getParameter("keyword")!=null?(String)request.getParameter("keyword"):"";

            Product product = new Product();
            int cateInt;
            try {
                cateInt = Integer.parseInt(cate_id);
            } catch (NumberFormatException e) {
                cateInt = 0;
            }
            ArrayList<ProductTO> listProduct=null;
            if(keyword.equals("")) {
                listProduct= product.listProductByCate(cateInt);
            }else{
                listProduct=product.listProductByKeyWord(cateInt,keyword);
            }
            request.setAttribute("listProduct", listProduct);
            forward("EMPLOYEE/serviceCheckOutElement.jsp", request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }
}
