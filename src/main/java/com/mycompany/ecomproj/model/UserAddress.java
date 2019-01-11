
package com.mycompany.ecomproj.model;

public class UserAddress {
    
    int id ;
    int userId;
    String shipTo;
    String billTo;

    public UserAddress() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getShipTo() {
        return shipTo;
    }

    public void setShipTo(String shipTo) {
        this.shipTo = shipTo;
    }

    public String getBillTo() {
        return billTo;
    }

    public void setBillTo(String billTo) {
        this.billTo = billTo;
    }

    @Override
    public String toString() {
        return "UserAddress{" + "id=" + id + ", userId=" + userId + ", shipTo=" + shipTo + ", billTo=" + billTo + '}';
    }
    
    
    
    
    

    
}
