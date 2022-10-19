package com.ZERO.server;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
public class Borrow {
    private Integer idBorrow;
    private String borrower;
    private String borrowing;
    private String idMedia;
    
    public Integer getIdBorrow() {
        return idBorrow;
    }
    public void setIdBorrow(Integer idBorrow) {
        this.idBorrow = idBorrow;
    }
    public String getBorrower() {
        return borrower;
    }
    public void setBorrower(String borrower) {
        this.borrower = borrower;
    }
    public String getBorrowing() {
        return borrowing;
    }
    public void setBorrowing(String borrowing) {
        this.borrowing = borrowing;
    }
    public String getIdMedia() {
        return idMedia;
    }
    public void setIdMedia(String idMedia) {
        this.idMedia = idMedia;
    }
    
    
}