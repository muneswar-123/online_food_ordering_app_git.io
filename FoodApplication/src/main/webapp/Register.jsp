<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Register</title>
    <style>
        /* Import Roboto font */
        @import url(https://fonts.googleapis.com/css?family=Roboto:300);

        /* Body styling with fixed background image */
        body {
            background-image: url(https://wallpapercave.com/wp/wp3376127.jpg);
            background-size: cover;
            background-position: center;
            background-attachment: fixed; /* Fixes the background image */
            font-family: "Roboto", sans-serif;
            -webkit-font-smoothing: antialiased;
            -moz-osx-font-smoothing: grayscale;
            margin: 0;
            height: 100vh; /* Full viewport height */
            display: flex;
            justify-content: center;
            align-items: center;
            overflow: hidden; /* Prevent scrolling */
        }

        /* Semi-transparent background */
        .register-page {
            width: 100%;
            max-width: 360px; /* Set max-width for form */
            padding: 5px; /* Equal padding above and below */
            margin: auto;
            background: rgba(255, 255, 255, 0.9); /* White background with opacity */
            border-radius: 8px;
            box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
        }

        /* Form container styling */
        .form {
            position: relative;
            z-index: 1;
            text-align: center;
            padding: 30px 40px;
        }

        /* Input field styling */
        .form input {
            font-family: "Roboto", sans-serif;
            outline: 0;
            background: #f2f2f2;
            width: 100%;
            border: 0;
            margin: 0 0 15px;
            padding: 12px;
            box-sizing: border-box;
            font-size: 14px;
            border-radius: 4px;
        }

        /* Button styling */
        .form button {
            font-family: "Roboto", sans-serif;
            text-transform: uppercase;
            outline: 0;
            background: #4CAF50;
            width: 100%;
            border: 0;
            padding: 12px;
            color: #ffffff;
            font-size: 14px;
            font-weight: bold;
            transition: all 0.3s ease;
            cursor: pointer;
            border-radius: 4px;
        }

        .form button:hover, .form button:active, .form button:focus {
            background: #43A047;
        }

        /* Label styling */
        .form label {
            display: block;
            margin-top: 10px;
            font-size: 14px;
            color: balck;
            text-align: left;
        }

        /* Message styling */
        .form .message {
            margin: 15px 0 0;
            color: #b3b3b3;
            font-size: 12px;
        }

        .form .message a {
            color: #4CAF50;
            text-decoration: none;
        }
    </style>
</head>
<body>

<div class="register-page">
    <div class="form">
        <h2>Register</h2>

        <form action="Register" method="POST">
            <label for="name">Name</label>
            <input type="text" id="name" name="name" placeholder="Enter your name" required>

            <label for="email">Email</label>
            <input type="email" id="email" name="email" placeholder="Enter your email" required>

            <label for="password">Password</label>
            <input type="password" id="password" name="password" placeholder="Enter your password" required>

            <label for="number">Mobile Number</label>
            <input type="number" id="number" name="number" placeholder="Enter your mobile number" required>

            <button type="submit">Register</button>

            <p class="message">Already registered? <a href="Login.jsp">Sign In</a></p>
        </form>
    </div>
</div>

</body>
</html>
