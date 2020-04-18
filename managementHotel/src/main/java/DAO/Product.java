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
    public boolean addCategory(CategoriesTO categoriesTO) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        String sql = "INSERT INTO " + StaticTO.DB_CATEGORY_NAME + " VALUES(?,?,?,?)";
        int rs = 0;
        conn = getConnection();
        try {
            pstmt = conn.prepareStatement(sql);
            int index = 1;
            pstmt.setInt(index++, categoriesTO.getCate_id());
            pstmt.setString(index++, categoriesTO.getName());
            pstmt.setString(index++, categoriesTO.getStatus());
            pstmt.setString(index++, categoriesTO.getRemark());
            rs = pstmt.executeUpdate();
        } catch (SQLException e) {
            System.out.println("addCategory+++" + pstmt.toString());
            e.printStackTrace();
        } finally {
            System.out.println("addCategory+++" + pstmt.toString());
            DbUtils.closeQuietly(conn, pstmt);
        }
        return (rs > 0);
    }

    public boolean addProduct(ProductTO productTO) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        String sql = "INSERT INTO " + StaticTO.DB_PRODUCT_NAME + " VALUES(?,?,?,?,?,?,?,?,?,?,?)";
        int rs = 0;
        conn = getConnection();
        try {
            pstmt = conn.prepareStatement(sql);
            int index = 1;
            pstmt.setInt(index++, productTO.getID());
            pstmt.setString(index++, productTO.getNAME());
            pstmt.setString(index++, productTO.getDESCRIPTION());
            pstmt.setString(index++, productTO.getFILE_IMG_URL());
            pstmt.setString(index++, productTO.getSTATUS());
            pstmt.setString(index++, productTO.getREMARK());
            pstmt.setLong(index++, productTO.getPRICE());
            pstmt.setString(index++, productTO.getUNIT());
            pstmt.setInt(index++, productTO.getAMOUNT());
            pstmt.setInt(index++, productTO.getCate_id());
            pstmt.setInt(index++, productTO.getRegion_id());
            rs = pstmt.executeUpdate();
        } catch (SQLException e) {
            System.out.println("addProduct+++" + pstmt.toString());
            e.printStackTrace();
        } finally {
            System.out.println("addProduct+++" + pstmt.toString());
            DbUtils.closeQuietly(conn, pstmt);
        }
        return (rs > 0);
    }

    public ArrayList<CategoriesTO> listCategory() {
        Connection conn = null;
        PreparedStatement pstmt = null;
        String sql = "SELECT * FROM " + StaticTO.DB_CATEGORY_NAME;
        ArrayList<CategoriesTO> listcategory = new ArrayList<CategoriesTO>();
        ResultSet rs = null;
        conn = getConnection();
        try {
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                CategoriesTO categoriesTO = new CategoriesTO(rs.getInt("cate_id"),
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

    // tìm tất cả product
    public ArrayList<ProductTO> listProduct() {
        Connection conn = null;
        PreparedStatement pstmt = null;
        String sql = "SELECT * FROM " + StaticTO.DB_PRODUCT_NAME;
        ArrayList<ProductTO> listProduct = new ArrayList<ProductTO>();
        ResultSet rs = null;
        conn = getConnection();
        try {
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                ProductTO productTO = new ProductTO(rs.getInt("ID"),
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

    // tìm product theo loai sản phẩm
    public ArrayList<ProductTO> listProductByCate(int cate_id) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        String sql = "SELECT * FROM " + StaticTO.DB_PRODUCT_NAME + " WHERE CATE_ID=?";
        ArrayList<ProductTO> listProduct = new ArrayList<ProductTO>();
        ResultSet rs = null;
        conn = getConnection();
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, cate_id);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                ProductTO productTO = new ProductTO(rs.getInt("ID"),
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
            System.out.println("listProductByCate+++" + pstmt.toString());
            e.printStackTrace();
        } finally {
            System.out.println("listProductByCate+++" + pstmt.toString());
            DbUtils.closeQuietly(rs);
        }

        return listProduct;
    }

    // tìm product theo by id
    public ProductTO retrieveProductById(int product_id) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        String sql = "SELECT * FROM " + StaticTO.DB_PRODUCT_NAME + " WHERE ID=?";
        ProductTO productTO = null;
        ResultSet rs = null;
        conn = getConnection();
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, product_id);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                productTO = new ProductTO(rs.getInt("ID"),
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

            }
        } catch (SQLException e) {
            System.out.println("retrieveProductById+++" + pstmt.toString());
            e.printStackTrace();
        } finally {
            System.out.println("retrieveProductById+++" + pstmt.toString());
            DbUtils.closeQuietly(rs);
        }

        return productTO;
    }

    // tìm product theo loai sản phẩm và key word
    public ArrayList<ProductTO> listProductByKeyWord(int cate_id, String keyword) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        String sql = "SELECT * FROM " + StaticTO.DB_PRODUCT_NAME + " WHERE CATE_ID=? AND NAME like ?";
        ArrayList<ProductTO> listProduct = new ArrayList<ProductTO>();
        ResultSet rs = null;
        conn = getConnection();
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, cate_id);
            pstmt.setString(2, "%" + keyword + "%");
            rs = pstmt.executeQuery();
            while (rs.next()) {
                ProductTO productTO = new ProductTO(rs.getInt("ID"),
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
            System.out.println("listProductByKeyWord+++" + pstmt.toString());
            e.printStackTrace();
        } finally {
            System.out.println("listProductByKeyWord+++" + pstmt.toString());
            DbUtils.closeQuietly(rs);
        }

        return listProduct;
    }

    // danh sách các sản phẩm dựa theo booking product và product
    public ArrayList<ProductTO> retrieveBookingProduct(long bookingId) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        String sql = "SELECT P.*,BP.* FROM " + StaticTO.DB_PRODUCT_NAME + " P INNER JOIN " + StaticTO.DB_BOOKING_PRODUCT_NAME + " BP ON BP.ID=P.ID INNER JOIN "+StaticTO.DB_BOOKING_NAME+" B ON B.BOOKiNG_ID=BP.BOOKING_ID WHERE  BP.BOOKING_ID=? AND B.STATUS=?";
        ProductTO productTO = null;
        ResultSet rs = null;
        conn = getConnection();
        ArrayList<ProductTO> listProductTO=new ArrayList<ProductTO>();
        try {
            pstmt = conn.prepareStatement(sql);

            pstmt.setLong(1, bookingId);
            pstmt.setString(2,StaticTO.ACTIVE_STATUS);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                productTO = new ProductTO(rs.getInt("ID"),
                        rs.getString("NAME"),
                        rs.getString("DESCRIPTION"),
                        rs.getString("FILE_IMG_URL"),
                        rs.getString("STATUS"),
                        rs.getString("REMARK"),
                        rs.getLong("PRICE"),
                        rs.getString("UNIT"),
                        rs.getInt("AMOUNT"),
                        rs.getInt("cate_id"),
                        rs.getInt("region_id"),
                        rs.getLong("booking_id"),
                        rs.getInt("amount_pr"),
                        rs.getLong("pay")
                );
                listProductTO.add(productTO);
            }
        } catch (SQLException e) {
            System.out.println("retrieveProductById+++" + pstmt.toString());
            e.printStackTrace();
        } finally {
            System.out.println("retrieveProductById+++" + pstmt.toString());
            DbUtils.closeQuietly(rs);
        }
        return listProductTO;
    }

}
