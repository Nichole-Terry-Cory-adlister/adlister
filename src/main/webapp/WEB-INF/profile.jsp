<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Your Profile" />
    </jsp:include>
</head>
<body>
    <jsp:include page="/WEB-INF/partials/navbar.jsp" />

    <div class="container">

            <div class="welcome col-lg-4">
                <h1>Welcome, ${sessionScope.user.username}!</h1>
                <br>
                <img src="http://lorempixel.com/g/325/400" class="imgedits">
                    <br>
                    <button type="button" class="btn btn-secondary disabled">Edit Profile</button>
            </div>

        <div class="adsHere col-lg-8">
        <h2>My Ads</h2>

            <c:forEach var="ad" items="${userAds}">
                <div class="span2 well">
                    <a href="/ads/ad?id=${ad.id}">
                        <c:forEach var="cat" items="${categories}">
                            <c:if test="${cat.id == ad.catId}">
                                <jsp:include page="/WEB-INF/partials/adsnippet.jsp">
                                    <jsp:param name="title" value="${ad.title}"/>
                                    <jsp:param name="date" value="${ad.date}"/>
                                    <jsp:param name="category" value="${cat.name}"/>
                                </jsp:include>
                            </c:if>
                        </c:forEach>
                    </a>
                </div>
            </c:forEach>

        </div>

    </div>



    <%--need to implement edit profile button with below modal--%>

    <%--<!-- Modal -->--%>
    <%--<div class="modal bg-transparent in" id="profileModal" role="dialog">--%>
        <%--<div class="modal-dialog">--%>

            <%--<!-- Modal content-->--%>
            <%--<div class="modal-content">--%>
                <%--<div class="modal-header bg-primary" style="padding:35px 50px;">--%>
                    <%--<h4 class="logintitle"><span class="glyphicon glyphicon-lock bg-primary"></span> Log In Here</h4>--%>
                    <%--<button type="button" class="close modalclose" data-dismiss="modal"> X </button>--%>
                <%--</div>--%>
                <%--<div class="modal-body bg-light" style="padding:40px 50px;">--%>
                    <%--<form role="form" action="/login" method="POST">--%>
                        <%--<div class="form-group">--%>
                            <%--<label for="username"> Username</label>--%>
                            <%--<input type="text" class="form-control" id="username" placeholder="Enter username">--%>
                        <%--</div>--%>
                        <%--<div class="form-group">--%>
                            <%--<label for="password"> Password</label>--%>
                            <%--<input type="password" class="form-control" id="password" placeholder="Enter password">--%>
                        <%--</div>--%>
                        <%--<div class="checkbox">--%>
                            <%--<label><input type="checkbox" value="" checked> Remember me</label>--%>
                        <%--</div>--%>
                        <%--<button type="submit" class="btn btn-primary"> Login</button>--%>
                    <%--</form>--%>
                <%--</div>--%>
                <%--<div class="modal-footer bg-light">--%>
                    <%--<p>Not a registered user? <a href="/register">Sign Up Here</a> </p>--%>
                <%--</div>--%>
            <%--</div>--%>
        <%--</div>--%>
    <%--</div>--%>


</body>
</html>
