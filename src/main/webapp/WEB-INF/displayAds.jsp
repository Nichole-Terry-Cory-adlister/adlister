<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Viewing Ad" />
    </jsp:include>
</head>
<body>
    <jsp:include page="/WEB-INF/partials/navbar.jsp" />

    <div class="container">
        <br>
        <hr>

        <h2 class="mt=5">${ads[0].title}</h2>
        <div>
            pic
        </div>
        <p>${ads[0].description}</p>
        <c:forEach var="cat" items="${categories}">
            <c:if test="${cat.id == ads[0].catId}">
                <p>${cat.name}</p>
            </c:if>
        </c:forEach>

    </div>

</body>
</html>
