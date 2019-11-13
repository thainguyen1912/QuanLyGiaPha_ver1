
package Enity;

import java.sql.Date;


public class Post {
    private int idPost;
    private String title;
    private String summary;
    private String detail;
    private String status;
    private String key;
    private String image;
    private Date datePost;
    private int idIndividual;

    public Post(int idPost, String title, String summary, String detail, String status, String key, String image, Date datePost, int idIndividual) {
        this.idPost = idPost;
        this.title = title;
        this.summary = summary;
        this.detail = detail;
        this.status = status;
        this.key = key;
        this.image = image;
        this.datePost = datePost;
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

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getKey() {
        return key;
    }

    public void setKey(String key) {
        this.key = key;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public Date getDatePost() {
        return datePost;
    }

    public void setDatePost(Date datePost) {
        this.datePost = datePost;
    }

    public int getIdIndividual() {
        return idIndividual;
    }

    public void setIdIndividual(int idIndividual) {
        this.idIndividual = idIndividual;
    }

   
    
    
}
