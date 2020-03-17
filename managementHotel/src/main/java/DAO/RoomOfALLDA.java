package DAO;

import DTO.KindRoomTO;
import DTO.PriceRoomTO;
import DTO.RoomTO;
import DTO.StaticTO;
import Utils.DbUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class RoomOfALLDA extends DAOOject {
    public boolean addKindRoom(KindRoomTO kindRoomTO) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        String sql = "INSERT INTO " + StaticTO.DB_KIND_ROOM_NAME + " VALUES(?,?,?,?,?)";
        conn = getConnection();
        int rs = 0;
        try {
            pstmt = conn.prepareStatement(sql);
            int index = 1;
            pstmt.setInt(index++, kindRoomTO.getKindroom_id());
            pstmt.setString(index++, kindRoomTO.getName_vi());
            pstmt.setString(index++, kindRoomTO.getName_en());
            pstmt.setString(index++, StaticTO.ACTIVE_STATUS);
            pstmt.setString(index++, kindRoomTO.getRemark());
            rs = pstmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DbUtils.closeQuietly(conn, pstmt);
        }
        return (rs > 0);
    }

    public boolean addPriceRoom(PriceRoomTO priceRoomTO) {
        int rs=0;
        Connection conn=null;
        PreparedStatement pstmt=null;
        String sql="INSERT INTO "+StaticTO.DB_PRICE_ROOM+" VALUES(?,?,?,?,?,?,?)";
        conn=getConnection();
        try {
            pstmt=conn.prepareStatement(sql);
            int index=1;
            pstmt.setInt(index++,priceRoomTO.getPrice_id());
            pstmt.setString(index++,priceRoomTO.getType_price_room_vi());
            pstmt.setString(index++,priceRoomTO.getType_price_room_en());
            pstmt.setLong(index++,priceRoomTO.getPrice_1_night());
            pstmt.setInt(index++,priceRoomTO.getKind_room_id());
            pstmt.setString(index++,priceRoomTO.getStatus());
            pstmt.setString(index++,priceRoomTO.getRemark());
            rs=pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return (rs>0);
    }

    public ArrayList<KindRoomTO> retrieveALLKindRoom() {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql = "SELECT * FROM " + StaticTO.DB_KIND_ROOM_NAME;
        ArrayList<KindRoomTO> listKindRoomTO = new ArrayList<KindRoomTO>();
        conn = getConnection();
        try {
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                KindRoomTO kindRoomTO = new KindRoomTO(rs.getInt("kind_room_id"),
                        rs.getString("name_vi"),
                        rs.getString("name_en"),
                        rs.getString("status"),
                        rs.getString("remark")
                );
                listKindRoomTO.add(kindRoomTO);

            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DbUtils.closeQuietly(rs);
        }

        return listKindRoomTO;
    }

    public boolean addRoom(RoomTO roomTO) {
        int rs = 0;
        Connection conn = null;
        PreparedStatement pstmt = null;
        String sql = "INSERT INTO " + StaticTO.DB_ROOM_NAME + "  VALUES(?,?,?,?,?,?,?)";
        conn = getConnection();
        try {
            pstmt = conn.prepareStatement(sql);
            int index = 1;
            pstmt.setInt(index++, roomTO.getRoom_id());
            pstmt.setString(index++, roomTO.getName());
            pstmt.setInt(index++, roomTO.getKind_room_id());
            pstmt.setInt(index++, roomTO.getRegion_id());
            pstmt.setString(index++, roomTO.getStatus());
            pstmt.setString(index++, roomTO.getRemark());
            pstmt.setInt(index++, roomTO.getMax_people());
            rs = pstmt.executeUpdate();

        } catch (SQLException e) {
            System.out.println("+++++" + pstmt.toString());
            e.printStackTrace();
        } finally {
            System.out.println("+++++" + pstmt.toString());
            DbUtils.closeQuietly(conn, pstmt);
        }
        return (rs > 0);
    }
}
