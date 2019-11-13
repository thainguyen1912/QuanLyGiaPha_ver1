
package Model;

import Enity.Post;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;


public class Post_DAO {
    Connection connect = null;

    public Post_DAO(DBConnection db) {
        this.connect = db.getConnect();
    }
    
    public int insert(Post pos){
        int n=0;
        String sql="insert into quanlygiapha.post(title, summary, detail, status, key, image, datepost, idindividual) values(?, ?, ?, ?, ?, ?, ?, ?) ";
        try {
            PreparedStatement pre=connect.prepareStatement(sql);
            pre.setString(1, pos.getTitle());
            pre.setString(2, pos.getSummary());
            pre.setString(3, pos.getDetail());
            pre.setString(4, pos.getStatus());
            pre.setString(5, pos.getKey());
            pre.setString(6, pos.getImage());
            pre.setDate(7, pos.getDatePost());
            pre.setInt(4, pos.getIdIndividual());
            n=pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(Post_DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }
    
    public ArrayList<Post> selectAll(){
        ArrayList<Post> arr_pos=new ArrayList<>();
        String sql="select * from quanlygiapha.post";
        PreparedStatement pre;
        try {
            pre = connect.prepareStatement(sql);
            ResultSet rs=pre.executeQuery();
            while(rs.next()){
                String title=rs.getString("title");
                String summary=rs.getString("summary");
                String detail=rs.getString("detail");
                int idIndividual=rs.getInt("idindividual");
                int idParentage=rs.getInt("idparentage");
            }
        } catch (SQLException ex) {
            Logger.getLogger(Post_DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return arr_pos;
        
    }
}
