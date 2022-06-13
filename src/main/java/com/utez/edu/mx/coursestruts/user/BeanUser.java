package com.utez.edu.mx.coursestruts.user;
import com.utez.edu.mx.coursestruts.person.BeanPerson;
import com.utez.edu.mx.coursestruts.rol.BeanRol;
import com.utez.edu.mx.coursestruts.status.BeanStatus;

import java.util.List;


public class BeanUser {
    private int id;
    private String email,password,createat;
    private BeanStatus status;
    private List<BeanRol> rol;
    private BeanPerson person;

    BeanUser(){}

    public BeanUser(String email, String password, String createat, BeanStatus status, List<BeanRol> rol,BeanPerson person) {
        this.email = email;
        this.password = password;
        this.createat = createat;
        this.status = status;
        this.rol = rol;
        this.person = person;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getCreateat() {
        return createat;
    }

    public void setCreateat(String createat) {
        this.createat = createat;
    }

    public BeanStatus getStatus() {
        return status;
    }

    public void setStatus(BeanStatus status) {
        this.status = status;
    }

    public List<BeanRol> getRol() {
        return rol;
    }

    public void setRol(List<BeanRol> rol) {
        this.rol = rol;
    }
}
