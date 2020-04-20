
package model;


public class Toppic {
    private String tid;
    private String name;
    private String img;

    public Toppic() {
    }

    public Toppic(String tid, String name, String img) {
        this.tid = tid;
        this.name = name;
        this.img = img;
    }

    public String getTid() {
        return tid;
    }

    public void setTid(String tid) {
        this.tid = tid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

   
    
    
}
