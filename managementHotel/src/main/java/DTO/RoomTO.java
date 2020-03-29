package DTO;

public class RoomTO {
    private int room_id;
    private String name;
    private int kind_room_id;
    private int price_id;
    private int region_id;
    private String status;
    private String remark;
    private int max_people;
    private KindRoomTO kindRoomTO;
    private RegionTO regionTO;
    private RoomTO roomTO;
    private CustomerTO customerTO;
    // danh de luu cho du lieu danh sach booking


    public RoomTO(KindRoomTO kindRoomTO, RegionTO regionTO, RoomTO roomTO, CustomerTO customerTO) {
        this.kindRoomTO = kindRoomTO;
        this.regionTO = regionTO;
        this.roomTO = roomTO;
        this.customerTO = customerTO;
    }

    public RoomTO(int room_id, String name, int kind_room_id, int price_id, int region_id, String status, String remark, int max_people) {
        this.room_id = room_id;
        this.name = name;
        this.kind_room_id = kind_room_id;
        this.price_id = price_id;
        this.region_id = region_id;
        this.status = status;
        this.remark = remark;
        this.max_people = max_people;
    }
    public int getPrice_id() {
        return price_id;
    }

    public void setPrice_id(int price_id) {
        this.price_id = price_id;
    }
    public int getRoom_id() {
        return room_id;
    }

    public void setRoom_id(int room_id) {
        this.room_id = room_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getKind_room_id() {
        return kind_room_id;
    }

    public void setKind_room_id(int kind_room_id) {
        this.kind_room_id = kind_room_id;
    }

    public int getRegion_id() {
        return region_id;
    }

    public void setRegion_id(int region_id) {
        this.region_id = region_id;
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

    public int getMax_people() {
        return max_people;
    }

    public void setMax_people(int max_people) {
        this.max_people = max_people;
    }

    public KindRoomTO getKindRoomTO() {
        return kindRoomTO;
    }

    public void setKindRoomTO(KindRoomTO kindRoomTO) {
        this.kindRoomTO = kindRoomTO;
    }

    public RegionTO getRegionTO() {
        return regionTO;
    }

    public void setRegionTO(RegionTO regionTO) {
        this.regionTO = regionTO;
    }

    public RoomTO getRoomTO() {
        return roomTO;
    }

    public void setRoomTO(RoomTO roomTO) {
        this.roomTO = roomTO;
    }

    public CustomerTO getCustomerTO() {
        return customerTO;
    }

    public void setCustomerTO(CustomerTO customerTO) {
        this.customerTO = customerTO;
    }
}
