/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package za.ac.tut.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import za.ac.tut.bl.CustomerFacadeLocal;
import za.ac.tut.entities.Customer;
import za.ac.tut.entities.Order;

/**
 *
 * @author Keletso
 */
public class CreateCustomerServlet extends HttpServlet {
    @EJB CustomerFacadeLocal cfl;
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Long id = Long.parseLong(request.getParameter("id"));
        String name = request.getParameter("name");
        String surname = request.getParameter("Surname");
        Integer phone_number = Integer.parseInt(request.getParameter("phone_number"));
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String order1 = request.getParameter("order1");
        String order2 = request.getParameter("order2");
        String order3 = request.getParameter("order3");
        
        Customer customer = createCustomer(id, name, surname, phone_number, email, address);
        
        cfl.create(customer);
        
        RequestDispatcher disp = request.getRequestDispatcher("create_customer_outcome.jsp");
        disp.forward(request, response);
        
    } 
    private Customer createCustomer(Long id, String name, String surname, Integer phone_number, String email, String address){
        Customer customer = new Customer();
        customer.setId(id);
        customer.setName(name);
        customer.setSurname(surname);
        customer.setEmail(email);
        customer.setPhone_number(phone_number);
        customer.setAddress(address);
        
        return customer;
    }
}
