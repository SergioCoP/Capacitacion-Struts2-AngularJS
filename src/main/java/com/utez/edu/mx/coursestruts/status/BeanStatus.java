package com.utez.edu.mx.coursestruts.status;

public class BeanStatus {
    private int id;
    private String name;

    public BeanStatus(){ }

    public BeanStatus(String name){
        this.name = name;
    }

public BeanStatus(int id, String name){
        this.id = id;
        this.name = name;
}
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}

/*
*
*
*
insert into rol values(1,"Admin");
insert into rol values(2,"SuperAdmin");
insert into status values(1,"Activo");
insert into status values(2,"Inactivo");
*
*
*
* */