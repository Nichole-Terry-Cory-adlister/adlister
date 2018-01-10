<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="e" uri="https://www.owasp.org/index.php/OWASP_Java_Encoder_Project" %>
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
        <h2 class="mt=5"><e:forHtmlContent value="${ads[0].title}"/></h2>
        <div>
            <img src="">
        </div>
        <p><e:forHtmlContent value="${ads[0].description}"/></p>
        <c:forEach var="cat" items="${categories}">
            <c:if test="${cat.id == ads[0].catId}">
                <p><e:forHtmlContent value="${cat.name}"/></p>
            </c:if>
        </c:forEach>
    </div>
</body>
</html>
