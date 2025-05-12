<%@page import="java.util.Date"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.nio.charset.StandardCharsets" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="za.ac.tut.entities.Product"%>   

<!DOCTYPE html>
<html>
    <head>
        <title>Product Catalog</title>
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <link href="css/styles.css" rel="stylesheet" />
    </head>
    <body>
        <%
            // Ensure the cart exists
            Map<String, Integer> cart = (Map<String, Integer>) session.getAttribute("cart");
            if (cart == null) {
                cart = new HashMap();
                session.setAttribute("cart", cart);
            }

            List<Product> listOfProducts = (List<Product>) session.getAttribute("listOfProducts"); 

            // Calculate total cart quantity
            int cartSize = 0;
            for (Integer quantity : cart.values()) {
                cartSize += quantity;
            }
        %>

        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="#">Moruti's Tuck Shop</a>
                <form class="d-flex" action="customer_cart.jsp" method="get">
                    <button class="btn btn-outline-dark" type="submit">
                        <i class="bi-cart-fill me-1"></i> Cart
                        <span class="badge bg-dark text-white ms-1 rounded-pill"><%= cartSize %></span>
                    </button>
                </form>
            </div>
        </nav>

        <header class="bg-dark py-5">
            <div class="container px-4 px-lg-5 my-5 text-center text-white">
                <h1 class="display-4 fw-bolder">Welcome to Moruti's Shop</h1>
                <p class="lead fw-normal text-white-50 mb-0">Your one-stop shop for delicious snacks, refreshing drinks, and tasty meals!</p>
            </div>
        </header>
 
        <section class="py-5">
            <div class="container px-4 px-lg-5 mt-5">
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                    <% if (listOfProducts != null) {
                        for (Product product : listOfProducts) { %>
                            <div class="col mb-5">
                                <div class="card h-100">
                                    <img class="card-img-top" src="assets/" alt="<%= product.getName() %>" />
                                    <div class="card-body p-4 text-center">
                                        <h5 class="fw-bolder"><%= product.getName() %></h5>
                                        <p>R<%= product.getPrice() %></p>
                                    </div>
                                    <div class="card-footer p-4 pt-0 border-top-0 bg-transparent text-center">
                                        <form action="cartServlet" method="post">
                                            <input type="hidden" name="productName" value="<%= product.getName() %>">
                                            <input type="hidden" name="productPrice" value="<%= product.getPrice() %>">
                                            <input type="number" name="quantity" value="1" min="1">
                                            <button class="btn btn-outline-dark mt-auto" type="submit">Add to cart</button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                    <% } } else { %>
                        <p class="text-center">No products available.</p>
                    <% } %>
                </div>
            </div>
        </section>

        <footer class="py-5 bg-dark">
            <div class="container text-center text-white">
                <p>Copyright &copy; Moruti's Tuck Shop <%= new Date() %></p>
            </div>
        </footer>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <script src="js/scripts.js"></script>
    </body>
</html>
