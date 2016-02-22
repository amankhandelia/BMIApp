<%-- 
    Document   : login
    Created on : Feb 11, 2016, 6:52:18 PM
    Author     : 1034834
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>BMI App</title>
        <link rel="stylesheet" href="Assets/styles/bootstrap.min.css">
        <link rel="stylesheet" href="Assets/styles/sigin.css">
        <link rel="stylesheet" href="Assets/styles/style.css">
        <style>
            input[type=number]::-webkit-inner-spin-button, 
input[type=number]::-webkit-outer-spin-button { 
  -webkit-appearance: none; 
  margin: 0; 
}
        </style>
    </head>
    <body>
        <nav class="navbar navbar-default navbar-fixed-top" style=" background:#337ab7;">
                <div class="container-fluid">
                    <div class="navbar-header">
                        <a href="#" class="navbar-brand">BMI App</a>
                    </div>
            </nav>
        <div class="container">
            <form class="form-signin has-feedback" method="post" action="Login">
                <h2 class="form-signin-heading">Sign in</h2>
                <label for="inputEmail" class="sr-only">Employee ID</label>
                <input type="number" id="inputEmail" class="form-control has-feedback" placeholder="Employee ID" required="" name="employeeid" autofocus="">
                <label for="inputPassword" class="sr-only">Password</label>
                <input type="password" id="inputPassword" name="password" class="form-control has-feedback" placeholder="Password" required="">
                <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
            </form>
            <script type="text/javascript" src="Assets/scripts/jquery-2.2.0.min.js"></script>
        <script type="text/javascript" src="Assets/scripts/bootstrap.min.js"></script>
        <script>
            
        </script>
        </div>
    </body>
</html>
