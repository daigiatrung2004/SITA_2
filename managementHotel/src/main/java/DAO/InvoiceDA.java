package DAO;

import DTO.InvoiceTO;
import DTO.StaticTO;
import Utils.DbUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class InvoiceDA extends DAOOject{
    public boolean addInvoice(InvoiceTO invoiceTO){
        Connection conn=null;
        PreparedStatement pstmt=null;
        int rs=0;
        String sql="INSERT INTO "+ StaticTO.DB_INVOICE_NAME+" VALUES(?,?,?,?,?,?,?) ";

        conn=getConnection();
        try {
            pstmt=conn.prepareStatement(sql);
            int index=1;
            pstmt.setLong(index++,invoiceTO.getInvoice_id());
            pstmt.setLong(index++,invoiceTO.getBooking_id());
            pstmt.setLong(index++,invoiceTO.getCustomer_id());
            pstmt.setInt(index++,invoiceTO.getRoom_id());
            pstmt.setLong(index++,invoiceTO.getTongtiensanpham());
            pstmt.setLong(index++,invoiceTO.getTongtien());
            pstmt.setString(index++,invoiceTO.getRemark());
            rs=pstmt.executeUpdate();

        } catch (SQLException e) {
            System.out.println("++++addInvoice"+pstmt.toString());
            e.printStackTrace();
        }finally {
            System.out.println("++++addInvoice"+pstmt.toString());
            DbUtils.closeQuietly(conn,pstmt);
        }


        return (rs>0);
    }
}

