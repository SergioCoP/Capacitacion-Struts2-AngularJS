package com.utez.edu.mx.coursestruts.user;

import com.utez.edu.mx.coursestruts.person.BeanPerson;
import com.utez.edu.mx.coursestruts.rol.BeanRol;
import com.utez.edu.mx.coursestruts.rol.DaoRol;
import com.utez.edu.mx.coursestruts.status.BeanStatus;
import com.utez.edu.mx.coursestruts.userData.BeanUserData;
import com.utez.edu.mx.coursestruts.utils.ConnectionMysql;

import java.sql.*;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class DaoUser {
    Connection connection;
    PreparedStatement pstm;
    ResultSet rs;

    public List<BeanUserData> findAll () throws SQLException{
        List<BeanUserData> users = new ArrayList<>();

        try{
            connection = ConnectionMysql.getConnection();
            String script = "select *from userData;";
            pstm = connection.prepareStatement(script);
            rs = pstm.executeQuery();
            while(rs.next()){
                users.add(new BeanUserData(rs.getInt("idUser"),
                        rs.getInt("idPerson"),
                        rs.getInt("idRolUser"),
                        rs.getString("name"),
                        rs.getString("surname"),
                        rs.getString("lastname"),
                        rs.getString("birthday"),
                        rs.getString("phone"),
                        rs.getString("email"),
                        rs.getString("password"),
                        new BeanStatus(rs.getInt("idStatus"),rs.getString("name_status")),
                        new BeanRol(rs.getInt("Rol_id"),rs.getString("rolName"),new BeanStatus(rs.getInt("rolStatus"),rs.getString("name_status")))));
//                users.add(new BeanRol(rs.getInt("id"),
//                        rs.getString("name"),
//                        new BeanStatus(rs.getInt("id_status"),rs.getString("name_status"))));

            }

        }catch (SQLException e){
            e.printStackTrace();
        }finally {
            closeConnection();
        }

        return users;
    }

    public boolean createUser(BeanUserData useData) throws SQLException{
        boolean status = false;

        try{
            connection = ConnectionMysql.getConnection();
            CallableStatement statement = connection.prepareCall("{call registerUser(?,?,?,?,?,?,?,?,?)}");
            statement.setString(1,useData.getPname());
            statement.setString(2,useData.getPsurname());
            statement.setString(3, useData.getPlastname());
            statement.setString(4,useData.getPbirthday ());
            statement.setString(5, useData.getPphone());
            statement.setString(6, useData.getUemail());
            statement.setString(7, useData.getUpassword());
            statement.setInt(8,useData.getUser_status_id().getId());
            statement.setInt(9,useData.getRol().getId());


            status = statement.execute();
        }catch(SQLException e){
            e.printStackTrace();
        }finally{
            closeConnection();
        }
        return status;
    }

    public boolean updateUser(BeanUserData useData) throws SQLException{
        boolean status = false;

        try{
            connection = ConnectionMysql.getConnection();
            CallableStatement statement = connection.prepareCall("{call updateUser(?,?,?,?,?,?,?,?,?,?)}");
            statement.setInt(1,useData.getIdPerson());
            statement.setString(2,useData.getPname());
            statement.setString(3,useData.getPsurname());
            statement.setString(4, useData.getPlastname());
            statement.setString(5, useData.getPphone());
            statement.setInt(6,useData.getIdUser());
            statement.setString(7, useData.getUemail());
            statement.setString(8, useData.getUpassword());
            statement.setInt(9,useData.getUser_status_id().getId());
            statement.setInt(10,useData.getRol().getId());

            status = statement.execute();
        }catch(SQLException e){
            e.printStackTrace();
        }finally{
            closeConnection();
        }
        return status;
    }

    public boolean deleteUser(BeanUserData user) throws SQLException{
        System.out.println("" +user.getIdUser() + " " + user.getIdPerson());
        boolean status = false;
        try{
            connection = ConnectionMysql.getConnection();
            CallableStatement statement = connection.prepareCall("{call deleteUser(?,?)}");
            statement.setInt(1,user.getIdPerson());
            statement.setInt(2,user.getIdUser());
            status = statement.execute();
        }catch (SQLException  e){
            e.printStackTrace();
        }finally {
            closeConnection();
        }

        return status;
    }

    public void closeConnection() throws SQLException{
        if(rs != null){
            rs.close();
        }

        if(pstm != null){
            pstm.close();
        }

        if(connection != null){
            connection.close();
        }
    }

    public static void main(String[] args) throws SQLException, ParseException {
        DaoUser dao = new DaoUser();
        try{
            BeanUserData user = new BeanUserData();
            user.setIdUser(8);
            user.setIdPerson(8);
//            user.setPname("Sergio");
//            user.setPsurname("Cortes");
//            user.setPlastname("Popoca");
//            user.setPbirthday("2014-04-13");
//            user.setPphone("7779632514");
//            user.setUemail("sergiocortes518@gmail.com");
//            user.setUpassword("123456");
//
//            BeanStatus status = new BeanStatus();
//            status.setId(2);
//            status.setName("Activo");
//            user.setUser_status_id(status);
//
//            BeanRol rol = new BeanRol();
//            rol.setId(1);
//            rol.setName("Admin");
//            rol.setStatus(status);
//            BeanRol rol2 = new BeanRol();
//            rol2.setId(3);
//            rol2.setName("Alumno");
//            rol2.setStatus(status);
//            user.setRol(rol);
//            user.setRol(rol2);

//        BeanUser use = new BeanUser();
//        use.setEmail("sergiocortes518@gmail.com");
//        use.setPassword("123456");
//        use.setStatus(status);
            dao.deleteUser(user);
            //        BeanPerson per = new BeanPerson();
//        per.setName("Sergio");
//        per.setSurname("Cortes");
//        per.setLastname("Popoca");


//        SimpleDateFormat format = new SimpleDateFormat("yyyy/MM/dd");
//        java.util.Date utilDate = format.parse("2014/04/13");
//        java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
//        per.setBirthday("2014-04-13");
//        per.setPhone("777852147");




//            if () {
//                System.out.println("Exitoso");
//            }
            //        for (BeanRol rol : dao.findAll()) {
//            System.out.println("--DATOS--");
//            System.out.println(rol.getId());
//            System.out.println(rol.getName());
//        }
        }catch(SQLException e){
            e.printStackTrace();
        }




    }

}
