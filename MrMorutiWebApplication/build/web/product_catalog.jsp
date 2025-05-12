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
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product Catalog</title>
    <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
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
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                    <li class="nav-item"><a class="nav-link active" aria-current="page" href="#">Home</a></li>
                    <li class="nav-item"><a class="nav-link" href="#">About</a></li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Shop</a>
                        <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <li><a class="dropdown-item" href="#">All Products</a></li>
                            <li><hr class="dropdown-divider" /></li>
                            <li><a class="dropdown-item" href="#">Popular Items</a></li>
                            <li><a class="dropdown-item" href="#">New Arrivals</a></li>
                        </ul>
                    </li>
                </ul>
                <form class="d-flex" action="customer_cart.jsp" method="get">
                    <button class="btn btn-outline-dark" type="submit">
                        <i class="bi-cart-fill me-1"></i>
                        Cart
                        <span class="badge bg-dark text-white ms-1 rounded-pill"><%= cartSize %></span>
                    </button>
                </form>
            </div>
        </div>
    </nav>

    <header class="bg-dark py-5">
        <div class="container px-4 px-lg-5 my-5 text-center text-white">
            <div class="d-flex align-items-center flex-column">
                <h1 class="display-4 fw-bolder">Welcome to Moruti's Shop</h1>
                <p class="lead fw-normal text-white-50 mb-0">Your one-stop shop for delicious snacks, refreshing drinks, and tasty meals!</p>
            </div>
        </div>
    </header>

    <section class="py-5">
        <div class="container px-4 px-lg-5 mt-5">
            <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                <% if (listOfProducts != null) {
                    for (Product product : listOfProducts) { %>
                        <div class="col mb-5">
                            <div class="card h-100">
                                <img class="card-img-top" src="assets/chips.jpg" alt="<%= product.getName() %>" />
                                <div class="card-body p-4 text-center">
                                    <div class="text-center">
                                        <h5 class="fw-bolder"><%= product.getName() %></h5>
                                        <p>R<%= product.getPrice() %></p>
                                    </div>
                                </div>
                                <div class="card-footer p-4 pt-0 border-top-0 bg-transparent text-center">
                                    <form action="cartServlet.do" method="post">
                                        <input type="hidden" name="productName" value="<%= product.getName() %>">
                                        <input type="hidden" name="productPrice" value="<%= product.getPrice() %>">
                                        <div class="d-flex justify-content-center align-items-center">
                                            <input class="form-control text-center me-3" id="inputQuantity" type="num" value="1" style="max-width: 3rem" name="quantity" min="1" />
                                            <button class="btn btn-outline-dark flex-shrink-0" type="submit">
                                                <i class="bi-cart-plus-fill me-1"></i>
                                                Add to cart
                                            </button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    <% } } else { %>
                        <p class="text-center lead">No products available at the moment. Please check back later!</p>
                    <% } %>
                </div>
            </div>
        </section>

        <footer class="py-5 bg-dark">
            <div class="container"><p class="m-0 text-center text-white">Copyright &copy; Moruti's Tuck Shop <%= new Date() %></p></div>
        </footer>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <script src="js/scripts.js"></script>
    </body>
    </html>