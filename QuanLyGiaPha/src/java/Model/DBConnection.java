package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;


public class DBConnection {
    Connection connect=null;

    public Connection getConnect() {
        return connect;
    }
    
    public DBConnection(){
        String driver = "com.mysql.jdbc.Driver";
        String connection = "jdbc:mysql://localhost:3306/quanlygiapha";
        String user = "root";
        String password = "2411";
        
        try {
            Class.forName(driver);
            connect=DriverManager.getConnection(connection, user, password);
            System.out.println(connect);
                
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DBConnection.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(DBConnection.class.getName()).log(Level.SEVERE, null, ex);
        }
    } 

}