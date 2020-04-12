package DAO;

import DTO.AnnoucementTO;
import DTO.CategoriesTO;
import DTO.ProductTO;
import DTO.StaticTO;
import Utils.DbUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class Product extends DAOOject {
    public boolean addCategory(CategoriesTO categoriesTO){
        Connection conn = null;
        PreparedStatement pstmt = null;
        String sql = "INSERT INTO " + StaticTO.DB_CATEGORY_NAME + " VALUES(?,?,?,?)";
        int rs = 0;
        conn = getConnection();
        try {
            pstmt = conn.prepareStatement(sql);
            int index=1;
            pstmt.setInt(index++,categoriesTO.getCate_id());
            pstmt.setString(index++,categoriesTO.getName());
            pstmt.setString(index++,categoriesTO.getStatus());
            pstmt.setString(index++,categoriesTO.getRemark());
            rs=pstmt.executeUpdate();
        }catch (SQLException e) {
            System.out.println("addCategory+++" + pstmt.toString());
            e.printStackTrace();
        } finally {
            System.out.println("addCategory+++" + pstmt.toString());
            DbUtils.closeQuietly(conn, pstmt);
        }
        return (rs > 0);
    }
    public boolean addProduct(ProductTO productTO){
        Connection conn = null;
        PreparedStatement pstmt = null;
        String sql = "INSERT INTO " + StaticTO.DB_PRODUCT_NAME + " VALUES(?,?,?,?,?,?,?,?,?,?,?)";
        int rs = 0;
        conn = getConnection();
        try {
            pstmt = conn.prepareStatement(sql);
            int index=1;
            pstmt.setInt(index++,productTO.getID());
            pstmt.setString(index++,productTO.getNAME());
            pstmt.setString(index++,productTO.getDESCRIPTION());
            pstmt.setString(index++,productTO.getFILE_IMG_URL());
            pstmt.setString(index++,productTO.getSTATUS());
            pstmt.setString(index++,productTO.getREMARK());
            pstmt.setLong(index++,productTO.getPRICE());
            pstmt.setString(index++,productTO.getUNIT());
            pstmt.setInt(index++,productTO.getAMOUNT());
            pstmt.setInt(index++,productTO.getCate_id());
            pstmt.setInt(index++,productTO.getRegion_id());
            rs=pstmt.executeUpdate();
        }catch (SQLException e) {
            System.out.println("addProduct+++" + pstmt.toString());
            e.printStackTrace();
        } finally {
            System.out.println("addProduct+++" + pstmt.toString());
            DbUtils.closeQuietly(conn, pstmt);
        }
        return (rs > 0);
    }
    public ArrayList<CategoriesTO> listCategory(){
        Connection conn = null;
        PreparedStatement pstmt = null;
        String sql = "SELECT * FROM "+StaticTO.DB_CATEGORY_NAME;
        ArrayList<CategoriesTO> listcategory = new ArrayList<CategoriesTO>();
        ResultSet rs = null;
        conn = getConnection();
        try {
            pstmt = conn.prepareStatement(sql);
            rs=pstmt.executeQuery();
            while(rs.next()){
                CategoriesTO categoriesTO=new CategoriesTO(rs.getInt("cate_id"),
                        rs.getString("name"),
                        rs.getString("status"),
                        rs.getString("remark")
                        );
                listcategory.add(categoriesTO);
            }
        } catch (SQLException e) {
            System.out.println("listCategory+++" + pstmt.toString());
            e.printStackTrace();
        } finally {
            System.out.println("listCategory+++" + pstmt.toString());
            DbUtils.closeQuietly(rs);
        }

        return listcategory;
    }
    public ArrayList<ProductTO> listProduct(){
        Connection conn = null;
        PreparedStatement pstmt = null;
        String sql = "SELECT * FROM "+StaticTO.DB_PRODUCT_NAME;
        ArrayList<ProductTO> listProduct = new ArrayList<ProductTO>();
        ResultSet rs = null;
        conn = getConnection();
        try {
            pstmt = conn.prepareStatement(sql);
            rs=pstmt.executeQuery();
            while(rs.next()){
                ProductTO productTO=new ProductTO(rs.getInt("ID"),
                        rs.getString("NAME"),
                        rs.getString("DESCRIPTION"),
                        rs.getString("FILE_IMG_URL"),
                        rs.getString("STATUS"),
                        rs.getString("REMARK"),
                        rs.getLong("PRICE"),
                        rs.getString("UNIT"),
                        rs.getInt("AMOUNT"),
                        rs.getInt("cate_id"),
                        rs.getInt("region_id")
                );
                listProduct.add(productTO);
            }
        } catch (SQLException e) {
            System.out.println("listCategory+++" + pstmt.toString());
            e.printStackTrace();
        } finally {
            System.out.println("listCategory+++" + pstmt.toString());
            DbUtils.closeQuietly(rs);
        }

        return listProduct;
    }
}
