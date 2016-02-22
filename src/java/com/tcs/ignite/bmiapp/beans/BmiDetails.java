/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tcs.ignite.bmiapp.beans;

import java.io.Serializable;
import java.math.BigDecimal;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author 1034834
 */
@Entity
@Table(name = "bmi_details")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "BmiDetails.findAll", query = "SELECT b FROM BmiDetails b"),
    @NamedQuery(name = "BmiDetails.findById", query = "SELECT b FROM BmiDetails b WHERE b.id = :id"),
    @NamedQuery(name = "BmiDetails.findByHeight", query = "SELECT b FROM BmiDetails b WHERE b.height = :height"),
    @NamedQuery(name = "BmiDetails.findByWeight", query = "SELECT b FROM BmiDetails b WHERE b.weight = :weight"),
    @NamedQuery(name = "BmiDetails.findByBmi", query = "SELECT b FROM BmiDetails b WHERE b.bmi = :bmi")})
public class BmiDetails implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(nullable = false)
    private Integer id;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Basic(optional = false)
    @Column(nullable = false, precision = 5, scale = 2)
    private BigDecimal height;
    @Basic(optional = false)
    @Column(nullable = false, precision = 5, scale = 2)
    private BigDecimal weight;
    @Basic(optional = false)
    @Column(nullable = false, precision = 4, scale = 2)
    private BigDecimal bmi;
    @JoinColumn(name = "user_details_ID", referencedColumnName = "ID", nullable = false)
    @ManyToOne(optional = false)
    private UserDetails userdetailsID;
    @JoinColumn(name = "trainee_details_ID", referencedColumnName = "ID", nullable = false)
    @ManyToOne(optional = false)
    private TraineeDetails traineedetailsID;

    public BmiDetails() {
    }

    public BmiDetails(Integer id) {
        this.id = id;
    }

    public BmiDetails(Integer id, BigDecimal height, BigDecimal weight, BigDecimal bmi) {
        this.id = id;
        this.height = height;
        this.weight = weight;
        this.bmi = bmi;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public BigDecimal getHeight() {
        return height;
    }

    public void setHeight(BigDecimal height) {
        this.height = height;
    }

    public BigDecimal getWeight() {
        return weight;
    }

    public void setWeight(BigDecimal weight) {
        this.weight = weight;
    }

    public BigDecimal getBmi() {
        return bmi;
    }

    public void setBmi(BigDecimal bmi) {
        this.bmi = bmi;
    }

    public UserDetails getUserdetailsID() {
        return userdetailsID;
    }

    public void setUserdetailsID(UserDetails userdetailsID) {
        this.userdetailsID = userdetailsID;
    }

    public TraineeDetails getTraineedetailsID() {
        return traineedetailsID;
    }

    public void setTraineedetailsID(TraineeDetails traineedetailsID) {
        this.traineedetailsID = traineedetailsID;
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
        if (!(object instanceof BmiDetails)) {
            return false;
        }
        BmiDetails other = (BmiDetails) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.tcs.ignite.bmiapp.beans.BmiDetails[ id=" + id + " ]";
    }
    
}
