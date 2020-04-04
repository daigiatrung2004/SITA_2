package DTO;

public class FurnitureTO {
    private int id_furniture;
    private String name_vi;
    private String name_en;
    private String type;
    private long price;
    private String details;
    private String status;
    private String remark;
    private String type_en;
    private int id_furniture_room;
    private int kind_room_id;

    public FurnitureTO(int id_furniture, String status, int id_furniture_room, int kind_room_id) {
        this.id_furniture = id_furniture;
        this.status = status;
        this.id_furniture_room = id_furniture_room;
        this.kind_room_id = kind_room_id;
    }

    public FurnitureTO(int id_furniture, String name_vi, String name_en, String type, long price, String details, String status, String remark, String type_en) {
        this.id_furniture = id_furniture;
        this.name_vi = name_vi;
        this.name_en = name_en;
        this.type = type;
        this.price = price;
        this.details = details;
        this.status = status;
        this.remark = remark;
        this.type_en = type_en;
    }

    public int getId_furniture() {
        return id_furniture;
    }

    public void setId_furniture(int id_furniture) {
        this.id_furniture = id_furniture;
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

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public long getPrice() {
        return price;
    }

    public void setPrice(long price) {
        this.price = price;
    }

    public String getDetails() {
        return details;
    }

    public void setDetails(String details) {
        this.details = details;
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

    public String getType_en() {
        return type_en;
    }

    public void setType_en(String type_en) {
        this.type_en = type_en;
    }

    public int getId_furniture_room() {
        return id_furniture_room;
    }

    public void setId_furniture_room(int id_furniture_room) {
        this.id_furniture_room = id_furniture_room;
    }

    public int getKind_room_id() {
        return kind_room_id;
    }

    public void setKind_room_id(int kind_room_id) {
        this.kind_room_id = kind_room_id;
    }
}
