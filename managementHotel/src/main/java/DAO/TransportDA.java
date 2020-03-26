package DAO;

import DTO.StaticTO;
import DTO.TransportTO;
import Utils.DbUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class TransportDA extends DAOOject {
    // thêm dữ liệu transport
    public boolean addTransport(TransportTO transportTO) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        int rs = 0;
        String sql = "INSERT INTO " + StaticTO.DB_TRANSPORT_NAME + " VALUES(?,?,?,?,?,?,?,?)";
        conn = getConnection();
        try {
            pstmt = conn.prepareStatement(sql);
            int index = 1;
            pstmt.setLong(index++, transportTO.getTransport_id());
            pstmt.setString(index++, transportTO.getName_vi());
            pstmt.setString(index++, transportTO.getName_en());
            pstmt.setString(index++, transportTO.getDetails_vi());
            pstmt.setString(index++, transportTO.getDetails_en());
            pstmt.setLong(index++, transportTO.getPrice());
            pstmt.setString(index++, transportTO.getStatus());
            pstmt.setString(index++, transportTO.getRemark());
            rs = pstmt.executeUpdate();

        } catch (SQLException e) {
            System.out.println("addTransport++++" + pstmt.toString());
            e.printStackTrace();
        } finally {
            System.out.println("addTransport++++" + pstmt.toString());
            DbUtils.closeQuietly(conn, pstmt);
        }
        return (rs > 0);
    }
  // thêm dữ liệu phí khác
    public boolean addTransportOther(TransportTO transportTO) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        int rs = 0;
        String sql = "INSERT INTO " + StaticTO.DB_FEES_OTHER_NAME + " VALUES(?,?,?,?,?,?)";
        conn = getConnection();
        try {
            pstmt = conn.prepareStatement(sql);
            int index = 1;
            pstmt.setLong(index++, transportTO.getTransport_id());
            pstmt.setString(index++, transportTO.getName_vi());
            pstmt.setString(index++, transportTO.getName_en());
            pstmt.setLong(index++, transportTO.getPrice());
            pstmt.setString(index++, transportTO.getStatus());
            pstmt.setString(index++, transportTO.getRemark());
            rs = pstmt.executeUpdate();

        } catch (SQLException e) {
            System.out.println("addTransportOther++++" + pstmt.toString());
            e.printStackTrace();
        } finally {
            System.out.println("addTransportOther++++" + pstmt.toString());
            DbUtils.closeQuietly(conn, pstmt);

        }
        return (rs > 0);
    }
    // thêm dữ liệu transport cho từng khu vực
    public boolean addTransportRegion(TransportTO transportTO) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        int rs = 0;
        String sql = "INSERT INTO " + StaticTO.DB_TRANS_REGION_NAME + " VALUES(?,?,?)";
        conn = getConnection();
        try {
            pstmt = conn.prepareStatement(sql);
            int index = 1;
            pstmt.setInt(index++, transportTO.getId_transport_region());
            pstmt.setLong(index++, transportTO.getTransport_id());
            pstmt.setInt(index++, transportTO.getRegion_id());

            rs = pstmt.executeUpdate();

        } catch (SQLException e) {
            System.out.println("addTransportOther++++" + pstmt.toString());
            e.printStackTrace();
        } finally {
            System.out.println("addTransportOther++++" + pstmt.toString());
            DbUtils.closeQuietly(conn, pstmt);

        }
        return (rs > 0);
    }
    //lấy ra tất các transport
    public ArrayList<TransportTO> retreiveAllTransport() {
        ArrayList<TransportTO> listTrans = new ArrayList<TransportTO>();
        Connection conn = null;
        PreparedStatement pstmt = null;
        conn = getConnection();
        ResultSet rs = null;
        String sql = "SELECT * FROM " + StaticTO.DB_TRANSPORT_NAME;
        try {
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                TransportTO transportTO = new TransportTO(rs.getLong("transport_id"),
                        rs.getString("name_vi"),
                        rs.getString("name_en"),
                        rs.getString("details_vi"),
                        rs.getString("details_en"),
                        rs.getLong("price"),
                        rs.getString("status"),
                        rs.getString("remark")
                );
                listTrans.add(transportTO);
            }

        } catch (SQLException e) {
            System.out.println("retreiveAllTransport+++++" + pstmt.toString());
            e.printStackTrace();
        } finally {
            System.out.println("retreiveAllTransport+++++" + pstmt.toString());
            DbUtils.closeQuietly(rs);
        }

        return listTrans;
    }
    // lấy ra các phí dịch vụ
    public ArrayList<TransportTO> retreiveAllFeesOther() {
        ArrayList<TransportTO> listTrans = new ArrayList<TransportTO>();
        Connection conn = null;
        PreparedStatement pstmt = null;
        conn = getConnection();
        ResultSet rs = null;
        String sql = "SELECT * FROM " + StaticTO.DB_FEES_OTHER_NAME;
        try {
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                TransportTO transportTO = new TransportTO(rs.getInt("id_fees"),
                        rs.getString("name_vi"),
                        rs.getString("name_en"),
                        rs.getLong("price"),
                        rs.getString("status"),
                        rs.getString("remark")
                );
                listTrans.add(transportTO);
            }

        } catch (SQLException e) {
            System.out.println("retreiveAllFeesOther+++++" + pstmt.toString());
            e.printStackTrace();
        } finally {
            System.out.println("retreiveAllFeesOther+++++" + pstmt.toString());
            DbUtils.closeQuietly(rs);
        }

        return listTrans;
    }
    // lấy tất cả các vận chuyển theo vùng
    public ArrayList<TransportTO> retreiveAllTransByRegionId(int region_id) {
        ArrayList<TransportTO> listTrans = new ArrayList<TransportTO>();
        Connection conn = null;
        PreparedStatement pstmt = null;
        conn = getConnection();
        ResultSet rs = null;
        String sql = "SELECT * FROM " + StaticTO.DB_TRANSPORT_NAME +" T "
                +"INNER JOIN "+StaticTO.DB_TRANS_REGION_NAME+" TR ON T.TRANSPORT_ID=TR.TRANSPORT_ID "
                +" WHERE TR.REGION_ID=? ";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1,region_id);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                TransportTO transportTO = new TransportTO(rs.getLong("transport_id"),
                        rs.getString("name_vi"),
                        rs.getString("name_en"),
                        rs.getString("details_vi"),
                        rs.getString("details_en"),
                        rs.getLong("price"),
                        rs.getString("status"),
                        rs.getString("remark")
                );
                listTrans.add(transportTO);
            }

        } catch (SQLException e) {
            System.out.println("retreiveAllTransByRegionId+++++" + pstmt.toString());
            e.printStackTrace();
        } finally {
            System.out.println("retreiveAllTransByRegionId+++++" + pstmt.toString());
            DbUtils.closeQuietly(rs);
        }

        return listTrans;
    }
    // lấy tất cả các vận chuyển THEO ID
    public TransportTO retreiveAllTransById(int transport_id) {
        TransportTO transportTO=null;
        Connection conn = null;
        PreparedStatement pstmt = null;
        conn = getConnection();
        ResultSet rs = null;
        String sql = "SELECT * FROM " + StaticTO.DB_TRANSPORT_NAME +" T WHERE T.TRANSPORT_ID=? AND T.STATUS=?";

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1,transport_id);
            pstmt.setString(2,StaticTO.ACTIVE_STATUS);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                transportTO= new TransportTO(rs.getLong("transport_id"),
                        rs.getString("name_vi"),
                        rs.getString("name_en"),
                        rs.getString("details_vi"),
                        rs.getString("details_en"),
                        rs.getLong("price"),
                        rs.getString("status"),
                        rs.getString("remark")
                );

            }

        } catch (SQLException e) {
            System.out.println("retreiveAllTransByRegionId+++++" + pstmt.toString());
            e.printStackTrace();
        } finally {
            System.out.println("retreiveAllTransByRegionId+++++" + pstmt.toString());
            DbUtils.closeQuietly(rs);
        }

        return transportTO;
    }



}

