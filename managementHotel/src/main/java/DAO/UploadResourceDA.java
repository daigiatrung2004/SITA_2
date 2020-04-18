package DAO;

import DTO.StaticTO;
import DTO.UploadResourceTO;
import Utils.DbUtils;
import servlet.Admin.WebServletAdmin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

public class UploadResourceDA extends DAOOject {
    public boolean addUploadResource(UploadResourceTO uploadResourceTO) {
        int rs = 0;
        Connection conn = null;
        PreparedStatement pstmt = null;
        String sql = "INSERT INTO " + StaticTO.DB_UPLOAD_RESOURCE + " VALUES(?,?,?,?,?,?,?,?)";
        conn = getConnection();
        try {
            pstmt = conn.prepareStatement(sql);
            int index = 1;
            pstmt.setLong(index++, uploadResourceTO.getId());
            pstmt.setString(index++, uploadResourceTO.getOriginal_filename());
            pstmt.setString(index++, uploadResourceTO.getFile_url());
            pstmt.setString(index++, uploadResourceTO.getParent_table());
            pstmt.setString(index++, uploadResourceTO.getCreated_date());
            pstmt.setString(index++, uploadResourceTO.getStatus());
            pstmt.setString(index++, uploadResourceTO.getRemark());
            pstmt.setString(index++, uploadResourceTO.getFile_type());
            rs = pstmt.executeUpdate();

        } catch (SQLException e) {
            System.out.println("+++sql" + pstmt.toString());
            e.printStackTrace();
        } finally {
            System.out.println("+++sql" + pstmt.toString());
            DbUtils.closeQuietly(conn, pstmt);
        }

        return (rs > 0);
    }
    public ArrayList<UploadResourceTO> retrieveUploadByKindRoomId(String kind_room_id){

        Connection conn = null;
        UploadResourceTO uploadResourceTO = null;
        ArrayList<UploadResourceTO> listUploadResoure=new  ArrayList<UploadResourceTO>();
        ResultSet rs = null;
        PreparedStatement pstmt = null;
        String sql = "SELECT * FROM " + StaticTO.DB_UPLOAD_RESOURCE + " WHERE PARENT_TABLE=? ";
        conn = getConnection();
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, kind_room_id);


            rs = pstmt.executeQuery();
            while (rs.next()) {
                java.util.Date create_date = null;
                String createDateStr="";
                DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
                if (rs.getDate("Created_date") != null) {
                    create_date = new java.util.Date(rs.getTimestamp("Created_date").getTime());
                    createDateStr = dateFormat.format(create_date);
                }
                uploadResourceTO = new UploadResourceTO(rs.getLong("id"),
                        rs.getString("Original_filename"),
                        rs.getString("File_url"),
                        rs.getString("Parent_table"),
                        createDateStr,
                        rs.getString("status"),
                        rs.getString("remark"),
                        rs.getString("File_type")

                );
                listUploadResoure.add(uploadResourceTO);
            }

        } catch (SQLException e) {
            System.out.println("+++sql" + pstmt.toString());
            e.printStackTrace();
        } finally {
            System.out.println("+++sql" + pstmt.toString());
            DbUtils.closeQuietly(conn, pstmt);
        }

        return listUploadResoure;
    }

    public UploadResourceTO retrieveImgGalery(String kind_room_id) {

        Connection conn = null;
        UploadResourceTO uploadResourceTO = null;
        ResultSet rs = null;
        PreparedStatement pstmt = null;
        String sql = "SELECT * FROM " + StaticTO.DB_UPLOAD_RESOURCE + " WHERE PARENT_TABLE=? LIMIT 1 ";
        conn = getConnection();
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, kind_room_id);


            rs = pstmt.executeQuery();
            if (rs.next()) {
                java.util.Date create_date = null;
                String createDateStr="";
                DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
                if (rs.getDate("Created_date") != null) {
                    create_date = new java.util.Date(rs.getTimestamp("Created_date").getTime());
                    createDateStr = dateFormat.format(create_date);
                }
                uploadResourceTO = new UploadResourceTO(rs.getLong("id"),
                        rs.getString("Original_filename"),
                        rs.getString("File_url"),
                        rs.getString("Parent_table"),
                        createDateStr,
                        rs.getString("status"),
                        rs.getString("remark"),
                        rs.getString("File_type")

                );
            }

        } catch (SQLException e) {
            System.out.println("+++sql" + pstmt.toString());
            e.printStackTrace();
        } finally {
            System.out.println("+++sql" + pstmt.toString());
            DbUtils.closeQuietly(conn, pstmt);
        }

        return uploadResourceTO;
    }
}
