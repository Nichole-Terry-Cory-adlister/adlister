<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="CatLister" />
    </jsp:include>
</head>
<body>
    <jsp:include page="/WEB-INF/partials/navbar.jsp" />
    <div class="container">
        <div class="jumbotron">
            <h1 class="display-3">CatLister</h1>
            <p class="lead">A website where people sell cats. </p>
            <%--<p class="lead">--%>
            <%--</p>--%>
        </div>
        <div>
            <div class="container">
                <div class="row">
                    <div class=".col-sm-6">
                        1 of 3
                    </div>
                    <div class=".col-sm-6">
                        2 of 3
                    </div>
                    <div class=".col-sm-6">
                        3 of 3
                    </div>
                </div>
            </div>
        </div>
    </div>

</body>
</html>
