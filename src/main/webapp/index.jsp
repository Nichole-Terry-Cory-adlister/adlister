<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="e" uri="https://www.owasp.org/index.php/OWASP_Java_Encoder_Project" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="AdLister" />
    </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp" />
<div class="container">
    <div class="hero-image">
        <div class="hero-text">
            <form class="form-inline my-2 my-lg-0" action="/search" method="GET">
                <input class="form-control mr-sm-2" name="input" type="text" placeholder="Search">
                <button class="btn btn-secondary my-2" type="submit">Search</button>
            </form>
        </div>
    </div>
        <br>
    <c:forEach var="category" items="${categories}">
        <a href="/search?catid=<e:forUriComponent value="${category.id}"/>">
            <div class="box card mb-3">${category.name}</div>
        </a>
    </c:forEach>
</div>
<script>
    var colors = ["#E95420", "#AEA79F", "#38B44A", "#17a2b8", "#EFB73E", "#772953"];
    var usedColors = [];
    $('.box').each(function(){
        var random_color = colors[Math.floor(Math.random() * colors.length)];
        while (usedColors.includes(random_color)) {
            random_color = colors[Math.floor(Math.random() * colors.length)];
        }
        usedColors.push(random_color);
        $(this).css("background-color", random_color)
    });
</script>
</body>
</html>