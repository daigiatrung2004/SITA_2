package DTO;

public class BookingTO {
    private long booking_id;
    private long customer_id;
    private String start_booking_date;
    private String check_in_date;
    private String check_out_date;
    private int kind_room_id;
    private int region_id;
    private int room_id;
    private String status;
    private String remark;
    private String code_booking;
    private long transport_id;
    private long id_trans_booking;
    private int ID;
    private int amount;
    private long pay;
    private long tongtiendichvu;
    private long tongtienservice;
    private long tienphong;// dùng cho thông kê
    // dành cho thông kê booking toàn thành phần


    public BookingTO(long booking_id, long customer_id, String start_booking_date, String check_in_date, String check_out_date, int kind_room_id, int region_id, int room_id, String status, String remark, String code_booking, long tongtiendichvu, long tongtienservice, long tienphong) {
        this.booking_id = booking_id;
        this.customer_id = customer_id;
        this.start_booking_date = start_booking_date;
        this.check_in_date = check_in_date;
        this.check_out_date = check_out_date;
        this.kind_room_id = kind_room_id;
        this.region_id = region_id;
        this.room_id = room_id;
        this.status = status;
        this.remark = remark;
        this.code_booking = code_booking;
        this.tongtiendichvu = tongtiendichvu;
        this.tongtienservice = tongtienservice;
        this.tienphong = tienphong;
    }

    // dành cho booking product
    public BookingTO(long booking_id, String status, int ID, int amount, long pay) {
        this.booking_id = booking_id;
        this.status = status;
        this.ID = ID;
        this.amount = amount;
        this.pay = pay;
    }

    //dành cho booking
    public BookingTO(long booking_id, long customer_id, String start_booking_date, String check_in_date, String check_out_date, int kind_room_id, int region_id, int room_id, String status, String remark, String code_booking) {
        this.booking_id = booking_id;
        this.customer_id = customer_id;
        this.start_booking_date = start_booking_date;
        this.check_in_date = check_in_date;
        this.check_out_date = check_out_date;
        this.kind_room_id = kind_room_id;
        this.region_id = region_id;
        this.room_id = room_id;
        this.status = status;
        this.remark = remark;
        this.code_booking = code_booking;
    }

    //dành  cho booking transport
    public BookingTO(long booking_id, long transport_id, long id_trans_booking) {
        this.booking_id = booking_id;
        this.transport_id = transport_id;
        this.id_trans_booking = id_trans_booking;
    }

    public long getTransport_id() {
        return transport_id;
    }

    public void setTransport_id(long transport_id) {
        this.transport_id = transport_id;
    }

    public long getId_trans_booking() {
        return id_trans_booking;
    }

    public void setId_trans_booking(long id_trans_booking) {
        this.id_trans_booking = id_trans_booking;
    }

    public long getBooking_id() {
        return booking_id;
    }

    public void setBooking_id(long booking_id) {
        this.booking_id = booking_id;
    }

    public long getCustomer_id() {
        return customer_id;
    }

    public void setCustomer_id(long customer_id) {
        this.customer_id = customer_id;
    }

    public String getStart_booking_date() {
        return start_booking_date;
    }

    public void setStart_booking_date(String start_booking_date) {
        this.start_booking_date = start_booking_date;
    }

    public String getCheck_in_date() {
        return check_in_date;
    }

    public void setCheck_in_date(String check_in_date) {
        this.check_in_date = check_in_date;
    }

    public String getCheck_out_date() {
        return check_out_date;
    }

    public void setCheck_out_date(String check_out_date) {
        this.check_out_date = check_out_date;
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

    public int getRoom_id() {
        return room_id;
    }

    public void setRoom_id(int room_id) {
        this.room_id = room_id;
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

    public String getCode_booking() {
        return code_booking;
    }

    public void setCode_booking(String code_booking) {
        this.code_booking = code_booking;
    }

    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public long getPay() {
        return pay;
    }

    public void setPay(long pay) {
        this.pay = pay;
    }

    public long getTongtiendichvu() {
        return tongtiendichvu;
    }

    public void setTongtiendichvu(long tongtiendichvu) {
        this.tongtiendichvu = tongtiendichvu;
    }

    public long getTongtienservice() {
        return tongtienservice;
    }

    public void setTongtienservice(long tongtienservice) {
        this.tongtienservice = tongtienservice;
    }

    public long getTienphong() {
        return tienphong;
    }

    public void setTienphong(long tienphong) {
        this.tienphong = tienphong;
    }
}
