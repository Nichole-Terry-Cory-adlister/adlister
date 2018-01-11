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

    <div class="container">
        <form action="/ads/edit" method="post">
            <div class="form-group mx-3">
                <label for="title">Title</label>
                <input type="text" class="form-control" id="title" value="${ad.title}">
            </div>
            <br>
            <div class="form-group mx-3">
                <label for="exampleFormControlTextarea1">Description</label>
                <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" value="${ad.description}"></textarea>
            </div>
            <br>
            <div>
                <select class="form-control custom-select ml-3 mr-3 mb-5" value="${ad.category}">
                    <option selected>Select your ad category</option>
                    <option value="1">Jobs</option>
                    <option value="2">For Sale</option>
                    <option value="3">Services</option>
                    <option value="4">Housing</option>
                    <option value="5">For Free</option>
                    <option value="6">Misc</option>
                </select>
            </div>
            <br>
            <button class="submit ml-3" type="submit">Edit</button>
        </form>
     </div>
</body>
</html>
