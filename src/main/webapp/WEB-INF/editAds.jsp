<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Edit Ad" />
    </jsp:include>
</head>
<body>
    <jsp:include page="/WEB-INF/partials/navbar.jsp" />


    <div class="container">
    <br>
    <hr>
    <h1>Edit Your Ad</h1>
        <form action="/ads/edit" method="post">
            <input id="adID" name="adID" type="hidden" value="${ads[0].id}">
            <div class="form-group mx-3">
                <label for="title">Title</label>
                <input name="title" type="text" class="form-control" id="title" value="${ads[0].title}">
            </div>
            <br>
            <div class="form-group mx-3">
                <label for="exampleFormControlTextarea1">Description</label>
                <textarea name="description" class="form-control" id="exampleFormControlTextarea1" rows="3">${ads[0].description}</textarea>
            </div>
            <br>
            <div>
                <select id="catId" name="catId">
                    <c:forEach var="Category" items="${categories}">
                        <option value="${Category.id}">${Category.name}</option>
                    </c:forEach>
                </select>
            </div>
            <br>
            <button class="btn btn-secondary" type="submit">Submit</button>
        </form>
     </div>
</body>

</html>



