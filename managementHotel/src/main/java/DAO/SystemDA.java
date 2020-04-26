package DAO;

import DTO.StaticTO;
import DTO.SystemTO;
import Utils.DbUtils;
import com.mysql.cj.protocol.Resultset;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class SystemDA extends DAOOject {
    public boolean addView(SystemTO systemTO) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        String sql = "INSERT INTO " + StaticTO.DB_SYSTEM_NAME + " VALUES(?,?,?,?,?,?)";
        int rs = 0;
        conn = getConnection();
        try {
            pstmt=conn.prepareStatement(sql);
            int index=1;
            pstmt.setLong(index++,systemTO.getSys_id());
            pstmt.setString(index++,systemTO.getMeta_key());
            pstmt.setString(index++,systemTO.getIp_Address());
            pstmt.setString(index++,systemTO.getType());
            pstmt.setString(index++,systemTO.getMeta_value());
            pstmt.setString(index++,systemTO.getDate_update());
            rs=pstmt.executeUpdate();
        } catch (SQLException e) {
            System.out.println("++++addView"+pstmt.toString());
            e.printStackTrace();
        }finally {
            System.out.println("++++addView"+pstmt.toString());
            DbUtils.closeQuietly(conn,pstmt);
        }
      return (rs>0);

    }
    // check Exist ip đó
    public boolean checkViews(String ip_address,String startdate,String enddate){
        Connection conn = null;
        PreparedStatement pstmt = null;
        String sql = "SELECT COUNT(*) AS TOTAL FROM  " + StaticTO.DB_SYSTEM_NAME + " WHERE ip_Address=? and (date_update BETWEEN ? AND ?)";
        int count = 0;
       ResultSet rs=null;
        conn = getConnection();
        try {
            pstmt=conn.prepareStatement(sql);
            int index=1;
            pstmt.setString(index++,ip_address);
            pstmt.setString(index++,startdate);
            pstmt.setString(index++,enddate);
            rs=pstmt.executeQuery();
            if(rs.next()){
                count=rs.getInt("TOTAL");
            }
        } catch (SQLException e) {
            System.out.println("++++addView"+pstmt.toString());
            e.printStackTrace();
        }finally {
            System.out.println("++++addView"+pstmt.toString());
            DbUtils.closeQuietly(rs);
        }
        return (count>0);
    }
    // COUNT views
    public int countViews(){
        Connection conn = null;
        PreparedStatement pstmt = null;
        String sql = "SELECT COUNT(*) AS TOTAL FROM  " + StaticTO.DB_SYSTEM_NAME + " WHERE TYPE=?";
        int count = 0;
        ResultSet rs=null;
        conn = getConnection();
        try {
            pstmt=conn.prepareStatement(sql);
            int index=1;
            pstmt.setString(index++,StaticTO.TYPE_VIEWS);

            rs=pstmt.executeQuery();
            if(rs.next()){
                count=rs.getInt("TOTAL");
            }
        } catch (SQLException e) {
            System.out.println("++++addView"+pstmt.toString());
            e.printStackTrace();
        }finally {
            System.out.println("++++addView"+pstmt.toString());
            DbUtils.closeQuietly(rs);
        }
        return count;
    }
    // count views theo số ngày
    public int countViewsOfDay(String dateStart,String dateEnd){
        Connection conn = null;
        PreparedStatement pstmt = null;
        String sql = "SELECT COUNT(*) AS TOTAL FROM  " + StaticTO.DB_SYSTEM_NAME + " WHERE TYPE=? AND (date_update BETWEEN ? AND ?)";
        int count = 0;
        ResultSet rs=null;
        conn = getConnection();
        try {
            pstmt=conn.prepareStatement(sql);
            int index=1;
            pstmt.setString(index++,StaticTO.TYPE_VIEWS);
            pstmt.setString(index++,dateStart);
            pstmt.setString(index++,dateEnd);

            rs=pstmt.executeQuery();
            if(rs.next()){
                count=rs.getInt("TOTAL");
            }
        } catch (SQLException e) {
            System.out.println("++++addView"+pstmt.toString());
            e.printStackTrace();
        }finally {
            System.out.println("++++addView"+pstmt.toString());
            DbUtils.closeQuietly(rs);
        }
        return count;
    }
    // report  from user
    public boolean addReportUser(long id,int regionId,String room,String nameuser,String email,String quoctich,String title,String content,String remark,String type,String status){
        Connection conn = null;
        PreparedStatement pstmt = null;
        String sql = "INSERT INTO " + StaticTO.DB_REPORT_USER_NAME + " VALUES(?,?,?,?,?,?,?,?,?,?,?)";
        int rs = 0;
        conn = getConnection();
        try {
            pstmt=conn.prepareStatement(sql);
            int index=1;
            pstmt.setLong(index++,id);
            pstmt.setInt(index++,regionId);
            pstmt.setString(index++,room);
            pstmt.setString(index++,nameuser);
            pstmt.setString(index++,email);
            pstmt.setString(index++,quoctich);
            pstmt.setString(index++,title);
            pstmt.setString(index++,content);
            pstmt.setString(index++,type);
            pstmt.setString(index++,status);
            pstmt.setString(index++,remark);

            rs=pstmt.executeUpdate();
        } catch (SQLException e) {
            System.out.println("++++addReportUser"+pstmt.toString());
            e.printStackTrace();
        }finally {
            System.out.println("++++addReportUser"+pstmt.toString());
            DbUtils.closeQuietly(conn,pstmt);
        }
        return (rs>0);
    }


}
