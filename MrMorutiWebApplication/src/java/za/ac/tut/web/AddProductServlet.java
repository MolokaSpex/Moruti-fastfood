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
import za.ac.tut.entities.Product;
import za.ac.tut.model.ImageManager;

/**
 *
 * @author thema
 */
public class AddProductServlet extends HttpServlet {
    @EJB private ProductFacadeLocal pfl;
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
                
        Product product;
        String image = request.getParameter("image");
        String productName = request.getParameter("productName");
        String productDescription = request.getParameter("productDescription");
        Double productPrice = Double.parseDouble(request.getParameter("productPrice")); 
        
        ImageManager imgToByte = new ImageManager();
        byte[] img = imgToByte.getByteImage(image);
        product = new Product(img, productName, productDescription, productPrice);
            
        pfl.create(product);
        RequestDispatcher disp = request.getRequestDispatcher("product_add_outcome.html");
        disp.forward(request, response);
    }

}
