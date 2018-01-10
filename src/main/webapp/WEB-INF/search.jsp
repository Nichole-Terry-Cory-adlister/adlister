<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Results" />
    </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp" />

<div class="container">
    <br>
    <hr>
    <h1>Searching for: (insert search term here/card clicked on)</h1>
    <c:forEach var="ad" items="${ads}">
        <div class="col-md-6">
            <h2>${ad.title}</h2>
            <p>${ad.description}</p>
            <c:forEach var="cat" items="${categories}">
                <c:if test="${cat.id == ad.catId}">
                    <p>${cat.name}</p>
                </c:if>
            </c:forEach>
            <p>${ad.location}</p>
            <p>${ad.date}</p>
        </div>
    </c:forEach>

</div>
</body>
</html>
