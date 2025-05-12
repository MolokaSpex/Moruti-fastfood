<%@page import="za.ac.tut.entities.Product"%>
<%@page import="za.ac.tut.entities.Product"%>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Shopping Cart</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        .equal-height {
            display: flex;
            align-items: stretch;
        }
        .cart-section, .summary-section {
            flex: 1;
            min-height: 100%;
        }
    </style>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container px-4 px-lg-5">
        <a class="navbar-brand" href="#!">Moruti's Tuck Shop</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                <li class="nav-item"><a class="nav-link active" aria-current="page" href="#!">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="#!">About</a></li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Shop</a>
                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="#!">All Products</a></li>
                        <li><hr class="dropdown-divider" /></li>
                        <li><a class="dropdown-item" href="#!">Food</a></li>
                        <li><a class="dropdown-item" href="#!">Snack</a></li>
                    </ul>
                </li>
            </ul>
            <form class="d-flex">
                <button class="btn btn-outline-dark" type="submit">
                    <i class="bi-cart-fill me-1"></i>
                    Cart
                    <span class="badge bg-dark text-white ms-1 rounded-pill">4</span>
                </button>
            </form>
        </div>
    </div>
</nav>

<div class="container mt-5">
    <div class="row equal-height">
        <div class="col-md-8 cart-section" id="cart-items-container">
            <h2 class="mb-4">Your Shopping Cart</h2>
            <%
                HashMap<Product, Integer> orderItems = (HashMap<Product, Integer>) session.getAttribute("listOfOrders");
                if (orderItems != null && !orderItems.isEmpty()) {
                    for (Map.Entry<Product, Integer> entry : orderItems.entrySet()) {
                        Product product = entry.getKey();
                        Integer quantity = entry.getValue();
            %>
            <div class="card p-3 mb-3">
                <div class="row align-items-center" data-product-id="<%= product.getId() %>">
                    <div class="col-md-3">
                    </div>
                    <div class="col-md-9">
                        <h5><%= product.getName() %></h5>
                        <p>Price: R<%= String.format("%.2f", product.getPrice()) %></p>
                        <div class="d-flex align-items-center">
                            <button class="btn btn-sm btn-outline-secondary">-</button>
                            <span class="mx-2"><%= quantity %></span>
                            <button class="btn btn-sm btn-outline-secondary">+</button>
                            <button class="btn btn-sm btn-danger ms-3">Delete</button>
                        </div>
                    </div>
                </div>
            </div>
            <%
                    }
                } else {
            %>
            <p>Your cart is empty.</p>
            <%
                }
            %>
        </div>

        <div class="col-md-4 summary-section">
            <div class="card p-4 bg-light shadow-sm">
                <h5 class="card-title text-center">Order Summary</h5>
                <hr>
                <p>Subtotal: <strong id="subtotal">R0.00</strong></p>
                <p>Delivery Fee: <strong>R10.00</strong></p>
                <p class="fs-5">Total: <strong id="total">R10.00</strong></p>
                <button class="btn btn-success w-100" id="checkout-button">Checkout</button>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
    function updateCart(productId, quantity) {
        fetch('orderItems', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded',
            },
            body: `action=update&productId=${productId}&quantity=${quantity}`,
        })
        .then(response => response.text())
        .then(data => {
            document.getElementById('cart-items-container').innerHTML = data;
            updateSummary();    
        })
        .catch(error => {
            console.error('Error updating cart:', error);
        });
    }

    function removeItem(productId) {
        fetch('orderItems', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded',
            },
            body: `action=remove&productId=${productId}`,
        })
        .then(response => response.text())
        .then(data => {
            document.getElementById('cart-items-container').innerHTML = data;
            updateSummary(); // Update the summary after cart update
        })
        .catch(error => {
            console.error('Error removing item:', error);
        });
    }

    function updateSummary() {
        fetch('orderItems?action=summary')
        .then(response => response.json())
        .then(data => {
            document.getElementById('subtotal').textContent = `R${data.subtotal.toFixed(2)}`;
            document.getElementById('total').textContent = `R${data.total.toFixed(2)}`;
        })
        .catch(error => {
            console.error('Error fetching summary:', error);
        });
    }

    document.addEventListener('click', function(event) {
        if (event.target.classList.contains('btn-sm') && event.target.textContent === '-') {
            const productId = event.target.closest('.row.align-items-center').dataset.productId;
            const quantitySpan = event.target.nextElementSibling;
            let quantity = parseInt(quantitySpan.textContent);
            if (quantity > 1) {
                updateCart(productId, quantity - 1);
            }
        } else if (event.target.classList.contains('btn-sm') && event.target.textContent === '+') {
            const productId = event.target.closest('.row.align-items-center').dataset.productId;
            const quantitySpan = event.target.previousElementSibling;
            let quantity = parseInt(quantitySpan.textContent);
            updateCart(productId, quantity + 1);
        } else if (event.target.classList.contains('btn-danger') && event.target.textContent === 'Delete') {
            const productId = event.target.closest('.row.align-items-center').dataset.productId;
            removeItem(productId);
        } else if (event.target.id === 'checkout-button') {
            // Optionally, you can send the final cart data to another servlet here
            fetch('orderConfirmation', { // Example: Send to orderConfirmation servlet
                method: 'POST',
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded',
                },
                body: `action=finalOrder`, // You'll need to handle this in the servlet
            })
            .then(response => response.text())
            .then(data => {
                window.location.href = 'orderConfirmation.jsp'; // Redirect to confirmation page
            })
            .catch(error => {
                console.error('Error during checkout:', error);
            });
        }
    });

    // Initially update the summary when the page loads
    updateSummary();
</script>
</body>
</html>