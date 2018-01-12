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
        <br>
        <hr>
        <div class="row">
            <div class="col-lg-4 welcome">
                <img src="http://lorempixel.com/g/325/400" class="img-fluid imgedits">
                <br>
                    <c:if test="${sessionScope.user.id == ad.userId}">
                        <a href="/ads/edit?id=${ad.id}">
                            <button class="btn btn-secondary" type="submit">Edit Ad</button>
                        </a>
                    </c:if>
            </div>
                <div class="col-lg-8 adsHere">
                <h2 class="mb-5"><e:forHtmlContent value="${ad.title}"/></h2>
                    <p><e:forHtmlContent value="${ad.description}"/></p>
                </div>
        </div>

        <div class="row">
            <div class="col-12">
                <c:forEach var="cat" items="${categories}">
                    <c:if test="${cat.id == ad.catId}">
                        <p class="adInfo">Category: <e:forHtmlContent value="${cat.name}"/></p>
                    </c:if>
                </c:forEach>
                <p class="adInfo">Location: <e:forHtmlContent value="${ad.location}"/></p>
                <p class="adInfo">Date: <e:forHtmlContent value="${ad.date}"/></p>
            </div>
        </div>


    </div>

</body>
</html>