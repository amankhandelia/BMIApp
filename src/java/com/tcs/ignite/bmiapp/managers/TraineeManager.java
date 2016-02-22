/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tcs.ignite.bmiapp.managers;

import com.tcs.ignite.bmiapp.DAOs.TraineeDAO;
import com.tcs.ignite.bmiapp.beans.TraineeDetails;

/**
 *
 * @author 1034834
 */
public class TraineeManager {
    public TraineeDetails getTraineeByIgniteId(String igniteId){
        return new TraineeDAO().getTraineeDetailsByIgniteID(igniteId);
    }
}
