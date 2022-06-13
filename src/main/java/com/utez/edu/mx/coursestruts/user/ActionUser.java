package com.utez.edu.mx.coursestruts.user;

import com.google.gson.Gson;
import com.utez.edu.mx.coursestruts.person.BeanPerson;
import com.utez.edu.mx.coursestruts.rol.BeanRol;
import com.utez.edu.mx.coursestruts.rol.DaoRol;
import com.utez.edu.mx.coursestruts.userData.BeanUserData;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import static com.opensymphony.xwork2.Action.SUCCESS;

public class ActionUser {
    private List<BeanUser> listuser = new ArrayList<>();
    private List<BeanUserData> listUsers = new ArrayList<>();
//    private BeanUser user;
//    private BeanPerson person;
//    private BeanRol rol;
    private BeanUserData user;
    private String message;
    private String data;

    public String findAllUsers () throws SQLException {
        setListUsers(new DaoUser().findAll());
        return SUCCESS;
    }

    public String createUser() throws SQLException{
        user = new Gson().fromJson(data,BeanUserData.class);

        if(new DaoUser().createUser(user)){
            setMessage("success");
        }else{
            setMessage("Fail");
        }
        return SUCCESS;
    }

    public String updateUser() throws SQLException {
        user = new Gson().fromJson(data, BeanUserData.class);
        if(new DaoUser().updateUser(user)){
            setMessage("SUCCES");
        }else{
            setMessage("Fail");
        }
        return SUCCESS;
    }

    public String deleteUser() throws SQLException {
        user = new Gson().fromJson(data, BeanUserData.class);
        if(new DaoUser().deleteUser(user)){
            setMessage("SUCCES");
        }else{
            setMessage("Fail");
        }
        return SUCCESS;
    }

    public String user(){
        return SUCCESS;
    }

    public List<BeanUser> getListuser() {
        return listuser;
    }

    public void setListuser(List<BeanUser> listuser) {
        this.listuser = listuser;
    }

    public BeanUserData getUser() {
        return user;
    }

    public void setUser(BeanUserData user) {
        this.user = user;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public List<BeanUserData> getListUsers() {
        return listUsers;
    }

    public void setListUsers(List<BeanUserData> listUsers) {
        this.listUsers = listUsers;
    }
//    public BeanPerson getPerson() {
//        return person;
//    }
//
//    public void setPerson(BeanPerson person) {
//        this.person = person;
//    }
//
//    public BeanRol getRol() {
//        return rol;
//    }
//
//    public void setRol(BeanRol rol) {
//        this.rol = rol;
//    }

    public String getData() {
        return data;
    }

    public void setData(String data) {
        this.data = data;
    }
}
