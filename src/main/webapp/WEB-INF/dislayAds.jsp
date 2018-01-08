<%--
  Created by IntelliJ IDEA.
  User: terryhale
  Date: 1/8/18
  Time: 1:34 PM
  To change this template use File | Settings | File Templates.
--%>
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

        <h2>${ad.title}</h2>
        <div>Pic</div>
        <p>${ad.description}</p>
        <p>${categories}</p>

    </div>

</body>
</html>
