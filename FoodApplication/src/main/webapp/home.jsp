<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome to Food Trail</title>
    <!-- Include Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #FAFAF8; /* Light Gray */
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        .navbar {
            background-color: #FF7F50; /* Tangerine Orange */
        }
        .navbar-brand, .navbar-nav .nav-link {
            color: #fff !important;
        }
        .navbar-brand:hover, .navbar-nav .nav-link:hover {
            color: #FFDAB9 !important; /* Peach Puff */
        }
        .hero-section {
            background-color: #FFFAF0; /* Floral White */
            padding: 60px 20px;
            text-align: center;
        }
        .hero-section h1 {
            font-size: 3rem;
            color: #2C3E50; /* Midnight Blue */
        }
        .hero-section p {
            font-size: 1.2rem;
            color: #707070; /* Slate Gray */
        }
        .info-section, .features-section, .testimonials-section, .footer-section {
            padding: 50px 20px;
            text-align: center;
        }
        .info-section h2, .features-section h2, .testimonials-section h2, .footer-section h2 {
            font-size: 2rem;
            color: #008080; /* Deep Teal */
        }
        .info-section p, .features-section p, .testimonials-section p, .footer-section p {
            font-size: 1.1rem;
            color: #707070; /* Slate Gray */
        }
        .feature-item, .testimonial-item {
            margin-bottom: 30px;
        }
        .footer-section {
            background-color: #2C3E50; /* Midnight Blue */
            color: #fff;
        }
        .footer-section p {
            font-size: 0.9rem;
        }
    </style>
</head>
<body>
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg">
        <div class="container">
            <a class="navbar-brand" href="#">Food Trail</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item"><a class="nav-link" href="restaurant.jsp">Restaurants</a></li>
                    <li class="nav-item"><a class="nav-link" href="menu.jsp">Menu</a></li>
                    <li class="nav-item"><a class="nav-link" href="OrderHistoryController">Order History</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Hero Section -->
    <div class="hero-section">
        <h1>Welcome to Food Trail</h1>
        <p>Your one-stop solution for seamless food ordering and delivery.</p>
    </div>

    <!-- About Section -->
    <div class="container info-section">
        <h2>About Food Trail</h2>
        <p>
            Food Trail connects you with your favorite restaurants, offering a variety of cuisines for delivery right to your doorstep. 
            Experience a world of flavors with just a few clicks!
        </p>
    </div>

    <!-- Features Section -->
    <div class="container features-section">
        <h2>Why Choose Us?</h2>
        <div class="row">
            <div class="col-md-4 feature-item">
                <h5>Wide Variety of Cuisines</h5>
                <p>Discover a vast range of cuisines, from Indian to Continental, tailored to satisfy your cravings.</p>
            </div>
            <div class="col-md-4 feature-item">
                <h5>Real-Time Order Tracking</h5>
                <p>Track your food delivery live and get updates on your order status in real-time.</p>
            </div>
            <div class="col-md-4 feature-item">
                <h5>Exciting Deals & Offers</h5>
                <p>Enjoy exclusive discounts and special offers from top restaurants in your city.</p>
            </div>
        </div>
    </div>

    <!-- Testimonials Section -->
    <div class="container testimonials-section">
        <h2>What Our Customers Say</h2>
        <div class="row">
            <div class="col-md-6 testimonial-item">
                <p>"Food Trail made my weekend special with quick delivery and mouth-watering dishes. Highly recommend!"</p>
                <h6>- Sarah K.</h6>
            </div>
            <div class="col-md-6 testimonial-item">
                <p>"Best food ordering app ever! Great offers and a user-friendly interface."</p>
                <h6>- John D.</h6>
            </div>
        </div>
    </div>

    <!-- Footer Section -->
    <div class="footer-section">
        <p>&copy; 2024 Food Trail. All rights reserved. | <a href="#" style="color: #FFDAB9;">Privacy Policy</a> | <a href="#" style="color: #FFDAB9;">Terms of Service</a></p>
    </div>

    <!-- Include Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
