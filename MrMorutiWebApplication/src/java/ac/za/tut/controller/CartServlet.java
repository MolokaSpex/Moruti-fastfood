 
package ac.za.tut.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author 221155203
 */
public class CartServlet extends HttpServlet {

  
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
        String productName = request.getParameter("productName");
  
        // Get the session
        HttpSession session = request.getSession();

        // Get the cart from the session
        Map<String, Integer> cart = (Map<String, Integer>) session.getAttribute("cart");

        // If the cart doesn't exist, create it
        if (cart == null) {
            cart = new HashMap<>();
            session.setAttribute("cart", cart);
        }

        // Add the product to the cart or update the quantity if it already exists
        if (cart.containsKey(productName)) {
            cart.put(productName, cart.get(productName) + 1);
        } else {
            cart.put(productName, 1);
        }

        // Store the updated cart back in the session
        session.setAttribute("cart", cart);

        // Redirect back to the product catalog page so the user can continue shopping
        response.sendRedirect("product_catalog.jsp");  
    }

  

}
