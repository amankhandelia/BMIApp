<%-- 
    Document   : Analysis
    Created on : Mar 11, 2015, 3:52:22 PM
    Author     : Manish
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!--        <noscript>
        <meta http-equiv="refresh" content="1; url=JSDisableErrorPage.jsp">
        </noscript>-->
        <title>TCS iGnite</title>
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" />
        <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" />
        <link href="CSS/header.css" rel="stylesheet" />
        <link href="CSS/Login.css" rel="stylesheet" />
        <link href="CSS/footer.css" rel="stylesheet"/>
    </head>
    <body>


        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12 col-md-12 header" style="text-align: center;padding: 20px 0px;">
                    <div class="title">BMI</div>
                    <!--<div class="bottom-line">Past Data, Present Analysis, Future Prediction</div>-->
                </div>
            </div>
        </div>

        <div class="container-fluid nopadding">
            <div class="col-lg-12 bg invisible"></div>
            <div class="col-lg-6 col-md-6 col-lg-offset-3 col-md-offset-3">
                <div role="tabpanel" id="tabpanel">
                    <!-- Nav tabs -->
                    <ul class="nav nav-tabs tab-ul" role="tablist">
                        <li role="presentation" class="active"><a href="#tab5" aria-controls="tab5" role="tab" data-toggle="tab"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
                        <!--<li role="presentation" class=""><a href="#tab6" aria-controls="tab6" role="tab" data-toggle="tab"><span class="glyphicon glyphicon-user"></span> Register</a></li>-->
                    </ul>
                    <!-- Tab panes -->
                    <div class="tab-content">
                        <div role="tabpanel" class="tab-pane active" id="tab5">
                            <!--Prev id of form is myform-->
                            <form id="LoginForm" method="post" action="Login">
                                <div class="form-row clearfix">
                                    <div class="col-lg-8 col-md-8 col-lg-offset-2 col-md-offset-2">
                                        <div class="row">
                                            <div class="col-lg-1">
                                                <span class="glyphicon glyphicon-user"></span>
                                            </div>
                                            <div class="col-lg-11">
                                                <label>Employee ID</label>
                                                <input id="login-username" name="employeeid" type="text" value="" autocomplete="off" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-row clearfix">
                                    <div class="col-lg-8 col-md-8 col-lg-offset-2 col-md-offset-2">
                                        <div class="row">
                                            <div class="col-lg-1">
                                                <span class="glyphicon glyphicon-lock"></span>
                                            </div>
                                            <div class="col-lg-11">
                                                <label>Password</label>
                                                <input id="login-password" name="password" type="password" autocomplete="off" />
                                                <!--<div><a class="pull-right fp" href="Forgot.jsp">Forgot password?</a></div>-->
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="button-box clearfix">
                                    <div class="col-lg-8 col-md-8 col-lg-offset-2 col-md-offset-2">
                                        <div class="row">
                                            <div class="col-lg-6">
                                                <button type="submit" id="login">Login</button>
                                            </div>
                                            <div class="col-lg-6">
                                                <button type="reset" id="btnreset">Reset</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="footer.jsp" %>
        <script src="JS/jquery-1.10.2.js"></script>
        <script src="bootstrap/js/bootstrap.min.js"></script>
        <script>
        </script>
    </body>
</html>
