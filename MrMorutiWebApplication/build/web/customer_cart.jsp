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
<!-- Navigation-->
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
        <!-- Shopping Cart Left -->
        <div class="col-md-8 cart-section">
            <h2 class="mb-4">Your Shopping Cart</h2>
            <div class="card p-3 mb-3">
                <div class="row align-items-center">
                    <div class="col-md-3">
                        <img src="assets/chips.jpg" class="img-fluid rounded" style="max-width: 80px;" alt="Kota">
                    </div>
                    <div class="col-md-9">
                        <h5>Chips</h5>
                        <p>Price: R25.00</p>
                        <div class="d-flex align-items-center">
                            <button class="btn btn-sm btn-outline-secondary">-</button>
                            <span class="mx-2">2</span>
                            <button class="btn btn-sm btn-outline-secondary">+</button>
                            <button class="btn btn-sm btn-danger ms-3">Delete</button>
                        </div>
                    </div>
                </div>
            </div>
            
            
            <div class="card p-3 mb-3">
                <div class="row align-items-center">
                    <div class="col-md-3">
                        <img src="assets/bread.jpg" class="img-fluid rounded" style="max-width: 80px;" alt="Kota">
                    </div>
                    <div class="col-md-9">
                        <h5>Bread</h5>
                        <p>Price: R20.00</p>
                        <div class="d-flex align-items-center">
                            <button class="btn btn-sm btn-outline-secondary">-</button>
                            <span class="mx-2">2</span>
                            <button class="btn btn-sm btn-outline-secondary">+</button>
                            <button class="btn btn-sm btn-danger ms-3">Delete</button>
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="card p-3 mb-3">
                <div class="row align-items-center">
                    <div class="col-md-3">
                        <img src="assets/milypie.jpg" class="img-fluid rounded" style="max-width: 80px;" alt="Kota">
                    </div>
                    <div class="col-md-9">
                        <h5>milky Pie</h5>
                        <p>Price: R11.00</p>
                        <div class="d-flex align-items-center">
                            <button class="btn btn-sm btn-outline-secondary">-</button>
                            <span class="mx-2">2</span>
                            <button class="btn btn-sm btn-outline-secondary">+</button>
                            <button class="btn btn-sm btn-danger ms-3">Delete</button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="card p-3 mb-3">
                <div class="row align-items-center">
                    <div class="col-md-3">
                        <img src="assets/kota.jpg" class="img-fluid rounded" style="max-width: 80px;" alt="Kota">
                    </div>
                    <div class="col-md-9">
                        <h5>Kota</h5>
                        <p>Price: R25.00</p>
                        <div class="d-flex align-items-center">
                            <button class="btn btn-sm btn-outline-secondary">-</button>
                            <span class="mx-2">2</span>
                            <button class="btn btn-sm btn-outline-secondary">+</button>
                            <button class="btn btn-sm btn-danger ms-3">Delete</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Order Summary Right -->
        <div class="col-md-4 summary-section">
            <div class="card p-4 bg-light shadow-sm">
                <h5 class="card-title text-center">Order Summary</h5>
                <hr>
                <p>Subtotal: <strong>R70.00</strong></p>
                <p>Delivery Fee: <strong>R10.00</strong></p>
                <p class="fs-5">Total: <strong>R80.00</strong></p>
                <button class="btn btn-success w-100">Checkout</button>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
