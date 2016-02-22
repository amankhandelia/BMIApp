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
@Table(name = "trainee_details")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "TraineeDetails.findAll", query = "SELECT t FROM TraineeDetails t"),
    @NamedQuery(name = "TraineeDetails.findById", query = "SELECT t FROM TraineeDetails t WHERE t.id = :id"),
    @NamedQuery(name = "TraineeDetails.findByIgniteId", query = "SELECT t FROM TraineeDetails t WHERE t.igniteId = :igniteId"),
    @NamedQuery(name = "TraineeDetails.findByName", query = "SELECT t FROM TraineeDetails t WHERE t.name = :name")})
public class TraineeDetails implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(nullable = false)
    private Integer id;
    @Basic(optional = false)
    @Column(name = "ignite_id", nullable = false, length = 45)
    private String igniteId;
    @Basic(optional = false)
    @Column(nullable = false, length = 45)
    private String name;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "traineedetailsID")
    private Collection<BmiDetails> bmiDetailsCollection;

    public TraineeDetails() {
    }

    public TraineeDetails(Integer id) {
        this.id = id;
    }

    public TraineeDetails(Integer id, String igniteId, String name) {
        this.id = id;
        this.igniteId = igniteId;
        this.name = name;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getIgniteId() {
        return igniteId;
    }

    public void setIgniteId(String igniteId) {
        this.igniteId = igniteId;
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
        if (!(object instanceof TraineeDetails)) {
            return false;
        }
        TraineeDetails other = (TraineeDetails) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.tcs.ignite.bmiapp.beans.TraineeDetails[ id=" + id + " ]";
    }
    
}
