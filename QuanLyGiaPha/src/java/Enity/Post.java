
package Enity;


public class Post {
    private int idPost;
    private String title;
    private String summary;
    private String detail;
    private String status;
    private int idIndividual;
    private int idParentage;

    public Post(int idPost, String title, String summary, String detail, String status, int idIndividual, int idParentage) {
        this.idPost = idPost;
        this.title = title;
        this.summary = summary;
        this.detail = detail;
        this.status = status;
        this.idIndividual = idIndividual;
        this.idParentage = idParentage;
    }

    

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getIdParentage() {
        return idParentage;
    }

    public void setIdParentage(int idParentage) {
        this.idParentage = idParentage;
    }

    public int getIdPost() {
        return idPost;
    }

    public void setIdPost(int idPost) {
        this.idPost = idPost;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getSummary() {
        return summary;
    }

    public void setSummary(String summary) {
        this.summary = summary;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    public int getIdIndividual() {
        return idIndividual;
    }

    public void setIdIndividual(int idIndividual) {
        this.idIndividual = idIndividual;
    }
    
    
}
