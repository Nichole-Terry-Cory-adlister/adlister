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
        <%--<br>--%>
        <%--<hr>--%>
        <h1>Welcome, ${sessionScope.user.username}!</h1>
        <br>
        <img src="http://lorempixel.com/g/325/400" class="imgedits">
            <button type="button" class="btn btn-secondary disabled">Edit Profile</button>
        </div>

        <div class="adsHere col-lg-8">
        <h2>My Ads</h2>

            <c:forEach var="ad" items="${userAds}">
                <a href="/search?catid=${ad.id}">
                    <div class="box card mb-3">${ad.title}</div>
                </a>
            </c:forEach>



        </div>


    </div>


</body>
</html>
