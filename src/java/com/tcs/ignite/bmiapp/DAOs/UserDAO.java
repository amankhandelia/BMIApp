/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tcs.ignite.bmiapp.DAOs;

import com.tcs.ignite.bmiapp.beans.UserDetails;
import com.tcs.ignite.bmiapp.util.HibernateUtil;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

/**
 *
 * @author 1034834
 */
public class UserDAO {
    //Session -> It is for storing the session which would be used to make the connection with the database

    Session session;
    //For making transaction.Every thing we do from database is transaction.
    Transaction transaction;
    //To add a assignment to the database

    public UserDetails getUserDetailsByEmployeeID(String employeeId) {
        UserDetails userDetails = null;
        try {
            SessionFactory sessionfactory = HibernateUtil.getSessionFactory();
            session = sessionfactory.openSession();
            transaction = session.beginTransaction();
            transaction.begin();
            Query query = session.getNamedQuery("UserDetails.findByEmployeeId");
            query.setString("employeeId",employeeId);
            userDetails = (UserDetails) query.uniqueResult();
            transaction.commit();
            
        } catch (Exception e) {
            System.out.println(e.getMessage());
        } finally {
            if (session.isOpen()) {
                session.close();
            }
        }
        return userDetails;
    }
}
