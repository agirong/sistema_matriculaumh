/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package baseDatos;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author irvin
 */
public class bdSegura {
    private static final String DB_DRIVER = "com.mysql.jdbc.Driver";
    private static final String DB_SERVER = "jdbc:mysql://localhost:3306/sistema_matricula";
    private static final String DB_USER = "root";
    private static final String DB_PASS = "";
    
    public Connection conSeg() {
        Connection conn = null;
        try {
            
            Class.forName(DB_DRIVER).newInstance();
            conn = DriverManager.getConnection(DB_SERVER, DB_USER, DB_PASS);
            
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(bdSegura.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(bdSegura.class.getName()).log(Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            Logger.getLogger(bdSegura.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            Logger.getLogger(bdSegura.class.getName()).log(Level.SEVERE, null, ex);
        }
        return conn;
    }
        
  
}
