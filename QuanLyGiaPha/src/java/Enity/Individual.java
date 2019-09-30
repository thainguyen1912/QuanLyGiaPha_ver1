

package Enity;

import java.sql.Date;


public class Individual {
    private int idIndividual;
    private int idParentAge;
    private String name;
    private int gender;
    private Date dateBirth;
    private Date dateDeath;
    private String branch;
    private String avatar;

    public Individual(int idIndividual, int idParentAge, String name, int gender, Date dateBirth, Date dateDeath, String branch, String avatar) {
        this.idIndividual = idIndividual;
        this.idParentAge = idParentAge;
        this.name = name;
        this.gender = gender;
        this.dateBirth = dateBirth;
        this.dateDeath = dateDeath;
        this.branch = branch;
        this.avatar = avatar;
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

    public int getGender() {
        return gender;
    }

    public void setGender(int gender) {
        this.gender = gender;
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

    
    
    
}
