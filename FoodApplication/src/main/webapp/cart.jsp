<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.Map"%>
<%@ page import="com.foodapplication.model.model.Menu"%>
<%@ page import="com.foodapplication.model.model.CartItems"%>
<!DOCTYPE html>
<html>
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
            height: 100vh;
            margin: 0;
            font-family: 'Arial', sans-serif;
        }

        .container {
            margin-top: 50px;
        }

        /* Removed the unused CSS styles for menu card and alert */
        .dropdown-container {
            background-color: rgba(139, 69, 19, 0.5);
            padding: 15px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.05);
        }

        select.form-control {
            background-color: #fff;
            border-color: #8ecae6;
        }

        select.form-control:focus {
            border-color: #005f73;
        }

        .previous-btn .btn {
            margin-right: 10px;
        }

        /* Styling for buttons container (Home, Restaurant, Menu) */
        .btn-container {
            display: flex;
            justify-content: space-between;
            margin-bottom: 30px;
        }

        .btn-container .btn {
            flex: 1;
            padding: 10px;
        }

        .alert {
            margin-top: 20px;
        }
    </style>
</head>
<body>

    <!-- Previous Button (Home, Restaurant, Menu) -->
    <div class="container previous-btn">
        <div class="btn-container">
            <a href="home.jsp" class="btn btn-secondary">Home</a>
            <a href="restaurant.jsp" class="btn btn-secondary">Restaurant Page</a>
            <a href="menu.jsp" class="btn btn-secondary">Menu Page</a>
        </div>
    </div>

    <!-- Cart Dropdown for Update and Remove -->
    <div class="container mt-4 dropdown-container">
        <h4>Cart</h4>
        
        <% 
            // Get the cart from session
            Map<Integer, CartItems> cart = (Map<Integer, CartItems>) session.getAttribute("cart");

            if (cart != null && !cart.isEmpty()) {
        %>
        
        <!-- Update Cart Form -->
        <form action="UpdateController" method="get">
            <label for="menuId">Select Item to Update:</label>
            <select name="menuId" id="menuId" class="form-control">
                <% 
                    for (Map.Entry<Integer, CartItems> entry : cart.entrySet()) {
                        CartItems item = entry.getValue();
                %>
                    <option value="<%= item.getMenu_id() %>">
                        <%= item.getName() %> - Quantity: <%= item.getQuantity() %> - Sub Total: <%= item.getQuantity() * item.getPrice() %>
                    </option>
                <% 
                    }
                %>
            </select>
            <label for="quantity" class="mt-2">New Quantity:</label>
            <input type="number" name="quantity" min="1" class="form-control" required>
            <button type="submit" class="btn btn-secondary mt-2">Update Cart</button>
        </form>

        <!-- Remove Item Form -->
        <form action="RemoveItemController" method="post" class="mt-3">
            <label for="removeMenuId">Select Item to Remove:</label>
            <select name="menuId" id="removeMenuId" class="form-control">
                <% 
                    for (Map.Entry<Integer, CartItems> entry : cart.entrySet()) {
                        CartItems item = entry.getValue();
                %>
                    <option value="<%= item.getMenu_id() %>"><%= item.getName() %></option>
                <% 
                    }
                %>
            </select>
            <div>
                <button type="submit" class="btn btn-danger mt-2">Remove Item</button>
                <a href="checkout.jsp" class="btn btn-secondary mt-2">Proceed To Order</a>
            </div>
        </form>

        <% 
            } else {
        %>

        <!-- Alert when cart is empty -->
        <div class="alert alert-warning" role="alert">
            Your cart is empty! Please add some items to proceed with your order.
        </div>

        <% 
            }
        %>
        
    </div>

</body>
</html>
