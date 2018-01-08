<%--
  Created by IntelliJ IDEA.
  User: terryhale
  Date: 1/8/18
  Time: 3:29 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Edit Ad" />
    </jsp:include>
</head>
<body>
    <jsp:include page="/WEB-INF/partials/navbar.jsp" />

    <h1>Edit your Ad</h1>

    <form action="/ads/edit" method="POST">
        <label for="title">Title</label>
        <input id="title" type="text">

        <label for="description"></label>
        <textarea name="description" id="description" cols="30" rows="10"></textarea>

        <button type="submit">Edit</button>
    </form>

</body>
</html>
