/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tcs.ignite.bmiapp.beans;

/**
 *
 * @author 1034834
 */
public class UserData {

    double weight,height;
    String igniteId, name;

    public double getWeight() {
        return weight;
    }

    public void setWeight(double weight) {
        this.weight = weight;
    }

    public double getHeight() {
        return height;
    }

    public void setHeight(double height) {
        this.height = height;
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

    public UserData(float weight, int height, String igniteId, String name) {
        this.weight = weight;
        this.height = height;
        this.igniteId = igniteId;
        this.name = name;
    }
    
    
}
