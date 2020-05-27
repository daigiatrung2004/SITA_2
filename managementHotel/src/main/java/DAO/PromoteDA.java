package DAO;

import DTO.PriceRoomTO;
import DTO.PromoteTO;
import DTO.StaticTO;
import Utils.DbUtils;

import javax.xml.transform.Result;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

public class PromoteDA extends DAOOject {
    public boolean addPromote(PromoteTO promoteTO) {
        int rs = 0;
        Connection conn = null;
        PreparedStatement pstmt = null;
        String sql = "INSERT INTO " + StaticTO.DB_PROMOTE_NAME + " VALUES(?,?,?,?,?,?)";
        conn = getConnection();
        try {
            pstmt = conn.prepareStatement(sql);
            int index = 1;
            pstmt.setInt(index++, promoteTO.getPromte_id());
            pstmt.setString(index++, promoteTO.getPro_code());
            pstmt.setString(index++, promoteTO.getPro_value());
            pstmt.setString(index++, promoteTO.getStatus());
            pstmt.setString(index++, promoteTO.getRemark());
            pstmt.setString(index++, promoteTO.getExpired_date());
            rs = pstmt.executeUpdate();
        } catch (SQLException e) {
            System.out.println("addPromote:++++" + pstmt.toString());
            e.printStackTrace();
        } finally {
            System.out.println("addPromote:++++" + pstmt.toString());
            DbUtils.closeQuietly(conn, pstmt);
        }

        return (rs > 0);
    }
    public boolean updatePromote(PromoteTO promoteTO) {
        int rs = 0;
        Connection conn = null;
        PreparedStatement pstmt = null;
        String sql = "UPDATE " + StaticTO.DB_PROMOTE_NAME + " SET pro_code=?,pro_value=?,status=?,remark=?,expired_date=? WHERE promote_id=?";
        conn = getConnection();
        try {
            pstmt = conn.prepareStatement(sql);
            int index = 1;

            pstmt.setString(index++, promoteTO.getPro_code());
            pstmt.setString(index++, promoteTO.getPro_value());
            pstmt.setString(index++, promoteTO.getStatus());
            pstmt.setString(index++, promoteTO.getRemark());
            pstmt.setString(index++, promoteTO.getExpired_date());
            pstmt.setInt(index++, promoteTO.getPromte_id());
            rs = pstmt.executeUpdate();
        } catch (SQLException e) {
            System.out.println("updatePromote:++++" + pstmt.toString());
            e.printStackTrace();
        } finally {
            System.out.println("updatePromote:++++" + pstmt.toString());
            DbUtils.closeQuietly(conn, pstmt);
        }

        return (rs > 0);
    }
    // update promote_price
    public boolean updatePromotePrice(PromoteTO promoteTO) {
        int rs = 0;
        Connection conn = null;
        PreparedStatement pstmt = null;
        String sql = "UPDATE " + StaticTO.DB_PROMOTE_PRICE_NAME + " SET promote_id=? WHERE price_id=?";
        conn = getConnection();
        try {
            pstmt = conn.prepareStatement(sql);
            int index = 1;
            pstmt.setInt(index++, promoteTO.getPromte_id());
            pstmt.setInt(index++, promoteTO.getPrice_id());

            rs = pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DbUtils.closeQuietly(conn, pstmt);
        }

        return (rs > 0);
    }
    // dành cho search promoteid
    public PromoteTO retrievePromotePrice(int promote_id){
        Connection conn = null;
        ResultSet rs = null;
        PreparedStatement pstmt = null;
        String sql = "SELECT * FROM " + StaticTO.DB_PROMOTE_NAME + " WHERE PROMOTE_ID=? AND STATUS=?";
        PromoteTO promoteTO = null;
        conn = getConnection();
        try {
            pstmt = conn.prepareStatement(sql);
            int index = 1;

            pstmt.setInt(index++, promote_id);
            pstmt.setString(index++, StaticTO.ACTIVE_STATUS);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                promoteTO = new PromoteTO(rs.getInt("promote_id"),
                        rs.getString("pro_code"),
                        rs.getString("pro_value"),
                        rs.getString("status"),
                        rs.getString("remark"),
                        rs.getString("expired_date")
                );

            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DbUtils.closeQuietly(rs);
        }
        return promoteTO;
    }
    //dành cho promote_price
    public PromoteTO retreivePromotePrice(int price_id) {
        Connection conn = null;
        ResultSet rs = null;
        PreparedStatement pstmt = null;
        String sql = "SELECT * FROM " + StaticTO.DB_PROMOTE_PRICE_NAME + " WHERE PRICE_ID=? LIMIT 1";

        PromoteTO promoteTO = null;
        conn = getConnection();
        try {
            pstmt = conn.prepareStatement(sql);
            int index = 1;
            pstmt.setInt(index++, price_id);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                promoteTO = new PromoteTO(rs.getInt("promote_id"), rs.getLong("id_promote_price"), rs.getInt("price_id"));

            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DbUtils.closeQuietly(rs);
        }
        return promoteTO;
    }

