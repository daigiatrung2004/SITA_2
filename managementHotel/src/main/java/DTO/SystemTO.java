package DTO;

public class SystemTO {
    private long sys_id;
    private String  meta_key;
    private String  ip_Address;
    private String type;
    private String meta_value;
    private String date_update;

    public SystemTO(long sys_id, String meta_key, String ip_Address, String type, String meta_value, String date_update) {
        this.sys_id = sys_id;
        this.meta_key = meta_key;
        this.ip_Address = ip_Address;
        this.type = type;
        this.meta_value = meta_value;
        this.date_update = date_update;
    }

    public long getSys_id() {
        return sys_id;
    }

    public void setSys_id(long sys_id) {
        this.sys_id = sys_id;
    }

    public String getMeta_key() {
        return meta_key;
    }

    public void setMeta_key(String meta_key) {
        this.meta_key = meta_key;
    }

    public String getIp_Address() {
        return ip_Address;
    }

    public void setIp_Address(String ip_Address) {
        this.ip_Address = ip_Address;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getMeta_value() {
        return meta_value;
    }

    public void setMeta_value(String meta_value) {
        this.meta_value = meta_value;
    }

    public String getDate_update() {
        return date_update;
    }

    public void setDate_update(String date_update) {
        this.date_update = date_update;
    }

}

