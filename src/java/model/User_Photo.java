
package model;

import dal.PhotoDao;
import dal.UserDAO;

/**
 *
 * @author thaoq
 */
public class User_Photo {
    private String uid;
    private String pid;

    public User_Photo() {
    }

    public User_Photo(String uid, String pid) {
        this.uid = uid;
        this.pid = pid;
    }

    public String getUid() {
        return uid;
    }

    public void setUid(String uid) {
        this.uid = uid;
    }

    public String getPid() {
        return pid;
    }

    public void setPid(String pid) {
        this.pid = pid;
    }
    
    public Photo getPhoto() {
        PhotoDao photoDB = new PhotoDao();
        Photo p = photoDB.getPhotoByID(getPid());
        return p;
    }
    
    public User getUser() {
        UserDAO userDB = new UserDAO();
        User u = userDB.getUserByID(getUid());
        return u;
    }
}
