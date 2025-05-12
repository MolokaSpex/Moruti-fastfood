/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package za.ac.tut.web;

import java.io.IOException;
import java.io.PrintWriter;
import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
 
import za.ac.tut.bl.ProductFacadeLocal;

/**
 *
 * @author thema
 */
public class RemoveProductServlet extends HttpServlet {
    
    @EJB ProductFacadeLocal pfl;
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String p_name =  request.getParameter("name").toLowerCase();
        pfl.removeByName(p_name);
        
        RequestDispatcher didsp =  request.getRequestDispatcher("remove_outcome.html");
        didsp.include(request, response);
    }

}
