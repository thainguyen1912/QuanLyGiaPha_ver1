package Model;

import Enity.Individual;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Individual_DAO {

    Connection connect = null;

    public Individual_DAO(DBConnection db) {
        this.connect = db.getConnect();
    }

    public ResultSet SelectByParentageIdOrderBranch(int parentageid) {
        String sql = "select * from quanlygiapha.individual where idparentage='" + parentageid + "' order by branch";
        ResultSet rs = null;
        try {
            rs = connect.createStatement().executeQuery(sql);
        } catch (SQLException ex) {
            Logger.getLogger(Individual_DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rs;
    }
    public ArrayList<Individual> SelectByParentageIdOrderFloor(int parentageid) {
        ArrayList<Individual> arr_ind = new ArrayList<Individual>();
        String sql = "select * from quanlygiapha.individual where idparentage='" + parentageid + "' order by floor";
        ResultSet rs = null;
        try {
            rs = connect.createStatement().executeQuery(sql);
            while (rs.next()) {
                int id = rs.getInt(1);
                int idParentage = rs.getInt(2);
                String name = rs.getString(3);
                String wifeOrHusbandName = rs.getString(4);
                Date dateBirth = rs.getDate(5);
                Date dateDeath = rs.getDate(6);
                int childth = rs.getInt(7);
                int idFather = rs.getInt(8);
                int gender = rs.getInt(9);
                String brand = rs.getString(10);
                String avatar = rs.getString(11);
                String moreInfo = rs.getString(12);
                int floor=rs.getInt(13);
                Individual ind = new Individual(id, idParentage, name, wifeOrHusbandName, dateBirth, dateDeath, childth, idFather, gender, brand, avatar, moreInfo, floor);
                arr_ind.add(ind);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Individual_DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return arr_ind;
    }

    public int InsertSimple(Individual ind) {
        int n = 0;
        String sql = "insert into quanlygiapha.individual(idparentage, name, datebirth,"
                + " datedeath, childth, idfather, gender) values(?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement pre = connect.prepareStatement(sql);
            pre.setInt(1, ind.getIdParentAge());
            pre.setString(2, ind.getName());
            pre.setDate(3, ind.getDateBirth());
            pre.setDate(4, ind.getDateDeath());
            pre.setInt(5, ind.getChildth());
            pre.setInt(6, ind.getIdFather());
            pre.setInt(7, ind.getGender());
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(Individual_DAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return n;
    }
    public int InsertIndividual(Individual ind) {
        int n = 0;
        String sql = "insert into quanlygiapha.individual(idparentage, name, wifeorhusbandname, datebirth,"
                + " datedeath, childth, idfather, gender, branch, avatar, moreinfo, floor) values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement pre = connect.prepareStatement(sql);
            pre.setInt(1, ind.getIdParentAge());
            pre.setString(2, ind.getName());
            pre.setString(3, ind.getWifeOrHusbandName());
            pre.setDate(4, ind.getDateBirth());
            pre.setDate(5, ind.getDateDeath());
            pre.setInt(6, ind.getChildth());
            pre.setInt(7, ind.getIdFather());
            pre.setInt(8, ind.getGender());
            pre.setString(9, ind.getBranch());
            pre.setString(10, ind.getAvatar());
            pre.setString(11, ind.getMoreInfo());
            pre.setInt(12, ind.getFloor());
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(Individual_DAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return n;
    }

    public int getChildCount(int id) {
        int n = -1;
        String sql = "select count(id) as count from quanlygiapha.individual where idfather='" + id + "'";
        try {
            ResultSet rs = connect.createStatement().executeQuery(sql);
            n = rs.getInt("count");
        } catch (SQLException ex) {
            Logger.getLogger(Individual_DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public ArrayList<Individual> getListChildByIdFather(int idfar) {
        ArrayList<Individual> arr_ind = new ArrayList<Individual>();
        String sql = "select * from quanlygiapha.individual where idfather='" + idfar + "'";
        ResultSet rs = null;
        try {
            rs = connect.createStatement().executeQuery(sql);
            while (rs.next()) {
                int id = rs.getInt(1);
                int idParentage = rs.getInt(2);
                String name = rs.getString(3);
                String wifeOrHusbandName = rs.getString(4);
                Date dateBirth = rs.getDate(5);
                Date dateDeath = rs.getDate(6);
                int childth = rs.getInt(7);
                int idFather = rs.getInt(8);
                int gender = rs.getInt(9);
                String brand = rs.getString(10);
                String avatar = rs.getString(11);
                String moreInfo = rs.getString(12);
                int floor=rs.getInt(13);
                Individual ind = new Individual(id, idParentage, name, wifeOrHusbandName, dateBirth, dateDeath, childth, idFather, gender, brand, avatar, moreInfo, floor);
                arr_ind.add(ind);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Individual_DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return arr_ind;
    }
    public ArrayList<Individual> getListChildByIdParentage(int idpar) {
        ArrayList<Individual> arr_ind = new ArrayList<Individual>();
        String sql = "select * from quanlygiapha.individual where idparentage='" + idpar + "'";
        ResultSet rs = null;
        try {
            rs = connect.createStatement().executeQuery(sql);
            while (rs.next()) {
                int id = rs.getInt(1);
                int idParentage = rs.getInt(2);
                String name = rs.getString(3);
                String wifeOrHusbandName = rs.getString(4);
                Date dateBirth = rs.getDate(5);
                Date dateDeath = rs.getDate(6);
                int childth = rs.getInt(7);
                int idFather = rs.getInt(8);
                int gender = rs.getInt(9);
                String brand = rs.getString(10);
                String avatar = rs.getString(11);
                String moreInfo = rs.getString(12);
                int floor=rs.getInt(13);
                Individual ind = new Individual(id, idParentage, name, wifeOrHusbandName, dateBirth, dateDeath, childth, idFather, gender, brand, avatar, moreInfo, floor);
                arr_ind.add(ind);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Individual_DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return arr_ind;
    }
    
    public ArrayList<Individual> getListChildByIdParentageAvatar(int idpar) {
        ArrayList<Individual> arr_ind = new ArrayList<Individual>();
        String sql = "select * from quanlygiapha.individual where idparentage='" + idpar + "' and avatar is not null";
        ResultSet rs = null;
        try {
            rs = connect.createStatement().executeQuery(sql);
            while (rs.next()) {
                int id = rs.getInt(1);
                int idParentage = rs.getInt(2);
                String name = rs.getString(3);
                String wifeOrHusbandName = rs.getString(4);
                Date dateBirth = rs.getDate(5);
                Date dateDeath = rs.getDate(6);
                int childth = rs.getInt(7);
                int idFather = rs.getInt(8);
                int gender = rs.getInt(9);
                String brand = rs.getString(10);
                String avatar = rs.getString(11);
                String moreInfo = rs.getString(12);
                int floor=rs.getInt(13);
                Individual ind = new Individual(id, idParentage, name, wifeOrHusbandName, dateBirth, dateDeath, childth, idFather, gender, brand, avatar, moreInfo, floor);
                arr_ind.add(ind);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Individual_DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return arr_ind;
    }
    
    public Individual getIndividualById(int idIndividual){
        Individual ind=null;
        String sql="select * from quanlygiapha.individual where id='"+idIndividual+"'";
        try {
            ResultSet rs=connect.createStatement().executeQuery(sql);
            if(rs.next()){
                int id = rs.getInt(1);
                int idParentage = rs.getInt(2);
                String name = rs.getString(3);
                String wifeOrHusbandName = rs.getString(4);
                Date dateBirth = rs.getDate(5);
                Date dateDeath = rs.getDate(6);
                int childth = rs.getInt(7);
                int idFather = rs.getInt(8);
                int gender = rs.getInt(9);
                String brand = rs.getString(10);
                String avatar = rs.getString(11);
                String moreInfo = rs.getString(12);
                int floor=rs.getInt(13);
                ind = new Individual(id, idParentage, name, wifeOrHusbandName, dateBirth, dateDeath, childth, idFather, gender, brand, avatar, moreInfo, floor);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Individual_DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ind;
    }
    public ResultSet getResultSetById(int idIndividual){
        ResultSet rs=null;
        String sql="select * from quanlygiapha.individual where id='"+idIndividual+"'";
        try {
            rs=connect.createStatement().executeQuery(sql);
        } catch (SQLException ex) {
            Logger.getLogger(Individual_DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rs;
    }
    public int update(Individual ind){
        int n=0;
        String sql="update quanlygiapha.individual set name=?, wifeorhusbandname=?, datebirth=?, datedeath=?,childth=?, gender=?, avatar=?, moreinfo=? where id=?";
        try {
            PreparedStatement pre=connect.prepareStatement(sql);
            pre.setString(1, ind.getName());
            pre.setString(2, ind.getWifeOrHusbandName());
            pre.setDate(3, ind.getDateBirth());
            pre.setDate(4, ind.getDateDeath());
            pre.setInt(5, ind.getChildth());
            pre.setInt(6, ind.getGender());
            pre.setString(7, ind.getAvatar());
            pre.setString(8, ind.getMoreInfo());
            pre.setInt(9, ind.getIdIndividual());
            n=pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(Individual_DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }
    public int maxId(int parentageId){
        int n=0;
        String sql="select max(id) as 'maxid' from quanlygiapha.individual where idparentage='"+parentageId+"'";
        try {
            ResultSet rs=connect.createStatement().executeQuery(sql);
            if(rs.next()){
                n=rs.getInt("maxid");
            }
        } catch (SQLException ex) {
            Logger.getLogger(Individual_DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }
    public int updateBranch(String br, int id, int idparentage){
        int n=0;
        String sql="update quanlygiapha.individual set branch='"+br+"' where id='"+id+"' and idparentage='"+idparentage+"'";
        try {
            n=connect.createStatement().executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(Individual_DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }
    public boolean checkChild(int idFather){
        String sql="select id from quanlygiapha.individual where idfather='"+idFather+"'";
        try {
            ResultSet rs=connect.createStatement().executeQuery(sql);
            if(rs.next()) return true;
        } catch (SQLException ex) {
            Logger.getLogger(Individual_DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    public int deleteIndividual(int id){
        int n=0;
        String sql="delete from quanlygiapha.individual where id='"+id+"'";
        try {
            n=connect.createStatement().executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(Individual_DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }
    public int getFloorById(int id){
        int n=0;
        String sql="select floor from quanlygiapha.individual where id ='"+id+"'";
        try {
            ResultSet rs=connect.createStatement().executeQuery(sql);
            if(rs.next()){
                n=rs.getInt("floor");
            } 
        } catch (SQLException ex) {
            Logger.getLogger(Individual_DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }
    public ArrayList<String> getListAvatar(int idParentage){
        ArrayList<String> arr_avatar=new ArrayList<String>();
        String sql="select avatar from quanlygiapha.individual where idparentage ='"+idParentage+"'";
        try {
            ResultSet rs=connect.createStatement().executeQuery(sql);
            if(rs.next()){
                arr_avatar.add(rs.getString("avatar"));
            } 
        } catch (SQLException ex) {
            Logger.getLogger(Individual_DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return arr_avatar;
    }
}
