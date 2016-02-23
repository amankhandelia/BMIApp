/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tcs.ignite.bmiapp.actions;

import com.google.gson.Gson;
import com.google.gson.JsonSyntaxException;
import com.tcs.ignite.bmiapp.beans.BmiDetails;
import com.tcs.ignite.bmiapp.beans.Response;
import com.tcs.ignite.bmiapp.beans.TraineeDetails;
import com.tcs.ignite.bmiapp.beans.UserData;
import com.tcs.ignite.bmiapp.beans.UserDetails;
import com.tcs.ignite.bmiapp.managers.BmiManager;
import com.tcs.ignite.bmiapp.managers.TraineeManager;
import com.tcs.ignite.bmiapp.managers.UserManager;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author 1034834
 */
@WebServlet(name = "SubmitBMIServlet", urlPatterns = {"/SubmitBMI"})
public class SubmitBMIServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            /* TODO output your page here. You may use following sample code. */
        } finally {
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        processRequest(request, response);
        PrintWriter out = response.getWriter();
        String input = request.getParameter("myData");
        String output;
        System.out.println(input);
        Gson gson = new Gson();
        UserData userData;
        Response myResponse = new Response();
        try {
            userData = gson.fromJson(input, UserData.class);
            String employeeId = (String) request.getSession(false).getAttribute("employeeId");
            UserManager userManager = new UserManager();
            UserDetails userDetails = userManager.getUserByEmployeeId(employeeId);
            TraineeDetails traineeDetails = new TraineeManager().getTraineeByIgniteId(userData.getIgniteId());
            BmiDetails bmiDetails = new BmiDetails();
            bmiDetails.setTraineedetailsID(traineeDetails);
            bmiDetails.setUserdetailsID(userDetails);
            bmiDetails.setWeight(new BigDecimal(userData.getWeight()));
            bmiDetails.setHeight(new BigDecimal(userData.getHeight()));
            double height = userData.getHeight() / 100.0;
            double bmi = userData.getWeight() / (height * height);
            bmi = Math.round(bmi * 100) / 100.0;
            bmiDetails.setBmi(new BigDecimal(bmi));
            response.setCharacterEncoding("UTF-8");
            BmiManager bmiManager = new BmiManager();
            bmiManager.checkBMI(bmiDetails);
            if (userData.getHeight() % 1 != 0) {
                myResponse.setResponse("failed");
                output = gson.toJson(myResponse);
                out.println(output);
            }
            if (bmiManager.saveBMI(bmiDetails) && bmiDetails.getId() != null) {
                myResponse.setResponse("success");
            } else {
                myResponse.setResponse("failed");
            }
        } catch (JsonSyntaxException exception) {
            myResponse.setResponse("failed");
        } finally {
            output = gson.toJson(myResponse);
            out.println(output);
        }

    }

    /**
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        processRequest(request, response);
//        BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
//        String json = "";
//        if(br != null){
//            json = br.readLine();
//        }
        String input = request.getParameter("myData");
        System.out.println(input);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
