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

        </div>
        <div>
            <%--add categories here --%>
                <div class="box red">620-750 nm</div>
                <div class="box orange">590-620 nm</div>
                <div class="box yellow">570-590 nm</div>
                <div class="box green">495-570 nm</div>
                <div class="box blue">450-495 nm</div>
                <div class="box violet">380-450 nm</div>
        </div>

</body>
</html>
