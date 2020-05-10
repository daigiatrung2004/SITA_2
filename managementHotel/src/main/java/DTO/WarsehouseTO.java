package DTO;

public class WarsehouseTO {
    private long warsehouse_id;
    private int ID;
    private String type;
    private int amount;
    private String inputdate;
    private long employee_id;
    private String remarks;

    public WarsehouseTO(long warsehouse_id, int ID, String type, int amount, String inputdate, long employee_id, String remarks) {
        this.warsehouse_id = warsehouse_id;
        this.ID = ID;
        this.type = type;
        this.amount = amount;
        this.inputdate = inputdate;
        this.employee_id = employee_id;
        this.remarks = remarks;
    }

    public long getWarsehouse_id() {
        return warsehouse_id;
    }

    public void setWarsehouse_id(long warsehouse_id) {
        this.warsehouse_id = warsehouse_id;
    }

    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public String getInputdate() {
        return inputdate;
    }

    public void setInputdate(String inputdate) {
        this.inputdate = inputdate;
    }

    public long getEmployee_id() {
        return employee_id;
    }

    public void setEmployee_id(long employee_id) {
        this.employee_id = employee_id;
    }

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }
}