    public PromoteTO retreivePromoteByPrice(int price_id) {

        Connection conn = null;
        ResultSet rs = null;
        PreparedStatement pstmt = null;
        String sql = "SELECT P.* FROM " + StaticTO.DB_PROMOTE_NAME + " P INNER JOIN "
                + StaticTO.DB_PROMOTE_PRICE_NAME + " PP ON PP.PROMOTE_ID=P.PROMOTE_ID "
                + " WHERE  PP.PRICE_ID=? AND P.STATUS=?";
        PromoteTO promoteTO = null;
        conn = getConnection();
        try {
            pstmt = conn.prepareStatement(sql);
            int index = 1;

            pstmt.setInt(index++, price_id);
            pstmt.setString(index++, StaticTO.ACTIVE_STATUS);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                promoteTO = new PromoteTO(rs.getInt("promote_id"),
                        rs.getString("pro_code"),
                        rs.getString("pro_value"),
                        rs.getString("status"),
                        rs.getString("remark"),
                        rs.getString("expired_date")
                );

            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DbUtils.closeQuietly(rs);
        }
        return promoteTO;

    }

    public ArrayList<PromoteTO> retreiveAllPromote() {
        ArrayList<PromoteTO> listPromote = new ArrayList<PromoteTO>();
        Connection conn = null;
        ResultSet rs = null;
        PreparedStatement pstmt = null;
        String sql = "SELECT * FROM " + StaticTO.DB_PROMOTE_NAME + " ";
        conn = getConnection();
        try {
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                PromoteTO promoteTO = new PromoteTO(rs.getInt("promote_id"),
                        rs.getString("pro_code"),
                        rs.getString("pro_value"),
                        rs.getString("status"),
                        rs.getString("remark"),
                        rs.getString("expired_date")
                );
                listPromote.add(promoteTO);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DbUtils.closeQuietly(rs);
        }
        return listPromote;

    }

    // danh sách các mã giảm giá theo từng kiểu giá
    public ArrayList<Map<PriceRoomTO, PromoteTO>> retrieveAllCodePrice() {
        Connection conn = null;
        PreparedStatement pstmt = null;
        String sql = "SELECT * FROM " + StaticTO.DB_PROMOTE_NAME + " p inner join " + StaticTO.DB_PROMOTE_PRICE_NAME + " pp on pp.promote_id=p.promote_id inner join price_room pr on pr.price_id=pp.price_id ";
        conn = getConnection();
        ArrayList<Map<PriceRoomTO, PromoteTO>> listCodePrice = new ArrayList<>();
        ResultSet rs = null;
        try {
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                Date dateexprire = null;
                DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                String dateStr = "";
                if (rs.getTimestamp("expired_date") != null) {
                    dateexprire = new Date(rs.getTimestamp("expired_date").getTime());
                    dateStr = dateFormat.format(dateexprire);
                }
                PriceRoomTO priceRoomTO = new PriceRoomTO(rs.getInt("price_id"),
                        rs.getString("type_price_room_vi"),
                        rs.getString("type_price_room_en"),
                        rs.getLong("price_1_night"),
                        rs.getInt("kind_room_id"),
                        rs.getString("status"),
                        rs.getString("remark")
                );
                PromoteTO promoteTO = new PromoteTO(rs.getInt("promote_id"), rs.getString("pro_code"),
                        rs.getString("pro_value"),
                        rs.getString("status"),
                        rs.getString("remark"),
                        dateStr

                );
                Map<PriceRoomTO, PromoteTO> map = new HashMap<PriceRoomTO, PromoteTO>();
                map.put(priceRoomTO, promoteTO);
                listCodePrice.add(map);
            }


        } catch (SQLException e) {
            e.printStackTrace();
        }
        return listCodePrice;
    }

    public boolean addPromotePrice(PromoteTO promoteTO) {
        int rs = 0;
        Connection conn = null;
        PreparedStatement pstmt = null;
        String sql = "INSERT INTO " + StaticTO.DB_PROMOTE_PRICE_NAME + " VALUES(?,?,?)";
        conn = getConnection();
        try {
            pstmt = conn.prepareStatement(sql);
            int index = 1;
            pstmt.setLong(index++, promoteTO.getId_promote_price());
            pstmt.setInt(index++, promoteTO.getPromte_id());
            pstmt.setInt(index++, promoteTO.getPrice_id());

            rs = pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DbUtils.closeQuietly(conn, pstmt);
        }

        return (rs > 0);
    }

}
