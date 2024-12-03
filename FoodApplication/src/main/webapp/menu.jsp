<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.foodapplication.model.model.Menu"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Menu List</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-size: cover;
            background-attachment: fixed;
            background-position: center;
            margin: 0;
            height: 100vh;
        }

        .container {
            margin-top: 50px;
        }

        .menu-card {
            width: 100%; /* Full width of the column */
            margin-bottom: 20px;
            border: none;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            background-color: rgba(139, 69, 19, 0.5);
            height: 100%; /* Ensures consistent height */
        }

        .card-title {
            font-weight: bold;
        }

        .card-img-top {
            height: 200px; /* Fixed image height */
            object-fit: cover; /* Ensures images maintain aspect ratio and fill space */
        }

        .btn-primary {
            background-color: black;
            border-color: #008CBA;
        }

        .btn-primary:hover {
            background-color: #005f73;
            border-color: #005f73;
        }

        .previous-btn {
            margin-top: 20px;
            margin-bottom: 20px;
        }

        .btn-container {
            display: flex;
            gap: 20px;
             margin-top: 20px;
        }

        .btn-container .btn {
            flex: 1;
        }

        .col-md-4 {
            display: flex;
            justify-content: center;
            margin-bottom: 30px; /* Added space between cards */
        }

        .row {
            display: flex;
            flex-wrap: wrap; /* Ensures cards wrap to the next row */
            justify-content: space-between; /* Evenly distributes space between the cards */
        }

        .card-body {
            padding: 15px;
        }

        .card-img-top {
            max-height: 200px; /* Limit image height */
            object-fit: cover; /* Ensures image fills space without distorting */
        }
    </style>
</head>
<body>

    <!-- Previous Button (Home and Restaurant Buttons Side by Side) -->
    <div class="container previous-btn">
        <div class="row">
            <div class="col-md-6 text-center">
                <a href="home.jsp" class="btn btn-secondary w-100">Home</a>
            </div>
            <div class="col-md-6 text-center">
                <a href="restaurant.jsp" class="btn btn-secondary w-100">Restaurant Page</a>
            </div>
        </div>
    </div>

    <!-- Display Success Message -->
    <% 
        String message = (String) request.getAttribute("message");
        if (message != null) {
    %>
        <div class="alert alert-success" role="alert">
            <%= message %>
        </div>
    <% } %>

    <!-- Menu List as Cards -->
    <div class="container">
        <div class="row">
            <% 
                List<Menu> menuList = (List<Menu>) session.getAttribute("menuList");
                if (menuList != null) {
                    for (Menu menu : menuList) { 
            %>
                <div class="col-md-4">
                    <div class="card menu-card">
                        <div class="card-body">
                            <img src="ShowMenu?menuId=<%= menu.getMid() %>&imageRequest=true" class="card-img-top" alt="<%= menu.getName() %>"><br><br>
                            <h5 class="card-title"><%= menu.getName() %></h5>
                            <p class="card-text"><%= menu.getDescription() %></p>
                            <p class="card-text">Price: <%= menu.getPrice() %></p>
                            <p class="card-text">Rating: <%= menu.getRating() %></p>

                            <!-- Add to Cart Form -->
                            <form action="AddToCartController" method="get">
                                <input type="hidden" name="menuId" value="<%= menu.getMid() %>">
                                Quantity: <input type="number" name="quantity" min="1" required>
                                <div class="btn-container mt-2">
                                    <button type="submit" class="btn btn-primary">Add To Cart</button>
                                    <a href="cart.jsp" class="btn btn-primary">View Cart</a>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            <% 
                    } 
                } else {
            %>
                <p>No menu items available.</p>
            <% } %>
        </div>
    </div>

    <!-- Include Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
