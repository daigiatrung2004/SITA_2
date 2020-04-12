package DAO;

import DTO.AnnoucementTO;
import DTO.EmployeeTO;
import DTO.StaticTO;
import Utils.DbUtils;
import com.mysql.cj.protocol.Resultset;
import com.mysql.cj.x.protobuf.MysqlxPrepare;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

public class AnnoucementDA extends DAOOject {
    public boolean addAnnoucement(AnnoucementTO annoucementTO) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        String sql = "INSERT INTO " + StaticTO.DB_ANNOUCE_NAME + " VALUES(?,?,?,?,?,?,?)";
        int rs = 0;
        conn = getConnection();
        try {
            pstmt = conn.prepareStatement(sql);
            int index = 1;
            pstmt.setLong(index++, annoucementTO.getANNOUNCE_ID());
            pstmt.setString(index++, annoucementTO.getTITLE());
            pstmt.setString(index++, annoucementTO.getCONTENT());
            pstmt.setLong(index++, annoucementTO.getEmployee_id());
            pstmt.setString(index++, annoucementTO.getSTATUS());
            pstmt.setString(index++, annoucementTO.getREMARK());
            pstmt.setString(index++, annoucementTO.getDATE_POST());
            rs = pstmt.executeUpdate();
            EmployeeDA employeeDA = new EmployeeDA();
            ArrayList<EmployeeTO> employeeTOS = employeeDA.retrieveALLEmployee();
            for (int i = 0; i < employeeTOS.size(); i++) {
                if (employeeTOS.get(i).getLoginName().equals("admin")) {
                    continue;
                } else {
                    AnnoucementTO annoucementTO1 = retrieveLastestAnnounce();
                    addAnnounceEmployee(employeeTOS.get(i).getId(), annoucementTO1.getANNOUNCE_ID());
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DbUtils.closeQuietly(conn, pstmt);
        }
        return (rs > 0);

    }

    public ArrayList<AnnoucementTO> retrieveALLAnounce() {
        Connection conn = null;
        PreparedStatement pstmt = null;
        String sql = "SELECT * FROM  " + StaticTO.DB_ANNOUCE_NAME;
        ArrayList<AnnoucementTO> listAnnounce = new ArrayList<AnnoucementTO>();
        ResultSet rs = null;
        conn = getConnection();
        try {
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                Date date_post = null;
                DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                String datepostStr = "";
                if (rs.getDate("DATE_POST") != null) {
                    date_post = new Date(rs.getTimestamp("DATE_POST").getTime());
                    datepostStr = dateFormat.format(date_post);
                }
                AnnoucementTO annoucementTO1 = new AnnoucementTO(rs.getLong("ANNOUNCE_ID"), rs.getString("TITLE"),
                        rs.getString("CONTENT"), rs.getLong("employee_id"), rs.getString("STATUS"), rs.getString("REMARK"), rs.getString("DATE_POST")
                );
                listAnnounce.add(annoucementTO1);
            }


        } catch (SQLException e) {
            System.out.println("retrieveALLAnounce+++" + pstmt.toString());
            e.printStackTrace();
        } finally {
            System.out.println("retrieveALLAnounce+++" + pstmt.toString());
            DbUtils.closeQuietly(rs);
        }

        return listAnnounce;
    }

    public AnnoucementTO retrieveLastestAnnounce() {
        Connection conn = null;
        PreparedStatement pstmt = null;
        String sql = "SELECT * FROM  " + StaticTO.DB_ANNOUCE_NAME + " ORDER BY ANNOUNCE_ID DESC LIMIT 1";
        AnnoucementTO annoucementTO1 = null;
        ResultSet rs = null;
        conn = getConnection();
        try {
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                Date date_post = null;
                DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                String datepostStr = "";
                if (rs.getDate("DATE_POST") != null) {
                    date_post = new Date(rs.getTimestamp("DATE_POST").getTime());
                    datepostStr = dateFormat.format(date_post);
                }
                annoucementTO1 = new AnnoucementTO(rs.getLong("ANNOUNCE_ID"), rs.getString("TITLE"),
                        rs.getString("CONTENT"), rs.getLong("employee_id"), rs.getString("STATUS"), rs.getString("REMARK"), rs.getString("DATE_POST")
                );

            }


        } catch (SQLException e) {
            System.out.println("retrieveLastestAnnounce+++" + pstmt.toString());
            e.printStackTrace();
        } finally {
            System.out.println("retrieveLastestAnnounce+++" + pstmt.toString());
            DbUtils.closeQuietly(rs);
        }

