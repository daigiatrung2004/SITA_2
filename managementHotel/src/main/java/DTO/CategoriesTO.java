package DTO;

public class CategoriesTO {
    private int cate_id;
    private String name;
    private String status;
    private String remark;

    public CategoriesTO(int cate_id, String name, String status, String remark) {
        this.cate_id = cate_id;
        this.name = name;
        this.status = status;
        this.remark = remark;
    }

    public int getCate_id() {
        return cate_id;
    }

    public void setCate_id(int cate_id) {
        this.cate_id = cate_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
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
