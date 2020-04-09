package DTO;

public class PaymentOrderTO {
     private long ID;
     private long PAYEE_ID;
     private String BILLING_INFO;
     private String MERCHANT_ID;
     private String TRANSACTION_NO;
     private String TRANSACTION_DATE;
     private int RETURN_CODE;
     private long  AMOUNT;
     private  String CURRENCY;
     private  String PAYPAL_TXN_ID;
     private  String PAYPAL_TXN_FEE;
     private  String PAYPAL_RECEIPT_NO;
     private  String REMARK;
     private  String STATUS;
     private  String PAYEE_INFO;
     private  String PURCHASE_INFO;
     private  String GEN_MSG_KEY;
     private  String RETURN_MSG_KEY;
     private  String PAYMENT_TYPE;

    public PaymentOrderTO(long ID, long PAYEE_ID, String BILLING_INFO, String MERCHANT_ID, String TRANSACTION_NO, String TRANSACTION_DATE, int RETURN_CODE, long AMOUNT, String CURRENCY, String PAYPAL_TXN_ID, String PAYPAL_TXN_FEE, String PAYPAL_RECEIPT_NO, String REMARK, String STATUS, String PAYEE_INFO, String PURCHASE_INFO, String GEN_MSG_KEY, String RETURN_MSG_KEY, String PAYMENT_TYPE) {
        this.ID = ID;
        this.PAYEE_ID = PAYEE_ID;
        this.BILLING_INFO = BILLING_INFO;
        this.MERCHANT_ID = MERCHANT_ID;
        this.TRANSACTION_NO = TRANSACTION_NO;
        this.TRANSACTION_DATE = TRANSACTION_DATE;
        this.RETURN_CODE = RETURN_CODE;
        this.AMOUNT = AMOUNT;
        this.CURRENCY = CURRENCY;
        this.PAYPAL_TXN_ID = PAYPAL_TXN_ID;
        this.PAYPAL_TXN_FEE = PAYPAL_TXN_FEE;
        this.PAYPAL_RECEIPT_NO = PAYPAL_RECEIPT_NO;
        this.REMARK = REMARK;
        this.STATUS = STATUS;
        this.PAYEE_INFO = PAYEE_INFO;
        this.PURCHASE_INFO = PURCHASE_INFO;
        this.GEN_MSG_KEY = GEN_MSG_KEY;
        this.RETURN_MSG_KEY = RETURN_MSG_KEY;
        this.PAYMENT_TYPE = PAYMENT_TYPE;
    }

    public long getID() {
        return ID;
    }

    public void setID(long ID) {
        this.ID = ID;
    }

    public long getPAYEE_ID() {
        return PAYEE_ID;
    }

    public void setPAYEE_ID(long PAYEE_ID) {
        this.PAYEE_ID = PAYEE_ID;
    }

    public String getBILLING_INFO() {
        return BILLING_INFO;
    }

    public void setBILLING_INFO(String BILLING_INFO) {
        this.BILLING_INFO = BILLING_INFO;
    }

    public String getMERCHANT_ID() {
        return MERCHANT_ID;
    }

    public void setMERCHANT_ID(String MERCHANT_ID) {
        this.MERCHANT_ID = MERCHANT_ID;
    }

    public String getTRANSACTION_NO() {
        return TRANSACTION_NO;
    }

    public void setTRANSACTION_NO(String TRANSACTION_NO) {
        this.TRANSACTION_NO = TRANSACTION_NO;
    }

    public String getTRANSACTION_DATE() {
        return TRANSACTION_DATE;
    }

    public void setTRANSACTION_DATE(String TRANSACTION_DATE) {
        this.TRANSACTION_DATE = TRANSACTION_DATE;
    }

    public int getRETURN_CODE() {
        return RETURN_CODE;
    }

    public void setRETURN_CODE(int RETURN_CODE) {
        this.RETURN_CODE = RETURN_CODE;
    }

    public long getAMOUNT() {
        return AMOUNT;
    }

    public void setAMOUNT(long AMOUNT) {
        this.AMOUNT = AMOUNT;
    }

    public String getCURRENCY() {
        return CURRENCY;
    }

    public void setCURRENCY(String CURRENCY) {
        this.CURRENCY = CURRENCY;
    }

    public String getPAYPAL_TXN_ID() {
        return PAYPAL_TXN_ID;
    }

    public void setPAYPAL_TXN_ID(String PAYPAL_TXN_ID) {
        this.PAYPAL_TXN_ID = PAYPAL_TXN_ID;
    }

    public String getPAYPAL_TXN_FEE() {
        return PAYPAL_TXN_FEE;
    }

    public void setPAYPAL_TXN_FEE(String PAYPAL_TXN_FEE) {
        this.PAYPAL_TXN_FEE = PAYPAL_TXN_FEE;
    }

    public String getPAYPAL_RECEIPT_NO() {
        return PAYPAL_RECEIPT_NO;
    }

    public void setPAYPAL_RECEIPT_NO(String PAYPAL_RECEIPT_NO) {
        this.PAYPAL_RECEIPT_NO = PAYPAL_RECEIPT_NO;
    }

    public String getREMARK() {
        return REMARK;
    }

    public void setREMARK(String REMARK) {
        this.REMARK = REMARK;
    }

    public String getSTATUS() {
        return STATUS;
    }

    public void setSTATUS(String STATUS) {
        this.STATUS = STATUS;
    }

    public String getPAYEE_INFO() {
        return PAYEE_INFO;
    }

    public void setPAYEE_INFO(String PAYEE_INFO) {
        this.PAYEE_INFO = PAYEE_INFO;
    }

    public String getPURCHASE_INFO() {
        return PURCHASE_INFO;
    }

    public void setPURCHASE_INFO(String PURCHASE_INFO) {
        this.PURCHASE_INFO = PURCHASE_INFO;
    }

    public String getGEN_MSG_KEY() {
        return GEN_MSG_KEY;
    }

    public void setGEN_MSG_KEY(String GEN_MSG_KEY) {
        this.GEN_MSG_KEY = GEN_MSG_KEY;
    }

    public String getRETURN_MSG_KEY() {
        return RETURN_MSG_KEY;
    }

    public void setRETURN_MSG_KEY(String RETURN_MSG_KEY) {
        this.RETURN_MSG_KEY = RETURN_MSG_KEY;
    }

    public String getPAYMENT_TYPE() {
        return PAYMENT_TYPE;
    }

    public void setPAYMENT_TYPE(String PAYMENT_TYPE) {
        this.PAYMENT_TYPE = PAYMENT_TYPE;
    }
}
