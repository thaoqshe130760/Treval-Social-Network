/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Like;

/**
 *
 * @author thaoq
 */
public class LikeDao extends DBContext{
     public ArrayList<Like> getLikeOfPost(String pid) {
        ArrayList<Like> listCmt = new ArrayList<>();
        try {
            String sql = "SELECT [ID]\n"
                    + "      ,[UserID]\n"
                    + "      ,[PostID]\n"
                    + "  FROM [dbo].[Likes]\n"
                    + "where [PostID] = " + pid;
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                listCmt.add(new Like(rs.getString(1), rs.getString(2)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(CommentDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listCmt;
    }
     public boolean checkLike(String pid,String uid) {
        try {
            String sql = "SELECT [ID]\n"
                    + "      ,[UserID]\n"
                    + "      ,[PostID]\n"
                    + "  FROM [dbo].[Likes]\n"
                    + "where [PostID] = " + pid+" And [UserID]="+uid;
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
               return  true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(CommentDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public void addLike(String uid, String pid) {
        try {
            String sql = "INSERT INTO [dbo].[Likes]\n"
                    + "           ([UserID]\n"
                    + "           ,[PostID])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?)\n";
                 

            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, uid);
            ps.setString(2, pid);
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CommentDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
      public void deleteLike(String uid, String pid) {
        try {
            String sql =  "Delete From Likes where [UserID]=? and PostID=?";
                 

            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, uid);
            ps.setString(2, pid);
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CommentDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
      
}
