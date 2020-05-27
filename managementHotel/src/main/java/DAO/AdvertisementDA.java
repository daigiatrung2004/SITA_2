package DAO;

import DTO.AdvertisementTO;
import DTO.StaticTO;
import Utils.DbUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

public class AdvertisementDA extends DAOOject {
    public boolean addPackage(AdvertisementTO advertisementTO) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        String sql = "INSERT INTO " + StaticTO.DB_PACKAGE + " VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
        conn = getConnection();
        int rs = 0;
        try {
            pstmt = conn.prepareStatement(sql);
            int index = 1;
            pstmt.setLong(index++, advertisementTO.getID());
            pstmt.setString(index++, advertisementTO.getTITLE());
            pstmt.setString(index++, advertisementTO.getSHORT_DESCRIPTION());
            pstmt.setString(index++, advertisementTO.getFILE_URL_IMG());
            pstmt.setString(index++, advertisementTO.getSTART_DATE());
            pstmt.setString(index++, advertisementTO.getEND_DATE());
            pstmt.setInt(index++, advertisementTO.getRegion_id());
            pstmt.setString(index++, advertisementTO.getREMARK());
            pstmt.setString(index++, advertisementTO.getSTATUS());
            pstmt.setInt(index++, advertisementTO.getPromote_id());
            pstmt.setString(index++, advertisementTO.getDESCRIPTION());
            pstmt.setString(index++, advertisementTO.getTILTLE_EN());
            pstmt.setString(index++, advertisementTO.getDESCRIPTION_EN());
            pstmt.setString(index++, advertisementTO.getSHORT_DESCRIPTION_EN());
            rs = pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DbUtils.closeQuietly(conn, pstmt);
        }
        return (rs > 0);
    }
    public boolean updatePackage(AdvertisementTO advertisementTO) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        String sql = "UPDATE " + StaticTO.DB_PACKAGE + " SET TITLE=?,SHORT_DESCRIPTION=?,FILE_URL_IMG=?,START_DATE=?,END_DATE=?,region_id=?,REMARK=?,STATUS=?,promote_id=?,DESCRIPTION=?,TILTLE_EN=?,DESCRIPTION_EN=?,SHORT_DESCRIPTION_EN=? WHERE ID=?";
        conn = getConnection();
        int rs = 0;
        try {
            pstmt = conn.prepareStatement(sql);
            int index = 1;

            pstmt.setString(index++, advertisementTO.getTITLE());
            pstmt.setString(index++, advertisementTO.getSHORT_DESCRIPTION());
            pstmt.setString(index++, advertisementTO.getFILE_URL_IMG());
            pstmt.setString(index++, advertisementTO.getSTART_DATE());
            pstmt.setString(index++, advertisementTO.getEND_DATE());
            pstmt.setInt(index++, advertisementTO.getRegion_id());
            pstmt.setString(index++, advertisementTO.getREMARK());
            pstmt.setString(index++, advertisementTO.getSTATUS());
            pstmt.setInt(index++, advertisementTO.getPromote_id());
            pstmt.setString(index++, advertisementTO.getDESCRIPTION());
            pstmt.setString(index++, advertisementTO.getTILTLE_EN());
            pstmt.setString(index++, advertisementTO.getDESCRIPTION_EN());
            pstmt.setString(index++, advertisementTO.getSHORT_DESCRIPTION_EN());
            pstmt.setLong(index++, advertisementTO.getID());
            rs = pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            System.out.println("updatePackage++++"+pstmt.toString());
            DbUtils.closeQuietly(conn, pstmt);
        }
        return (rs > 0);
    }
    // danh sach tất cả các package
    public ArrayList<AdvertisementTO> retrieveAllPackage() {
        Connection conn = null;
        PreparedStatement pstmt = null;
        String sql = "SELECT * FROM " + StaticTO.DB_PACKAGE;
        ArrayList<AdvertisementTO> listAdvertisement = new ArrayList<AdvertisementTO>();
        conn = getConnection();
        ResultSet rs = null;
        try {
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                Date enddate, startdate;
                String endateStr = "", startdatestr = "";
                DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
                if (rs.getTimestamp("START_DATE") != null) {
                    startdate = new Date(rs.getTimestamp("START_DATE").getTime());
                    startdatestr = dateFormat.format(startdate);
                }
                if (rs.getTimestamp("END_DATE") != null) {
                    enddate = new Date(rs.getTimestamp("END_DATE").getTime());
                    endateStr = dateFormat.format(enddate);
                }
                AdvertisementTO advertisementTO = new AdvertisementTO(rs.getLong("ID"),
                        rs.getString("TITLE"),
                        rs.getString("SHORT_DESCRIPTION"),
                        rs.getString("FILE_URL_IMG"),
                        startdatestr,
                        endateStr,
                        rs.getInt("region_id"),
                        rs.getString("REMARK"),
                        rs.getString("REMARK"),
                        rs.getInt("promote_id"),
                        rs.getString("DESCRIPTION"),
                        rs.getString("TILTLE_EN"),
                        rs.getString("DESCRIPTION_EN"),
                        rs.getString("SHORT_DESCRIPTION_EN")
                );
                listAdvertisement.add(advertisementTO);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DbUtils.closeQuietly(rs);
        }
        return listAdvertisement;
    }

    // advertisementDA
    // danh sach tất cả các package
    public ArrayList<AdvertisementTO> retrieveAllTop3() {
        Connection conn = null;
        PreparedStatement pstmt = null;
        String sql = "SELECT * FROM " + StaticTO.DB_PACKAGE + " ORDER BY start_date desc limit 3";
        ArrayList<AdvertisementTO> listAdvertisement = new ArrayList<AdvertisementTO>();
        conn = getConnection();
        ResultSet rs = null;
        try {
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                Date enddate, startdate;
                String endateStr = "", startdatestr = "";
                DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
                if (rs.getTimestamp("START_DATE") != null) {
                    startdate = new Date(rs.getTimestamp("START_DATE").getTime());
                    startdatestr = dateFormat.format(startdate);
                }
                if (rs.getTimestamp("END_DATE") != null) {
                    enddate = new Date(rs.getTimestamp("END_DATE").getTime());
                    endateStr = dateFormat.format(enddate);
                }
                AdvertisementTO advertisementTO = new AdvertisementTO(rs.getLong("ID"),
                        rs.getString("TITLE"),
                        rs.getString("SHORT_DESCRIPTION"),
                        rs.getString("FILE_URL_IMG"),
                        startdatestr,
                        endateStr,
                        rs.getInt("region_id"),
                        rs.getString("REMARK"),
                        rs.getString("REMARK"),
                        rs.getInt("promote_id"),
                        rs.getString("DESCRIPTION"),
                        rs.getString("TILTLE_EN"),
                        rs.getString("DESCRIPTION_EN"),
                        rs.getString("SHORT_DESCRIPTION_EN")

                );
                listAdvertisement.add(advertisementTO);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DbUtils.closeQuietly(rs);
        }
        return listAdvertisement;
    }


    // search  advertisement by region id
    public ArrayList<AdvertisementTO> retrievePackageByRegionId(int regionid) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        String sql = "SELECT * FROM " + StaticTO.DB_PACKAGE + " WHERE REGION_ID=? AND STATUS=?";
        ArrayList<AdvertisementTO> listAdvertisemntTO = new ArrayList<AdvertisementTO>();

        conn = getConnection();
        ResultSet rs = null;
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, regionid);
            pstmt.setString(2,StaticTO.ACTIVE_STATUS);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                Date enddate, startdate;
                String endateStr = "", startdatestr = "";
                DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
                if (rs.getTimestamp("START_DATE") != null) {
                    startdate = new Date(rs.getTimestamp("START_DATE").getTime());
                    startdatestr = dateFormat.format(startdate);
                }
                if (rs.getTimestamp("END_DATE") != null) {
                    enddate = new Date(rs.getTimestamp("END_DATE").getTime());
                    endateStr = dateFormat.format(enddate);
                }
                AdvertisementTO advertisementTO = new AdvertisementTO(rs.getLong("ID"),
                        rs.getString("TITLE"),
                        rs.getString("SHORT_DESCRIPTION"),
                        rs.getString("FILE_URL_IMG"),
                        startdatestr,
                        endateStr,
                        rs.getInt("region_id"),
                        rs.getString("REMARK"),
                        rs.getString("STATUS"),
                        rs.getInt("promote_id"),
                        rs.getString("DESCRIPTION"),
                        rs.getString("TILTLE_EN"),
                        rs.getString("DESCRIPTION_EN"),
                        rs.getString("SHORT_DESCRIPTION_EN")
                );
                listAdvertisemntTO.add(advertisementTO);

            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DbUtils.closeQuietly(rs);
        }
        return listAdvertisemntTO;
    }

    // search Advertisement by id
    public AdvertisementTO retrievePackageById(long ID) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        String sql = "SELECT * FROM " + StaticTO.DB_PACKAGE + " WHERE ID=?";
        AdvertisementTO advertisementTO = null;
        conn = getConnection();
        ResultSet rs = null;
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setLong(1, ID);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                Date enddate, startdate;
                String endateStr = "", startdatestr = "";
                DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
                if (rs.getTimestamp("START_DATE") != null) {
                    startdate = new Date(rs.getTimestamp("START_DATE").getTime());
                    startdatestr = dateFormat.format(startdate);
                }
                if (rs.getTimestamp("END_DATE") != null) {
                    enddate = new Date(rs.getTimestamp("END_DATE").getTime());
                    endateStr = dateFormat.format(enddate);
                }
                advertisementTO = new AdvertisementTO(rs.getLong("ID"),
                        rs.getString("TITLE"),
                        rs.getString("SHORT_DESCRIPTION"),
                        rs.getString("FILE_URL_IMG"),
                        startdatestr,
                        endateStr,
                        rs.getInt("region_id"),
                        rs.getString("REMARK"),
                        rs.getString("REMARK"),
                        rs.getInt("promote_id"),
                        rs.getString("DESCRIPTION"),
                        rs.getString("TILTLE_EN"),
                        rs.getString("DESCRIPTION_EN"),
                        rs.getString("SHORT_DESCRIPTION_EN")
                );

            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DbUtils.closeQuietly(rs);
        }
        return advertisementTO;
    }

    // lay tat cac package khac khong phai package truyen vao
    public ArrayList<AdvertisementTO> retrieveAllNotPackageNow(long ID, int regionid) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        String sql = "SELECT * FROM " + StaticTO.DB_PACKAGE + " WHERE ID NOT LIKE ? AND region_id=? AND STATUS=?";
        ArrayList<AdvertisementTO> listAdvertisement = new ArrayList<AdvertisementTO>();
        conn = getConnection();
        ResultSet rs = null;
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setLong(1, ID);
            pstmt.setInt(2, regionid);
            pstmt.setString(3,StaticTO.ACTIVE_STATUS);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                Date enddate, startdate;
                String endateStr = "", startdatestr = "";
                DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
                if (rs.getTimestamp("START_DATE") != null) {
                    startdate = new Date(rs.getTimestamp("START_DATE").getTime());
                    startdatestr = dateFormat.format(startdate);
                }
                if (rs.getTimestamp("END_DATE") != null) {
                    enddate = new Date(rs.getTimestamp("END_DATE").getTime());
                    endateStr = dateFormat.format(enddate);
                }
                AdvertisementTO advertisementTO = new AdvertisementTO(rs.getLong("ID"),
                        rs.getString("TITLE"),
                        rs.getString("SHORT_DESCRIPTION"),
                        rs.getString("FILE_URL_IMG"),
                        startdatestr,
                        endateStr,
                        rs.getInt("region_id"),
                        rs.getString("REMARK"),
                        rs.getString("REMARK"),
                        rs.getInt("promote_id"),
                        rs.getString("DESCRIPTION"), rs.getString("TILTLE_EN"),
                        rs.getString("DESCRIPTION_EN"),
                        rs.getString("SHORT_DESCRIPTION_EN")
                );
                listAdvertisement.add(advertisementTO);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DbUtils.closeQuietly(rs);
        }
        return listAdvertisement;
    }
}
