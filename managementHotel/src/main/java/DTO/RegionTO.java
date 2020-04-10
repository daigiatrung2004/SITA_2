package DTO;

public class RegionTO {
    private int region_id;
    private String name_vi;
    private String name_en;
    private String status;
    private String remark;
    private String file_url_img;

    public RegionTO(int region_id, String name_vi, String name_en, String status, String remark, String file_url_img) {
        this.region_id = region_id;
        this.name_vi = name_vi;
        this.name_en = name_en;
        this.status = status;
        this.remark = remark;
        this.file_url_img = file_url_img;
    }

    public RegionTO(int region_id, String name_vi, String name_en, String status, String remark) {
        this.region_id = region_id;
        this.name_vi = name_vi;
        this.name_en = name_en;
        this.status = status;
        this.remark = remark;
    }

    public int getRegion_id() {
        return region_id;
    }

    public void setRegion_id(int region_id) {
        this.region_id = region_id;
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

    public String getFile_url_img() {
        return file_url_img;
    }

    public void setFile_url_img(String file_url_img) {
        this.file_url_img = file_url_img;
    }
}
