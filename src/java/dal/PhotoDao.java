package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Photo;

/**
 *
 * @author thaoq
 */
public class PhotoDao extends DBContext {

    public Photo getPhotoByID(String pid) {
        Photo p = null;
        try {
            String sql = "select * from Photo where Photo.ID = " + pid;
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                p = new Photo(pid, rs.getString(2), rs.getString(3));
            }
        } catch (SQLException ex) {
            Logger.getLogger(PhotoDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return p;
    }

    public void updatePhoto(String pid, String photoName, String title) {
        try {
            String sql = "UPDATE [dbo].[Photo]\n"
                    + "   SET [PhotoName] = ?\n"
                    + ",[Title] = ?"
                    + " WHERE [Photo].ID = ?";

            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, photoName);
            ps.setString(2, title);
            ps.setString(3, pid);
            ps.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(PhotoDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void updatePhotoTitle(String pid, String photoTitle) {
        try {
            String sql = "UPDATE [dbo].[Photo]\n"
                    + "   SET \n"
                    + "      [Title] = ?\n"
                    + " WHERE [Photo].ID = ?";

            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, photoTitle);
            ps.setString(2, pid);
            ps.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(PhotoDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static void main(String[] args) {
//        System.out.println(new UserDAO().getUser());

    }
}
