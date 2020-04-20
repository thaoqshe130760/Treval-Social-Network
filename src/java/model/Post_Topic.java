
package model;

public class Post_Topic {
    private String id;
    private String pid;
    private String topic;

    public Post_Topic() {
    }

    public Post_Topic(String id, String pid, String topic) {
        this.id = id;
        this.pid = pid;
        this.topic = topic;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getPid() {
        return pid;
    }

    public void setPid(String pid) {
        this.pid = pid;
    }

    public String getTopic() {
        return topic;
    }

    public void setTopic(String topic) {
        this.topic = topic;
    }
    
}
