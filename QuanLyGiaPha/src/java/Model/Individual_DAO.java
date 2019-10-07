
package Model;

import Enity.Individual;
import java.sql.Connection;


public class Individual_DAO {
    Connection connect=null;
    public Individual_DAO(DBConnection db){
        this.connect=db.getConnect();
    }
    public int Insert(Individual ind){
        int n=0;
        String sql="insert into "
    }
}
