<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="e" uri="https://www.owasp.org/index.php/OWASP_Java_Encoder_Project" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Create a new Ad" />
    </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp" />

    <div class="container">
        <br>
        <hr>
        <h1 style="text-align: center">Create A New Ad</h1>
        <c:forEach var="violation" items="${createViolations}">
            <div style="color: #FF0000;">${violation.getMessage()}</div>
        </c:forEach>
        <form action="/ads/create" method="post">
            <div class="form-group">
                <label for="title">Title</label>
                <input id="title" name="title" class="form-control" type="text">
            </div>
            <div class="form-group">
                <label for="description">Description</label>
                <textarea id="description" name="description" class="form-control" type="text"></textarea>
            </div>
            <div class="form-group">
                <label for="location">Location</label>
                <input id="location" name="location" class="form-control" type="text"></input>
            </div>
            <div class="form-group">
                <label for="date">Date</label>
                <input id="date" name="date" class="form-control" type="text"></input>
            </div>
            <div>
            <select id="catId" name="catId">
                <c:forEach var="Category" items="${all}">
                    <option value="${Category.id}"><e:forHtmlContent value="${Category.name}"/></option>
                </c:forEach>
            </select>
            </div>
            <input type="submit" class="btn btn-block btn-primary mt-3">
        </form>
    </div>

</body>
</html>
