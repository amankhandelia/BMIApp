
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!--        <noscript>
                <meta http-equiv="refresh" content="1; url=JSDisableErrorPage.jsp">
                </noscript>-->
        <title>TCS iGnite</title>
        <%@include file="util.jsp" %>
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" />
        <link href="CSS/Landing.css" rel="stylesheet" />
        <link rel="stylesheet" href="Assets/styles/toastr.min.css">
        <link rel="stylesheet" href="CSS/DataTable.css"/>
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
        <c:set var="active" value="bmi"/>

        <%@include file="HeaderAfterLogin.jsp" %>
        <div class="container" style="padding-top: 81px;">
            <div class="row wrapper">
                <div class="col-lg-12 col-md-12 col-sm-12">
                    <div role="tabpanel" id="tabpanel">
                        <!-- Nav tabs -->
                        <ul class="nav nav-tabs tab-ul" role="tablist">
                            <li role="presentation" class="active" id="li1"><a href="#tabs-enter" aria-controls="tab1" role="tab" data-toggle="tab"><span class="glyphicon glyphicon-list-alt"></span> Enter BMI</a></li>
                            <li role="presentation" id="li2"><a href="#tabs-edit" aria-controls="tab2" role="tab" data-toggle="tab"><span class="glyphicon glyphicon-edit"></span> Edit BMI</a></li>
                        </ul>

                        <!-- Tab panes -->
                        <div class="tab-content iotabs-content">
                            <div role="tabpanel" class="tab-pane active" id="tabs-enter">
                                <div class="table-responsive divborder">
                                    <table id="traineeTable" class="table table-bordered" cellspacing="0" width="100%">
                                        <thead>
                                            <tr>
                                                <th style="width:8%">S.No</th>
                                                <th style="width:16%">Ignite ID</th>
                                                <th  style="width:16%">Name</th>
                                                <th title="Kilograms" style="width:16%">Height (in cm)</th>
                                                <th title="Centimeters" style="width:16%">Weight (in kg)</th>
                                                <th  title="Body Mass Index" style="width:10%">B.M.I</th>
                                                <th  title="Submit" style="width:16%">Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div role="tabpanel" class="tab-pane" id="tabs-edit">
                                <div class="table-responsive divborder">
                                    <table id="traineeEditDataTable" class="table table-bordered" cellspacing="0" width="100%">
                                        <thead>
                                            <tr>
                                                <th style="width:8%">S.No</th>
                                                <th style="width:16%">Ignite ID</th>
                                                <th  style="width:16%">Name</th>
                                                <th title="Kilograms" style="width:16%">Height (in cm)</th>
                                                <th title="Centimeters" style="width:16%">Weight (in kg)</th>
                                                <th  title="Body Mass Index" style="width:10%">B.M.I</th>
                                                <th  title="Submit" style="width:16%">Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div id="sRangex" class="container-fluid loader-overlay windows8 hidden">
            <div class="tableDiv">
                <div class="tableCellDiv">
                    <div class="windows8">
                        <div class="wBall" id="wBall_1">
                            <div class="wInnerBall">
                            </div>
                        </div>
                        <div class="wBall" id="wBall_2">
                            <div class="wInnerBall">
                            </div>
                        </div>
                        <div class="wBall" id="wBall_3">
                            <div class="wInnerBall">
                            </div>
                        </div>
                        <div class="wBall" id="wBall_4">
                            <div class="wInnerBall">
                            </div>
                        </div>
                        <div class="wBall" id="wBall_5">
                            <div class="wInnerBall">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="footer.jsp" %>
        <script type="text/javascript" src="Assets/scripts/jquery-2.2.0.min.js"></script>
        <script type="text/javascript" src="Assets/scripts/bootstrap.min.js"></script>
        <script type="text/javascript" src="Assets/scripts/toastr.min.js"></script>
        <script src="https://cdn.datatables.net/1.10.10/js/jquery.dataTables.min.js"></script>
        <script src="https://cdn.datatables.net/1.10.10/js/dataTables.bootstrap.min.js"></script>
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
                var entertable = $('#traineeTable').DataTable();
                var editTable = $('#traineeEditDataTable').DataTable();
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
//                            console.log(aData);
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
                    var value = $(this).val();
                    if (value.indexOf('.') !== -1) {
                        if (value.substring(value.indexOf('.'), value.length).length + 1 > 3 || value.substring(0, value.indexOf('.')).length > 4) {
                            event.preventDefault();
                            toastr.error("Above permissible limit");
                            return;
                        } else if (event.which === 46) {
                            event.preventDefault();
                            toastr.error("Invalid Format");
                            return;
                        }
                    } else {
                        if (event.which !== 46 && $(this).val().length + 1 > 3 ) {
                            event.preventDefault();
                            toastr.error("Above permissible limit");
                            return;
                        }
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
                    if ($(this).val().length + 1 > 3) {
                        event.preventDefault();
                        toastr.error("Above permissible limit");
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
                $('#traineeTable tbody,#traineeEditDataTable tbody').on('click', 'input[value^="Edit"]', function() {

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


    </body>
</html>
