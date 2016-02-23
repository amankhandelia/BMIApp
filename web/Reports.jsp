
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
       
        <script type="text/javascript" language="javascript" src="JS/DataTable1.js"></script>
        <script type="text/javascript" language="javascript" src="JS/DataTable2.js"></script>
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" />
        <link href="CSS/Landing.css" rel="stylesheet" />
        <link rel="stylesheet" href="CSS/DataTable.css"/>
    </head>
    <body>
      <c:set var="active" value="reports"/>
        <%@include file="HeaderAfterLogin.jsp" %>
        <div class="container" style="padding-top: 81px;">
            <div class="row wrapper">
                <div class="col-lg-12 col-md-12 col-sm-12">
                    <div class="col-lg-6 col-md-6 col-sm-12">
                        <div role="tabpanel" id="">
                            <ul class="nav nav-tabs tab-ul" role="tablist">
                                <li role="presentation" id="li1"><a href="#tab1" aria-controls="tab1" role="tab" data-toggle="tab"><span class="glyphicon glyphicon-list-alt"></span> Enter BMI</a></li>
                            </ul>
                        </div>
                          <div class="section-card" >
                              
                          </div>
                    </div>
                    <div class="col-lg-6 col-md-6 col-sm-12">
                        <div role="tabpanel" id="">
                            <ul class="nav nav-tabs tab-ul" role="tablist">
                                <li role="presentation"  id="li1"><a href="#tab1" aria-controls="tab1" role="tab" data-toggle="tab"><span class="glyphicon glyphicon-list-alt"></span> Enter BMI</a></li>
                            </ul>
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
    </body>
</html>
