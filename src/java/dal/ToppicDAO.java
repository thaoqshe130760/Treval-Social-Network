
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Toppic;

public class ToppicDAO extends DBContext{
    public ArrayList<Toppic> getToppic() {
       ArrayList<Toppic> listToppic = new ArrayList<>();
        try {
            String sql = "select * from Topic";
            PreparedStatement ps = connection.prepareStatement(sql);
           ResultSet rs = ps.executeQuery();
            while (rs.next()) {         
                listToppic.add(new Toppic(rs.getString(1), rs.getString(2), rs.getString(3)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(ToppicDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listToppic;
    }
    public ArrayList<Toppic> getToppicByPost(String pid) {
       ArrayList<Toppic> listToppic = new ArrayList<>();
        try {
            String sql = "SELECT        Topic.ID, Topic.Text, Topic.ImageName, TopicOfPoster.PostID\n" +
"FROM            Topic INNER JOIN\n" +
"                         TopicOfPoster ON Topic.ID = TopicOfPoster.TopicID where TopicOfPoster.PostID="+pid;
            PreparedStatement ps = connection.prepareStatement(sql);
            
           ResultSet rs = ps.executeQuery();
            while (rs.next()) {         
                listToppic.add(new Toppic(rs.getString(1), rs.getString(2), rs.getString(3)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(ToppicDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listToppic;
    }
    
    public static void main(String[] args) {
        System.out.println(new ToppicDAO().getToppicByPost("46").size());
   }
}
