<html>
<head>
    <meta name='layout' content='login'/>
    <title>BEPZA - User Login</title>
</head>

<body>
<div class="login-box">
    <div class="login-logo">
        <g:img dir="images" file="logo-lg.png"></g:img>
    </div><!-- /.login-logo -->
    <div class="login-box-body">
        <p class="login-box-msg"><g:message code="springSecurity.login.header"/></p>
        <g:if test='${flash.message}'>
            <div class="alert alert-danger alert-dismissable">
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                ${flash.message}
            </div>
        </g:if>
        <form action='${postUrl}' method='POST' id='loginForm' autocomplete='off'>
            <div class="form-group has-feedback">
                <input type='text' class='form-control' name='j_username' id='username' placeholder="Username">
                <span class="glyphicon glyphicon-user form-control-feedback"></span>
            </div>

            <div class="form-group has-feedback">
                <input type='password' class='form-control' name='j_password' id='password' placeholder="Password">
                <span class="glyphicon glyphicon-lock form-control-feedback"></span>
            </div>

            <div class="row">
                <div class="col-xs-8">
                    <div class="checkbox icheck">
                        <label for="remember_me">
                            <input type='checkbox' name='${rememberMeParameter}' id='remember_me'
                                   <g:if test='${hasCookie}'>checked='checked'</g:if>>
                            <g:message code="springSecurity.login.remember.me.label"/>
                        </label>
                    </div>
                </div><!-- /.col -->
                <div class="col-xs-4">
                    <button type="submit" class="btn btn-primary btn-block btn-flat">Sign In</button>
                </div><!-- /.col -->
            </div>
        </form>

    </div><!-- /.login-box-body -->
</div><!-- /.login-box -->
<script type='text/javascript'>
    (function () {
        document.forms['loginForm'].elements['j_username'].focus();
    })();
</script>
</body>
</html>
