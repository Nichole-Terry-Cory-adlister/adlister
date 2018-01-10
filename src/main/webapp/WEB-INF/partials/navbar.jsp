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
<div class="modal bg-transparent in" id="myModal" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header bg-primary" style="padding:35px 50px;">
                <h4 class="logintitle"><span class="glyphicon glyphicon-lock bg-primary"></span> Log In Here</h4>
                <button type="button" class="close modalclose" data-dismiss="modal"> X </button>
            </div>
            <div class="modal-body bg-light" style="padding:40px 50px;">
                <form role="form" action="/login" method="POST">
                    <div class="form-group">
                        <label for="username"> Username</label>
                        <input type="text" class="form-control" id="username" name="username" placeholder="Enter username">
                    </div>
                    <div class="form-group">
                        <label for="password"> Password</label>
                        <input type="password" class="form-control" id="password" name="password" placeholder="Enter password">
                    </div>
                    <div class="checkbox">
                        <label><input type="checkbox" value="" checked> Remember me</label>
                    </div>
                    <button type="submit" class="btn btn-primary"> Login</button>
                </form>
            </div>
            <div class="modal-footer bg-light">
                <p>Not a registered user? <a href="/register">Sign Up Here</a> </p>
            </div>
        </div>
    </div>
    </div>
</div>
