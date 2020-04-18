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
    public ArrayList<SearchTO> searchBooking(int location, int numOfPeo) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        ArrayList<SearchTO> listSearchTO = new ArrayList<SearchTO>();


        String sql = " SELECT RG.*,KR.* FROM " + StaticTO.DB_REGION_NAME + " RG  "
                + " INNER JOIN " + StaticTO.DB_ROOM_NAME + " R ON RG.REGION_ID=R.REGION_ID "
                + " INNER JOIN " + StaticTO.DB_KIND_ROOM_NAME + " KR ON KR.KIND_ROOM_ID=R.KIND_ROOM_ID  "
                + " WHERE RG.REGION_ID=? AND (R.STATUS=? OR R.STATUS=?)  AND R.MAX_PEOPEL>=? GROUP BY R.KIND_ROOM_ID ";
        conn = getConnection();
        try {
//            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//            Date date1 = df.parse(checkOut);
            pstmt = conn.prepareStatement(sql);
            int index = 1;
            pstmt.setInt(index++, location);
            pstmt.setString(index++, StaticTO.ACTIVE_STATUS);
            pstmt.setString(index++, StaticTO.BOOKED_STATUS);
//            pstmt.setString(index++,date1.toString());
            pstmt.setInt(index++, numOfPeo);
            rs = pstmt.executeQuery();
            while (rs.next()) {
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
