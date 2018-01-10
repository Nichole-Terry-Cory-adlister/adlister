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
                    <button id="myButton">Login</button>
                </li>
            </ul>


            <%--<button>Create Ad</button>--%>
            <%--<button>Login</button>--%>
        </div>
    </div>
</div>


<div class="modal fade" id="myButton">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Please log in here</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <h1>Please Log In</h1>
                <form action="/login" method="POST">
                    <div class="form-group">
                        <label for="username">Username</label>
                        <input id="username" name="username" class="form-control" type="text">
                    </div>
                    <div class="form-group">
                        <label for="password">Password</label>
                        <input id="password" name="password" class="form-control" type="password">
                    </div>
                    <%--<input type="submit" class="btn btn-primary btn-block" value="Log In">--%>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal" value="Log in">Log In</button>
            </div>
        </div>
    </div>
</div>

<script>
    $('#myButton').modal(options)
</script>