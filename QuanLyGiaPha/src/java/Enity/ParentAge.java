
package Enity;

import java.sql.Date;


public class ParentAge {
    private int id;
    private String name;
    private String ancestor;
    private String address;
    private String anniversary;
    private String history;
    private String note;
    private Date dateCreate;
    private String userName;

    public ParentAge(String name, String ancestor, String address, String anniversary, String history, String note, Date dateCreate, String userName) {
        this.name = name;
        this.ancestor = ancestor;
        this.address = address;
        this.anniversary = anniversary;
        this.history = history;
        this.note = note;
        this.dateCreate = dateCreate;
        this.userName = userName;
    }

    
    
    public ParentAge(int id, String name, String ancestor, String address, String anniversary, String history, String note, Date dateCreate, String userName) {
        this.id = id;
        this.name = name;
        this.ancestor = ancestor;
        this.address = address;
        this.anniversary = anniversary;
        this.history = history;
        this.note = note;
        this.dateCreate = dateCreate;
        this.userName = userName;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAncestor() {
        return ancestor;
    }

    public void setAncestor(String ancestor) {
        this.ancestor = ancestor;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getAnniversary() {
        return anniversary;
    }

    public void setAnniversary(String anniversary) {
        this.anniversary = anniversary;
    }

    public String getHistory() {
        return history;
    }

    public void setHistory(String history) {
        this.history = history;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public Date getDateCreate() {
        return dateCreate;
    }

    public void setDateCreate(Date dateCreate) {
        this.dateCreate = dateCreate;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    
    
    
}
