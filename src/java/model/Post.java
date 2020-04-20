
package model;

import dal.UserDAO;


public class Post {
    private String pid;
    private String uid;
    private String img;
    private String text;
    private String postingDate;
    private String title;

    public Post() {
    }

    public Post(String pid, String uid, String img, String text, String postingDate, String title) {
        this.pid = pid;
        this.uid = uid;
        this.img = img;
        this.text = text;
        this.postingDate = postingDate;
        this.title = title;
    }

    public String getPid() {
        return pid;
    }

    public void setPid(String pid) {
        this.pid = pid;
    }

    public String getUid() {
        return uid;
    }

    public void setUid(String uid) {
        this.uid = uid;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public String getPostingDate() {
        return postingDate;
    }

    public void setPostingDate(String postingDate) {
        this.postingDate = postingDate;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

   
    
    public User getUser() {
        UserDAO udb = new UserDAO();
        return udb.getUserByID(getUid());
    }


    
    
    
}
