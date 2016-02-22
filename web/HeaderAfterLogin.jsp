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
                        <li class="active">
                            <a href="home.jsp">BMI</a>
                        </li>
                        <li class="active">
                            <a href="">Reports</a>
                        </li>
                        <!--                        <c:choose>
                                                    <c:when test="${active=='dataDictionary'}">
                                                        <li class="active">
                                                            <a href="DataDict.jsp">Upload Data</a>
                                                        </li>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <li>
                                                            <a href="DataDict.jsp">Upload Data</a>
                                                        </li>
                                                    </c:otherwise>
                                                </c:choose>
                                                <c:choose>
                                                    <c:when test="${active=='getRules'}">
                                                        <li class="active">
                                                            <a href="Get_Rules.jsp" class="active" id="getRulesPage">Analyze</a>
                                                        </li>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <li>
                                                            <a href="Get_Rules.jsp" id="getRulesPage">Analyze</a>
                                                        </li>
                                                    </c:otherwise>
                                                </c:choose>
                                                <c:choose>
                                                    <c:when test="${active=='dashboard'}">
                                                        <li class="active dashboardPage">
                                                            <a href="DashBoard.jsp" class="active">Dashboard</a>
                                                        </li>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <li class="dashboardPage">
                                                            <a href="DashBoard.jsp">Dashboard</a>
                                                        </li>
                                                    </c:otherwise>
                                                </c:choose>
                                                <c:choose>
                                                    <c:when test="${active=='history'}">
                                                        <li class="active">
                                                            <a href="History.jsp">History</a>
                                                        </li>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <li>
                                                            <a href="History.jsp">History</a>
                                                        </li>
                                                    </c:otherwise>
                                                </c:choose>
                                                          <c:choose>
                                                    <c:when test="${active=='help'}">
                                                        <li class="active">
                                                            <a href="help.jsp">Help</a>
                                                        </li>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <li>
                                                            <a href="help.jsp">Help</a>
                                                        </li>
                                                    </c:otherwise>
                                                </c:choose>-->
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                <label id="name" style="color:white;">
                                    <c:out value="${sessionScope.name}"></c:out>
                                </label>
                                <b class="caret" ></b>
                            </a>
                            <ul class="dropdown-menu dropdown-menu-user" >
                                <c:choose>
                                    <c:when test="${active=='profile'}">
                                        <li class="active"><a href="Profile.jsp">Profile</a></li>
                                    </c:when>
                                    <c:otherwise>
                                        <li><a href="Profile.jsp">Profile</a></li>
                                    </c:otherwise>
                                </c:choose>
                                <li><a href="LogoutServlet">Logout</a></li>

                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>