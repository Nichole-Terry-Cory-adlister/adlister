<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="AdLister" />
    </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp" />
<div class="container">
    <%--<div class="jumbotron"></div>--%>
    <div class="hero-image">
        <div class="hero-text">
            <form class="form-inline my-2 my-lg-0" action="/search" method="GET">
                <input class="form-control mr-sm-2" name="input" type="text" placeholder="Search">
                <button class="btn btn-secondary my-2 my-sm-0" type="submit">Search</button>
            </form>
        </div>
    </div>
        <br>

    <c:forEach var="category" items="${categories}">
        <a href="/search?catid=${category.id}">
            <div id="${category.id}" class="box jobs card text-white mb-3">${category.name}</div>
        </a>
    </c:forEach>


        <%--["#E95420", "#AEA79F", "#38B44A", "#17a2b8", "#EFB73E", "#772953"];--%>

</div>
<script src="JavaScript/ColorPicker.js"></script>
</body>
</html>