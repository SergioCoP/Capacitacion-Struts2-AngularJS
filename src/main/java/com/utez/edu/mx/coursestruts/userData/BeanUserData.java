package com.utez.edu.mx.coursestruts.userData;

import com.utez.edu.mx.coursestruts.person.BeanPerson;
import com.utez.edu.mx.coursestruts.rol.BeanRol;
import com.utez.edu.mx.coursestruts.status.BeanStatus;

import java.util.List;

public class BeanUserData {

    private int idUser,idPerson,IdRolUser;
    private String pname,psurname,plastname,pbirthday,pphone;
    private String uemail,upassword;
    private BeanStatus user_status_id;
    private BeanRol rol;

    public BeanUserData() {
    }

    public BeanUserData(int idUser, int idPerson, int idRolUser, String pname, String psurname, String plastname, String pbirthday, String pphone, String uemail, String upassword, BeanStatus user_status_id, BeanRol rol) {
        this.idUser = idUser;
        this.idPerson = idPerson;
        this.IdRolUser = idRolUser;
        this.pname = pname;
        this.psurname = psurname;
        this.plastname = plastname;
        this.pbirthday = pbirthday;
        this.pphone = pphone;
        this.uemail = uemail;
        this.upassword = upassword;
        this.user_status_id = user_status_id;
        this.rol = rol;
    }

    public int getIdUser() {
        return idUser;
    }

    public void setIdUser(int idUser) {
        this.idUser = idUser;
    }

    public int getIdPerson() {
        return idPerson;
    }

    public void setIdPerson(int idPerson) {
        this.idPerson = idPerson;
    }

    public int getIdRolUser() {
        return IdRolUser;
    }

    public void setIdRolUser(int idRolUser) {
        IdRolUser = idRolUser;
    }

    public String getPname() {
        return pname;
    }

    public void setPname(String pname) {
        this.pname = pname;
    }

    public String getPsurname() {
        return psurname;
    }

    public void setPsurname(String psurname) {
        this.psurname = psurname;
    }

    public String getPlastname() {
        return plastname;
    }

    public void setPlastname(String plastname) {
        this.plastname = plastname;
    }

    public String getPbirthday() {
        return pbirthday;
    }

    public void setPbirthday(String pbirthday) {
        this.pbirthday = pbirthday;
    }

    public String getPphone() {
        return pphone;
    }

    public void setPphone(String pphone) {
        this.pphone = pphone;
    }

    public String getUemail() {
        return uemail;
    }

    public void setUemail(String uemail) {
        this.uemail = uemail;
    }

    public String getUpassword() {
        return upassword;
    }

    public void setUpassword(String upassword) {
        this.upassword = upassword;
    }

    public BeanStatus getUser_status_id() {
        return user_status_id;
    }

    public void setUser_status_id(BeanStatus user_status_id) {
        this.user_status_id = user_status_id;
    }

    public BeanRol getRol() {
        return rol;
    }

    public void setRol(BeanRol rol) {
        this.rol = rol;
    }
}
