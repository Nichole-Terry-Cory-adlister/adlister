<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="e" uri="https://www.owasp.org/index.php/OWASP_Java_Encoder_Project" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Edit Ad" />
    </jsp:include>
</head>
<body>
    <jsp:include page="/WEB-INF/partials/navbar.jsp" />
    <br>
    <br>
    <div class="container">
        <hr>
        <h1 style="text-align: center">Edit your Ad</h1>
        <c:forEach var="violation" items="${editViolations}">
            <div style="color: #FF0000;">   ${violation.getMessage()}</div>
        </c:forEach>
        <form action="/ads/edit" method="post">
            <input id="adID" name="adID" type="hidden" value="<e:forHtmlContent value="${ad.id}"/>">
            <div class="form-group mx-3">
                <label for="title">Title</label>
                <input name="title" type="text" class="form-control" id="title" value="<e:forHtmlContent value="${ad.title}"/>">
            </div>
            <br>
            <div class="form-group mx-3">
                <label for="exampleFormControlTextarea1">Description</label>
                <textarea name="description" class="form-control" id="exampleFormControlTextarea1" rows="3"><e:forHtmlContent value="${ad.description}"/></textarea>
            </div>
            <br>
            <div>
                <select id="catId" name="catId">
                    <c:forEach var="Category" items="${categories}">
                        <option value="${Category.id}"><e:forHtmlContent value="${Category.name}"/></option>
                    </c:forEach>
                </select>
            </div>
            <button class="btn btn-block btn-primary" type="submit">Edit</button>
        </form>
     </div>
</body>
</html>



