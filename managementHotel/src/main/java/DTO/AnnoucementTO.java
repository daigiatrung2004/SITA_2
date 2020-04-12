package DTO;

public class AnnoucementTO {
    private long ANNOUNCE_ID;
    private String TITLE;
    private String CONTENT;
    private long employee_id;
    private String STATUS;
    private String REMARK;
    private String DATE_POST;
    private String STATUS_READ_UNREAD;


    // nhân thông báo về
    public AnnoucementTO(long ANNOUNCE_ID, String TITLE, String CONTENT, long employee_id, String STATUS, String REMARK, String DATE_POST, String STATUS_READ_UNREAD) {
        this.ANNOUNCE_ID = ANNOUNCE_ID;
        this.TITLE = TITLE;
        this.CONTENT = CONTENT;
        this.employee_id = employee_id;
        this.STATUS = STATUS;
        this.REMARK = REMARK;
        this.DATE_POST = DATE_POST;
        this.STATUS_READ_UNREAD = STATUS_READ_UNREAD;
    }
     // gửi thông báo đi
    public AnnoucementTO(long ANNOUNCE_ID, String TITLE, String CONTENT, long employee_id, String STATUS, String REMARK, String DATE_POST) {
        this.ANNOUNCE_ID = ANNOUNCE_ID;
        this.TITLE = TITLE;
        this.CONTENT = CONTENT;
        this.employee_id = employee_id;
        this.STATUS = STATUS;
        this.REMARK = REMARK;
        this.DATE_POST = DATE_POST;
    }

    public long getANNOUNCE_ID() {
        return ANNOUNCE_ID;
    }

    public void setANNOUNCE_ID(long ANNOUNCE_ID) {
        this.ANNOUNCE_ID = ANNOUNCE_ID;
    }

    public String getTITLE() {
        return TITLE;
    }

    public void setTITLE(String TITLE) {
        this.TITLE = TITLE;
    }

    public String getCONTENT() {
        return CONTENT;
    }

    public void setCONTENT(String CONTENT) {
        this.CONTENT = CONTENT;
    }

    public long getEmployee_id() {
        return employee_id;
    }

    public void setEmployee_id(long employee_id) {
        this.employee_id = employee_id;
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

    public String getDATE_POST() {
        return DATE_POST;
    }

    public void setDATE_POST(String DATE_POST) {
        this.DATE_POST = DATE_POST;
    }
}
