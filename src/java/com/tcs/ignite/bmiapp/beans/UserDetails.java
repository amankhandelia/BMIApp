/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tcs.ignite.bmiapp.beans;

import java.io.Serializable;
import java.util.Collection;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author 1034834
 */
@Entity
@Table(name = "user_details")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "UserDetails.findAll", query = "SELECT u FROM UserDetails u"),
    @NamedQuery(name = "UserDetails.findById", query = "SELECT u FROM UserDetails u WHERE u.id = :id"),
    @NamedQuery(name = "UserDetails.findByEmployeeId", query = "SELECT u FROM UserDetails u WHERE u.employeeId = :employeeId"),
    @NamedQuery(name = "UserDetails.findByPassword", query = "SELECT u FROM UserDetails u WHERE u.password = :password"),
    @NamedQuery(name = "UserDetails.findByName", query = "SELECT u FROM UserDetails u WHERE u.name = :name")})
public class UserDetails implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(nullable = false)
    private Integer id;
    @Basic(optional = false)
    @Column(name = "employee_id", nullable = false, length = 45)
    private String employeeId;
    @Basic(optional = false)
    @Column(nullable = false, length = 45)
    private String password;
    @Basic(optional = false)
    @Column(nullable = false, length = 45)
    private String name;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "userdetailsID")
    private Collection<BmiDetails> bmiDetailsCollection;

    public UserDetails() {
    }

    public UserDetails(Integer id) {
        this.id = id;
    }

    public UserDetails(Integer id, String employeeId, String password, String name) {
        this.id = id;
        this.employeeId = employeeId;
        this.password = password;
        this.name = name;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getEmployeeId() {
        return employeeId;
    }

    public void setEmployeeId(String employeeId) {
        this.employeeId = employeeId;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @XmlTransient
    public Collection<BmiDetails> getBmiDetailsCollection() {
        return bmiDetailsCollection;
    }

    public void setBmiDetailsCollection(Collection<BmiDetails> bmiDetailsCollection) {
        this.bmiDetailsCollection = bmiDetailsCollection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof UserDetails)) {
            return false;
        }
        UserDetails other = (UserDetails) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.tcs.ignite.bmiapp.beans.UserDetails[ id=" + id + " ]";
    }
    
}
