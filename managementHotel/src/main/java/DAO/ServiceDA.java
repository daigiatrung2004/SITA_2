package DAO;

import DAO.DAOOject;
import DTO.ServiceRoomTO;
import DTO.ServiceTO;
import DTO.StaticTO;
import Utils.DbUtils;
import servlet.Admin.WebServletAdmin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ServiceDA extends DAOOject {
    public ArrayList<ServiceTO> retrieveAllService() {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql = "SELECT * FROM " + StaticTO.DB_SERVICE_NAME;
        ArrayList<ServiceTO> listServiceTO = new ArrayList<ServiceTO>();
        conn = getConnection();
        try {
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                ServiceTO serviceTO = new ServiceTO(rs.getInt("id_service"),
                        rs.getString("service_name_vi"),
                        rs.getString("servict_name_en"),
                        rs.getString("file_img_url"),
                        rs.getString("service_details_vi"),
                        rs.getString("service_details_en"),
                        rs.getString("status"),
                        rs.getString("remark")
                );
                listServiceTO.add(serviceTO);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DbUtils.closeQuietly(rs);
        }
        return listServiceTO;
    }
    public ArrayList<ServiceTO> retrieveServiceByPrice(int price_id) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql = "SELECT S.* FROM " + StaticTO.DB_SERVICE_NAME+" S "
                +" INNER JOIN "+StaticTO.DB_SERVICE_ROOM_NAME+" SR ON SR.ID_SERVICE=S.ID_SERVICE"
                +" WHERE SR.PRICE_ID=? AND S.STATUS=?"
                ;
        ArrayList<ServiceTO> listServiceTO = new ArrayList<ServiceTO>();
        conn = getConnection();
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1,price_id);
            pstmt.setString(2,StaticTO.ACTIVE_STATUS);
            rs = pstmt.executeQuery();
            while (rs.next()) {

                ServiceTO serviceTO = new ServiceTO(rs.getInt("id_service"),
                        rs.getString("service_name_vi"),
                        rs.getString("servict_name_en"),
                        rs.getString("file_img_url"),
                        rs.getString("service_details_vi"),
                        rs.getString("service_details_en"),
                        rs.getString("status"),
                        rs.getString("remark")
                );
                listServiceTO.add(serviceTO);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            System.out.println("retrieveServiceByPrice:+++++"+pstmt.toString());
            DbUtils.closeQuietly(rs);
        }
        return listServiceTO;
    }

    public boolean addService(ServiceTO serviceTO) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        int rs = 0;
        String sql = "INSERT INTO " + StaticTO.DB_SERVICE_NAME + " VALUES(?,?,?,?,?,?,?,?)";
        conn = getConnection();
        try {
            pstmt = conn.prepareStatement(sql);
            int index = 1;
            pstmt.setInt(index++, serviceTO.getId_service());
            pstmt.setString(index++, serviceTO.getService_name_vi());
            pstmt.setString(index++, serviceTO.getService_name_en());
            pstmt.setString(index++, serviceTO.getFile_img_url());
            pstmt.setString(index++, serviceTO.getService_details_vi());
            pstmt.setString(index++, serviceTO.getService_details_en());
            pstmt.setString(index++, serviceTO.getStatus());
            pstmt.setString(index++, serviceTO.getRemark());
            rs = pstmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DbUtils.closeQuietly(conn, pstmt);
        }
        return (rs > 0);
    }

    public boolean addServiceRoom(ServiceRoomTO serviceRoomTO) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        int rs = 0;
        String sql = "INSERT INTO " + StaticTO.DB_SERVICE_ROOM_NAME + " VALUES(?,?,?)";
        conn = getConnection();
        try {
            pstmt = conn.prepareStatement(sql);
            int index = 1;
            pstmt.setLong(index++, serviceRoomTO.getId_service_room());
            pstmt.setInt(index++, serviceRoomTO.getId_service());
            pstmt.setInt(index++, serviceRoomTO.getPrice_id());
            rs = pstmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DbUtils.closeQuietly(conn, pstmt);
        }
        return (rs > 0);
    }

}
