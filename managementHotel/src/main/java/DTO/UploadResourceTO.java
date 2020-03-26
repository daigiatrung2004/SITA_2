package DTO;

public class UploadResourceTO {
    private long id;
    private String Original_filename;
    private String File_url;
    private String Parent_table;
    private String Created_date;
    private String status;
    private String remark;
    private String File_type;

    public UploadResourceTO(long id, String original_filename, String file_url, String parent_table, String created_date, String status, String remark, String file_type) {
        this.id = id;
        Original_filename = original_filename;
        File_url = file_url;
        Parent_table = parent_table;
        Created_date = created_date;
        this.status = status;
        this.remark = remark;
        File_type = file_type;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getOriginal_filename() {
        return Original_filename;
    }

    public void setOriginal_filename(String original_filename) {
        Original_filename = original_filename;
    }

    public String getFile_url() {
        return File_url;
    }

    public void setFile_url(String file_url) {
        File_url = file_url;
    }

    public String getParent_table() {
        return Parent_table;
    }

    public void setParent_table(String parent_table) {
        Parent_table = parent_table;
    }

    public String getCreated_date() {
        return Created_date;
    }

    public void setCreated_date(String created_date) {
        Created_date = created_date;
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

    public String getFile_type() {
        return File_type;
    }

    public void setFile_type(String file_type) {
        File_type = file_type;
    }
}
