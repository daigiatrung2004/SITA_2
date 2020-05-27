package DTO;

public class AdvertisementTO  {
  private long ID;
  private String TITLE;
  private String SHORT_DESCRIPTION;
  private String FILE_URL_IMG;
  private String START_DATE;
  private String END_DATE;
  private int region_id;
  private String REMARK;
  private String STATUS;
  private int promote_id;
  private String DESCRIPTION;
  private String TILTLE_EN;
  private String DESCRIPTION_EN;
  private String SHORT_DESCRIPTION_EN;

    public AdvertisementTO(long ID, String TITLE, String SHORT_DESCRIPTION, String FILE_URL_IMG, String START_DATE, String END_DATE, int region_id, String REMARK, String STATUS, int promote_id, String DESCRIPTION, String TILTLE_EN, String DESCRIPTION_EN, String SHORT_DESCRIPTION_EN) {
        this.ID = ID;
        this.TITLE = TITLE;
        this.SHORT_DESCRIPTION = SHORT_DESCRIPTION;
        this.FILE_URL_IMG = FILE_URL_IMG;
        this.START_DATE = START_DATE;
        this.END_DATE = END_DATE;
        this.region_id = region_id;
        this.REMARK = REMARK;
        this.STATUS = STATUS;
        this.promote_id = promote_id;
        this.DESCRIPTION = DESCRIPTION;
        this.TILTLE_EN = TILTLE_EN;
        this.DESCRIPTION_EN = DESCRIPTION_EN;
        this.SHORT_DESCRIPTION_EN = SHORT_DESCRIPTION_EN;
    }

    public String getTILTLE_EN() {
        return TILTLE_EN;
    }

    public void setTILTLE_EN(String TILTLE_EN) {
        this.TILTLE_EN = TILTLE_EN;
    }

    public String getDESCRIPTION_EN() {
        return DESCRIPTION_EN;
    }

    public void setDESCRIPTION_EN(String DESCRIPTION_EN) {
        this.DESCRIPTION_EN = DESCRIPTION_EN;
    }

    public String getSHORT_DESCRIPTION_EN() {
        return SHORT_DESCRIPTION_EN;
    }

    public void setSHORT_DESCRIPTION_EN(String SHORT_DESCRIPTION_EN) {
        this.SHORT_DESCRIPTION_EN = SHORT_DESCRIPTION_EN;
    }

    public String getDESCRIPTION() {
        return DESCRIPTION;
    }

    public void setDESCRIPTION(String DESCRIPTION) {
        this.DESCRIPTION = DESCRIPTION;
    }

    public long getID() {
        return ID;
    }

    public void setID(long ID) {
        this.ID = ID;
    }

    public String getTITLE() {
        return TITLE;
    }

    public void setTITLE(String TITLE) {
        this.TITLE = TITLE;
    }

    public String getSHORT_DESCRIPTION() {
        return SHORT_DESCRIPTION;
    }

    public void setSHORT_DESCRIPTION(String SHORT_DESCRIPTION) {
        this.SHORT_DESCRIPTION = SHORT_DESCRIPTION;
    }

    public String getFILE_URL_IMG() {
        return FILE_URL_IMG;
    }

    public void setFILE_URL_IMG(String FILE_URL_IMG) {
        this.FILE_URL_IMG = FILE_URL_IMG;
    }

    public String getSTART_DATE() {
        return START_DATE;
    }

    public void setSTART_DATE(String START_DATE) {
        this.START_DATE = START_DATE;
    }

    public String getEND_DATE() {
        return END_DATE;
    }

    public void setEND_DATE(String END_DATE) {
        this.END_DATE = END_DATE;
    }

    public int getRegion_id() {
        return region_id;
    }

    public void setRegion_id(int region_id) {
        this.region_id = region_id;
    }

    public String getREMARK() {
        return REMARK;
    }

    public void setREMARK(String REMARK) {
        this.REMARK = REMARK;
    }

    public String getSTATUS() {
        return STATUS;
    }

    public void setSTATUS(String STATUS) {
        this.STATUS = STATUS;
    }

    public int getPromote_id() {
        return promote_id;
    }

    public void setPromote_id(int promote_id) {
        this.promote_id = promote_id;
    }
}
