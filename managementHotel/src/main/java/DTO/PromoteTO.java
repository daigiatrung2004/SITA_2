package DTO;

public class PromoteTO {
    private int promte_id;
    private String pro_code;
    private String pro_value;
    private String status;
    private String remark;
    private String expired_date;
    private long id_promote_price;
    private int price_id;





    public PromoteTO(int promte_id, String pro_code, String pro_value, String status, String remark, String expired_date) {
        this.promte_id = promte_id;
        this.pro_code = pro_code;
        this.pro_value = pro_value;
        this.status = status;
        this.remark = remark;
        this.expired_date = expired_date;
    }

    public PromoteTO(int promte_id, long id_promote_price, int price_id) {
        this.promte_id = promte_id;
        this.id_promote_price = id_promote_price;
        this.price_id = price_id;
    }

    public long getId_promote_price() {
        return id_promote_price;
    }

    public void setId_promote_price(long id_promote_price) {
        this.id_promote_price = id_promote_price;
    }

    public int getPrice_id() {
        return price_id;
    }

    public void setPrice_id(int price_id) {
        this.price_id = price_id;
    }

    public int getPromte_id() {
        return promte_id;
    }

    public void setPromte_id(int promte_id) {
        this.promte_id = promte_id;
    }

    public String getPro_code() {
        return pro_code;
    }

    public void setPro_code(String pro_code) {
        this.pro_code = pro_code;
    }

    public String getPro_value() {
        return pro_value;
    }

    public void setPro_value(String pro_value) {
        this.pro_value = pro_value;
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

    public String getExpired_date() {
        return expired_date;
    }

    public void setExpired_date(String expired_date) {
        this.expired_date = expired_date;
    }
}
