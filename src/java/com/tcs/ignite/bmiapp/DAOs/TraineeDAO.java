/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tcs.ignite.bmiapp.DAOs;

import com.tcs.ignite.bmiapp.beans.TraineeDetails;
import com.tcs.ignite.bmiapp.util.HibernateUtil;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

/**
 *
 * @author 1034834
 */
public class TraineeDAO {
    //Session -> It is for storing the session which would be used to make the connection with the database

    Session session;
    //For making transaction.Every thing we do from database is transaction.
    Transaction transaction;
    //To add a assignment to the database

    public TraineeDetails getTraineeDetailsByIgniteID(String igniteId) {
        TraineeDetails traineeDetails = null;
        try {
            SessionFactory sessionfactory = HibernateUtil.getSessionFactory();
            session = sessionfactory.openSession();
            transaction = session.beginTransaction();
            transaction.begin();
            Query query = session.getNamedQuery("TraineeDetails.findByIgniteId");
            query.setString("igniteId",igniteId);
            traineeDetails = (TraineeDetails) query.uniqueResult();
            transaction.commit();
            
        } catch (Exception e) {
            System.out.println(e.getMessage());
        } finally {
            if (session.isOpen()) {
                session.close();
            }
        }
        return traineeDetails;
    }
    
}
