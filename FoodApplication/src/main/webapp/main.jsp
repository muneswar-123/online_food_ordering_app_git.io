<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Food Trail</title>
    <style>
        /* General body styling */
        body {
            margin: 0;
            padding: 0;
            font-family: 'Roboto', sans-serif;
            background: #f5f5f5; /* Light gray background */
            color: #333;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
        }

        /* App name animation */
        .app-name {
            font-size: 60px;
            font-weight: 600;
            text-align: center;
            color: #5c4033; /* Rich brown color */
            animation: grow 2s forwards;
            margin-bottom: 30px;
        }

        @keyframes grow {
            0% {
                font-size: 30px;
            }
            100% {
                font-size: 70px;
            }
        }

        /* Information text */
        .info-text {
            font-size: 18px;
            color: #666;
            text-align: center;
            margin-bottom: 30px;
            max-width: 600px;
        }

        /* Horizontal scrollable cards container */
        .cards-container {
            display: flex;
            overflow-x: scroll;
            gap: 20px;
            padding: 20px;
            margin-bottom: 40px;
            scroll-behavior: smooth;
            width: 80%;
        }

        /* Individual card styling */
        .food-card {
            width: 250px;
            height: 350px;
            background-color: #fff;
            border-radius: 15px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease;
            text-align: center;
        }

        .food-card:hover {
            transform: scale(1.05);
        }

        .food-card img {
            width: 100%;
            height: 200px;
            border-radius: 15px 15px 0 0;
            object-fit: cover;
        }

        .food-card .food-name {
            font-size: 20px;
            font-weight: bold;
            margin-top: 15px;
        }

        /* Scrollbar Styling */
        .cards-container::-webkit-scrollbar {
            height: 8px;
        }

        .cards-container::-webkit-scrollbar-thumb {
            background: #888;
            border-radius: 5px;
        }

        .cards-container::-webkit-scrollbar-thumb:hover {
            background: #555;
        }

        .cards-container::-webkit-scrollbar-track {
            background: #f5f5f5;
        }

        /* Button container */
        .button-container {
            position: absolute;
            top: 20px; /* Distance from the top */
            right: 20px; /* Distance from the right */
            display: flex;
            gap: 20px;
            z-index: 10; /* Ensures the buttons appear on top of other content */
        }

        /* Button styling */
        .button-container button {
            padding: 12px 20px;
            font-size: 18px;
            font-weight: bold;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background 0.3s ease;
        }

        /* Login button */
        .login-btn {
            background-color: #4CAF50;
            color: white;
        }

        .login-btn:hover {
            background-color: #45a049;
        }

        /* Sign Up button */
        .signup-btn {
            background-color: #007bff;
            color: white;
        }

        .signup-btn:hover {
            background-color: #0056b3;
        }

        /* Hero Section styling */
        .hero-section {
            text-align: center;
            margin-top: 50px;
        }

        /* Info Section Styling */
        .info-section {
            text-align: center;
            margin-top: 30px;
        }

        /* Features Section */
        .features-section {
            background-color: #fff;
            padding: 50px 20px;
            margin-top: 40px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
        }

        .feature-item {
            margin-bottom: 20px;
        }

        /* Testimonials Section */
        .testimonials-section {
            background-color: #f9f9f9;
            padding: 50px 20px;
            margin-top: 40px;
        }

        .testimonial-item {
            text-align: center;
            font-style: italic;
        }

        /* Footer Section */
        .footer-section {
            background-color: #333;
            color: white;
            padding: 20px;
            text-align: center;
            position: fixed;
            bottom: 0;
            width: 100%;
        }
    </style>
</head>
<body>

<!-- Button Container for Login and Sign Up -->
<div class="button-container">
    <a href="Login.jsp">
        <button class="login-btn">Login</button>
    </a>
    <a href="Register.jsp">
        <button class="signup-btn">Sign Up</button>
    </a>
</div>

<!-- App Name Section -->
<div class="app-name" id="appName">
    <!-- The text will be animated and shown here -->
</div>

<!-- Information Section -->
<div class="info-text">
    Discover the finest food from around the world. Browse through our variety of dishes, select your favorite, and order them with ease. Let's start exploring!
</div>

<!-- Horizontal Scrollable Food Cards -->
<div class="cards-container">
    <!-- Card 1 -->
    <div class="food-card">
        <img src="https://via.placeholder.com/250x200?text=Pizza" alt="Pizza">
        <div class="food-name">Pizza</div>
    </div>
    <!-- Card 2 -->
    <div class="food-card">
        <img src="https://via.placeholder.com/250x200?text=Burger" alt="Burger">
        <div class="food-name">Burger</div>
    </div>
    <!-- Card 3 -->
    <div class="food-card">
        <img src="https://via.placeholder.com/250x200?text=Sushi" alt="Sushi">
        <div class="food-name">Sushi</div>
    </div>
    <!-- Card 4 -->
    <div class="food-card">
        <img src="https://via.placeholder.com/250x200?text=Pasta" alt="Pasta">
        <div class="food-name">Pasta</div>
    </div>
    <!-- Card 5 -->
    <div class="food-card">
        <img src="https://via.placeholder.com/250x200?text=Salad" alt="Salad">
        <div class="food-name">Salad</div>
    </div>
</div>

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
    <p>&copy; 2024 Food Trail. All rights reserved.</p>
</div>

<script>
    // Animation to grow the app name
    window.onload = function () {
        document.getElementById('appName').innerText = 'Food Trail';
    }
</script>

</body>
</html>
