<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Set" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@page import="za.ac.tut.entities.Product"%>
<%
    // Get the cart from the session.
    Map<String, Integer> cart = (Map<String, Integer>) session.getAttribute("cart");
    if (cart == null) {
        cart = new HashMap();
        session.setAttribute("cart", cart);
    }

     
    double totalPrice = 0;
    int totalItems = 0;

    List<Product> listOfProducts = (List<Product>) session.getAttribute("listOfProducts");
     
     
%>

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
        .cart-item-row {  
            margin-bottom: 15px;  
            padding-bottom: 15px;
            border-bottom: 1px solid #ddd;  
        }
        .cart-item-row:last-child {
            border-bottom: none;  
            padding-bottom: 0;
            margin-bottom: 0;
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
            <form class="d-flex" action="product_catalog.jsp" method="get">
                <button class="btn btn-outline-dark" type="submit">
                    <i class="bi-cart-fill me-1"></i>
                    Continue Shopping
                </button>
            </form>
        </div>
    </div>
</nav>

<div class="container mt-5">
    <div class="row equal-height">
        <div class="col-md-8 cart-section">
            <h2 class="mb-4">Your Shopping Cart</h2>
            <%
                if (cart == null || cart.isEmpty()) {
            %>
            <div class="alert alert-info" role="alert">
                Your cart is empty.
            </div>
            <%
                } else {
                    for (Map.Entry<String, Integer> entry : cart.entrySet()) {
                        String productName = entry.getKey();
                        Integer quantity = entry.getValue();
                         List<Product> listOfProducts 
                          for(Product product:listOfProducts){
                              if(product.getName().equalsIgnoreCase(productName)){
                               Double productPrice=product.getPrice();     
                                }
                            }
                         
                        if (productPrice != null)
                        {
                            double itemTotal = quantity * productPrice;
                            totalPrice += itemTotal;
                            totalItems += quantity;
            %>
            <div class="card p-3 mb-3 cart-item-row">
                <div class="row align-items-center">
                    <div class="col-md-3">
                        <img src="assets/<%=productName.toLowerCase().replaceAll(" ", "")%>.jpg" class="img-fluid rounded" style="max-width: 80px;" alt="<%=productName%>">
                    </div>
                    <div class="col-md-9">
                        <h5><%=productName%></h5>
                        <p>Price: R<%=String.format("%.2f", productPrice)%></p>
                        <div class="d-flex align-items-center">
                            <button class="btn btn-sm btn-outline-secondary">-</button>
                            <span class="mx-2"><%=quantity%></span>
                            <button class="btn btn-sm btn-outline-secondary">+</button>
                            <button class="btn btn-sm btn-danger ms-3">Delete</button>
                        </div>
                    </div>
                </div>
            </div>
            <%
                        }
                        else
                        {
                            out.println("<p>Price for " + productName + " not found.</p>");
                        }
                    }
                }
            %>
        </div>

        <div class="col-md-4 summary-section">
            <div class="card p-4 bg-light shadow-sm">
                <h5 class="card-title text-center">Order Summary</h5>
                <hr>
                <p>Subtotal: <strong>R<%=String.format("%.2f", totalPrice)%></strong></p>
                <p>Delivery Fee: <strong>R10.00</strong></p>
                <p class="fs-5">Total: <strong>R<%=String.format("%.2f", totalPrice + 10)%></strong></p>
                <button class="btn btn-success w-100" data-bs-toggle="modal" data-bs-target="#checkoutModal">Checkout</button>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="checkoutModal" tabindex="-1" aria-labelledby="checkoutModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg modal-dialog-scrollable"> <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="checkoutModalLabel">Checkout</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <h3>Shipping Information</h3>
                <hr class="mb-3">
                <div class="row g-3">
                    <div class="col-sm-6">
                        <label for="firstName" class="form-label">First Name</label>
                        <input type="text" class="form-control" id="firstName" required>
                    </div>
                    <div class="col-sm-6">
                        <label for="lastName" class="form-label">Last Name</label>
                        <input type="text" class="form-control" id="lastName" required>
                    </div>
                    <div class="col-12">
                        <label for="address" class="form-label">Address</label>
                        <input type="text" class="form-control" id="address" placeholder="123 Main St" required>
                    </div>
                    <div class="col-12">
                        <label for="address2" class="form-label">Address 2 <span class="text-muted">(Optional)</span></label>
                        <input type="text" class="form-control" id="address2" placeholder="Apartment or suite">
                    </div>
                    <div class="col-md-5">
                        <label for="country" class="form-label">Country</label>
                        <select class="form-select" id="country" required>
                            <option value="">Choose...</option>
                            <option>South Africa</option>
                            </select>
                    </div>
                    <div class="col-md-4">
                        <label for="province" class="form-label">Province</label>
                        <select class="form-select" id="province" required>
                            <option value="">Choose...</option>
                            <option>Gauteng</option>
                            <option>Mpumalanga</option>
                             <option>Limpopo</option>
                            </select>
                    </div>
                    <div class="col-md-3">
                        <label for="zip" class="form-label">Zip / Postal code</label>
                        <input type="text" class="form-control" id="zip" required>
                    </div>
                    <div class="col-12">
                        <label for="phone" class="form-label">Phone Number</label>
                        <input type="tel" class="form-control" id="phone">
                    </div>
                </div>

                <hr class="my-4">

                <h3>Payment Information</h3>
                <hr class="mb-3">

                <div class="form-check mb-3">
                    <input class="form-check-input" type="radio" name="paymentMethod" id="creditCard" value="creditCard" checked>
                    <label class="form-check-label" for="creditCard">
                        Credit Card
                    </label>
                </div>
                <div id="creditCardDetails" class="mb-3">
                    <div class="row g-3">
                        <div class="col-md-6">
                            <label for="cc-number" class="form-label">Credit card number</label>
                            <input type="text" class="form-control" id="cc-number" placeholder="XXXX-XXXX-XXXX-XXXX" required>
                            <div class="invalid-feedback">
                                Credit card number is required
                            </div>
                        </div>
                        <div class="col-md-3">
                            <label for="cc-expiry" class="form-label">Expiry</label>
                            <input type="text" class="form-control" id="cc-expiry" placeholder="MM/YY" required>
                            <div class="invalid-feedback">
                                Expiry date required
                            </div>
                        </div>
                        <div class="col-md-3">
                            <label for="cc-cvv" class="form-label">CVV</label>
                            <input type="text" class="form-control" id="cc-cvv" placeholder="123" required>
                            <div class="invalid-feedback">
                                Security code required
                            </div>
                        </div>
                    </div>
                </div>

                <div class="form-check mb-3">
                    <input class="form-check-input" type="radio" name="paymentMethod" id="eft" value="eft">
                    <label class="form-check-label" for="eft">
                        EFT (Electronic Funds Transfer)
                    </label>
                </div>
                <div id="eftDetails" style="display: none;" class="alert alert-info">
                    <p class="mb-0">Please make a transfer to the following bank details:</p>
                    <p class="mb-0">Bank: Example Bank</p>
                    <p class="mb-0">Account Number: 1234567890</p>
                    <p class="mb-0">Branch Code: 000000</p>
                    <p class="mb-0">Use your order number as a reference.</p>
                </div>

                <div class="form-check mb-3">
                    <input class="form-check-input" type="radio" name="paymentMethod" id="cash" value="cash">
                    <label class="form-check-label" for="cash">
                        Cash on Delivery <span class="text-muted">(Not Recommended)</span>
                    </label>
                </div>
                <div id="cashDetails" style="display: none;" class="alert alert-warning">
                    <p class="mb-0">Cash on delivery is currently not recommended due to safety reasons. Please choose another payment method if possible.</p>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary" onclick="processPayment()">Place Order</button>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
    const paymentOptions = document.querySelectorAll('input[name="paymentMethod"]');
    const creditCardDetails = document.getElementById('creditCardDetails');
    const eftDetails = document.getElementById('eftDetails');
    const cashDetails = document.getElementById('cashDetails');

    paymentOptions.forEach(option => {
        option.addEventListener('change', function() {
            creditCardDetails.style.display = this.value === 'creditCard' ? 'block' : 'none';
            eftDetails.style.display = this.value === 'eft' ? 'block' : 'none';
            cashDetails.style.display = this.value === 'cash' ? 'block' : 'none';
        });
    });

    function processPayment() {
        const firstName = document.getElementById('firstName').value;
        const lastName = document.getElementById('lastName').value;
        const address = document.getElementById('address').value;
        const address2 = document.getElementById('address2').value;
        const country = document.getElementById('country').value;
        const province = document.getElementById('province').value;
        const zip = document.getElementById('zip').value;
        const phone = document.getElementById('phone').value;
        const paymentMethod = document.querySelector('input[name="paymentMethod"]:checked').value;

        let paymentInfo = {};
        if (paymentMethod === 'creditCard') {
            paymentInfo = {
                cardNumber: document.getElementById('cc-number').value,
                expiryDate: document.getElementById('cc-expiry').value,
                cvv: document.getElementById('cc-cvv').value
            };
        } else if (paymentMethod === 'eft') {
            paymentInfo = { message: 'EFT selected. Please follow instructions.' };
        } else if (paymentMethod === 'cash') {
            paymentInfo = { message: 'Cash on delivery selected.' };
        }

        const orderDetails = {
            shippingAddress: { firstName, lastName, address, address2, country, province, zip, phone },
            paymentMethod: paymentMethod,
            paymentDetails: paymentInfo,
            cartItems: <%= cart %>,  
            totalPrice: <%= totalPrice + 10 %>
        };
 
    }
</script>
</body>
</html>