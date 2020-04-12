package DTO;

public class ProductTO {
    private int ID;
    private String NAME;
    private String DESCRIPTION;
    private String FILE_IMG_URL;
    private String STATUS;
    private String REMARK;
    private long PRICE;
    private String UNIT;
    private int AMOUNT;
    private int cate_id;
    private int region_id;

    public ProductTO(int ID, String NAME, String DESCRIPTION, String FILE_IMG_URL, String STATUS, String REMARK, long PRICE, String UNIT, int AMOUNT, int cate_id, int region_id) {
        this.ID = ID;
        this.NAME = NAME;
        this.DESCRIPTION = DESCRIPTION;
        this.FILE_IMG_URL = FILE_IMG_URL;
        this.STATUS = STATUS;
        this.REMARK = REMARK;
        this.PRICE = PRICE;
        this.UNIT = UNIT;
        this.AMOUNT = AMOUNT;
        this.cate_id = cate_id;
        this.region_id = region_id;
    }

    public int getRegion_id() {
        return region_id;
    }

    public void setRegion_id(int region_id) {
        this.region_id = region_id;
    }

    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public String getNAME() {
        return NAME;
    }

    public void setNAME(String NAME) {
        this.NAME = NAME;
    }

    public String getDESCRIPTION() {
        return DESCRIPTION;
    }

    public void setDESCRIPTION(String DESCRIPTION) {
        this.DESCRIPTION = DESCRIPTION;
    }

    public String getFILE_IMG_URL() {
        return FILE_IMG_URL;
    }

    public void setFILE_IMG_URL(String FILE_IMG_URL) {
        this.FILE_IMG_URL = FILE_IMG_URL;
    }

    public String getSTATUS() {
        return STATUS;
    }

    public void setSTATUS(String STATUS) {
        this.STATUS = STATUS;
    }

    public String getREMARK() {
        return REMARK;
    }

    public void setREMARK(String REMARK) {
        this.REMARK = REMARK;
    }

    public long getPRICE() {
        return PRICE;
    }

    public void setPRICE(long PRICE) {
        this.PRICE = PRICE;
    }

    public String getUNIT() {
        return UNIT;
    }

    public void setUNIT(String UNIT) {
        this.UNIT = UNIT;
    }

    public int getAMOUNT() {
        return AMOUNT;
    }

    public void setAMOUNT(int AMOUNT) {
        this.AMOUNT = AMOUNT;
    }

    public int getCate_id() {
        return cate_id;
    }

    public void setCate_id(int cate_id) {
        this.cate_id = cate_id;
    }
}
