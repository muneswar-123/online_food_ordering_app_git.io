<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login/Register</title>
    <style>
        @import url('https://fonts.googleapis.com/css?family=Roboto:300');

        /* Body styling with background image */
        body {
            background-image: url('https://wallpapercave.com/wp/wp3376127.jpg');
            background-size: cover;
            background-position: center;
            font-family: "Roboto", sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        /* Main container styling */
        .login-page {
            width: 380px;
            padding: 20px;
            margin: auto;
            background: rgba(255, 255, 255, 0.8); /* Transparent background for the form */
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.3);
            text-align: center;
        }

        /* Heading styling */
        .form h2 {
            font-size: 24px;
            margin-bottom: 20px;
            color: #333;
            font-weight: 500;
        }

        /* Input field styling */
        .form input {
            font-family: "Roboto", sans-serif;
            background: #f1f1f1;
            width: 100%;
            border: 1px solid #ddd;
            margin: 10px 0;
            padding: 12px;
            font-size: 15px;
            border-radius: 5px;
            box-sizing: border-box;
            transition: border-color 0.3s ease;
        }
        .form input:focus {
            border-color: #4CAF50;
        }

        /* Button styling */
        .form button {
            font-family: "Roboto", sans-serif;
            text-transform: uppercase;
            background: #4CAF50;
            width: 100%;
            border: 0;
            padding: 12px;
            color: #FFFFFF;
            font-size: 15px;
            font-weight: bold;
            margin-top: 15px;
            transition: background 0.3s ease;
            cursor: pointer;
            border-radius: 5px;
        }
        .form button:hover {
            background: #43A047;
        }

        /* Message styling */
        .form .message {
            margin: 20px 0 0;
            font-size: 14px;
            color: #555;
        }
        .form .message a {
            color: #4CAF50;
            text-decoration: none;
            font-weight: bold;
        }
        .form .message a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

<div class="login-page">
    <div class="form">
        <h2>Login to Your Account</h2>
        <form class="login-form" action="Login">
            <input type="text" placeholder="Username" name="email" required/>
            <input type="password" placeholder="Password" name="password" required/>
            <button type="submit">Login</button>
            <p class="message">Not registered? <a href="Register.jsp">Create an account</a></p>
        </form>
    </div>
</div>

</body>
</html>
