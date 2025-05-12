/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package za.ac.tut.web;

import java.io.IOException;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import za.ac.tut.bl.ProductFacadeLocal;
import za.ac.tut.entities.Product;

/**
 *
 * @author thema
 */
public class GetAllProductsServlet extends HttpServlet {

    @EJB private ProductFacadeLocal pfl;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {         
        List<Product> listOfProducts = pfl.findAll();
        request.setAttribute("listOfProducts", listOfProducts);
        RequestDispatcher disp = request.getRequestDispatcher("product_catalog.jsp");
        disp.forward(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Product p = pfl.find(Long.parseLong(request.getParameter("product")));
        sessionUpdate(session,p);
        Integer numItems = 0;
        
        RequestDispatcher disp = request.getRequestDispatcher("product_catalog.jsp");
        disp.include(request, response);
    }

    private void sessionUpdate(HttpSession session, Product p) {
        Integer cartNum = (Integer) session.getAttribute("cartNum");
        cartNum += 1;
        session.setAttribute("cartNum", cartNum);
        
        List<Product> cartProduct = (List<Product>) session.getAttribute("cartProduct");
        cartProduct.add(p);
        session.setAttribute("cartNum", cartNum);
    }
}
