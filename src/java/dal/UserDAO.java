package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.User;

public class UserDAO extends DBContext {

    public ArrayList<User> getUser() {
        ArrayList<User> listUser = new ArrayList<>();
        try {
            String sql = "select * from [User]";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                System.out.println("id:" + rs.getString(1));
                listUser.add(new User(rs.getString(1), rs.getBoolean(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listUser;
    }

    public void addUser(String name, String username, String password) {
        try {
            String sql = "INSERT INTO [dbo].[User]\n"
                    + "           ([Username]\n"
                    + "           ,[Password]\n"
                    + "           ,[DisplayName])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?\n"
                    + "           ,?)";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);
            ps.setString(3, name);
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public User getUserByID(String uid) {
        User p = null;
        try {
            String sql = "select * from [User] where [User].ID = " + uid;
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                p = new User(uid, rs.getBoolean(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7));
            }
        } catch (SQLException ex) {
            Logger.getLogger(PhotoDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return p;
    }
 public String getname(String uid) {
        String name=null;
        try {
            String sql = "select [DisplayName] from [User] where [User].ID = " + uid;
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                name=rs.getString(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(PhotoDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return name;
    }

    public void updateUser(String uid, String name, String dob, String hobbies) {
        try {
            String sql = "UPDATE [dbo].[User]\n"
                    + "    SET  [DisplayName] = ?\n"
                    + "      ,[DateOfbirth] = ?\n"
                    + "      ,[Hobbies] = ?\n"
                    + " WHERE [User].ID = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, dob);
            ps.setString(3, hobbies);
            ps.setString(4, uid);
            ps.executeUpdate();
            
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }

    public static void main(String[] args) {
//        System.out.println(new UserDAO().getUser());

        System.out.println(new UserDAO().getUserByID("datdt"));
    }
}
