package DAO;

import DTO.*;
import Utils.DbUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class RoomOfALLDA extends DAOOject {
    // thêm loại phòng
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

    // update room
    public boolean updateRoom(RoomTO roomTO) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        int rs = 0;
        String sql = "UPDATE " + StaticTO.DB_ROOM_NAME + " SET "
                + "  name=? , kind_room_id=? , region_id=? , price_id=? , status=? , remark=? , max_peopel=?";
        conn = getConnection();
        try {
            pstmt = conn.prepareStatement(sql);
            int index = 1;
            pstmt.setString(index++, roomTO.getName());
            pstmt.setInt(index++, roomTO.getKind_room_id());
            pstmt.setInt(index++, roomTO.getRegion_id());
            pstmt.setInt(index++, roomTO.getPrice_id());
            pstmt.setString(index++, roomTO.getStatus());
            pstmt.setString(index++, roomTO.getRemark());
            pstmt.setInt(index, roomTO.getMax_people());
            rs = pstmt.executeUpdate();
        } catch (SQLException e) {
            System.out.println("updateRoom+++" + pstmt.toString());
            e.printStackTrace();
        } finally {
            System.out.println("updateRoom+++" + pstmt.toString());
            DbUtils.closeQuietly(conn, pstmt);
        }
        return (rs > 0);
    }

    // thêm giá trị price của room
    public boolean addPriceRoom(PriceRoomTO priceRoomTO) {
        int rs = 0;
        Connection conn = null;
        PreparedStatement pstmt = null;
        String sql = "INSERT INTO " + StaticTO.DB_PRICE_ROOM + " VALUES(?,?,?,?,?,?,?)";
        conn = getConnection();
        try {
            pstmt = conn.prepareStatement(sql);
            int index = 1;
            pstmt.setInt(index++, priceRoomTO.getPrice_id());
            pstmt.setString(index++, priceRoomTO.getType_price_room_vi());
            pstmt.setString(index++, priceRoomTO.getType_price_room_en());
            pstmt.setLong(index++, priceRoomTO.getPrice_1_night());
            pstmt.setInt(index++, priceRoomTO.getKind_room_id());
            pstmt.setString(index++, priceRoomTO.getStatus());
            pstmt.setString(index++, priceRoomTO.getRemark());
            rs = pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return (rs > 0);
    }

    //  lấy danh sách các giá
    public ArrayList<PriceRoomTO> retrieveALLPrice() {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql = "SELECT * FROM " + StaticTO.DB_PRICE_ROOM;
        ArrayList<PriceRoomTO> listPriceRoomTO = new ArrayList<PriceRoomTO>();
        conn = getConnection();
        try {
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                PriceRoomTO priceRoomTO = new PriceRoomTO(rs.getInt("price_id"),
                        rs.getString("type_price_room_vi"),
                        rs.getString("type_price_room_en"),
                        rs.getLong("price_1_night"),
                        rs.getInt("kind_room_id"),
                        rs.getString("status"),
                        rs.getString("remark")
                );
                listPriceRoomTO.add(priceRoomTO);

            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DbUtils.closeQuietly(rs);
        }

        return listPriceRoomTO;
    }

    // Lấy giá theo price_id
    public PriceRoomTO retrievePriceById(int price_id) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql = "SELECT * FROM " + StaticTO.DB_PRICE_ROOM + " WHERE PRICE_ID=? AND STATUS=? LIMIT 1";
        PriceRoomTO priceRoomTO = null;
        conn = getConnection();
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, price_id);
            pstmt.setString(2, StaticTO.ACTIVE_STATUS);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                priceRoomTO = new PriceRoomTO(rs.getInt("price_id"),
                        rs.getString("type_price_room_vi"),
                        rs.getString("type_price_room_en"),
                        rs.getLong("price_1_night"),
                        rs.getInt("kind_room_id"),
                        rs.getString("status"),
                        rs.getString("remark")
                );


            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DbUtils.closeQuietly(rs);
        }

        return priceRoomTO;
    }

    // SEARCH LOAI GIA THEO KHU VUC VA LOAI PHONG
    public ArrayList<PriceRoomTO> retrievePrice(int kind_room_id, int region_ID) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql = "SELECT P.* FROM " + StaticTO.DB_PRICE_ROOM + " P "
                + " INNER JOIN " + StaticTO.DB_ROOM_NAME + " R ON R.KIND_ROOM_ID=P.KIND_ROOM_ID "
                + "WHERE R.KIND_ROOM_ID=? AND R.REGION_ID=? AND R.STATUS=?";
        ArrayList<PriceRoomTO> listPriceRoomTO = new ArrayList<PriceRoomTO>();
        conn = getConnection();
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, kind_room_id);
            pstmt.setInt(2, region_ID);
            pstmt.setString(3, StaticTO.ACTIVE_STATUS);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                PriceRoomTO priceRoomTO = new PriceRoomTO(rs.getInt("price_id"),
                        rs.getString("type_price_room_vi"),
                        rs.getString("type_price_room_en"),
                        rs.getLong("price_1_night"),
                        rs.getInt("kind_room_id"),
                        rs.getString("status"),
                        rs.getString("remark")
                );
                listPriceRoomTO.add(priceRoomTO);

            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DbUtils.closeQuietly(rs);
        }

        return listPriceRoomTO;
    }

    // lấy tất cả các loại phòng
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

    //get kind room by id
    public KindRoomTO retrieveKindRoomById(int kind_room_id) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql = "SELECT * FROM " + StaticTO.DB_KIND_ROOM_NAME + " WHERE KIND_ROOM_ID=? AND STATUS=?";
        KindRoomTO kindRoomTO = null;
        conn = getConnection();
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, kind_room_id);
            pstmt.setString(2, StaticTO.ACTIVE_STATUS);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                kindRoomTO = new KindRoomTO(rs.getInt("kind_room_id"),
                        rs.getString("name_vi"),
                        rs.getString("name_en"),
                        rs.getString("status"),
                        rs.getString("remark")
                );


            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DbUtils.closeQuietly(rs);
        }

        return kindRoomTO;
    }

    // thêm phòng
    public boolean addRoom(RoomTO roomTO) {
        int rs = 0;
        Connection conn = null;
        PreparedStatement pstmt = null;
        String sql = "INSERT INTO " + StaticTO.DB_ROOM_NAME + "  VALUES(?,?,?,?,?,?,?,?)";
        conn = getConnection();
        try {
            pstmt = conn.prepareStatement(sql);
            int index = 1;
            pstmt.setInt(index++, roomTO.getRoom_id());
            pstmt.setString(index++, roomTO.getName());
            pstmt.setInt(index++, roomTO.getKind_room_id());
            pstmt.setInt(index++, roomTO.getRegion_id());
            pstmt.setInt(index++, roomTO.getPrice_id());
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

    // đếm số phòng  còn chống dựa vào check out
    public int countRoom(int location, int kind_room_price, int numOfPeo) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        int count = 0;


        String sql = " SELECT COUNT(*) AS TOTAL FROM " + StaticTO.DB_REGION_NAME + " RG  "
                + " INNER JOIN " + StaticTO.DB_ROOM_NAME + " R ON RG.REGION_ID=R.REGION_ID "
                + " INNER JOIN " + StaticTO.DB_KIND_ROOM_NAME + " KR ON KR.KIND_ROOM_ID=R.KIND_ROOM_ID  "
                + " WHERE RG.REGION_ID=? AND R.STATUS=?  AND R.MAX_PEOPEL>=? AND R.KIND_ROOM_ID=?   ";
        conn = getConnection();
        try {
//            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//            Date date1 = df.parse(checkOut);
            pstmt = conn.prepareStatement(sql);
            int index = 1;
            pstmt.setInt(index++, location);
            pstmt.setString(index++, StaticTO.ACTIVE_STATUS);

//            pstmt.setString(index++,date1.toString());
            pstmt.setInt(index++, numOfPeo);
            pstmt.setInt(index++, kind_room_price);
//            pstmt.setInt(index++,price_id);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                count = rs.getInt("TOTAL");
            }

        } catch (SQLException e) {
            System.out.println("++++++SearchBooking" + pstmt.toString());
            e.printStackTrace();
        } finally {
            System.out.println("++++++SearchBooking" + pstmt.toString());
            DbUtils.closeQuietly(rs);
        }

        return count;
    }

    public ArrayList<RoomTO> searchRoom(int location, int numOfPeo) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        ArrayList<RoomTO> listSearchTO = new ArrayList<RoomTO>();


        String sql = " SELECT R.* FROM " + StaticTO.DB_REGION_NAME + " RG  "
                + " INNER JOIN " + StaticTO.DB_ROOM_NAME + " R ON RG.REGION_ID=R.REGION_ID "
                + " INNER JOIN " + StaticTO.DB_KIND_ROOM_NAME + " KR ON KR.KIND_ROOM_ID=R.KIND_ROOM_ID  "
                + " WHERE RG.REGION_ID=? AND R.STATUS=?  AND R.MAX_PEOPEL>=? GROUP BY R.ROOM_ID ";
        conn = getConnection();
        try {
//            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//            Date date1 = df.parse(checkOut);
            pstmt = conn.prepareStatement(sql);
            int index = 1;
            pstmt.setInt(index++, location);
            pstmt.setString(index++, StaticTO.ACTIVE_STATUS);
//            pstmt.setString(index++,date1.toString());
            pstmt.setInt(index++, numOfPeo);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                RoomTO roomTO = new RoomTO(rs.getInt("room_id"),
                        rs.getString("name"),
                        rs.getInt("kind_room_id"),
                        rs.getInt("region_id"),
                        rs.getInt("price_id"),
                        rs.getString("status"),
                        rs.getString("remark"),
                        rs.getInt("max_peopel")
                );

                listSearchTO.add(roomTO);
            }
        } catch (SQLException e) {
            System.out.println("++++++searchRoom" + pstmt.toString());
            e.printStackTrace();
        } finally {
            System.out.println("++++++searchRoom" + pstmt.toString());
            DbUtils.closeQuietly(rs);
        }
        return listSearchTO;

    }

    public RoomTO searchRoomById(int room_id) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        RoomTO roomTO = null;


        String sql = "SELECT * FROM " + StaticTO.DB_ROOM_NAME + " WHERE ROOM_ID=?";
        conn = getConnection();
        try {
//            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//            Date date1 = df.parse(checkOut);
            pstmt = conn.prepareStatement(sql);
            int index = 1;
            pstmt.setInt(index++, room_id);
//            pstmt.setString(index++, StaticTO.ACTIVE_STATUS);
//            pstmt.setString(index++,date1.toString());

            rs = pstmt.executeQuery();
            while (rs.next()) {
                roomTO = new RoomTO(rs.getInt("room_id"),
                        rs.getString("name"),
                        rs.getInt("kind_room_id"),
                        rs.getInt("price_id"),
                        rs.getInt("region_id"),
                        rs.getString("status"),
                        rs.getString("remark"),
                        rs.getInt("max_peopel")
                );


            }
        } catch (SQLException e) {
            System.out.println("++++++searchRoom" + pstmt.toString());
            e.printStackTrace();
        } finally {
            System.out.println("++++++searchRoom" + pstmt.toString());
            DbUtils.closeQuietly(rs);
        }
        return roomTO;

    }
    // tìm tất cả các phòng theo khu vuc
    public  ArrayList<RoomTO> retrieveRoomByRegionId(int region_id){
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        RoomTO roomTO = null;

        ArrayList<RoomTO> listRoomTO=new ArrayList<RoomTO>();
        String sql = "SELECT * FROM " + StaticTO.DB_ROOM_NAME + " WHERE REGION_ID=?";
        conn = getConnection();
        try {
//            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//            Date date1 = df.parse(checkOut);
            pstmt = conn.prepareStatement(sql);
            int index = 1;
            pstmt.setInt(index++, region_id);
//            pstmt.setString(index++, StaticTO.ACTIVE_STATUS);
//            pstmt.setString(index++,date1.toString());

            rs = pstmt.executeQuery();
            while (rs.next()) {
                roomTO = new RoomTO(rs.getInt("room_id"),
                        rs.getString("name"),
                        rs.getInt("kind_room_id"),
                        rs.getInt("region_id"),
                        rs.getInt("price_id"),
                        rs.getString("status"),
                        rs.getString("remark"),
                        rs.getInt("max_peopel")
                );

                listRoomTO.add(roomTO);
            }
        } catch (SQLException e) {
            System.out.println("++++++searchRoom" + pstmt.toString());
            e.printStackTrace();
        } finally {
            System.out.println("++++++searchRoom" + pstmt.toString());
            DbUtils.closeQuietly(rs);
        }
        return listRoomTO;
    }

    // thêm furniture
    public boolean addfurniture(FurnitureTO furnitureTO) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        int rs = 0;
        String sql = "INSERT INTO " + StaticTO.DB_FURNITURE_NAME + " VALUES(?,?,?,?,?,?,?,?,?)";
        conn = getConnection();
        try {
            pstmt = conn.prepareStatement(sql);
            int index = 1;
            pstmt.setInt(index++, furnitureTO.getId_furniture());
            pstmt.setString(index++, furnitureTO.getName_vi());
            pstmt.setString(index++, furnitureTO.getName_en());
            pstmt.setString(index++, furnitureTO.getType());
            pstmt.setLong(index++, furnitureTO.getPrice());
            pstmt.setString(index++, furnitureTO.getDetails());
            pstmt.setString(index++, furnitureTO.getStatus());
            pstmt.setString(index++, furnitureTO.getRemark());
            pstmt.setString(index++, furnitureTO.getType_en());
            rs = pstmt.executeUpdate();
        } catch (SQLException e) {
            System.out.println("addfurniture" + pstmt.toString());
            e.printStackTrace();
        } finally {
            System.out.println("addfurniture" + pstmt.toString());
            DbUtils.closeQuietly(conn, pstmt);
        }
        return (rs > 0);
    }

    // Danh sách các thiết bị
    public ArrayList<FurnitureTO> listFurnitureAll() {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ArrayList<FurnitureTO> listFurniture = new ArrayList<FurnitureTO>();
        String sql = "SELECT * FROM " + StaticTO.DB_FURNITURE_NAME;
        ResultSet rs = null;
        conn = getConnection();
        try {
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            while(rs.next()) {
                FurnitureTO furnitureTO = new FurnitureTO(rs.getInt("id_furniture"),
                        rs.getString("name_vi"),
                        rs.getString("name_en"),
                        rs.getString("type"),
                        rs.getLong("price"),
                        rs.getString("details"),
                        rs.getString("status"),
                        rs.getString("remark"),
                        rs.getString("type_en")
                );
                listFurniture.add(furnitureTO);
            }
        } catch (SQLException e) {
            System.out.println("listFurnitureAll:" + pstmt.toString());
            e.printStackTrace();
        } finally {
            System.out.println("listFurnitureAll:" + pstmt.toString());
            DbUtils.closeQuietly(rs);
        }
        return listFurniture;
    }
    // retrieve furniture type giường
