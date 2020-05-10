package DAO;

import DTO.StaticTO;
import DTO.WarsehouseTO;
import Utils.DbUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

public class WarsehouseDA extends DAOOject {
    public boolean inputWarsehouse(WarsehouseTO warsehouseTO) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        String sql = "INSERT INTO " + StaticTO.DB_WARSEHOUSE + " VALUES(?,?,?,?,?,?,?)";
        conn = getConnection();
        int rs = 0;
        try {
            pstmt = conn.prepareStatement(sql);
            int index = 1;
            pstmt.setLong(index++, warsehouseTO.getWarsehouse_id());
            pstmt.setInt(index++, warsehouseTO.getID());
            pstmt.setString(index++, warsehouseTO.getType());
            pstmt.setInt(index++, warsehouseTO.getAmount());
            pstmt.setString(index++, warsehouseTO.getInputdate());
            pstmt.setLong(index++, warsehouseTO.getEmployee_id());
            pstmt.setString(index++, warsehouseTO.getRemarks());
            rs = pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DbUtils.closeQuietly(conn, pstmt);
        }
        return (rs > 0);
    }

    public ArrayList<WarsehouseTO> retrieveAllWarsehouse(String type) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql = "SELECT * FROM " + StaticTO.DB_WARSEHOUSE + " WHERE TYPE=? ORDER BY warsehouse_id DESC";
        conn = getConnection();
        ArrayList<WarsehouseTO> listInput = new ArrayList<WarsehouseTO>();
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, type);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                Date date = null;
                String dateStr = "";
                DateFormat dateFormat;
                dateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
                if (rs.getTimestamp("inputdate") != null) {
                    date = new Date(rs.getTimestamp("inputdate").getTime());
                    dateStr = dateFormat.format(date);
                }
                WarsehouseTO warsehouseTO = new WarsehouseTO(rs.getLong("warsehouse_id"), rs.getInt("ID"),
                        rs.getString("type"),
                        rs.getInt("amount"),
                        dateStr,
                        rs.getLong("employee_id"),
                        rs.getString("remarks")
                );
                listInput.add(warsehouseTO);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return listInput;
    }


}
