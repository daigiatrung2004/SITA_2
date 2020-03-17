package DTO;

public class PriceRoomTO {
    private int price_id;
    private String type_price_room_vi;
    private String type_price_room_en;
    private long price_1_night;
    private int kind_room_id;
    private String status;
    private String remark;

    public PriceRoomTO(int price_id, String type_price_room_vi, String type_price_room_en, long price_1_night, int kind_room_id, String status, String remark) {
        this.price_id = price_id;
        this.type_price_room_vi = type_price_room_vi;
        this.type_price_room_en = type_price_room_en;
        this.price_1_night = price_1_night;
        this.kind_room_id = kind_room_id;
        this.status = status;
        this.remark = remark;
    }

    public int getPrice_id() {
        return price_id;
    }

    public void setPrice_id(int price_id) {
        this.price_id = price_id;
    }

    public String getType_price_room_vi() {
        return type_price_room_vi;
    }

    public void setType_price_room_vi(String type_price_room_vi) {
        this.type_price_room_vi = type_price_room_vi;
    }

    public String getType_price_room_en() {
        return type_price_room_en;
    }

    public void setType_price_room_en(String type_price_room_en) {
        this.type_price_room_en = type_price_room_en;
    }

    public long getPrice_1_night() {
        return price_1_night;
    }

    public void setPrice_1_night(long price_1_night) {
        this.price_1_night = price_1_night;
    }

    public int getKind_room_id() {
        return kind_room_id;
    }

    public void setKind_room_id(int kind_room_id) {
        this.kind_room_id = kind_room_id;
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
