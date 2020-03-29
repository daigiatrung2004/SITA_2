package DAO;

import DTO.EmployeeTO;
import DTO.PositionEmployeeTO;
import DTO.StaticTO;
import Utils.DbUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

public class EmployeeDA extends DAOOject {
    public EmployeeDA() {
    }

    public boolean addPositionEmpoloyee(String name) throws SQLException {
        Connection conn = null;
        PreparedStatement pstmt = null;
        String sql = "INSERT INTO " + StaticTO.DB_EMPLOYEE_POSITION_NAME + " VALUES(0,?,?)";
        int rs = 0;
        conn = getConnection();
        try {

            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, name);
            pstmt.setString(2, StaticTO.ACTIVE_STATUS);
            rs = pstmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DbUtils.closeQuietly(conn, pstmt);
        }
        return (rs > 0);
    }

    public ArrayList<PositionEmployeeTO> retreiveAllPositionEmployee() {
        Connection conn = null;
        EmployeeTO employeeTO = null;
        ArrayList<PositionEmployeeTO> listPosEmployee = new ArrayList<PositionEmployeeTO>();

        ResultSet rs = null;
        String sql = "SELECT * FROM " + StaticTO.DB_EMPLOYEE_POSITION_NAME;
        PreparedStatement pstmt = null;
        conn = getConnection();
        try {
            pstmt = conn.prepareStatement(sql);

            rs = pstmt.executeQuery();
            while (rs.next()) {

                PositionEmployeeTO posEm = new PositionEmployeeTO(rs.getLong("position_employee_id"),
                        rs.getString("name"),
                        rs.getString("status")

                );
                listPosEmployee.add(posEm);


            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DbUtils.closeQuietly(rs);
        }
        return listPosEmployee;
    }

    public Boolean addEmployee(EmployeeTO employeeTO) {
        Connection conn = null;
        String sql = "INSERT INTO  " + StaticTO.DB_EMPLOYEE_NAME + " VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
        PreparedStatement pstmt = null;
        conn = getConnection();
        int result=0;
        try {
            pstmt = conn.prepareStatement(sql);
            int index=1;
            pstmt.setLong(index++,employeeTO.getId());
            pstmt.setLong(index++,employeeTO.getPositionEmployeeId());
            pstmt.setString(index++,employeeTO.getLoginName());
            pstmt.setString(index++,employeeTO.getSankey());
            pstmt.setString(index++,employeeTO.getEncryptpass());
            pstmt.setString(index++,employeeTO.getStart_date());
            pstmt.setString(index++,employeeTO.getAddress());
            pstmt.setString(index++,employeeTO.getCountry());
            pstmt.setString(index++,employeeTO.getContact_person());
            pstmt.setString(index++,employeeTO.getContact_email());
            pstmt.setLong(index++,employeeTO.getSalary());
            pstmt.setString(index++,employeeTO.getStatus());
            pstmt.setString(index++,employeeTO.getRemark());
            pstmt.setString(index++,employeeTO.getIpAdress());
            pstmt.setString(index++,employeeTO.getLast_login());
            pstmt.setString(index++,employeeTO.getFirstName());
            pstmt.setString(index++,employeeTO.getLastName());
            pstmt.setInt(index++,employeeTO.getRegion_id());
            result=pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("sql +++++"+pstmt.toString());
        } finally {
            DbUtils.closeQuietly(conn,pstmt);
            System.out.println("sql +++++"+pstmt.toString());
        }
         return (result>0);
    }

    public EmployeeTO retrieveEmployeeByEmail(String email) {
        Connection conn = null;
        EmployeeTO employeeTO = null;
        ResultSet rs = null;
        String sql = "SELECT * FROM " + StaticTO.DB_EMPLOYEE_NAME + " WHERE LOGINNAME=? LIMIT 1";
        PreparedStatement pstmt = null;
        conn = getConnection();
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, email);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                long employee_id = rs.getLong("employee_id");
                long position_employee = rs.getLong("position_employee_id");
                String loginname = rs.getString("loginname");
                String sankey = rs.getString("sankey");
                String encryptpass = rs.getString("encryptpass");
                java.util.Date start_date = null, last_login = null;
                String start_dateStr = "", last_login_str = "";
                DateFormat dateFormat = new SimpleDateFormat("yyyy-mm-dd hh:mm:ss");
                if (rs.getDate("start_date") != null) {
                    start_date = new java.util.Date(rs.getTimestamp("start_date").getTime());
                    start_dateStr = dateFormat.format(start_date);
                }
                if (rs.getDate("last_login") != null) {
                    last_login = new java.util.Date(rs.getTimestamp("last_login").getTime());
                    last_login_str = dateFormat.format(last_login);
                }
                employeeTO = new EmployeeTO(employee_id,
                        position_employee,
                        loginname,
                        sankey,
                        encryptpass,
                        start_dateStr,
                        rs.getString("address"),
                        rs.getString("country"),
                        rs.getString("contact_person"),
                        rs.getString("contact_email"),
                        rs.getLong("salary"),
                        rs.getString("status"),
                        rs.getString("remark"),
                        rs.getString("ipAddress"),
                        last_login_str,
                        rs.getString("first_name"),
                        rs.getString("last_name"),
                       rs.getInt("region_id")
                );


            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DbUtils.closeQuietly(rs);
        }
        return employeeTO;
    }

    public Boolean authenticateEmployee(String username, String password) {
        Connection conn = null;
        ResultSet rs = null;
        String sql = " SELECT COUNT(*) as checkExistCount FROM  " + StaticTO.DB_EMPLOYEE_NAME + " WHERE USERNAME=? AND PASSWORD=?";
        PreparedStatement pstmt = null;
        int index = 1;
        int checkExistCount = 0;
        try {
            conn = getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(index++, username);
            pstmt.setString(index++, password);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                checkExistCount = rs.getInt("checkExistCount");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Xảy ra lỗi câu truy vấn ++++" + pstmt.toString());
        } finally {
            DbUtils.closeQuietly(conn, pstmt);
        }

        return (checkExistCount > 0);
    }

}
