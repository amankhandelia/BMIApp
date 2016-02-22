/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tcs.ignite.bmiapp.util;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.AnnotationConfiguration;

/**
 *
 * @author 1034834
 */
public class HibernateUtil {
    private static SessionFactory sessionfactory;
    
    static {
        try {
            sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
        } catch (Exception ex) {
            System.err.println("Initial SessionFactory creation failed." + ex);
            throw new ExceptionInInitializerError(ex);
        }
    }
    public static SessionFactory getSessionFactory(){
        return sessionfactory;
    }
    
}
