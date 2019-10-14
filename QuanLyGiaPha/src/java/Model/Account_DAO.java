
package Model;

import Enity.Account;
import java.sql.Connection;
import java.sql.PreparedStatement;
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
    public Account getOneAccount(String username, String password){
        Account acc=null;
        String sql="select * from quanlygiapha.account where username='"+username+"' and password='"+password+"'";
        ResultSet rs=null;
        try {
            rs=connect.createStatement().executeQuery(sql);
            if(rs==null) System.out.println("null");
            if(rs.next()){
                String UserName=rs.getString("username");
                String PassWord=rs.getString("password");
                int Role=rs.getInt("role");
                acc=new Account(UserName, PassWord, Role);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Account_DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return acc;
    }
    public int Insert(Account acc){
        int n=0;
        String sql="insert into quanlygiapha.account values(?, ?, ?)";
        PreparedStatement pre;
        try {
            pre = connect.prepareStatement(sql);
            pre.setString(1, acc.getUserName());
            pre.setString(2, acc.getPassWord());
            pre.setInt(3, acc.getRole());
            n=pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(Account_DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }
    public Account getOneAccountByUserName(String username){
        Account acc=null;
        String sql="select * from quanlygiapha.account where username='"+username+"'";
        ResultSet rs=null;
        try {
            rs=connect.createStatement().executeQuery(sql);
            if(rs.next()){
                String UserName=rs.getString("username");
                String PassWord=rs.getString("password");
                int Role=rs.getInt("role");
                acc=new Account(UserName, PassWord, Role);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Account_DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return acc;
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
