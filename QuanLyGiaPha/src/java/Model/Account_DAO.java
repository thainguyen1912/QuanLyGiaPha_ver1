
package Model;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;


public class Account_DAO {
    Connection connect=null;
    
    
    public Account_DAO(DBConnection db){
        this.connect=db.getConnect();
    }
    
    public ResultSet getAllAccount(){
        String sql="select * from account";
        ResultSet rs=null;
        
        try {
            rs=connect.createStatement().executeQuery(sql);
        } catch (SQLException ex) {
            Logger.getLogger(Account_DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rs;
    }
//    public static void main(String[] args) {
//        DBConnection db=new DBConnection();
//        Account_DAO acc=new Account_DAO(db);
//        ResultSet rs=acc.getAllAccount();
//        try {
//            while(rs.next()){
//                System.out.println(rs.getString("username"));
//            }
//        } catch (SQLException ex) {
//            Logger.getLogger(Account_DAO.class.getName()).log(Level.SEVERE, null, ex);
//        }
//    }
}
