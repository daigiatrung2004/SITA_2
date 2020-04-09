package DAO;

import DTO.BookingTO;
import DTO.CustomerTO;
import DTO.StaticTO;
import Utils.DbUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;


public class BookingDA extends DAOOject {
    // sử dụng cho kiểm tra search có đụng ngày check in của người không
    public boolean checkBooking(int kind_room_id, int region_id, String checkOut) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        int results = 0;
        String sql = "SELECT COUNT(*) AS TOTAL  FROM " + StaticTO.DB_BOOKING_NAME + " B INNER JOIN ROOM R ON R.ROOM_ID=B.ROOM_ID WHERE KIND_ROOM_ID=?  AND B.CHECK_IN_DATE<=? AND REGION_ID=?  ";
        conn = getConnection();
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, kind_room_id);
//            String []splitDate=checkOut.split("/");
//            checkOut=splitDate[0]+"-"+splitDate[1]+"-"+splitDate[2];

            Date date1 = new SimpleDateFormat("dd/MM/yyyy").parse(checkOut.trim());
            checkOut = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(date1);
            System.out.println("date" + checkOut);
            pstmt.setString(2, checkOut);
            pstmt.setInt(3, region_id);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                results = rs.getInt("TOTAL");
            }
        } catch (SQLException e) {
            System.out.println("++++checkBooking:" + pstmt.toString());
            e.printStackTrace();
        } catch (ParseException e) {
            System.out.println("++++checkBooking:" + pstmt.toString());
            e.printStackTrace();
        } finally {
            DbUtils.closeQuietly(rs);
        }
        return (results > 0);
    }

    public boolean checkBookingByRoom(int kind_room_id, int region_id, String checkOut, int room_id) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        int results = 0;
        String sql = "SELECT COUNT(*) AS TOTAL  FROM " + StaticTO.DB_BOOKING_NAME + " B WHERE KIND_ROOM_ID=?  AND B.CHECK_IN_DATE<=? AND REGION_ID=? AND ROOM_ID=? ";
        conn = getConnection();
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, kind_room_id);
//            String []splitDate=checkOut.split("/");
//            checkOut=splitDate[0]+"-"+splitDate[1]+"-"+splitDate[2];

            Date date1 = new SimpleDateFormat("dd/MM/yyyy").parse(checkOut.trim());
            checkOut = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(date1);
            System.out.println("date" + checkOut);
            pstmt.setString(2, checkOut);
            pstmt.setInt(3, region_id);
            pstmt.setInt(4, room_id);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                results = rs.getInt("TOTAL");
            }
        } catch (SQLException e) {
            System.out.println("++++checkBooking:" + pstmt.toString());
            e.printStackTrace();
        } catch (ParseException e) {
            System.out.println("++++checkBooking:" + pstmt.toString());
            e.printStackTrace();
        } finally {
            DbUtils.closeQuietly(rs);
        }
        return (results > 0);
    }

    // thêm dữ liệu customer
    public boolean addCustomer(CustomerTO customerTO) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        String sql = "INSERT INTO " + StaticTO.DB_CUSTOMER_NAME + " VALUES(?,?,?,?,?,?,?,?,?,?,?)";
        conn = getConnection();
        int rs = 0;
        try {
            pstmt = conn.prepareStatement(sql);
            int index = 1;
            pstmt.setLong(index++, customerTO.getCustomer_id());
            pstmt.setString(index++, customerTO.getEmail());
            pstmt.setString(index++, customerTO.getSankey());
            pstmt.setString(index++, customerTO.getEncryptpass());
            pstmt.setString(index++, customerTO.getStart_date());
            pstmt.setString(index++, customerTO.getContact_person());
            pstmt.setString(index++, customerTO.getVerify_person());
            pstmt.setString(index++, customerTO.getStatus());
            pstmt.setString(index++, customerTO.getRemark());
            pstmt.setString(index++, customerTO.getFirstname());
            pstmt.setString(index++, customerTO.getLastname());
            rs = pstmt.executeUpdate();
        } catch (SQLException e) {
            System.out.println("addCustomer++++" + pstmt.toString());
            e.printStackTrace();
        } finally {
            System.out.println("addCustomer++++" + pstmt.toString());
            DbUtils.closeQuietly(conn, pstmt);
        }
        return (rs > 0);
    }

    // select customer mới nhất
    public CustomerTO retreiveCustomerLatest() {
        Connection conn = null;
        PreparedStatement pstmt = null;
        String sql = "SELECT * FROM " + StaticTO.DB_CUSTOMER_NAME + " ORDER BY CUSTOMER_ID DESC LIMIT 1";
        conn = getConnection();
        ResultSet rs = null;
        CustomerTO customer = null;
        try {
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            Date start_date = null;
            String start_dateStr = "";
            DateFormat dateFormat = new SimpleDateFormat("yyyy-mm-dd hh:mm:ss");
            if (rs.next()) {
                if (rs.getTimestamp("start_date") != null) {
                    start_date = new Date(rs.getTimestamp("start_date").getTime());
                    start_dateStr = dateFormat.format(start_date);
                }
                customer = new CustomerTO(rs.getLong("customer_id"),
                        rs.getString("email"),
                        rs.getString("sankey"),
                        rs.getString("encryptpass"),
                        start_dateStr,
                        rs.getString("contact_person"),
                        rs.getString("verify_person"),
                        rs.getString("status"),
                        rs.getString("remark")
                );

            }

        } catch (SQLException e) {
            System.out.println("retreiveCustomerLatest++++" + pstmt.toString());
            e.printStackTrace();
        } finally {
            System.out.println("retreiveCustomerLatest++++" + pstmt.toString());
            DbUtils.closeQuietly(conn, pstmt);
        }
        return customer;
    }

    // retrieve customer by id
    public CustomerTO retrieveCustomer(long customer_id) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        conn = getConnection();
        String sql = "SELECT * FROM " + StaticTO.DB_CUSTOMER_NAME + " WHERE CUSTOMER_ID=? LIMIT 1";
        ResultSet rs = null;
        CustomerTO customer = null;
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setLong(1, customer_id);
            rs = pstmt.executeQuery();
            Date start_date = null;
            String start_dateStr = "";
            DateFormat dateFormat = new SimpleDateFormat("yyyy-mm-dd hh:mm:ss");

            if (rs.next()) {
                if (rs.getDate("start_date") != null) {
                    start_date = new Date(rs.getTimestamp("start_date").getTime());
                    start_dateStr = dateFormat.format(start_date);
                }
                customer = new CustomerTO(rs.getLong("customer_id"),
                        rs.getString("email"),
                        rs.getString("sankey"),
                        rs.getString("encryptpass"),
                        start_dateStr,
                        rs.getString("contact_person"),
                        rs.getString("verify_person"),
                        rs.getString("status"),
                        rs.getString("remark"),
                        rs.getString("firstname"),
                        rs.getString("lastname")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DbUtils.closeQuietly(rs);
        }
        return customer;
    }

    // thêm dữ liệu booking
    public boolean addBooking(BookingTO bookingTO) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        String sql = "INSERT INTO " + StaticTO.DB_BOOKING_NAME + " VALUES(?,?,?,?,?,?,?,?,?,?,?)";
        conn = getConnection();
        int rs = 0;
        try {
            pstmt = conn.prepareStatement(sql);
            int index = 1;
            pstmt.setLong(index++, bookingTO.getBooking_id());
            pstmt.setLong(index++, bookingTO.getCustomer_id());
            pstmt.setString(index++, bookingTO.getStart_booking_date());
            pstmt.setString(index++, bookingTO.getCheck_in_date());
            pstmt.setString(index++, bookingTO.getCheck_out_date());
            pstmt.setInt(index++, bookingTO.getKind_room_id());
            pstmt.setInt(index++, bookingTO.getRegion_id());
            pstmt.setInt(index++, bookingTO.getRoom_id());
            pstmt.setString(index++, bookingTO.getStatus());
            pstmt.setString(index++, bookingTO.getRemark());
            pstmt.setString(index++, bookingTO.getCode_booking());
            rs = pstmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DbUtils.closeQuietly(conn, pstmt);
        }
        return (rs > 0);
    }
     public int countBooking(){
         Connection conn = null;
         PreparedStatement pstmt = null;
         String sql = "SELECT COUNT(*) AS TOTAL FROM " + StaticTO.DB_BOOKING_NAME ;
         conn = getConnection();
         ResultSet rs = null;
         int count=0;

         try {
             pstmt = conn.prepareStatement(sql);

             rs = pstmt.executeQuery();
             while (rs.next()){
                 count=rs.getInt("TOTAL");
             }


         } catch (SQLException e) {
             System.out.println("countBooking++++" + pstmt.toString());
             e.printStackTrace();
         } finally {
             System.out.println("countBooking++++" + pstmt.toString());
             DbUtils.closeQuietly(rs);
         }
         return count;
     }
    // get booking mới nhất
    public BookingTO retrieveBookingLatest() {
        Connection conn = null;
        PreparedStatement pstmt = null;
        String sql = "SELECT * FROM " + StaticTO.DB_BOOKING_NAME + " ORDER BY BOOKING_ID DESC LIMIT 1";
        conn = getConnection();
        ResultSet rs = null;
        BookingTO bookingTO = null;
        try {
            pstmt = conn.prepareStatement(sql);

            rs = pstmt.executeQuery();
            Date start_booking_date = null, check_in_date = null, check_out_date = null;
            String start_booking_dateStr = "", check_in_dateStr = "", check_out_dateStr = "";
            if (rs.next()) {
                DateFormat dateFormat = new SimpleDateFormat("yyyy-mm-dd hh:mm:ss");
                if (rs.getDate("start_booking_date") != null) {
                    start_booking_date = new Date(rs.getTimestamp("start_booking_date").getTime());
                    start_booking_dateStr = dateFormat.format(start_booking_date);
                }
                if (rs.getDate("check_in_date") != null) {
                    check_in_date = new Date(rs.getTimestamp("check_in_date").getTime());
                    check_in_dateStr = dateFormat.format(check_in_date);
                }
                if (rs.getDate("check_out_date") != null) {
                    check_out_date = new Date(rs.getTimestamp("check_out_date").getTime());
                    check_out_dateStr = dateFormat.format(check_out_date);
                }
                bookingTO = new BookingTO(rs.getLong("booking_id"),
                        rs.getLong("customer_id"),
                        start_booking_dateStr,
                        check_in_dateStr,
                        check_out_dateStr,
                        rs.getInt("kind_room_id"),
                        rs.getInt("region_id"),
                        rs.getInt("room_id"),
                        rs.getString("status"),
                        rs.getString("remark"),
                        rs.getString("code_booking")
                );
            }

        } catch (SQLException e) {
            System.out.println("retrieveBookingLatest++++" + pstmt.toString());
            e.printStackTrace();
        } finally {
            System.out.println("retrieveBookingLatest++++" + pstmt.toString());
            DbUtils.closeQuietly(conn, pstmt);
        }
        return bookingTO;
    }

    // get all booking
    public ArrayList<BookingTO> retrieveAllBooking() {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ArrayList<BookingTO> listBooking = new ArrayList<BookingTO>();
        ResultSet rs = null;
        String sql = "SELECT * FROM " + StaticTO.DB_BOOKING_NAME;
        conn = getConnection();
        try {
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                Date start_booking_date = null, check_in_date = null, check_out_date = null;
                String start_booking_dateStr = "", check_in_dateStr = "", check_out_dateStr = "";
                DateFormat dateFormat = new SimpleDateFormat("yyyy-mm-dd hh:mm:ss");
                if (rs.getDate("start_booking_date") != null) {
                    start_booking_date = new Date(rs.getTimestamp("start_booking_date").getTime());
                    start_booking_dateStr = dateFormat.format(start_booking_date);
                }
                if (rs.getDate("check_in_date") != null) {
                    check_in_date = new Date(rs.getTimestamp("check_in_date").getTime());
                    check_in_dateStr = dateFormat.format(check_in_date);
                }
                if (rs.getDate("check_out_date") != null) {
                    check_out_date = new Date(rs.getTimestamp("check_out_date").getTime());
                    check_out_dateStr = dateFormat.format(check_out_date);
                }
                BookingTO bookingTO = new BookingTO(rs.getLong("booking_id"),
                        rs.getLong("customer_id"),
                        start_booking_dateStr,
                        check_in_dateStr,
                        check_out_dateStr,
                        rs.getInt("kind_room_id"),
                        rs.getInt("region_id"),
                        rs.getInt("room_id"),
                        rs.getString("status"),
                        rs.getString("remark"),
                        rs.getString("code_booking")
                );
                listBooking.add(bookingTO);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return listBooking;
    }
    // get all booking by region
    public ArrayList<BookingTO> retrieveAllBookingByRegion(int region_id,String keyword) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ArrayList<BookingTO> listBooking = new ArrayList<BookingTO>();
        ResultSet rs = null;
        String sql = "SELECT * FROM " + StaticTO.DB_BOOKING_NAME+" WHERE REGION_ID=? AND CODE_BOOKING LIKE ?";
        conn = getConnection();
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1,region_id);
            pstmt.setString(2,"%"+keyword+"%");
            rs = pstmt.executeQuery();
            while (rs.next()) {
                Date start_booking_date = null, check_in_date = null, check_out_date = null;
                String start_booking_dateStr = "", check_in_dateStr = "", check_out_dateStr = "";
                DateFormat dateFormat = new SimpleDateFormat("yyyy-mm-dd hh:mm:ss");
                if (rs.getDate("start_booking_date") != null) {
                    start_booking_date = new Date(rs.getTimestamp("start_booking_date").getTime());
                    start_booking_dateStr = dateFormat.format(start_booking_date);
                }
                if (rs.getDate("check_in_date") != null) {
                    check_in_date = new Date(rs.getTimestamp("check_in_date").getTime());
                    check_in_dateStr = dateFormat.format(check_in_date);
                }
                if (rs.getDate("check_out_date") != null) {
                    check_out_date = new Date(rs.getTimestamp("check_out_date").getTime());
                    check_out_dateStr = dateFormat.format(check_out_date);
                }
                BookingTO bookingTO = new BookingTO(rs.getLong("booking_id"),
                        rs.getLong("customer_id"),
                        start_booking_dateStr,
                        check_in_dateStr,
                        check_out_dateStr,
                        rs.getInt("kind_room_id"),
                        rs.getInt("region_id"),
                        rs.getInt("room_id"),
                        rs.getString("status"),
                        rs.getString("remark"),
                        rs.getString("code_booking")
                );
                listBooking.add(bookingTO);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return listBooking;
    }

    // thêm dữ liệu booking vs transport
    public boolean addBookingTrans(BookingTO bookingTO) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        String sql = "INSERT INTO " + StaticTO.DB_BOOKING_TRANS_NAME + " VALUES(?,?,?)";
        conn = getConnection();
        int rs = 0;
        try {
            pstmt = conn.prepareStatement(sql);
            int index = 1;
            pstmt.setLong(index++, bookingTO.getId_trans_booking());
            pstmt.setLong(index++, bookingTO.getTransport_id());
            pstmt.setLong(index++, bookingTO.getBooking_id());
            rs = pstmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DbUtils.closeQuietly(conn, pstmt);
        }
        return (rs > 0);
    }
}
