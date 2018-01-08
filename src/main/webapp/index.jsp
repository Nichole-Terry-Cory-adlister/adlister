<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Welcome to my site!" />
    </jsp:include>
</head>
<body>
    <jsp:include page="/WEB-INF/partials/navbar.jsp" />
    <div class="container">
        <h1>Welcome to the Adlister!</h1>
        <form action="/search" method="POST">
            <div class="form-group">
                <label for="input">Username</label>
                <input id="input" name="input" class="form-control" type="text">
            </div>
            <input type="submit" class="btn btn-primary btn-block" value="Search">
        </form>
    </div>
</body>
</html>
