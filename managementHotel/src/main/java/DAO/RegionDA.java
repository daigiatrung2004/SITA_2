package DAO;

import DTO.RegionTO;
import DTO.StaticTO;
import Utils.DbUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class RegionDA extends DAOOject {
    // thêm khu vực
    public boolean addRegion(RegionTO regionTO) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        String sql = "INSERT INTO " + StaticTO.DB_REGION_NAME + " VALUES(?,?,?,?,?,?,?,?)";
        conn = getConnection();
        int rs = 0;
        try {
            pstmt = conn.prepareStatement(sql);
            int index = 1;
            pstmt.setInt(index++, regionTO.getRegion_id());
            pstmt.setString(index++, regionTO.getName_vi());
            pstmt.setString(index++, regionTO.getName_en());
            pstmt.setString(index++, StaticTO.ACTIVE_STATUS);
            pstmt.setString(index++, regionTO.getRemark());
            pstmt.setString(index++,regionTO.getFile_url_img());
            pstmt.setString(index++,regionTO.getAddress());
            pstmt.setString(index++,regionTO.getContact_phone());
            rs = pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DbUtils.closeQuietly(conn, pstmt);
        }
        return (rs > 0);
    }
    // update dữ liệu region
    public boolean updateRegion(RegionTO regionTO) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        String sql = "UPDATE  " + StaticTO.DB_REGION_NAME + " SET name_vi=?,name_en=?,status=?,remark=?,file_url_img=?,Address=?,contact_phone=? WHERE region_id=?";
        conn = getConnection();
        int rs = 0;
        try {
            pstmt = conn.prepareStatement(sql);
            int index = 1;

            pstmt.setString(index++, regionTO.getName_vi());
            pstmt.setString(index++, regionTO.getName_en());
            pstmt.setString(index++, regionTO.getStatus());
            pstmt.setString(index++, regionTO.getRemark());
            pstmt.setString(index++,regionTO.getFile_url_img());
            pstmt.setString(index++,regionTO.getAddress());
            pstmt.setString(index++,regionTO.getContact_phone());
            pstmt.setInt(index++, regionTO.getRegion_id());
            rs = pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DbUtils.closeQuietly(conn, pstmt);
        }
        return (rs > 0);
    }
    // lấy dữ liệu bằng region id
    public RegionTO retrieveAllRegion(int region_id) {
        RegionTO regionTO = null;
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql = "SELECT * FROM " + StaticTO.DB_REGION_NAME +" WHERE REGION_ID=? AND STATUS=?";
        conn = getConnection();
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1,region_id);
            pstmt.setString(2,StaticTO.ACTIVE_STATUS);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                regionTO = new RegionTO(rs.getInt("region_id"),
                        rs.getString("name_vi"),
                        rs.getString("name_en"),
                        rs.getString("status"),
                        rs.getString("remark"),
                        rs.getString("file_url_img"),
                        rs.getString("Address"),
                        rs.getString("contact_phone")
                );

            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DbUtils.closeQuietly(rs);
        }
        return regionTO;
    }

    // lấy hêt khu vực
    public ArrayList<RegionTO> retrieveAllRegion() {
        ArrayList<RegionTO> listRegion = new ArrayList<RegionTO>();
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql = "SELECT * FROM " + StaticTO.DB_REGION_NAME+" WHERE STATUS=?";

        conn = getConnection();
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1,StaticTO.ACTIVE_STATUS);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                RegionTO regionTO = new RegionTO(rs.getInt("region_id"),
                        rs.getString("name_vi"),
                        rs.getString("name_en"),
                        rs.getString("status"),
                        rs.getString("remark"),
                        rs.getString("file_url_img"),
                        rs.getString("Address"),
                        rs.getString("contact_phone")

                );
                listRegion.add(regionTO);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DbUtils.closeQuietly(rs);
        }
        return listRegion;
    }

}
