/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package baseDatos;

import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

public class baseDatos {
    private Connection con_mysql;
    public Statement query;

    public baseDatos() {
    }
    
    public void conectar() {
        String conetc = "jdbc:mysql://localhost:3306/sistema_matricula";
        System.out.print(conetc);
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con_mysql = DriverManager.getConnection(conetc,"root","");
            query = con_mysql.createStatement();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public void desconectar(){
        try {
            query.close();
            con_mysql.close();
        } catch (SQLException ex) {
            Logger.getLogger(baseDatos.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public void commit(){
        try {
            con_mysql.commit();
        } catch (SQLException ex) {
            Logger.getLogger(baseDatos.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}

