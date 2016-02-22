<%-- 
    Document   : home
    Created on : Feb 11, 2016, 5:25:49 PM
    Author     : 1034834
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
        <link rel="stylesheet" href="Assets/styles/bootstrap.min.css">
        <link rel="stylesheet" href="Assets/styles/toastr.min.css">
        <style>
            .navbar-default .navbar-nav>li>a {
                color: #fff;
            }
            .navbar-default .navbar-brand {
                color: #fff;
            }
            #hi {
                color: #fff;
                text-decoration: none;
            }
            .navbar-default .navbar-text {
                color: #337ab7;
            }
            .dropdown-menu {
                min-width: 120px;
                text-align: center;
            }
            label {
                display: inline-block;
                max-width: 100%;
                margin-bottom: 5px;
                font-weight: inherit;
            }
        </style>
    </head>
    <body>
        <c:if test="${empty sessionScope.employeeId}">
            <c:redirect url="login.jsp"/>
        </c:if>
        <div class="container-fluid">
            <nav class="navbar navbar-default navbar-fixed-top">
                <div class="container-fluid" style=" background:#337ab7;">
                    <div class="navbar-header">
                        <a href="home.jsp" class="navbar-brand">BMI App</a>
                        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#hamburger-navigation">
                            <span class="sr-only">Navigation toggle</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                    </div>
                    <div class="collapse navbar-collapse" id="hamburger-navigation">
                        <div class="navbar-text navbar-right">
                            <li class="dropdown">
                                <a id = "hi" class="dropdown-toggle" role="button" data-toggle="dropdown" style="padding-right: 20pt">Hi ${sessionScope.name}</a>
                                <ul class="dropdown-menu">
                                    <li id="logout"><a href="logout">Logout</a></li>
                                </ul>
                            </li>
                        </div>
                        <ul class="nav navbar-nav" role="menu">
                            <li><a href="home.jsp" class="active">BMI Data</a><span class="sr-only">current</span></li>
                            <li><a href="#">Report</a></li>
                        </ul>
                    </div>
                </div>
            </nav>

        </div>

        <script type="text/javascript" src="Assets/scripts/jquery-2.2.0.min.js"></script>
        <script type="text/javascript" src="Assets/scripts/bootstrap.min.js"></script>
        <script type="text/javascript" src="Assets/scripts/toastr.min.js"></script>
        <script>
            function calculateBMI(a, b) {
                var aVal = parseFloat(a), bVal = parseFloat(b);
                return a / ((b / 100) * (b / 100));
            }
            var store;
            $(document).ready(function() {
                toastr.options = {
                    "closeButton": true,
                    "debug": false,
                    "newestOnTop": false,
                    "progressBar": true,
                    "positionClass": "toast-top-center",
                    "preventDuplicates": true,
                    "onclick": null,
                    "showDuration": "300",
                    "hideDuration": "1000",
                    "timeOut": "5000",
                    "extendedTimeOut": "1000",
                    "showEasing": "swing",
                    "hideEasing": "linear",
                    "showMethod": "fadeIn",
                    "hideMethod": "fadeOut"
                };

                var entertable = $('#traineeTable').DataTable({
                    "columnDefs": [
                        {"width": "10%", "targets": 0},
                        {"width": "15%", "targets": 1},
                        {"width": "20%", "targets": 2},
                        {"width": "15%", "targets": 3},
                        {"width": "15%", "targets": 4},
                        {"width": "10%", "targets": 5},
                        {"width": "15%", "targets": 6}
                    ]
                });
                var editTable = $('#traineeEditDataTable').DataTable({
                    "columnDefs": [
                        {"width": "5%", "targets": 0},
                        {"width": "10%", "targets": 1},
                        {"width": "20%", "targets": 2},
                        {"width": "20%", "targets": 3},
                        {"width": "20%", "targets": 4},
                        {"width": "10%", "targets": 5},
                        {"width": "15%", "targets": 6}
                    ]
                });
                $.ajax({
                    url: 'TraineeDetail',
                    method: 'GET',
                    success: function(resp) {
                        var aData = JSON.parse(resp);
                        store = aData;
                        var bmi = "<label for='bmi' title='Body Mass Index'>N.A.</label>", weight = "<input style='width: 100%;' class='form-control' type='text' placeholder='Kilograms' name='weight'>", height = "<input style='width: 100%;' class='form-control' type='text' placeholder='Centimeters' name='height'>";
                        var submit = "<input disabled='true' style='background: #337ab7;color: #fff;width: 100%;' class='mySubmit btn btn-default' type='button'  value='Submit'>"
                        for (var i = 0; i < store.length; i++) {
                            entertable.row.add([(i + 1), '<span data-ignite="id">' + store[i][0] + '</span>', '<span data-name="traineeName">' + store[i][1] + '</span>', height, weight, bmi, submit]).draw(true);
                        }
                    },
                    error: function(e) {
                        console.log(e);
                    }
                });
                $('a[href^="#tabs-edit"]').on('click', function() {
                    editTable.clear().draw();
                    $.ajax({
                        url: 'TraineeDetailsByEmp',
                        method: 'GET',
                        success: function(resp) {
                            var aData = JSON.parse(resp);
                            store = aData;
                            console.log(aData);
                            var bmi = "<label for='bmi' title='Body Mass Index'>", endBmi = "</label>";
//                                    weight = "<input disabled style='width: 100%;' class='form-control' type='text' placeholder='Kilograms' name='weight' value ='", endWeight = "'>", height = "<input style='width: 100%;' class='form-control' type='text' disabled placeholder='Centimeters' name='height' value ='", endHeight = "'>";
                            var weight = "<label title='Kilograms'>", endWeight = "</label>", height = "<label title='Centimeters'>", endHeight = "</label>";
                            var edit = "<input style='background: #337ab7;color: #fff;width: 100%;' class='btn btn-default' type='button'  value='Edit'>";
                            for (var i = 0; i < store.length; i++) {
                                editTable.row.add([(i + 1), '<span data-ignite="id">' + store[i][0] + '</span>', '<span data-name="traineeName">' + store[i][1] + '</span>', height + store[i][2] + endHeight, weight + store[i][3] + endWeight, bmi + store[i][4] + endBmi, edit]).draw(true);
                            }
                        },
                        error: function(e) {
                            console.log(e);
                        }
                    });
                });
                $('a[href^="#tabs-enter"]').on('click', function() {
                    entertable.clear().draw();
                    $.ajax({
                        url: 'TraineeDetail',
                        method: 'GET',
                        success: function(resp) {
                            var aData = JSON.parse(resp);
                            store = aData;
                            var bmi = "<label for='bmi' title='Body Mass Index'>N.A.</label>", weight = "<input style='width: 100%;' class='form-control' type='text' placeholder='Kilograms' name='weight'>", height = "<input style='width: 100%;' class='form-control' type='text' placeholder='Centimeters' name='height'>";
                            var submit = "<input disabled='true' style='background: #337ab7;color: #fff;width: 100%;' class='mySubmit btn btn-default' type='button'  value='Submit'>"
                            for (var i = 0; i < store.length; i++) {
                                entertable.row.add([(i + 1), '<span data-ignite="id">' + store[i][0] + '</span>', '<span data-name="traineeName">' + store[i][1] + '</span>', height, weight, bmi, submit]).draw(true);
                            }
                        },
                        error: function(e) {
                            console.log(e);
                        }
                    });
                });
                $('#traineeTable tbody,#traineeEditDataTable tbody').on('keypress', 'input[placeholder^="Kilograms"]', function(event) {
                    //46 -> KeyCode for decimal point
                    if (!((event.which >= 48 && event.which <= 57) || event.which === 46 || event.which === 8)) {
                        event.preventDefault();
                        toastr.error("Only decimal value is allowed");
                        return;
                    }
                    if ($(this).parents("tr").find('input[placeholder^="Centimeters"]').val().length !== 0) {
                        $(this).parents("tr").find('input[value^="Submit"]').removeAttr("disabled");
                        var bmi = calculateBMI($(this).parents("tr").find('input[placeholder^="Kilograms"]').val() + String.fromCharCode(event.which), $(this).parents("tr").find('input[placeholder^="Centimeters"]').val());
                        if (!isNaN(bmi)) {
                            bmi = Math.round(bmi * 100) / 100;
                            $(this).parents("tr").find('label[for^="bmi"]').text(bmi);
                        } else {
                            $(this).parents("tr").find('label[for^="bmi"]').text("N.A.");
                        }
                    } else {
                        $(this).parents("tr").find('input[value^="Submit"]').attr("disabled", "true");
                    }
                });
                $('#traineeTable tbody,#traineeEditDataTable tbody').on('keyup', 'input[placeholder^="Centimeters"]', function(event) {
                    if ($(this).val().length === 0) {
                        $(this).parents("tr").find('input[value^="Submit"]').attr("disabled", "true");
                        $(this).parents("tr").find('label[for^="bmi"]').text("N.A.");
                    } else if ($(this).parents("tr").find('input[placeholder^="Kilograms"]').val().length !== 0) {
                        $(this).parents("tr").find('input[value^="Submit"]').removeAttr("disabled");
                        var bmi = calculateBMI($(this).parents("tr").find('input[placeholder^="Kilograms"]').val(), $(this).parents("tr").find('input[placeholder^="Centimeters"]').val());
                        if (!isNaN(bmi)) {
                            bmi = Math.round(bmi * 100) / 100;
                            $(this).parents("tr").find('label[for^="bmi"]').text(bmi);
                        }
                    }
                });
                //For Checking if the user enter any 
                $('#traineeTable tbody,#traineeEditDataTable tbody').on('keyup', 'input[placeholder^="Kilograms"]', function(event) {
                    if ($(this).val().length === 0) {
                        $(this).parents("tr").find('input[value^="Submit"]').attr("disabled", "true");
                        $(this).parents("tr").find('label[for^="bmi"]').text("N.A.");
                    } else if ($(this).parents("tr").find('input[placeholder^="Centimeters"]').val().length !== 0) {
                        var bmi = calculateBMI($(this).parents("tr").find('input[placeholder^="Kilograms"]').val(), $(this).parents("tr").find('input[placeholder^="Centimeters"]').val());
                        if (!isNaN(bmi)) {
                            bmi = Math.round(bmi * 100) / 100;
                            $(this).parents("tr").find('label[for^="bmi"]').text(bmi);
                        }
                    }
                });
                $('#traineeTable tbody,#traineeEditDataTable tbody').on('keypress', 'input[placeholder^="Centimeters"]', function(event) {
                    if (!((event.which >= 48 && event.which <= 57) || (event.which === 8))) {
                        event.preventDefault();
                        toastr.error("Only numeric value is allowed");
                        return;
                    }
                    if ($(this).parents("tr").find('input[placeholder^="Kilograms"]').val().length !== 0) {
                        $(this).parents("tr").find('input[value^="Submit"]').removeAttr("disabled");
                        var bmi = calculateBMI($(this).parents("tr").find('input[placeholder^="Kilograms"]').val(), $(this).parents("tr").find('input[placeholder^="Centimeters"]').val() + String.fromCharCode(event.which));
                        if (!isNaN(bmi)) {
                            bmi = Math.round(bmi * 100) / 100;
                            $(this).parents("tr").find('label[for^="bmi"]').text(bmi);
                        } else {
                            $(this).parents("tr").find('label[for^="bmi"]').text("N.A.");
                        }
                    } else {
                        $(this).parents("tr").find('input[value^="Submit"]').attr("disabled", "true");
                    }
                });
                $('#traineeTable tbody,#traineeEditDataTable tbody').on('click', 'input[value^="Submit"]', function() {
                    var weight = $(this).parents("tr").find('input[placeholder^="Kilograms"]').val(), weightInt = parseFloat(weight);
                    var height = $(this).parents("tr").find('input[placeholder^="Centimeters"]').val(), heightInt = parseFloat(height);
                    if (height.length === 0) {
                        toastr.error("Please enter height.");
                        return;
                    }
                    if (weight.length === 0) {
                        toastr.error("Please enter weight.");
                        return;
                    }
                    var regexToCheckDecimal = /^\d+(\.\d{1,2})?$/;
                    if (!regexToCheckDecimal.test(weight)) {
                        toastr.error("Inappropriate format in weight column.Decimal upto two places are allowed.");
                        return;
                    }
                    if (!isNaN(weightInt)) {
                        weightInt = Math.round(weightInt * 100) / 100;
                    } else {
                        toastr.error("Only decimal value is allowed.");
                        return;
                    }
                    if (!isNaN(heightInt)) {
                        if (heightInt % 1 > 0) {
                            toastr.error("Decimal Value is not allowed in Height Column");
                            return;
                        } else {
                            var input = new Object();
                            input.weight = weightInt;
                            input.height = heightInt;
                            input.igniteId = $(this).parents("tr").find('span[data-ignite^="id"]').text();
                            input.name = $(this).parents("tr").find('span[data-name^="traineeName"]').text();
                            $.ajax({
                                context: this,
                                url: "SubmitBMI",
                                type: 'GET',
//                                dataType: 'json',
                                data: {myData: JSON.stringify(input)},
                                contentType: 'application/json',
                                mimeType: 'application/json',
                                success: function(resp, pointerToSubmitButton) {
                                    console.log(resp.response);
                                    if (resp.response === "success") {
                                        console.log(resp.response);
                                        $(this).parents("tr").find('input[placeholder^="Kilograms"]').attr("disabled", "true");
                                        $(this).parents("tr").find('input[placeholder^="Centimeters"]').attr("disabled", "true");
                                        if ($(this).parents("#traineeDataDiv").length > 0) {
                                            $(this).val("Done");
                                            $(this).attr("disabled", "true");
                                            $(this).css("background", "#57B331");
                                        } else {
                                            $(this).val("Edit");
                                            var weightValue = $(this).parents("tr").find('input[placeholder^="Kilograms"]').val();
                                            var heightValue = $(this).parents("tr").find('input[placeholder^="Centimeters"]').val();
                                            var weight = "<label title='Kilograms'>", endWeight = "</label>", height = "<label title='Centimeters'>", endHeight = "</label>";
                                            $(this).parents("tr").find("td:nth-child(4)").children().replaceWith(height + heightValue + endHeight);
                                            $(this).parents("tr").find("td:nth-child(5)").children().replaceWith(weight + weightValue + endWeight);
                                            $(this).css("background", "#337ab7");
                                        }

                                        $(this).attr("type", "button");
                                    }
                                },
                                error: function() {

                                }
                            });
                        }
                    } else {
                        toastr.error("Only numeric value is allowed.");
                    }
                });
                $('#traineeEditDataTable tbody').on('click', 'input[value^="Edit"]', function() {

//                    $(this).parents("tr").find('input[placeholder^="Kilograms"]').removeAttr("disabled");
//                    $(this).parents("tr").find('input[placeholder^="Centimeters"]').removeAttr("disabled");
                    var weightValue = $(this).parents("tr").find('label[title^="Kilograms"]').text();
                    var heightValue = $(this).parents("tr").find('label[title^="Centimeters"]').text();
                    var weight = "<input style='width: 100%;' class='form-control' type='text' placeholder='Kilograms' name='weight' value ='", endWeight = "'>", height = "<input style='width: 100%;' class='form-control' type='text' placeholder='Centimeters' name='height' value ='", endHeight = "'>";
                    $(this).parents("tr").find("td:nth-child(4)").children().replaceWith(height + heightValue + endHeight);
                    $(this).parents("tr").find("td:nth-child(5)").children().replaceWith(weight + weightValue + endWeight);
                    $(this).attr("value", "Submit");
                    $(this).css("background", "#337ab7");
                });
            });
        </script>
        <!--   Data Tables --->
        <script src="https://cdn.datatables.net/1.10.10/js/jquery.dataTables.min.js"></script>
        <script src="https://cdn.datatables.net/1.10.10/js/dataTables.bootstrap.min.js"></script>
        <script>
        </script>
    </body>
</html>
