<div class="container-fluid header-fix-top">
    <div class="row">
        <div class="col-lg-12 col-md-12 header padding-10">
            <div class="row">
                <div class="col-lg-5 col-md-5 title">
                    BMI
                    <!--                    <div class="bottom-line">Past Data, Present Analysis, Future Prediction</div>-->
                </div>
                <div class="col-lg-7 col-md-7 title">
                    <ul class="menu pull-right">
                        <c:choose>
                            <c:when test="${active=='bmi'}">
                                <li class="active">
                                    <a href="home.jsp">BMI</a>
                                </li>
                            </c:when>
                            <c:otherwise>
                                <li>
                                    <a href="home.jsp">BMI</a>
                                </li>
                            </c:otherwise>
                        </c:choose>
                        <c:choose>
                            <c:when test="${active=='reports'}">
                                <li class="active">
                                    <a href="Reports.jsp">Reports</a>
                                </li>
                            </c:when>
                            <c:otherwise>
                                <li>
                                    <a href="Reports.jsp">Reports</a>
                                </li>
                            </c:otherwise>
                        </c:choose>



                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                <label id="name" style="color:white;">
                                    <c:out value="${sessionScope.name}"></c:out>
                                </label>
                                <b class="caret" ></b>
                            </a>
                            <ul class="dropdown-menu dropdown-menu-user" >
                                <li><a href="logout">Logout</a></li>

                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>