package DTO;

public class KindRoomTO {
    private int kindroom_id;
    private String name_vi;
    private String name_en;
    private String status;
    private String remark;

    public KindRoomTO(int kindroom_id, String name_vi, String name_en, String status, String remark) {
        this.kindroom_id = kindroom_id;
        this.name_vi = name_vi;
        this.name_en = name_en;
        this.status = status;
        this.remark = remark;
    }

    public int getKindroom_id() {
        return kindroom_id;
    }

    public void setKindroom_id(int kindroom_id) {
        this.kindroom_id = kindroom_id;
    }

    public String getName_vi() {
        return name_vi;
    }

    public void setName_vi(String name_vi) {
        this.name_vi = name_vi;
    }

    public String getName_en() {
        return name_en;
    }

    public void setName_en(String name_en) {
        this.name_en = name_en;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }
}
