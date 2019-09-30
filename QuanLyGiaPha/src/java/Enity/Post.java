
package Enity;


public class Post {
    private int idPost;
    private String title;
    private String summary;
    private String detail;
    private int idIndividual;

    public Post(int idPost, String title, String summary, String detail, int idIndividual) {
        this.idPost = idPost;
        this.title = title;
        this.summary = summary;
        this.detail = detail;
        this.idIndividual = idIndividual;
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
