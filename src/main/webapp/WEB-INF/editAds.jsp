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

    <h1>Edit your Ad</h1>

    <div class="container">
        <form action="/ads/edit" method="post">
            <div class="form-group mx-3">
                <label for="title">Title</label>
                <input type="text" class="form-control" id="title" value="${ads[0].title}">
            </div>
            <br>
            <div class="form-group mx-3">
                <label for="exampleFormControlTextarea1">Description</label>
                <textarea class="form-control" id="exampleFormControlTextarea1" rows="3">${ads[0].description}</textarea>
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
            <button class="submit ml-3" type="submit">Edit</button>
        </form>
     </div>
</body>

</html>



