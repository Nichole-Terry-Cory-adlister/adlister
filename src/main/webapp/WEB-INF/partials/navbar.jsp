<div class="navbar navbar-expand-lg fixed-top navbar-dark bg-primary">
    <div class="container">
        <a href="/" class="navbar-brand">AdLister</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="nav navbar-nav ml-auto" id="buttons">
                <%--<li class="nav-item">--%>
                    <%--<a class="nav-link" href="/dash">Dashboard</a>--%>
                <%--</li>--%>
                <li class="nav-item">
                    <a class="nav-link" href="/ads/create">Create Ad</a>
                </li>
                <li class="nav-item">
                    <%--<a class="nav-link" id="myButton" href="#loginModal" data-toggle="modal">Log In</a>--%>
                        <a href="/login" class="nav-link" id="myBtn">Log In</a>
                </li>
            </ul>
            <%--<button>Create Ad</button>--%>
            <%--<button>Login</button>--%>
        </div>
    </div>
</div>

<!-- Modal -->
<div class="modal bg-transparent" id="myModal" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header" style="padding:35px 50px;">
                <h4><span class="glyphicon glyphicon-lock"></span> Login</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body" style="padding:40px 50px;">
                <form role="form" action="/login" method="POST">
                    <div class="form-group">
                        <label for="username"><span class="glyphicon glyphicon-user"></span> Username</label>
                        <input type="text" class="form-control" id="username" placeholder="Enter email">
                    </div>
                    <div class="form-group">
                        <label for="password"><span class="glyphicon glyphicon-eye-open"></span> Password</label>
                        <input type="password" class="form-control" id="password" placeholder="Enter password">
                    </div>
                    <%--<div class="checkbox">--%>
                        <%--<label><input type="checkbox" value="" checked>Remember me</label>--%>
                    <%--</div>--%>
                    <button type="submit" class="btn btn-success btn-block"><span class="glyphicon glyphicon-off"></span> Login</button>
                </form>
            </div>
            <div class="modal-footer">
                <button type="submit" class="btn btn-danger btn-default pull-left" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> Cancel</button>
                <p>Not a member? <a href="/register">Sign Up</a></p>
?            </div>
        </div>
    </div>
    </div>
</div>
