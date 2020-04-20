
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.User_Photo;

/**
 *
 * @author thaoq
 */
public class User_PhotoDAO extends DBContext{
    public User_Photo getUser_PhotoByUid(String uid) {
         User_Photo p = null;
        try {
            String sql = "select * from UserPhoto where UserID = " + uid;
            System.out.println(sql);
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {                
                p = new User_Photo(rs.getString(1), rs.getString(2));
            }
        } catch (SQLException ex) {
            Logger.getLogger(PhotoDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return p;
    }
    
    public static void main(String[] args) {
        System.out.println(new  User_PhotoDAO().getUser_PhotoByUid("3"));
    }
}
