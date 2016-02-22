/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tcs.ignite.bmiapp.managers;

import com.tcs.ignite.bmiapp.DAOs.UserDAO;
import com.tcs.ignite.bmiapp.beans.UserDetails;

/**
 *
 * @author 1034834
 */
public class UserManager {
    public UserDetails matchPassword(UserDetails userDetails){
        UserDetails tempUserDetails = new UserDAO().getUserDetailsByEmployeeID(userDetails.getEmployeeId());
        if(tempUserDetails.getPassword().equals(userDetails.getPassword())){
            return tempUserDetails;
        }
        return null;
    }
    public UserDetails getUserByEmployeeId(String employeeId){
        return new UserDAO().getUserDetailsByEmployeeID(employeeId);
    }
}
