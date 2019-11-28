
package Model;

import Enity.Image;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;


public class Image_DAO {
    Connection connect = null;

    public Image_DAO(DBConnection db) {
        this.connect = db.getConnect();
    }
    
    public ArrayList<Image> selectAll(int idPar) {
        ArrayList<Image> arr_image = new ArrayList<>();
        String sql = "select * from quanlygiapha.image where idparentage=?";
        PreparedStatement pre;
        try {
            pre = connect.prepareStatement(sql);
            pre.setInt(1, idPar);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                int id=rs.getInt("id");
                String url = rs.getString("url");
                String note = rs.getString("note");
                Date dateCreate=rs.getDate("datecreate");
                int idParentage = rs.getInt("idparentage");
                Image ima=new Image(id, url, note, dateCreate, idParentage);
                arr_image.add(ima);
            }
        } catch (SQLException ex) { 
            Logger.getLogger(Image_DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return arr_image;
    }
    public int Insert(Image ima){
        int n=0;
        String sql="insert into quanlygiapha.image(url, note, datecreate, idparentage) "
                + " values(?, ?, ?, ?)";
        try {
            PreparedStatement pre=connect.prepareStatement(sql);
            pre.setString(1, ima.getUrl());
            pre.setString(2, ima.getNote());
            pre.setDate(3, ima.getDateCreate());
            pre.setInt(4, ima.getIdParentAge());
            n=pre.executeUpdate();
        } catch (SQLException ex) { 
            Logger.getLogger(Image_DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }
}
