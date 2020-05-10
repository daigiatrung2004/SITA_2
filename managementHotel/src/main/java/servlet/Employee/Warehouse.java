package servlet.Employee;

import DAO.Product;
import DAO.WarsehouseDA;
import DTO.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

public class Warehouse extends WebServletEmployee {

    @Override
    protected void process(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        try {
            String type = request.getParameter("type") != null ? (String) request.getParameter("type") : "";
            String nameCate = request.getParameter("nameCate") != null ? (String) request.getParameter("nameCate") : "";
            Product product = new Product();
            // input export warsehouse
            ArrayList<ProductTO> listProduct=product.listProduct();
            request.setAttribute("listProduct",listProduct);
            WarsehouseDA warsehouseDA=new WarsehouseDA();


            if (type.equals("")) {
                //DANH MUC SAN PHAM
                ArrayList<CategoriesTO> listCategory = product.listCategory();
                request.setAttribute("listCategory", listCategory);

                forward("EMPLOYEE/warehouse.jsp", request, response);
            }
            else if(type.equals("in")){
                // NHẬP KHO
                ArrayList<WarsehouseTO> listWare = warsehouseDA.retrieveAllWarsehouse(StaticTO.IMPORT_WARSEHOUSE);
                request.setAttribute("listWare", listWare);
                 forward("/EMPLOYEE/input-warsehouse.jsp",request,response);
            }else if(type.equals("ex")){
                // XUẤT KHO
                ArrayList<WarsehouseTO> listWare = warsehouseDA.retrieveAllWarsehouse(StaticTO.EXPORT_WARSEHOUSE);
                request.setAttribute("listWare", listWare);
                forward("/EMPLOYEE/export-warsehouse.jsp",request,response);
            }
            else if(type.equals("import")|type.equals("export")){
               String productId=request.getParameter("productId")!=null?(String)request.getParameter("productId"):"0";
               int productLong;
                try {
                    productLong=Integer.parseInt(productId);
                } catch (NumberFormatException e) {
                    productLong=0;
                }
                String amount=request.getParameter("amount")!=null?(String)request.getParameter("amount"):"0";
                int amountInt;
                try {
                    amountInt=Integer.parseInt(amount);
                } catch (NumberFormatException e) {
                    amountInt=0;
                }

                ProductTO productTO=product.retrieveProductById(productLong);
                if(productTO!=null){
                    int amountProduct=productTO.getAMOUNT();
                    DateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                    Date date =new Date();
                    String inputDate=dateFormat.format(date);
                    EmployeeTO employeeTO=(EmployeeTO)request.getSession().getAttribute("mem_sid");
                    if(type.equals("import")){
                         WarsehouseTO warsehouseTO=new WarsehouseTO(0,productLong,StaticTO.IMPORT_WARSEHOUSE,amountInt,inputDate,employeeTO.getId(),"");
                         if(warsehouseDA.inputWarsehouse(warsehouseTO)) {
                             amountProduct += amountInt;
                             productTO.setAMOUNT(amountProduct);
                             if(product.updateProduct(productTO)){
                                 forward("/ListProduct",request,response);
                             }

                         }
                    }else{
                        WarsehouseTO warsehouseTO=new WarsehouseTO(0,productLong,StaticTO.EXPORT_WARSEHOUSE,amountInt,inputDate,employeeTO.getId(),"");
                        if(warsehouseDA.inputWarsehouse(warsehouseTO)) {
                            amountProduct -= amountInt;
                            if (amountProduct < 0) {
                                amountProduct = 0;
                            }
                            productTO.setAMOUNT(amountProduct);
                            if(product.updateProduct(productTO)){
                                forward("/ListProduct",request,response);
                            }
                        }
                    }
                }

            }
            else {
                //THÊM DANH MUC SAN PHẨM
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
