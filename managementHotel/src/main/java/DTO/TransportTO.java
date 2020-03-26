package DTO;

public class TransportTO {
    private long transport_id;
    private String name_vi;
    private String name_en;
    private String details_vi;
    private String details_en;
    private long price;
    private String status;
    private String remark;
    private int id_transport_region;
    // dành cho transport_region
    public TransportTO(long transport_id, int id_transport_region, int region_id) {
        this.transport_id = transport_id;
        this.id_transport_region = id_transport_region;
        this.region_id = region_id;
    }

    private int region_id;
    //dành cho other_fees
    public TransportTO(long transport_id, String name_vi, String name_en, long price, String status, String remark) {
        this.transport_id = transport_id;
        this.name_vi = name_vi;
        this.name_en = name_en;
        this.price = price;
        this.status = status;
        this.remark = remark;
    }
     // dành cho data transport
    public TransportTO(long transport_id, String name_vi, String name_en, String details_vi, String details_en, long price, String status, String remark) {
        this.transport_id = transport_id;
        this.name_vi = name_vi;
        this.name_en = name_en;
        this.details_vi = details_vi;
        this.details_en = details_en;
        this.price = price;
        this.status = status;
        this.remark = remark;
    }
    public int getId_transport_region() {
        return id_transport_region;
    }

    public void setId_transport_region(int id_transport_region) {
        this.id_transport_region = id_transport_region;
    }

    public int getRegion_id() {
        return region_id;
    }

    public void setRegion_id(int region_id) {
        this.region_id = region_id;
    }
    public long getTransport_id() {
        return transport_id;
    }

    public void setTransport_id(long transport_id) {
        this.transport_id = transport_id;
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

    public String getDetails_vi() {
        return details_vi;
    }

    public void setDetails_vi(String details_vi) {
        this.details_vi = details_vi;
    }

    public String getDetails_en() {
        return details_en;
    }

    public void setDetails_en(String details_en) {
        this.details_en = details_en;
    }

    public long getPrice() {
        return price;
    }

    public void setPrice(long price) {
        this.price = price;
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
