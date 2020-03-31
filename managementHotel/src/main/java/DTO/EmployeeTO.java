package DTO;

public class EmployeeTO {
    private long id;
    private long positionEmployeeId;
    private PositionEmployeeTO positionEmployeeTO;

    private String loginName;
    private String sankey;
    private String encryptpass;
    private String start_date;
    private String address;
    private String country;
    private String contact_person;
    private String contact_email;
    private long salary;
    private String status;
    private String remark;
    private String ipAdress;
    private String last_login;
    private String firstName;
    private String lastName;
    private int region_id;
    private String postionName;

    public EmployeeTO(long id, long positionEmployeeId, String loginName, String sankey, String encryptpass, String start_date, String address, String country, String contact_person, String contact_email, long salary, String status, String remark, String ipAdress, String last_login, String firstName, String lastName, int region_id) {
        this.id = id;
        this.positionEmployeeId = positionEmployeeId;
        this.loginName = loginName;
        this.sankey = sankey;
        this.encryptpass = encryptpass;
        this.start_date = start_date;
        this.address = address;
        this.country = country;
        this.contact_person = contact_person;
        this.contact_email = contact_email;
        this.salary = salary;
        this.status = status;
        this.remark = remark;
        this.ipAdress = ipAdress;
        this.last_login = last_login;
        this.firstName = firstName;
        this.lastName = lastName;
        this.region_id = region_id;
    }

    public EmployeeTO(long id, long positionEmployeeId, String loginName, String sankey, String encryptpass, String start_date, String address, String country, String contact_person, String contact_email, long salary, String status, String remark, String ipAdress, String last_login, String firstName, String lastName) {
        this.id = id;
        this.positionEmployeeId = positionEmployeeId;
        this.loginName = loginName;
        this.sankey = sankey;
        this.encryptpass = encryptpass;
        this.start_date = start_date;
        this.address = address;
        this.country = country;
        this.contact_person = contact_person;
        this.contact_email = contact_email;
        this.salary = salary;
        this.status = status;
        this.remark = remark;
        this.ipAdress = ipAdress;
        this.last_login = last_login;
        this.firstName = firstName;
        this.lastName = lastName;
    }
    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }



    public long getId() {
        return id;
    }

    public long getSalary() {
        return salary;
    }

    public void setSalary(long salary) {
        this.salary = salary;
    }

    public long getPositionEmployeeId() {
        return positionEmployeeId;
    }

    public void setPositionEmployeeId(long positionEmployeeId) {
        this.positionEmployeeId = positionEmployeeId;
    }

    public void setId(long id) {
        this.id = id;
    }



    public void setPositionEmployeeId(int positionEmployeeId) {
        this.positionEmployeeId = positionEmployeeId;
    }

    public PositionEmployeeTO getPositionEmployeeTO() {
        return positionEmployeeTO;
    }

    public void setPositionEmployeeTO(PositionEmployeeTO positionEmployeeTO) {
        this.positionEmployeeTO = positionEmployeeTO;
    }

    public String getLoginName() {
        return loginName;
    }

    public void setLoginName(String loginName) {
        this.loginName = loginName;
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

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getContact_person() {
        return contact_person;
    }

    public void setContact_person(String contact_person) {
        this.contact_person = contact_person;
    }

    public String getContact_email() {
        return contact_email;
    }

    public void setContact_email(String contact_email) {
        this.contact_email = contact_email;
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

    public String getIpAdress() {
        return ipAdress;
    }

    public void setIpAdress(String ipAdress) {
        this.ipAdress = ipAdress;
    }

    public String getLast_login() {
        return last_login;
    }

    public void setLast_login(String last_login) {
        this.last_login = last_login;
    }

    public int getRegion_id() {
        return region_id;
    }

    public void setRegion_id(int region_id) {
        this.region_id = region_id;
    }

    public String getPostionName() {
        return postionName;
    }

    public void setPostionName(String postionName) {
        this.postionName = postionName;
    }
}

