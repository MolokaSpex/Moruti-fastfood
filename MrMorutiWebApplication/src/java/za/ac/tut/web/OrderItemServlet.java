/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package za.ac.tut.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.ws.rs.client.Client;
import za.ac.tut.bl.CustomerFacadeLocal;
import za.ac.tut.bl.OrderFacadeLocal;
import za.ac.tut.bl.OrderItemFacadeLocal;
import za.ac.tut.bl.ProductFacadeLocal;
import za.ac.tut.entities.Customer;
import za.ac.tut.entities.Order;
import za.ac.tut.entities.OrderItem;
import za.ac.tut.entities.Product;

/**
 *
 * @author thema
 */
public class OrderItemServlet extends HttpServlet {

    @EJB private OrderFacadeLocal ofl;
    @EJB private OrderItemFacadeLocal oil;
    @EJB private CustomerFacadeLocal cil;
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
 
        HttpSession session = request.getSession();
        Customer customer = (Customer) session.getAttribute("customer");
        HashMap<Product, Integer> listOfOrders = (HashMap<Product, Integer>) session.getAttribute("cart");
        Customer managedCustomer = cil.find(customer.getId()); // Use cil to find managed Customer.
    
    // 2. Create the Order:
    Order order = new Order();
    order.setCustomer(managedCustomer);
    order.setOrder_items(new ArrayList<>());

        List<OrderItem> orderItems = new ArrayList<>(); 
    for (Map.Entry<Product, Integer> entry : listOfOrders.entrySet()) {
        Product product = entry.getKey();
        Integer quantity = entry.getValue();

        OrderItem orderItem = new OrderItem();
        orderItem.setProduct(product);
        orderItem.setQuantity(quantity);
        double subtotal = quantity * product.getPrice();
        orderItem.setSubtotal(subtotal);
        
        oil.create(orderItem);
        orderItems.add(orderItem);
    }
    order.setOrder_items(orderItems);
    ofl.create(order);

    
    for(OrderItem oi : orderItems){
        oi.setOrder(order);
        oil.edit(oi);
    }
    session.setAttribute("customer", customer   );
    session.removeAttribute("listOfOrders");
    response.sendRedirect("orderConfirmation.jsp");
        
     
        RequestDispatcher disp = request.getRequestDispatcher("view_order_page.jsp");
        disp.include(request, response);
        
    }

   
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
