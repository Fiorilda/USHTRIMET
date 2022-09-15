package com.ushtrimi1.clientAccount.model;

import org.hibernate.annotations.CreationTimestamp;
import javax.persistence.*;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;
@Entity
@Table(name = "clients")
public class Client {

    @Id
    //@GeneratedValue(strategy = GenerationType.AUTO)
    private long id;

    @Column(name = "name")
    private String name;

    @Column(name = "surname")
    private String surname;

    @Column(name = "email")
    private String  email;

    public Client(){

    }

    @OneToMany(cascade = CascadeType.ALL,orphanRemoval = true)
    //@JoinColumn(name="client_id",referencedColumnName ="id")
    @JoinColumn(name="client_id")

    private List<Account> accounts;


    public List<Account> getAccounts() {
        return accounts;
    }

    public void setAccounts(List<Account> accounts) {
        this.accounts = accounts;
    }
    public String getName() {
        return name;
    }

    public String getSurname() {
        return surname;
    }

    public String getEmail() {
        return email;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }

    public void setEmail(String email) {
        this.email = email;
    }


}
