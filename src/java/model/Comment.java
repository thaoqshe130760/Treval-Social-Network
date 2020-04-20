
package model;

import dal.UserDAO;

public class Comment {
    private String cid;
    private String uid;
    private String pid;
    private String text;
    private String CommentTime;

    public Comment() {
    }

    public Comment(String cid, String uid, String pid, String text, String CommentTime) {
        this.cid = cid;
        this.uid = uid;
        this.pid = pid;
        this.text = text;
        this.CommentTime = CommentTime;
    }

  

    public String getCid() {
        return cid;
    }

    public void setCid(String cid) {
        this.cid = cid;
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

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public String getCommentTime() {
        return CommentTime;
    }

    public void setCommentTime(String CommentTime) {
        this.CommentTime = CommentTime;
    }
    
    
    
    public User getUser() {
        UserDAO udb = new UserDAO();
        return udb.getUserByID(getUid());
    }
    
}
