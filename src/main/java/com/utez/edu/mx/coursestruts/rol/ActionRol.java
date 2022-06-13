package com.utez.edu.mx.coursestruts.rol;
import com.google.gson.Gson;

import static com.opensymphony.xwork2.Action.SUCCESS;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
public class ActionRol {
    private String message;
    private List<BeanRol> listRoles = new ArrayList<>();
    private  String data;
    private BeanRol rol;

    public String findAllRoles () throws SQLException {
        setListRoles(new DaoRol().findAll());
        return SUCCESS;
    }

    public String createRol() throws SQLException {
        rol = new Gson().fromJson(data, BeanRol.class);
        if(new DaoRol().createRol(rol)){
            setMessage("SUCCES");
        }else{
            setMessage("Fail");
        }
        return SUCCESS;
    }

    public String updateRol() throws SQLException {
        rol = new Gson().fromJson(data, BeanRol.class);
        if(new DaoRol().updateRol(rol)){
            setMessage("SUCCES");
        }else{
            setMessage("Fail");
        }
        return SUCCESS;
    }

    public String deleteRol() throws SQLException {
        rol = new Gson().fromJson(data, BeanRol.class);
        if(new DaoRol().deleteRol(rol)){
            setMessage("SUCCES");
        }else{
            setMessage("Fail");
        }
        return SUCCESS;
    }


    public BeanRol getRol() {
        return rol;
    }

    public void setRol(BeanRol rol) {
        this.rol = rol;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public List<BeanRol> getListRoles() {
        return listRoles;
    }

    public void setListRoles(List<BeanRol> listRoles) {
        this.listRoles = listRoles;
    }

    public String getData() {
        return data;
    }

    public void setData(String data) {
        this.data = data;
    }
}
