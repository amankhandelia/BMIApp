/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tcs.ignite.bmiapp.DAOs;

import com.tcs.ignite.bmiapp.beans.BmiDetails;
import com.tcs.ignite.bmiapp.beans.TraineeDetails;
import com.tcs.ignite.bmiapp.beans.UserDetails;
import com.tcs.ignite.bmiapp.util.HibernateUtil;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

/**
 *
 * @author 1034834
 */
public class BmiDAO {
    //Session -> It is for storing the session which would be used to make the connection with the database

    Session session;
    //For making transaction.Every thing we do from database is transaction.
    Transaction transaction;
    //To add a assignment to the database

    public List getTraineeDetailsPendingForBMI() {
        List myList = null;
        try {
            SessionFactory sessionfactory = HibernateUtil.getSessionFactory();
            session = sessionfactory.openSession();
            transaction = session.beginTransaction();
            transaction.begin();
            String sqlQuery = "SELECT trainee_details.ignite_id,trainee_details.name FROM trainee_details WHERE trainee_details.id NOT IN (SELECT bmi_details.trainee_details_ID FROM bmi_details)";
            Query query = session.createSQLQuery(sqlQuery);
            myList = query.list();
            transaction.commit();

        } catch (Exception e) {
            System.out.println(e.getMessage());
            myList = null;
        } finally {
            if (session.isOpen()) {
                session.close();
            }
        }
        return myList;
    }

    public boolean saveBMIDetails(BmiDetails bmiDetails) {
        boolean workDone = false;
        try {
            SessionFactory sessionfactory = HibernateUtil.getSessionFactory();
            session = sessionfactory.openSession();
            transaction = session.beginTransaction();
            transaction.begin();
            session.saveOrUpdate(bmiDetails);
            workDone = true;
            transaction.commit();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        } finally {
            if (session != null && session.isOpen()) {
                session.close();
            }
        }
        return workDone;
    }

    public List getTraineeDetailsByEmployeeId(UserDetails userDetails) {
        List myList = null;
        try {
            SessionFactory sessionfactory = HibernateUtil.getSessionFactory();
            session = sessionfactory.openSession();
            transaction = session.beginTransaction();
            transaction.begin();
            String sqlQuery = "SELECT trainee_details.ignite_id,trainee_details.name,bmi_details.height,bmi_details.weight,bmi_details.bmi  FROM trainee_details join bmi_details WHERE bmi_details.user_details_ID = :employeeId and  bmi_details.trainee_details_ID = trainee_details.ID";
            Query query = session.createSQLQuery(sqlQuery);
            query.setInteger("employeeId", userDetails.getId());
            myList = query.list();
            transaction.commit();

        } catch (Exception e) {
            System.out.println(e.getMessage());
        } finally {
            if (session.isOpen()) {
                session.close();
            }
        }
        return myList;
    }

    public Integer checkBMIDetailByIgniteId(BmiDetails bmiDetails) {
        try {
            SessionFactory sessionfactory = HibernateUtil.getSessionFactory();
            session = sessionfactory.openSession();
            transaction = session.beginTransaction();
            transaction.begin();
            String sqlQuery = "SELECT bmi_details.ID  FROM bmi_details WHERE bmi_details.trainee_details_ID = :igniteId";
            Query query = session.createSQLQuery(sqlQuery);
            query.setInteger("igniteId", bmiDetails.getTraineedetailsID().getId());
            Integer id = (Integer) query.uniqueResult();
            if (id != null) {
                bmiDetails.setId(id);
            }
            transaction.commit();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        } finally {
            if (session.isOpen()) {
                session.close();
            }
        }
        return bmiDetails.getId();
    }

    public List<BmiDetails> getAllBMIDetails() {
        List<BmiDetails> allBMIDetails = null;
        try {
            SessionFactory sessionfactory = HibernateUtil.getSessionFactory();
            session = sessionfactory.openSession();
            transaction = session.beginTransaction();
            transaction.begin();
             allBMIDetails = session.createCriteria(BmiDetails.class).list();
            transaction.commit();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        } finally {
            if (session.isOpen()) {
                session.close();
            }
        }
        return allBMIDetails;
    }
}
