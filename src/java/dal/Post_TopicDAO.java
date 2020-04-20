package dal;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Post_TopicDAO extends DBContext {

    public void addPost_Topic(String pid, String tid) {
        try {
            String sql = "INSERT INTO [dbo].[TopicOfPoster]\n"
                    + "           ([TopicID]\n"
                    + "           ,[PostID])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?)";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, tid);
            ps.setString(2, pid);
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(Post_TopicDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public static void main(String[] args) {
        new Post_TopicDAO().addPost_Topic("10", "3");
    }
}
