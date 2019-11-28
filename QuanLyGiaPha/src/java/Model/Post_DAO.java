package Model;

import Enity.Post;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Post_DAO {

    Connection connect = null;

    public Post_DAO(DBConnection db) {
        this.connect = db.getConnect();
    }

    public int insert(Post pos) {
        int n = 0;
        String sql = "insert into quanlygiapha.post(title, summary, detail, post.status, post.key, image, datepost, username) values(?, ?, ?, ?, ?, ?, ?, ?)";
//        trường status, key là từ khóa trong sql, thêm post.
        try {
            PreparedStatement pre = connect.prepareStatement(sql);
            pre.setString(1, pos.getTitle());
            pre.setString(2, pos.getSummary());
            pre.setString(3, pos.getDetail());
            pre.setString(4, pos.getStatus());
            pre.setString(5, pos.getKey());
            pre.setString(6, pos.getImage());
            pre.setDate(7, pos.getDatePost());
            pre.setString(8, pos.getUserName());
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(Post_DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }
    public int update(Post pos){
        int n=0;
        String sql="update quanlygiapha.post set title=?, summary=?, detail=?, post.status=?, post.key=?, image=? where id=?";
        try {
            PreparedStatement pre = connect.prepareStatement(sql);
            pre.setString(1, pos.getTitle());
            pre.setString(2, pos.getSummary());
            pre.setString(3, pos.getDetail());
            pre.setString(4, pos.getStatus());
            pre.setString(5, pos.getKey());
            pre.setString(6, pos.getImage());
            pre.setInt(7, pos.getIdPost());
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(Post_DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }
    public int updateStatus(int id, String status){
        int n=0;
        String sql="update quanlygiapha.post set post.status=? where id=?";
        try {
            PreparedStatement pre = connect.prepareStatement(sql);
            pre.setString(1, status);
            pre.setInt(2, id);
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(Post_DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }
    public int delete(int id){
        int n=0;
        String sql="delete from quanlygiapha.post where id=?";
        try {
            PreparedStatement pre = connect.prepareStatement(sql);
            pre.setInt(1, id);
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(Post_DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public ArrayList<Post> selectAll() {
        ArrayList<Post> arr_pos = new ArrayList<>();
        String sql = "select * from quanlygiapha.post";
        PreparedStatement pre;
        try {
            pre = connect.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                int id=rs.getInt("id");
                String title = rs.getString("title");
                String summary = rs.getString("summary");
                String detail = rs.getString("detail");
                String status = rs.getString("status");
                String key = rs.getString("key");
                String image = rs.getString("image");
                Date datePost = rs.getDate("datepost");
                String userName = rs.getString("username");
                Post pos = new Post(id,title, summary, detail, status, key, image, datePost, userName);
                arr_pos.add(pos);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Post_DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return arr_pos;
    }
    public ArrayList<Post> selectAllByUserName(String username) {
        ArrayList<Post> arr_pos = new ArrayList<>();
        String sql = "select * from quanlygiapha.post where username=?";
        PreparedStatement pre;
        try {
            pre = connect.prepareStatement(sql);
            pre.setString(1, username);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                int id=rs.getInt("id");
                String title = rs.getString("title");
                String summary = rs.getString("summary");
                String detail = rs.getString("detail");
                String status = rs.getString("status");
                String key = rs.getString("key");
                String image = rs.getString("image");
                Date datePost = rs.getDate("datepost");
                String userName = rs.getString("username");
                Post pos = new Post(id,title, summary, detail, status, key, image, datePost, userName);
                arr_pos.add(pos);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Post_DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return arr_pos;
    }
    public Post selectByID(int idPos) {
        Post pos=null;
        String sql = "select * from quanlygiapha.post where id=?";
        PreparedStatement pre;
        try {
            pre = connect.prepareStatement(sql);
            pre.setInt(1, idPos);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                int id=rs.getInt("id");
                String title = rs.getString("title");
                String summary = rs.getString("summary");
                String detail = rs.getString("detail");
                String status = rs.getString("status");
                String key = rs.getString("key");
                String image = rs.getString("image");
                Date datePost = rs.getDate("datepost");
                String userName = rs.getString("username");
                pos = new Post(id,title, summary, detail, status, key, image, datePost, userName);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Post_DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return pos;
    }
    
    public ArrayList<Post> getListPostByStatusAndKey(String sta, String k){
        ArrayList<Post> arr_pos=new ArrayList<>();
        String sql="select * from quanlygiapha.post where post.status=? and post.key=?";
        try {
            PreparedStatement pre=connect.prepareStatement(sql);
            pre.setString(1, sta);
            pre.setString(2, k);
            ResultSet rs=pre.executeQuery();
            while(rs.next()){
                int id=rs.getInt("id");
                String title = rs.getString("title");
                String summary = rs.getString("summary");
                String detail = rs.getString("detail");
                String status = rs.getString("status");
                String key = rs.getString("key");
                String image = rs.getString("image");
                Date datePost = rs.getDate("datepost");
                String userName = rs.getString("username");
                Post pos = new Post(id,title, summary, detail, status, key, image, datePost, userName);
                arr_pos.add(pos);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Post_DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return arr_pos;
    }

//    -----------------------------------------------------------------------------------------------------
    public String getUser(int id) {
        String userName = "";
        String sql ="select username from quanlygiapha.post where id=?";
        try {
            PreparedStatement pre = connect.prepareStatement(sql);
            pre.setInt(1, id);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                userName = rs.getString("username");
            }

        } catch (SQLException ex) {
            Logger.getLogger(Post_DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return userName;
    }
    public Post getPostDetail(int id){
        Post ps=null;
        String sql= "select * from quanlygiapha.post where quanlygiapha.post.id=?";
        ResultSet rs=null;
        try {
            PreparedStatement pre=connect.prepareStatement(sql);
            pre.setInt(1, id);
            rs=pre.executeQuery();
            if (rs.next()) {
                int iD=rs.getInt("id");
                String title=rs.getString("title");
                String summary=rs.getString("summary");
                String detail=rs.getString("detail");
                String status=rs.getString("status");
                String key=rs.getString("key");
                String image = rs.getString("image");
                Date datePost=rs.getDate("datePost");
                String username=rs.getString("username");
                ps=new Post(iD, title, summary, detail, status, key, image, datePost, username);
                
                
                
                
               
            }

        } catch (SQLException ex) {
            Logger.getLogger(Post_DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ps;
    }
}
