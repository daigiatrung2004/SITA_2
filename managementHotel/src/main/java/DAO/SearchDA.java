package DAO;

import DTO.*;
import Utils.DbUtils;

import javax.xml.transform.Result;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

public class SearchDA extends DAOOject {
    public ArrayList<SearchTO> searchBookingActive(int location, int numOfPeo,String checkin) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        ArrayList<SearchTO> listSearchTO = new ArrayList<SearchTO>();


        String sql = " SELECT RG.*,KR.*,b.*,R.STATUS AS STATUS_ROOM FROM " + StaticTO.DB_REGION_NAME + " RG  "
                + " INNER JOIN " + StaticTO.DB_ROOM_NAME + " R ON RG.REGION_ID=R.REGION_ID "
                + " INNER JOIN " + StaticTO.DB_KIND_ROOM_NAME + " KR ON KR.KIND_ROOM_ID=R.KIND_ROOM_ID  "
                +"left join  booking b on (b.room_id=R.room_id and b.check_out_date>=?) "
                + " WHERE RG.REGION_ID=? AND (R.STATUS=? )  AND R.MAX_PEOPEL>=? GROUP BY KR.KIND_ROOM_ID  ";
        conn = getConnection();
        try {
//            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//            Date date1 = df.parse(checkOut);
            pstmt = conn.prepareStatement(sql);
            int index = 1;
            pstmt.setString(index++,checkin);
            pstmt.setInt(index++, location);

            pstmt.setString(index++, StaticTO.ACTIVE_STATUS);

//            pstmt.setString(index++,date1.toString());
            pstmt.setInt(index++, numOfPeo);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                if(rs.getString("booking_id")!=null&&(!rs.getString("STATUS_ROOM").equals(StaticTO.ACTIVE_STATUS))){
                    // khác null thì nó sẽ đụng độ
                }else {
                    RegionTO regionTO = new RegionTO(rs.getInt("region_id"),
                            rs.getString("name_vi"),
                            rs.getString("name_en"),
                            rs.getString("status"),
                            rs.getString("remark")
                    );
                    KindRoomTO kindRoomTO = new KindRoomTO(rs.getInt("kind_room_id"),
                            rs.getString("name_vi"),
                            rs.getString("name_en"),
                            rs.getString("status"),
                            rs.getString("remark")

                    );
                    SearchTO searchTO = new SearchTO(kindRoomTO, regionTO);
                    listSearchTO.add(searchTO);
                }
            }
            // tim phong active
        } catch (SQLException e) {
            System.out.println("++++++SearchBooking" + pstmt.toString());
            e.printStackTrace();
        } finally {
            System.out.println("++++++SearchBooking" + pstmt.toString());
            DbUtils.closeQuietly(rs);
        }
        return listSearchTO;

    }
    public ArrayList<SearchTO> searchBooking(int location, int numOfPeo,String checkin) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        ArrayList<SearchTO> listSearchTO = new ArrayList<SearchTO>();


        String sql = " SELECT RG.*,KR.kind_room_id,KR.name_vi as KR_NAME_VI,KR.name_en AS KR_NAME_EN,KR.status AS KR_STATUS,KR.remark AS KR_REMARK,b.*,R.STATUS AS STATUS_ROOM FROM " + StaticTO.DB_REGION_NAME + " RG  "
                + " INNER JOIN " + StaticTO.DB_ROOM_NAME + " R ON RG.REGION_ID=R.REGION_ID "
                + " INNER JOIN " + StaticTO.DB_KIND_ROOM_NAME + " KR ON KR.KIND_ROOM_ID=R.KIND_ROOM_ID  "
                +"left join  booking b on (b.room_id=R.room_id and b.check_out_date>=?) "
                + " WHERE RG.REGION_ID=? AND (R.STATUS=? OR R.STATUS=?)  AND R.MAX_PEOPEL>=? GROUP BY KR.KIND_ROOM_ID  ";
        conn = getConnection();
        try {
//            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//            Date date1 = df.parse(checkOut);
            pstmt = conn.prepareStatement(sql);
            int index = 1;
            pstmt.setString(index++,checkin);
            pstmt.setInt(index++, location);

            pstmt.setString(index++, StaticTO.ACTIVE_STATUS);
            pstmt.setString(index++, StaticTO.BOOKED_STATUS);
//            pstmt.setString(index++,date1.toString());
            pstmt.setInt(index++, numOfPeo);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                if(rs.getString("booking_id")!=null&&(!rs.getString("STATUS_ROOM").equals(StaticTO.ACTIVE_STATUS))){
                    // khác null thì nó sẽ đụng độ
                }else {
                    RegionTO regionTO = new RegionTO(rs.getInt("region_id"),
                            rs.getString("name_vi"),
                            rs.getString("name_en"),
                            rs.getString("status"),
                            rs.getString("remark")
                    );
                    KindRoomTO kindRoomTO = new KindRoomTO(rs.getInt("kind_room_id"),
                            rs.getString("KR_NAME_VI"),
                            rs.getString("KR_NAME_EN"),
                            rs.getString("KR_STATUS"),
                            rs.getString("KR_REMARK")

                    );
                    SearchTO searchTO = new SearchTO(kindRoomTO, regionTO);
                    listSearchTO.add(searchTO);
                }
            }
            // tim phong active
            if(listSearchTO.size()==0){
                listSearchTO=searchBookingActive(location,numOfPeo,checkin);
            }
        } catch (SQLException e) {
            System.out.println("++++++SearchBooking" + pstmt.toString());
            e.printStackTrace();
        } finally {
            System.out.println("++++++SearchBooking" + pstmt.toString());
            DbUtils.closeQuietly(rs);
        }
        return listSearchTO;

    }
    public ArrayList<SearchTO> searchBookingCount(int location, int numOfPeo,String checkin) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        ArrayList<SearchTO> listSearchTO = new ArrayList<SearchTO>();


        String sql = " SELECT RG.*,KR.*,b.*,R.STATUS AS STATUS_ROOM FROM " + StaticTO.DB_REGION_NAME + " RG  "
                + " INNER JOIN " + StaticTO.DB_ROOM_NAME + " R ON RG.REGION_ID=R.REGION_ID "
                + " INNER JOIN " + StaticTO.DB_KIND_ROOM_NAME + " KR ON KR.KIND_ROOM_ID=R.KIND_ROOM_ID  "
                +"left join  booking b on (b.room_id=R.room_id and b.check_out_date>=?) "
                + " WHERE RG.REGION_ID=? AND (R.STATUS=? OR R.STATUS=?)  AND R.MAX_PEOPEL>=?  ";
        conn = getConnection();
        try {
//            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//            Date date1 = df.parse(checkOut);
            pstmt = conn.prepareStatement(sql);
            int index = 1;
            pstmt.setString(index++,checkin);
            pstmt.setInt(index++, location);

            pstmt.setString(index++, StaticTO.ACTIVE_STATUS);
            pstmt.setString(index++, StaticTO.BOOKED_STATUS);
//            pstmt.setString(index++,date1.toString());
            pstmt.setInt(index++, numOfPeo);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                if(rs.getString("booking_id")!=null&&(!rs.getString("STATUS_ROOM").equals(StaticTO.ACTIVE_STATUS))){
                    // khác null thì nó sẽ đụng độ
                }else {
                    RegionTO regionTO = new RegionTO(rs.getInt("region_id"),
                            rs.getString("name_vi"),
                            rs.getString("name_en"),
                            rs.getString("status"),
                            rs.getString("remark")
                    );
                    KindRoomTO kindRoomTO = new KindRoomTO(rs.getInt("kind_room_id"),
                            rs.getString("name_vi"),
                            rs.getString("name_en"),
                            rs.getString("status"),
                            rs.getString("remark")

                    );
                    SearchTO searchTO = new SearchTO(kindRoomTO, regionTO);
                    listSearchTO.add(searchTO);
                }
            }
        } catch (SQLException e) {
            System.out.println("++++++SearchBooking" + pstmt.toString());
            e.printStackTrace();
        } finally {
            System.out.println("++++++SearchBooking" + pstmt.toString());
            DbUtils.closeQuietly(rs);
        }
        return listSearchTO;

    }


}
