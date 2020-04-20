
package model;

/**
 *
 * @author thaoq
 */
public class Photo {
    private String id;
    private String photoName;
    private String title;

    public Photo() {
    }

    public Photo(String id, String photoName, String title) {
        this.id = id;
        this.photoName = photoName;
        this.title = title;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getPhotoName() {
        return photoName;
    }

    public void setPhotoName(String photoName) {
        this.photoName = photoName;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }
    
    
}
