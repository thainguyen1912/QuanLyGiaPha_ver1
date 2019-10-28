

package Enity;

import java.sql.Date;


public class Individual {
    private int idIndividual;
    private int idParentAge;
    private String name;
    private String wifeOrHusbandName;
    private Date dateBirth;
    private Date dateDeath;
    private int childth;
    private int idFather;
    private int gender;
    private String branch;
    private String avatar;
    private String moreInfo;
    private int floor;
    public Individual() {
    }

    public Individual(int idIndividual, int idParentAge, String name, String wifeOrHusbandName, Date dateBirth, Date dateDeath, int childth, int idFather, int gender, String branch, String avatar, String moreInfo, int floor) {
        this.idIndividual = idIndividual;
        this.idParentAge = idParentAge;
        this.name = name;
        this.wifeOrHusbandName = wifeOrHusbandName;
        this.dateBirth = dateBirth;
        this.dateDeath = dateDeath;
        this.childth = childth;
        this.idFather = idFather;
        this.gender = gender;
        this.branch = branch;
        this.avatar = avatar;
        this.moreInfo = moreInfo;
        this.floor=floor;
    }

    public Individual(int idParentAge, String name, String wifeOrHusbandName, Date dateBirth, Date dateDeath, int childth, int idFather, int gender, String branch, String avatar, String moreInfo, int floor) {
        this.idParentAge = idParentAge;
        this.name = name;
        this.wifeOrHusbandName = wifeOrHusbandName;
        this.dateBirth = dateBirth;
        this.dateDeath = dateDeath;
        this.childth = childth;
        this.idFather = idFather;
        this.gender = gender;
        this.branch = branch;
        this.avatar = avatar;
        this.moreInfo = moreInfo;
        this.floor=floor;
    }

    public int getFloor() {
        return floor;
    }

    public void setFloor(int floor) {
        this.floor = floor;
    }
    

    
    
    
    public int getIdIndividual() {
        return idIndividual;
    }

    public void setIdIndividual(int idIndividual) {
        this.idIndividual = idIndividual;
    }

    public int getIdParentAge() {
        return idParentAge;
    }

    public void setIdParentAge(int idParentAge) {
        this.idParentAge = idParentAge;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getWifeOrHusbandName() {
        return wifeOrHusbandName;
    }

    public void setWifeOrHusbandName(String wifeOrHusbandName) {
        this.wifeOrHusbandName = wifeOrHusbandName;
    }

    public Date getDateBirth() {
        return dateBirth;
    }

    public void setDateBirth(Date dateBirth) {
        this.dateBirth = dateBirth;
    }

    public Date getDateDeath() {
        return dateDeath;
    }

    public void setDateDeath(Date dateDeath) {
        this.dateDeath = dateDeath;
    }

    public int getChildth() {
        return childth;
    }

    public void setChildth(int childth) {
        this.childth = childth;
    }

    public int getIdFather() {
        return idFather;
    }

    public void setIdFather(int idFather) {
        this.idFather = idFather;
    }

    public int getGender() {
        return gender;
    }

    public void setGender(int gender) {
        this.gender = gender;
    }

    public String getBranch() {
        return branch;
    }

    public void setBranch(String branch) {
        this.branch = branch;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public String getMoreInfo() {
        return moreInfo;
    }

    public void setMoreInfo(String moreInfo) {
        this.moreInfo = moreInfo;
    }
    
}
