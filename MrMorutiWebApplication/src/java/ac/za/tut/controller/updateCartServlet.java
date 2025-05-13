package ac.za.tut.controller;

import java.io.IOException;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

 
public class updateCartServlet extends HttpServlet {
    

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        String productName = request.getParameter("productName");

        HttpSession session = request.getSession();
         
        Map<String, Integer> cart = (Map<String, Integer>) session.getAttribute("cart");

        if (cart != null && productName != null && !productName.isEmpty()) {
            if ("increase".equals(action)) {
                cart.put(productName, cart.getOrDefault(productName, 0) + 1);
            } else if ("decrease".equals(action)) {
                if (cart.containsKey(productName) && cart.get(productName) > 1) {
                    cart.put(productName, cart.get(productName) - 1);
                } else if ("delete".equals(action)) {
                    cart.remove(productName);
                }
            } else if ("delete".equals(action)) {
                cart.remove(productName);
            }
            session.setAttribute("cart", cart);
        }

        response.sendRedirect("customer_cart.jsp");
    }
}