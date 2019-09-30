
package Enity;


public class Image {
    private int idImage;
    private String url;
    private String note;
    private int idParentAge;

    public Image(int idImage, String url, String note, int idParentAge) {
        this.idImage = idImage;
        this.url = url;
        this.note = note;
        this.idParentAge = idParentAge;
    }

    public int getIdImage() {
        return idImage;
    }

    public void setIdImage(int idImage) {
        this.idImage = idImage;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public int getIdParentAge() {
        return idParentAge;
    }

    public void setIdParentAge(int idParentAge) {
        this.idParentAge = idParentAge;
    }
    
    
}
