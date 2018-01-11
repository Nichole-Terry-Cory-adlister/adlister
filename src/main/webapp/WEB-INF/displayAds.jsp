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
        <div class="col-lg-4 welcome">
            <img src="http://lorempixel.com/g/325/400" class="imgedits">
            <br>
            <c:choose>
                <c:when test="${sessionScope.user == null}">
                </c:when>
                <c:when test="${sessionScope.user != null}">
                    <%--<a href="/ads/edit?id=${ads[0].id}">--%>
                        <button class="btn btn-secondary" id="editAdBtn" type="submit">Edit Ad</button>
                    <%--</a>--%>
                </c:when>
            </c:choose>
        </div>

        <div class="col-lg-8 adsHere">
        <h2 class="mt=5"><e:forHtmlContent value="${ads[0].title}"/></h2>
            <p><e:forHtmlContent value="${ads[0].description}"/></p>
            <c:forEach var="cat" items="${categories}">
                <c:if test="${cat.id == ads[0].catId}">
                    <p><e:forHtmlContent value="${cat.name}"/></p>
                </c:if>
            </c:forEach>
        </div>
    </div>
    <script src="../assets/js/LoginModal.js"></script>

</body>
</html>