//    public ArrayList<FurnitureTO> listFurnitureAll() {
//        Connection conn = null;
//        PreparedStatement pstmt = null;
//        ArrayList<FurnitureTO> listFurniture = new ArrayList<FurnitureTO>();
//        String sql = "SELECT * FROM " + StaticTO.DB_FURNITURE_NAME ;
//        ResultSet rs = null;
//        conn = getConnection();
//        try {
//            pstmt = conn.prepareStatement(sql);
//            rs = pstmt.executeQuery();
//            while(rs.next()) {
//                FurnitureTO furnitureTO = new FurnitureTO(rs.getInt("id_furniture"),
//                        rs.getString("name_vi"),
//                        rs.getString("name_en"),
//                        rs.getString("type"),
//                        rs.getLong("price"),
//                        rs.getString("details"),
//                        rs.getString("status"),
//                        rs.getString("remark"),
//                        rs.getString("type_en")
//                );
//                listFurniture.add(furnitureTO);
//            }
//        } catch (SQLException e) {
//            System.out.println("listFurnitureAll:" + pstmt.toString());
//            e.printStackTrace();
//        } finally {
//            System.out.println("listFurnitureAll:" + pstmt.toString());
//            DbUtils.closeQuietly(rs);
//        }
//        return listFurniture;
//    }
    //Thêm dữ liệu furniture room
    public boolean addfurnitureKindRoom(FurnitureTO furnitureTO) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        int rs = 0;
        String sql = "INSERT INTO " + StaticTO.DB_FURNITURE_ROOM_NAME + " VALUES(?,?,?,?)";
        conn = getConnection();
        try {
            pstmt = conn.prepareStatement(sql);
            int index = 1;
            pstmt.setInt(index++, furnitureTO.getId_furniture_room());
            pstmt.setInt(index++, furnitureTO.getId_furniture());
            pstmt.setInt(index++, furnitureTO.getKind_room_id());
            pstmt.setString(index++, furnitureTO.getStatus());

            rs = pstmt.executeUpdate();
        } catch (SQLException e) {
            System.out.println("addfurniture" + pstmt.toString());
            e.printStackTrace();
        } finally {
            System.out.println("addfurniture" + pstmt.toString());
            DbUtils.closeQuietly(conn, pstmt);
        }
        return (rs > 0);
    }


}
