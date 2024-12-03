<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.foodapplication.model.model.Restaurant" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Restaurant List</title>
<style>
    /* General styling */
    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        display: flex;
        justify-content: center;
        background-color: #F5F7F8; /* Light Gray */
    }

    /* Container styling */
    .card-container {
        display: flex;
        flex-wrap: wrap;
        gap: 20px;
        max-width: 1200px;
        margin: 20px;
    }

    /* Card styling */
    .card {
        flex: 1 1 calc(33.333% - 20px);
        background-color: #FCDE70; /* Soft Yellow */
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
    }

    .card h3 {
        font-size: 1.25em;
        color: #E8B86D; /* Warm Brown */
        margin-bottom: 10px;
    }

    .card p {
        color: #185519; /* Dark Green */
        margin: 5px 0;
    }

    /* Responsive styling */
    @media (max-width: 768px) {
        .card {
            flex: 1 1 calc(50% - 20px);
        }
    }

    @media (max-width: 480px) {
        .card {
            flex: 1 1 100%;
        }
    }
</style>
</head>
<body>
<% 
    List<Restaurant> restaurantList = (List<Restaurant>)session.getAttribute("restaurantList");
%>

<div class="card-container">
    <% for (Restaurant restaurant : restaurantList) { %>
        <div class="card">
            <h3><%= restaurant.getName() %></h3>
            <p><strong>Cuisine Type:</strong> <%= restaurant.getCusineeType() %></p>
            <p><strong>Address:</strong> <%= restaurant.getAddress() %></p>
            <p><strong>Rating:</strong> <%= restaurant.getRating() %></p>
            <p><strong>Achieved:</strong> <%= restaurant.getIaAchive() %></p>
            <a href = "ShowMenu?restaurant_id=<%=restaurant.getRid()%>"><button>View Menu</button></a>
        </div>
    <% } %>
</div>

</body>
</html>
