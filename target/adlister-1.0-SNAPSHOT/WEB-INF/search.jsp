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
    <h1>Searching for: ${term}</h1>

<div class="container" style="margin-top: 75px">
<row>
    <c:forEach var="ad" items="${ads}">
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
</row>
</div>
</div>
</body>
</html>
