package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Post;

public class PostDAO extends DBContext {

    public ArrayList<Post> getPosts() {
        ArrayList<Post> listUser = new ArrayList<>();
        try {
            String sql = "SELECT [ID]\n"
                    + "      ,[UserID]\n"
                    + "      ,[Image]\n"
                    + "      ,[Text]\n"
                    + "      ,[PostingDate]\n"
                    + "       ,[Title]"
                    + "  FROM [dbo].[Poster] where ID!=38 and ID!=40";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                System.out.println("id:" + rs.getString(1));
                listUser.add(new Post(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(PostDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listUser;
    }

    public void deletePost(String pid) {

        try {
            String sql = "DELETE FROM [dbo].[Poster]\n"
                    + "      WHERE [Poster].ID = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, pid);
            ps.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(PostDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public Post getPost(String pid) {
        try {
            String sql = "SELECT [ID]\n"
                    + "      ,[UserID]\n"
                    + "      ,[Image]\n"
                    + "      ,[Text]\n"
                    + "      ,[PostingDate]\n"
                    + "      ,[Title]\n"
                    + "  FROM [dbo].[Poster]\n"
                    + "  where [Poster].ID = " + pid;
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Post p = new Post(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6));
                return p;
            }
        } catch (SQLException ex) {
            Logger.getLogger(PostDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    private String loadTimeSystem() {
        Date date = GregorianCalendar.getInstance().getTime();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        return sdf.format(date);
    }

    public void addPost(String uid, String img, String text, String title) {
        try {
            String sql = "INSERT INTO [dbo].[Poster]\n"
                    + "           ([UserID]\n"
                    + "           ,[Image]\n"
                    + "           ,[Text]\n"
                    + "           ,[PostingDate]\n"
                    + "           ,[Title])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?\n"
                    + "           ,N'" + text + "'\n"
                    + "           ,?\n"
                    + "           ,N'" + title + "')";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, uid);
            ps.setString(2, img);
            ps.setString(3, loadTimeSystem());
            ResultSet rs = ps.executeQuery();

        } catch (SQLException ex) {
            Logger.getLogger(PostDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public ArrayList<Post> getPostsByTopic(String tip) {
        ArrayList<Post> listUser = new ArrayList<>();
        try {
            String sql = "SELECT        Poster.*, Topic.ID AS tip\n"
                    + "FROM            Poster INNER JOIN\n"
                    + "                         TopicOfPoster ON Poster.ID = TopicOfPoster.PostID INNER JOIN\n"
                    + "                         Topic ON TopicOfPoster.TopicID = Topic.ID \n"
                    + "where Topic.ID = " + tip;
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                System.out.println("id:" + rs.getString(1));
                listUser.add(new Post(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(PostDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listUser;
    }

    public String getPidCurrent() {
        try {
            String sql = "SELECT IDENT_CURRENT('poster')";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getString(1);
            }

        } catch (SQLException ex) {
            Logger.getLogger(PostDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public static void main(String[] args) {
        System.out.println(new PostDAO().getPidCurrent());
    }

}
