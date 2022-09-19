package com.ushtrimi1.clientAccount.model;
import org.hibernate.annotations.CreationTimestamp;
import javax.persistence.*;
import java.util.Date;

@Entity(name = "accounts")
public class Account {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long accountId;

    @Column(name = "currency")
    private String currency;

    @Column(name = "amount")
    private double amount;

    @Column(name = "branch_code")
    private String branchCode;

    @Column(name="client_id")
    private long clientId;

    @CreationTimestamp
    private Date createdAt;

    @CreationTimestamp
    private Date updatedAt;

    public Account(){

    }

    public long getAccountId() {
        return accountId;
    }

    public double getAmount() {
        return amount;
    }

    public String getCurrency() {
        return currency;
    }

    public String getBranchCode() {
        return branchCode;
    }

    public Date getCreatedAt() {
        return createdAt;
    }

    public Date getUpdatedAt() {
        return updatedAt;
    }

    public long getClientId() {
        return clientId;
    }

    public void setAccountId(long accountId) {
       this.accountId = accountId;
    }

    public void setCurrency(String currency) {
        this.currency = currency;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }

    public void setBranchCode(String branchCode) {
        this.branchCode = branchCode;
    }

    public void setClientId(long clientId) {
        this.clientId = clientId;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }

    public void setUpdatedAt(Date updatedAt) {
        this.updatedAt = updatedAt;
    }
}





