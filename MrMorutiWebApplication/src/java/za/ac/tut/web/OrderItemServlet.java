/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package za.ac.tut.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;
import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import za.ac.tut.bl.OrderItemFacadeLocal;
import za.ac.tut.bl.ProductFacadeLocal;
import za.ac.tut.entities.OrderItem;
import za.ac.tut.entities.Product;

/**
 *
 * @author thema
 */
public class OrderItemServlet extends HttpServlet {

    @EJB private OrderItemFacadeLocal ofl;
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        HashMap<Product,Integer> listOfOrders =(HashMap<Product,Integer>) session.getAttribute("listOfOrders");
        
        
        OrderItem oi = new OrderItem();
        
        for (Map.Entry<Product, Integer> entry : listOfOrders.entrySet()) {
            Product product = entry.getKey();
            Integer quantity = entry.getValue();
        }   

        RequestDispatcher disp = request.getRequestDispatcher("view_order_page.jsp");
        disp.include(request, response);
        
    }

   
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
