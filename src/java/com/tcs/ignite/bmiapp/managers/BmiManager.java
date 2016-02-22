/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tcs.ignite.bmiapp.managers;

import com.tcs.ignite.bmiapp.DAOs.BmiDAO;
import com.tcs.ignite.bmiapp.beans.BmiDetails;
import com.tcs.ignite.bmiapp.beans.UserDetails;
import java.util.List;

/**
 *
 * @author 1034834
 */
public class BmiManager {

    static public List getPending() {
        return new BmiDAO().getTraineeDetailsPendingForBMI();
    }

    public boolean saveBMI(BmiDetails bmiDetails) {
        return new BmiDAO().saveBMIDetails(bmiDetails);
    }

    static public List getByEmployeeID(UserDetails userDetails) {
        return new BmiDAO().getTraineeDetailsByEmployeeId(userDetails);
    }

    public Integer checkBMI(BmiDetails bmiDetails) {
        return new BmiDAO().checkBMIDetailByIgniteId(bmiDetails);
    }
}
