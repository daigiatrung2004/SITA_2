package servlet.Employee;

import DAO.Product;
import DTO.CategoriesTO;
import DTO.EmployeeTO;
import DTO.ProductTO;
import DTO.StaticTO;
import Utils.SaveImageInServer;

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
            } else if (type.equals("edit")) {
                String productId = request.getParameter("productid") != null ? (String) request.getParameter("productid") : "0";
                int productIdInt;
                try {
                    productIdInt = Integer.parseInt(productId);
                } catch (NumberFormatException e) {
                    productIdInt = 0;
                }
                ProductTO productTO = product.retrieveProductById(productIdInt);
                request.setAttribute("productTO", productTO);
                forward("/EMPLOYEE/editProduct.jsp", request, response);
            } else if (type.equals("updateProduct")) {
                String productid = request.getParameter("productid") != null ? (String) request.getParameter("productid") : "0";
                String listSrcData = request.getParameter("listSrcData") != null ? (String) request.getParameter("listSrcData") : "";
                String listImgOrginData = request.getParameter("listImgOrginData") != null ? (String) request.getParameter("listImgOrginData") : "";
                String []OrginData=listImgOrginData.split("\\.");
                if(OrginData.length>1){
                    listImgOrginData=OrginData[0];
                }
                String name = request.getParameter("name") != null ? (String) request.getParameter("name") : "";
                String status = request.getParameter("status") != null ? (String) request.getParameter("status") : "";
                String remarks = request.getParameter("remarks") != null ? (String) request.getParameter("remarks") : "";
                String priceProduct = request.getParameter("price") != null ? (String) request.getParameter("price") : "0";
                String unit = request.getParameter("unit") != null ? (String) request.getParameter("unit") : "";
                listSrcData=listSrcData.replaceAll("\"","");
                priceProduct= priceProduct.replaceAll(",","");
                listImgOrginData=listImgOrginData.replaceAll("\"","");
                int productidInt;
                try {
                    productidInt = Integer.parseInt(productid);
                } catch (NumberFormatException e) {
                    productidInt = 0;
                }
                long priceLong;
                try {
                    priceLong=Long.parseLong(priceProduct);
                } catch (NumberFormatException e) {
                    priceLong=0;
                }

                ProductTO productTO = product.retrieveProductById(productidInt);
                boolean checkSuccess=false;
                if (productTO != null) {
                    String path = productTO.getFILE_IMG_URL();
                    String file_url=productTO.getFILE_IMG_URL();
                    if(!listImgOrginData.equals("")&&listSrcData.indexOf("temp//")==-1&&listSrcData.indexOf("/img/")==-1) {
                        SaveImageInServer.deleteFileName(path);

                        file_url= SaveImageInServer.createImageFromBase64(listSrcData, listImgOrginData);
                    }
                    productTO.setNAME(name);
                    productTO.setPRICE(priceLong);
                    productTO.setFILE_IMG_URL(file_url);
                    productTO.setREMARK(remarks);
                    productTO.setSTATUS(status);
                    productTO.setUNIT(unit);
                    checkSuccess=product.updateProduct(productTO);
                }
                response.getWriter().print("{\"success\":"+checkSuccess+"}");
            } else if(type.equals("deleteProduct")){
                String productid = request.getParameter("productid") != null ? (String) request.getParameter("productid") : "0";
                int productidInt;
                try {
                    productidInt=Integer.parseInt(productid);
                } catch (NumberFormatException e) {
                    productidInt=0;
                }
                ProductTO productTO=product.retrieveProductById(productidInt);
                productTO.setSTATUS(StaticTO.REMOVE_STATUS);
                product.updateProduct(productTO);
                response.sendRedirect("ListProduct");
            }
            else {
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
                    boolean checkSuccess = product.addProduct(productTO);
                    ArrayList<ProductTO> listProduct = product.listProduct();
                    ArrayList<CategoriesTO> listCategory = product.listCategory();
                    request.setAttribute("listProduct", listProduct);
                    request.setAttribute("listCategory", listCategory);
                    forward("/EMPLOYEE/listProduct.jsp?checkSuccess=" + checkSuccess, request, response);
                }
            }

        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
