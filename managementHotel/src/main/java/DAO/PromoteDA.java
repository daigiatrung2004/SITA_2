package DAO;

import DTO.PromoteTO;
import DTO.StaticTO;
import Utils.DbUtils;

import javax.xml.transform.Result;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class PromoteDA extends  DAOOject{
    public boolean addPromote(PromoteTO promoteTO){
        int rs=0;
        Connection conn=null;
        PreparedStatement pstmt=null;
        String sql="INSERT INTO "+ StaticTO.DB_PROMOTE_NAME+" VALUES(?,?,?,?,?,?)";
        conn=getConnection();
        try {
            pstmt=conn.prepareStatement(sql);
            int index=1;
            pstmt.setInt(index++,promoteTO.getPromte_id());
            pstmt.setString(index++,promoteTO.getPro_code());
            pstmt.setString(index++,promoteTO.getPro_value());
            pstmt.setString(index++,promoteTO.getStatus());
            pstmt.setString(index++,promoteTO.getRemark());
            pstmt.setString(index++,promoteTO.getExpired_date());
            rs=pstmt.executeUpdate();
        } catch (SQLException e) {
            System.out.println("addPromote:++++"+pstmt.toString());
            e.printStackTrace();
        }finally {
            System.out.println("addPromote:++++"+pstmt.toString());
            DbUtils.closeQuietly(conn,pstmt);
        }

        return (rs>0);
    }
    public PromoteTO retreivePromoteByPrice(int price_id){

        Connection conn=null;
        ResultSet rs=null;
        PreparedStatement pstmt=null;
        String sql="SELECT P.* FROM "+StaticTO.DB_PROMOTE_NAME+" P INNER JOIN "
                +StaticTO.DB_PROMOTE_PRICE_NAME+" PP ON PP.PROMOTE_ID=P.PROMOTE_ID "
                +" WHERE  PP.PRICE_ID=? AND P.STATUS=?"
                ;
        PromoteTO promoteTO=null;
        conn=getConnection();
        try {
            pstmt=conn.prepareStatement(sql);
            int index=1;

            pstmt.setInt(index++,price_id);
            pstmt.setString(index++,StaticTO.ACTIVE_STATUS);
            rs=pstmt.executeQuery();
            while(rs.next()){
                promoteTO=new PromoteTO(rs.getInt("promote_id"),
                        rs.getString("pro_code"),
                        rs.getString("pro_value"),
                        rs.getString("status"),
                        rs.getString("remark"),
                        rs.getString("expired_date")
                );

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            DbUtils.closeQuietly(rs);
        }
        return promoteTO;

    }
    public ArrayList<PromoteTO> retreiveAllPromote(){
        ArrayList<PromoteTO> listPromote=new ArrayList<PromoteTO>();
        Connection conn=null;
        ResultSet rs=null;
        PreparedStatement pstmt=null;
        String sql="SELECT * FROM "+StaticTO.DB_PROMOTE_NAME+" ";
        conn=getConnection();
        try {
            pstmt=conn.prepareStatement(sql);
            rs=pstmt.executeQuery();
            while(rs.next()){
                PromoteTO promoteTO=new PromoteTO(rs.getInt("promote_id"),
                        rs.getString("pro_code"),
                        rs.getString("pro_value"),
                        rs.getString("status"),
                        rs.getString("remark"),
                        rs.getString("expired_date")
                        );
                listPromote.add(promoteTO);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            DbUtils.closeQuietly(rs);
        }
        return listPromote;

    }
    public boolean addPromotePrice(PromoteTO promoteTO){
        int rs=0;
        Connection conn=null;
        PreparedStatement pstmt=null;
        String sql="INSERT INTO "+ StaticTO.DB_PROMOTE_PRICE_NAME+" VALUES(?,?,?)";
        conn=getConnection();
        try {
            pstmt=conn.prepareStatement(sql);
            int index=1;
            pstmt.setLong(index++,promoteTO.getId_promote_price());
            pstmt.setInt(index++,promoteTO.getPromte_id());
            pstmt.setInt(index++,promoteTO.getPrice_id());

            rs=pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            DbUtils.closeQuietly(conn,pstmt);
        }

        return (rs>0);
    }

}
