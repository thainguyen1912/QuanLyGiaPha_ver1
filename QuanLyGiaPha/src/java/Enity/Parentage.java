
package Enity;

import java.sql.Date;


public class Parentage {
    private int id;
    private String name;
    private String ancestor;
    private String address;
    private Date anniversary;
    private String history;
    private String note;
    private Date dateCreate;
    private String headName;
    private String headAddress;
    private String headNumberPhone;
    private String userName;

    public Parentage(String name, String ancestor, String address, Date anniversary, String history, String note, Date dateCreate, String headName, String headAddress, String headNumberPhone, String userName) {
        this.name = name;
        this.ancestor = ancestor;
        this.address = address;
        this.anniversary = anniversary;
        this.history = history;
        this.note = note;
        this.dateCreate = dateCreate;
        this.headName = headName;
        this.headAddress = headAddress;
        this.headNumberPhone = headNumberPhone;
        this.userName = userName;
    }

    public Parentage(int id, String name, String ancestor, String address, Date anniversary, String history, String note, Date dateCreate, String headName, String headAddress, String headNumberPhone, String userName) {
        this.id = id;
        this.name = name;
        this.ancestor = ancestor;
        this.address = address;
        this.anniversary = anniversary;
        this.history = history;
        this.note = note;
        this.dateCreate = dateCreate;
        this.headName = headName;
        this.headAddress = headAddress;
        this.headNumberPhone = headNumberPhone;
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

    public Date getAnniversary() {
        return anniversary;
    }

    public void setAnniversary(Date anniversary) {
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

    public String getHeadName() {
        return headName;
    }

    public void setHeadName(String headName) {
        this.headName = headName;
    }

    public String getHeadAddress() {
        return headAddress;
    }

    public void setHeadAddress(String headAddress) {
        this.headAddress = headAddress;
    }

    public String getHeadNumberPhone() {
        return headNumberPhone;
    }

    public void setHeadNumberPhone(String headNumberPhone) {
        this.headNumberPhone = headNumberPhone;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }
    
    

    @Override
    public String toString() {
        return "ParentAge{" + "id=" + id + ", name=" + name + ", ancestor=" + ancestor + ", address=" + address + ", anniversary=" + anniversary + ", history=" + history + ", note=" + note + ", dateCreate=" + dateCreate + ", headName=" + headName + ", headAddress=" + headAddress + ", headNumberPhone=" + headNumberPhone + ", userName=" + userName + '}';
    }
}
