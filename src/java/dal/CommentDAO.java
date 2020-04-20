package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Comment;

public class CommentDAO extends DBContext {

    public ArrayList<Comment> getCommentOfPost(String pid) {
        ArrayList<Comment> listCmt = new ArrayList<>();
        try {
            String sql = "SELECT [ID]\n"
                    + "      ,[UserID]\n"
                    + "      ,[PostID]\n"
                    + "      ,[Text]\n"
                    +"       ,[CommentTime]\n"
                    + "  FROM [dbo].[Comment]\n"
                    + "where [PostID] = " + pid;
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                listCmt.add(new Comment(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(CommentDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listCmt;
    }

    public void addComment(String uid, String pid, String text) {
        try {
            String sql = "INSERT INTO [dbo].[Comment]\n"
                    + "           ([UserID]\n"
                    + "           ,[PostID]\n"
                    + "           ,[Text])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?\n"
                    + "           ,?)";

            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, uid);
            ps.setString(2, pid);
            ps.setString(3, text);
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CommentDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public static void main(String[] args) {
        new CommentDAO().addComment("3", "1", "hello");
    }
}
