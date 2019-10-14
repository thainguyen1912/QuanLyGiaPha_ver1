
package PrintfTree;

import Enity.Individual;
import Model.DBConnection;
import Model.Individual_DAO;
import java.util.ArrayList;

public class PrintTree {
    
    public PrintTree() {
        
    }
    
    
    DBConnection db=new DBConnection();
    Individual_DAO ind_dao=new Individual_DAO(db);
    ArrayList<Individual> arr_default=ind_dao.getListChildByIdFather(1);
    
    public String printTree(ArrayList<Individual> arr_ind){
        int k=0;
        k++;
        
        
        String html="";
        int childcount=arr_ind.size();
        if(childcount==0) return"";
        if(childcount>=1 && k<=3){
            for(int i=1;i<=childcount;i++){
            html+="<li>\n" +
"                            <a href=\"#\">"+ arr_ind.get(i-1).getName() +"</a>\n" +
"                            <ul>\n" +
//                                this.printTree(1, arr_ind)+
//"                                <li>\n" +
//"                                    <a href=\"#\">Grand Child</a>\n" +
//"                                    <ul>\n" +
//"                                        <li>\n" +
//"                                            <a href=\"#\">Grand Grand Child</a>\n" +
//"                                        </li>\n" +
//"                                    </ul>\n" +
//"                                </li>\n" +
//"                                <li>\n" +
//"                                    <a href=\"#\">Grand Child</a>\n" +
//"                                </li>\n" +
"                            </ul>\n" +
"                   </li>\n";
            }
        }
        return html;
    }
}
