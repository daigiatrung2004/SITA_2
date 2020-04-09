package DAO;

import DTO.PaymentOrderTO;
import DTO.StaticTO;
import Utils.DbUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class PaymentOrderDA extends DAOOject {
    public boolean addPaymentOrder(PaymentOrderTO paymentOrderTO) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        String sql = "INSERT INTO " + StaticTO.DB_PAYMENT_NAME + " VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
        int rs = 0;
        conn=getConnection();
        try {

            pstmt = conn.prepareStatement(sql);
            int index=1;
            pstmt.setLong(index++,paymentOrderTO.getID());
            pstmt.setLong(index++,paymentOrderTO.getPAYEE_ID());
            pstmt.setString(index++,paymentOrderTO.getBILLING_INFO());
            pstmt.setString(index++,paymentOrderTO.getMERCHANT_ID());
            pstmt.setString(index++,paymentOrderTO.getTRANSACTION_NO());
            pstmt.setString(index++,paymentOrderTO.getTRANSACTION_DATE());
            pstmt.setInt(index++,paymentOrderTO.getRETURN_CODE());
            pstmt.setLong(index++,paymentOrderTO.getAMOUNT());
            pstmt.setString(index++,paymentOrderTO.getCURRENCY());
            pstmt.setString(index++,paymentOrderTO.getPAYPAL_TXN_ID());
            pstmt.setString(index++,paymentOrderTO.getPAYPAL_TXN_FEE());
            pstmt.setString(index++,paymentOrderTO.getPAYPAL_RECEIPT_NO());
            pstmt.setString(index++,paymentOrderTO.getREMARK());
            pstmt.setString(index++,paymentOrderTO.getSTATUS());
            pstmt.setString(index++,paymentOrderTO.getPAYEE_INFO());
            pstmt.setString(index++,paymentOrderTO.getPURCHASE_INFO());
            pstmt.setString(index++,paymentOrderTO.getGEN_MSG_KEY());
            pstmt.setString(index++,paymentOrderTO.getRETURN_MSG_KEY());
            pstmt.setString(index++,paymentOrderTO.getPAYMENT_TYPE());
            rs = pstmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return (rs > 0);
    }

    public int countPayment() {
        Connection conn = null;
        PreparedStatement pstmt = null;
        String sql = "SELECT COUNT(*) AS TOTAL FROM  " + StaticTO.DB_PAYMENT_NAME;
        int count = 0;
        ResultSet rs = null;
        conn = getConnection();
        try {
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                count = rs.getInt("TOTAL");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            DbUtils.closeQuietly(rs);
        }
        return count;

    }
}
