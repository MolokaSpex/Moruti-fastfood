package za.ac.tut.web;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author 221155203
 */
public class cartServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get the product name and price from the request
        String productName = request.getParameter("productName");
        //String productPriceStr = request.getParameter("productPrice"); // You might not need this in the cart, but I'll leave it here.
        //int productPrice = Integer.parseInt(productPriceStr);

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
        response.sendRedirect("product_catalog.jsp"); //changed to product_catalog.jsp
    }
}
