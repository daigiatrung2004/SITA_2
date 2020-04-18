package DTO;

public class InvoiceTO {
    private long Invoice_id;
    private long booking_id;
    private long customer_id;
    private int room_id;
    private long tongtiensanpham;
    private long tongtien;
    private String remark;

    public InvoiceTO(long invoice_id, long booking_id, long customer_id, int room_id, long tongtiensanpham, long tongtien, String remark) {
        Invoice_id = invoice_id;
        this.booking_id = booking_id;
        this.customer_id = customer_id;
        this.room_id = room_id;
        this.tongtiensanpham = tongtiensanpham;
        this.tongtien = tongtien;
        this.remark = remark;
    }

    public long getInvoice_id() {
        return Invoice_id;
    }

    public void setInvoice_id(long invoice_id) {
        Invoice_id = invoice_id;
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

    public void setCustomer_id(int customer_id) {
        this.customer_id = customer_id;
    }

    public int getRoom_id() {
        return room_id;
    }

    public void setRoom_id(int room_id) {
        this.room_id = room_id;
    }

    public long getTongtiensanpham() {
        return tongtiensanpham;
    }

    public void setTongtiensanpham(long tongtiensanpham) {
        this.tongtiensanpham = tongtiensanpham;
    }

    public long getTongtien() {
        return tongtien;
    }

    public void setTongtien(long tongtien) {
        this.tongtien = tongtien;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }
}
