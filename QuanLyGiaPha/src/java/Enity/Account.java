
package Enity;

import java.sql.Date;


public class Account {
    private String userName;
    private String passWord;
    private int role;
    private Date dateCreate;

    public Account(String userName, String passWord, int role, Date dateCreate) {
        this.userName = userName;
        this.passWord = passWord;
        this.role = role;
        this.dateCreate = dateCreate;
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

    public String getPassWord() {
        return passWord;
    }

    public void setPassWord(String passWord) {
        this.passWord = passWord;
    }

    public int getRole() {
        return role;
    }

    public void setRole(int role) {
        this.role = role;
    }

    
    
    
}
