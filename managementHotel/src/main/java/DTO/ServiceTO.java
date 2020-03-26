package DTO;

public class ServiceTO {
    private int id_service;
    private String service_name_vi;
    private String service_name_en;
    private String file_img_url;
    private String service_details_vi;
    private String service_details_en;
    private String status;
    private String remark;

    public ServiceTO(int id_service, String service_name_vi, String service_name_en, String file_img_url, String service_details_vi, String service_details_en, String status, String remark) {
        this.id_service = id_service;
        this.service_name_vi = service_name_vi;
        this.service_name_en = service_name_en;
        this.file_img_url = file_img_url;
        this.service_details_vi = service_details_vi;
        this.service_details_en = service_details_en;
        this.status = status;
        this.remark = remark;
    }

    public String getService_name_vi() {
        return service_name_vi;
    }

    public void setService_name_vi(String service_name_vi) {
        this.service_name_vi = service_name_vi;
    }

    public String getService_name_en() {
        return service_name_en;
    }

    public void setService_name_en(String service_name_en) {
        this.service_name_en = service_name_en;
    }

    public String getService_details_vi() {
        return service_details_vi;
    }

    public void setService_details_vi(String service_details_vi) {
        this.service_details_vi = service_details_vi;
    }

    public String getService_details_en() {
        return service_details_en;
    }

    public void setService_details_en(String service_details_en) {
        this.service_details_en = service_details_en;
    }

    public int getId_service() {
        return id_service;
    }

    public void setId_service(int id_service) {
        this.id_service = id_service;
    }





    public String getFile_img_url() {
        return file_img_url;
    }

    public void setFile_img_url(String file_img_url) {
        this.file_img_url = file_img_url;
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