        return annoucementTO1;
    }

    public boolean addAnnounceEmployee(long employee_id, long ANNOUNCE_ID) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        String sql = "INSERT INTO " + StaticTO.DB_ANNOUCE_EMPLOYEE_NAME + " VALUES(?,?,?)";
        int rs = 0;
        conn = getConnection();
        try {
            pstmt = conn.prepareStatement(sql);
            int index = 1;
            pstmt.setLong(index++, employee_id);
            pstmt.setLong(index++, ANNOUNCE_ID);
            pstmt.setString(index++, StaticTO.UNREAD_STATUS);
            rs = pstmt.executeUpdate();
        } catch (SQLException e) {
            System.out.println("addAnnounceEmployee+++" + pstmt.toString());
            e.printStackTrace();
        } finally {
            System.out.println("addAnnounceEmployee+++" + pstmt.toString());
            DbUtils.closeQuietly(conn, pstmt);
        }
        return (rs > 0);
    }

    // Tim tat ca cac thong bao
    public ArrayList<AnnoucementTO> retrieveALLAnounceByEmployee(long employee_id) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        String sql = "SELECT *  FROM  " + StaticTO.DB_ANNOUCE_NAME + " A INNER JOIN  " + StaticTO.DB_ANNOUCE_EMPLOYEE_NAME + " AE ON A.ANNOUNCE_ID=AE.ANNOUNCE_ID WHERE AE.employee_id=?";
        ArrayList<AnnoucementTO> listAnnounce = new ArrayList<AnnoucementTO>();
        ResultSet rs = null;
        conn = getConnection();
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setLong(1,employee_id);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                Date date_post = null;
                DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                String datepostStr = "";
                if (rs.getDate("DATE_POST") != null) {
                    date_post = new Date(rs.getTimestamp("DATE_POST").getTime());
                    datepostStr = dateFormat.format(date_post);
                }
                AnnoucementTO annoucementTO1 = new AnnoucementTO(rs.getLong("ANNOUNCE_ID"), rs.getString("TITLE"),
                        rs.getString("CONTENT"), rs.getLong("employee_id"), rs.getString("STATUS"), rs.getString("REMARK"), rs.getString("DATE_POST"), rs.getString("status_read_unread")
                );
                listAnnounce.add(annoucementTO1);
            }


        } catch (SQLException e) {
            System.out.println("retrieveALLAnounceByEmployee+++" + pstmt.toString());
            e.printStackTrace();
        } finally {
            System.out.println("retrieveALLAnounceByEmployee+++" + pstmt.toString());
            DbUtils.closeQuietly(rs);
        }

        return listAnnounce;
    }

    public int countAnnoucementUnread(long employee_id) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        String sql = "SELECT COUNT(*) AS TOTAL FROM  " + StaticTO.DB_ANNOUCE_NAME + " A INNER JOIN  " + StaticTO.DB_ANNOUCE_EMPLOYEE_NAME + " AE ON A.ANNOUNCE_ID=AE.ANNOUNCE_ID WHERE AE.employee_id=? AND AE.status_read_unread=? ";
        ArrayList<AnnoucementTO> listAnnounce = new ArrayList<AnnoucementTO>();
        ResultSet rs = null;
        int count = 0;
        conn = getConnection();
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setLong(1, employee_id);
            pstmt.setString(2, StaticTO.UNREAD_STATUS);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                count = rs.getInt("TOTAL");
            }


        } catch (SQLException e) {
            System.out.println("countAnnoucementUnread+++" + pstmt.toString());
            e.printStackTrace();
        } finally {
            System.out.println("countAnnoucementUnread+++" + pstmt.toString());
            DbUtils.closeQuietly(rs);
        }

        return count;
    }
}
