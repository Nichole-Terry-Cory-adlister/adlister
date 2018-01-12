<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="e" uri="https://www.owasp.org/index.php/OWASP_Java_Encoder_Project" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Your Profile" />
    </jsp:include>
</head>

<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp" />
<div class="container">
    <div class="row">
        <div class="welcome col-lg-4">
            <h1>Welcome, <e:forHtmlContent value="${sessionScope.user.username}"/>!</h1>
            <br>
            <img src="http://lorempixel.com/g/325/400" class="img-fluid imgedits">
            <br>
            <button type="button" class="btn btn-secondary" id="profileBtn">Edit Profile</button>
        </div>
        <div class="adsHere col-lg-8">
            <h2>My Ads</h2>
            <c:forEach var="ad" items="${userAds}">
                <div class="span2 well">
                    <a href="/ads/ad?id=<e:forUriComponent value="${ad.id}"/>">
                        <c:forEach var="cat" items="${categories}">
                            <c:if test="${cat.id == ad.catId}">
                                <jsp:include page="/WEB-INF/partials/adsnippet.jsp">
                                    <jsp:param name="title" value="${ad.title}"/>
                                    <jsp:param name="date" value="${ad.date}"/>
                                    <jsp:param name="category" value="${cat.name}"/>
                                </jsp:include>
                            </c:if>
                        </c:forEach>
                    </a>
                </div>
            </c:forEach>
        </div>
    </div>


<!-- Modal -->
<div class="modal bg-transparent in" id="profileModal" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header bg-primary" style="padding:35px 50px;">
                <h4 class="logintitle"><span class="glyphicon glyphicon-lock bg-primary"></span> Edit Profile</h4>
                <button type="button" class="close modalclose" data-dismiss="modal"> X </button>
            </div>
            <div class="modal-body bg-light" style="padding:40px 50px;">

                <div class="container">
                    <h2>Please update your information.</h2>
                    <form action="/profile/edit" method="post">
                        <div class="form-group">
                            <label for="editusername">Username</label>
                            <input id="editusername" name="username" class="form-control" type="text" value="${sessionScope.user.username}">
                        </div>
                        <div class="form-group">
                            <label for="editemail">Email</label>
                            <input id="editemail" name="email" class="form-control" type="text" value="${sessionScope.user.email}">
                        </div>
                        <div class="form-group">
                            <label for="current_password">Current Password</label>
                            <input id="current_password" name="current_password" class="form-control" type="password">
                        </div>
                        <div class="form-group">
                            <label for="editpassword">Password</label>
                            <input id="editpassword" name="password" class="form-control" type="password">
                        </div>
                        <div class="form-group">
                            <label for="editconfirm_password">Confirm Password</label>
                            <input id="editconfirm_password" name="confirm_password" class="form-control" type="password">
                        </div>
                        <input type="submit" class="btn btn-primary btn-block">
                    </form>
                </div>

            </div>
            <div class="modal-footer bg-light">
            </div>
        </div>
    </div>
</div>

<script src="../assets/js/LoginModal.js"></script>

</body>
</html>