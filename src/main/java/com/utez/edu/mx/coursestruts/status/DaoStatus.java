package com.utez.edu.mx.coursestruts.status;

import com.utez.edu.mx.coursestruts.rol.BeanRol;
import com.utez.edu.mx.coursestruts.rol.DaoRol;
import com.utez.edu.mx.coursestruts.utils.ConnectionMysql;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DaoStatus {
    Connection connection;
    ResultSet rs;
    PreparedStatement pstm;

    public List<BeanStatus> findAll() throws SQLException {
        List<BeanStatus> listStatus = new ArrayList<>();
        try{
            connection = ConnectionMysql.getConnection();
            String script = "SELECT status.id,status.name from status";
            pstm = connection.prepareStatement(script);
            rs = pstm.executeQuery();

            while(rs.next()){
                BeanStatus status = new BeanStatus();
                status.setId(rs.getInt("id"));
                status.setName(rs.getString("name"));
                listStatus.add(status);
            }
        }catch (SQLException e){
            e.printStackTrace();
        }finally {
            closeConnection();
        }

        return listStatus;
    }

    public static void main(String[] args) throws SQLException {
       DaoStatus dao = new DaoStatus();
        for (BeanStatus status: dao.findAll()) {
            System.out.println("----Datos----");
            System.out.println("-> " + status.getId());
            System.out.println("-> " + status.getName());
        }
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
}
