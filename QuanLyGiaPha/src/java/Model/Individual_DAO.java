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

    public ResultSet SelectByParentageId(int parentageid) {
        String sql = "select * from quanlygiapha.individual where idparentage='" + parentageid + "' order by branch";
        ResultSet rs = null;
        try {
            rs = connect.createStatement().executeQuery(sql);
        } catch (SQLException ex) {
            Logger.getLogger(Individual_DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rs;
    }

    public int Insert(Individual ind) {
        int n = 0;
        String sql = "insert into quanlygiapha.individual(idparentage, name, datebirth, status,"
                + " datedeath, childth, idfather, fatherfloor, gender) values(?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement pre = connect.prepareStatement(sql);
            pre.setInt(1, ind.getIdParentAge());
            pre.setString(2, ind.getName());
            pre.setDate(3, ind.getDateBirth());
            pre.setInt(4, ind.getStatus());
            pre.setDate(5, ind.getDateDeath());
            pre.setInt(6, ind.getChildth());
            pre.setInt(7, ind.getIdFather());
            pre.setInt(8, ind.getFatherFloor());
            pre.setInt(9, ind.getGender());
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
                int status = rs.getInt(6);
                Date dateDeath = rs.getDate(7);
                int childth = rs.getInt(8);
                int idFather = rs.getInt(9);
                int fatherFloor = rs.getInt(10);
                int gender = rs.getInt(11);
                String brand = rs.getString(12);
                String avatar = rs.getString(13);
                String moreInfo = rs.getString(14);
                Individual ind = new Individual(id, idParentage, name, wifeOrHusbandName, dateBirth, status, dateDeath, childth, idFather, fatherFloor, gender, brand, avatar, moreInfo);
                arr_ind.add(ind);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Individual_DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return arr_ind;
    }
}
