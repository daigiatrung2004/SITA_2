package DTO;

public class CustomerTO {
    private long customer_id;
    private String email;
    private String sankey;
    private String encryptpass;
    private String start_date;
    private String contact_person;
    private String verify_person;
    private String status;
    private String remark;
    private String firstname;
    private String lastname;

    public CustomerTO(long customer_id, String email, String sankey, String encryptpass, String start_date, String contact_person, String verify_person, String status, String remark, String firstname, String lastname) {
        this.customer_id = customer_id;
        this.email = email;
        this.sankey = sankey;
        this.encryptpass = encryptpass;
        this.start_date = start_date;
        this.contact_person = contact_person;
        this.verify_person = verify_person;
        this.status = status;
        this.remark = remark;
        this.firstname = firstname;
        this.lastname = lastname;
    }

    public CustomerTO(long customer_id, String email, String sankey, String encryptpass, String start_date, String contact_person, String verify_person, String status, String remark) {
        this.customer_id = customer_id;
        this.email = email;
        this.sankey = sankey;
        this.encryptpass = encryptpass;
        this.start_date = start_date;
        this.contact_person = contact_person;
        this.verify_person = verify_person;
        this.status = status;
        this.remark = remark;
    }

    public long getCustomer_id() {
        return customer_id;
    }

    public void setCustomer_id(long customer_id) {
        this.customer_id = customer_id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getSankey() {
        return sankey;
    }

    public void setSankey(String sankey) {
        this.sankey = sankey;
    }

    public String getEncryptpass() {
        return encryptpass;
    }

    public void setEncryptpass(String encryptpass) {
        this.encryptpass = encryptpass;
    }

    public String getStart_date() {
        return start_date;
    }

    public void setStart_date(String start_date) {
        this.start_date = start_date;
    }

    public String getContact_person() {
        return contact_person;
    }

    public void setContact_person(String contact_person) {
        this.contact_person = contact_person;
    }

    public String getVerify_person() {
        return verify_person;
    }

    public void setVerify_person(String verify_person) {
        this.verify_person = verify_person;
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

    public String getFirstname() {
        return firstname;
    }

    public void setFirstname(String firstname) {
        this.firstname = firstname;
    }

    public String getLastname() {
        return lastname;
    }

    public void setLastname(String lastname) {
        this.lastname = lastname;
    }
}
