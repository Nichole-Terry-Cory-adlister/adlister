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
    <c:forEach var="ad" items="${ads}">
        <a href="/ads/ad?id=${ad.id}">
        <div class="col-md-6">
            <c:forEach var="cat" items="${categories}">
                <c:if test="${cat.id == ad.catId}">
                    <jsp:include page="/WEB-INF/partials/adsnippet.jsp">
                        <jsp:param name="title" value="${ad.title}"/>
                        <jsp:param name="date" value="${ad.date}"/>
                        <jsp:param name="category" value="${cat.name}"/>
                    </jsp:include>
                </c:if>
            </c:forEach>
        </div>
        </a>
    </c:forEach>

</div>

</body>
</html>
