
package Model;

import Enity.Parentage;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;


public class Parentage_DAO {
    Connection connect=null;
    
    public Parentage_DAO(DBConnection db){
        connect = db.getConnect();
    }
    
    public List<Parentage> getAllParentAge(){
        List<Parentage> list_par=new ArrayList<Parentage>();
        String sql="select * from quanlygiapha.parentage";
        ResultSet rs=null;
        try {
            rs=connect.createStatement().executeQuery(sql);
            while(rs.next()){
                int id=rs.getInt("id");
                String name=rs.getString("name");
                String ancestor =rs.getString("ancestor");
                String address=rs.getString("address");
                Date anniversary=rs.getDate("anniversary");
                String history=rs.getString("history");
                String note=rs.getString("note");
                Date date=rs.getDate("datecreate");
                String headName=rs.getString("headname");
                String headAddress=rs.getString("headaddress");
                String headNumberPhone=rs.getString("headnumberphone");
                String userName=rs.getString("username");
                Parentage par=new Parentage(id,name, ancestor, address, anniversary, history, note, date, headName, headAddress, headNumberPhone, userName);
                list_par.add(par);
            }
        } catch (SQLException ex) { 
            Logger.getLogger(Parentage_DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list_par;
    }
    
    public Parentage getOneParentAge(String username){
        Parentage par=null;
        String sql="select * from quanlygiapha.parentage where username='"+username+"'";
        ResultSet rs=null;
        try {
            rs=connect.createStatement().executeQuery(sql);
            if(rs.next()){
                int id=rs.getInt("id");
                String name=rs.getString("name");
                String ancestor =rs.getString("ancestor");
                String address=rs.getString("address");
                Date anniversary=rs.getDate("anniversary");
                String history=rs.getString("history");
                String note=rs.getString("note");
                Date date=rs.getDate("datecreate");
                String headName=rs.getString("headname");
                String headAddress=rs.getString("headaddress");
                String headNumberPhone=rs.getString("headnumberphone");
                String userName=rs.getString("username");
                par=new Parentage(id,name, ancestor, address, anniversary, history, note, date, headName, headAddress, headNumberPhone, userName);
            }
        } catch (SQLException ex) { 
            Logger.getLogger(Parentage_DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return par;
    }
    
    public int Insert(Parentage par){
        int n=0;
        String sql="insert into quanlygiapha.parentage(name, ancestor, address, anniversary, history, note, datecreate, headname, headaddress, headnumberphone, username) "
                + " values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement pre=connect.prepareStatement(sql);
            pre.setString(1, par.getName());
            pre.setString(2, par.getAncestor());
            pre.setString(3, par.getAddress());
            pre.setDate(4, par.getAnniversary());
            pre.setString(5, par.getHistory());
            pre.setString(6, par.getNote());
            pre.setDate(7, par.getDateCreate());
            pre.setString(8, par.getHeadName());
            pre.setString(9, par.getHeadAddress());
            pre.setString(10, par.getHeadNumberPhone());
            pre.setString(11, par.getUserName());
            n=pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(Parentage_DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }
    
    public int Update(Parentage par){
        int n=0;
        String sql="update quanlygiapha.parentage set name=?, ancestor=?, address=?, anniversary=?, history=?, note=?, "
                + "datecreate=?, headname=?, headaddress=?, headnumberphone=? where username=?";
        try {
            PreparedStatement pre=connect.prepareStatement(sql);
            pre.setString(1, par.getName());
            pre.setString(2, par.getAncestor());
            pre.setString(3, par.getAddress());
            pre.setDate(4, par.getAnniversary());
            pre.setString(5, par.getHistory());
            pre.setString(6, par.getNote());
            pre.setDate(7, par.getDateCreate());
            pre.setString(8, par.getHeadName());
            pre.setString(9, par.getHeadAddress());
            pre.setString(10, par.getHeadNumberPhone());
            pre.setString(11, par.getUserName());
            n=pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(Parentage_DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }
    
    public int getNumber(String idp)
    {
        return 0;
    }
}
