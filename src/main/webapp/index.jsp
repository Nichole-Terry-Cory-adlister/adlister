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
    <div class="jumbotron">

    </div>
    <div>
        <div class="box jobs card text-white bg-primary mb-3">Jobs</div>
        <div class="box forsale card text-white bg-secondary mb-3">For Sale</div>
        <div class="box services card text-white bg-success mb-3">Services</div>
        <br>
        <div class="box housing card text-white bg-warning mb-3">Housing</div>
        <div class="box forfree card text-white bg-info mb-3">For Free</div>
        <div class="box misc card text-white bg-dark mb-3">Miscellaneous</div>
    </div>
</div>

</body>
</html>