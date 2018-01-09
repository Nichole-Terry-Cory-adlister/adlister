<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="AdLister" />
    </jsp:include>
    <%--<script src="JavaScript/ColorPicker.js"></script>--%>
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
            <div class="${category.id} box card text-primary mb-3">${category.name}</div>
        </a>
        <script>
            var colors = ["#E95420", "#AEA79F", "#38B44A", "#17a2b8", "#EFB73E", "#772953"];
            var random_color = colors[Math.floor(Math.random() * colors.length + 1)];
            $('.${category.id}').css('background_color', random_color);
        </script>
    </c:forEach>

    <%--<div>--%>
    <%--<div class="box jobs card text-white bg-primary mb-3">Jobs </div>--%>
    <%--<div class="box forsale card text-white bg-secondary mb-3">For Sale</div>--%>
    <%--<div class="box services card text-white bg-success mb-3">Services</div>--%>
    <%--<div class="box housing card text-white bg-warning mb-3">Housing</div>--%>
    <%--<div class="box forfree card text-white bg-info mb-3">For Free</div>--%>
    <%--<div class="box misc card text-white bg-dark mb-3">Miscellaneous</div>--%>
    <%--</div>--%>
</div>
<%--<script src="JavaScript/ColorPicker.js"></script>--%>
</body>
</html>