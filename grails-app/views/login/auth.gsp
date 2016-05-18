<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    %{--<meta name="viewport" content="width=device-width, initial-scale=1">--}%
    <title>BEPZA - User Login</title>

    <link rel="shortcut icon" type="image/x-icon" href="${resource(dir: "images", file: "favicon.ico")}">
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,600,700,400italic' rel='stylesheet' type='text/css'>

    <link rel="stylesheet" href="${resource(dir: 'resources/bootstrap/css', file: 'bootstrap.min.css')}">
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'font-awesome.min.css')}">
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'form-elements.css')}">
    %{--<link rel="stylesheet" href="${resource(dir: 'css', file: 'app_style.css')}">--}%
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'loginstyle.css')}">

    <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

    <script src="${resource(dir: 'resources/plugins/jQuery', file: 'jQuery-2.1.4.min.js')}"></script>
    <script src="${resource(dir: 'resources/bootstrap/js', file: 'bootstrap.min.js')}"></script>
</head>

<body>
<div class="top-content">
    <div class="inner-bg">
        <div class="container responsive-box">
            <div class="row form-font">
                <div class="form-box">
                    <div class="form-top">

                        <div class="form-top-left">
                            <img src="${resource(dir: 'images', file: 'logo-lg.png')}" style="position: relative; top: 6px;" alt=""/>
                        </div>

                        <div class="form-top-right">
                            <h3>Bangladesh Export Processing Zones Authority</h3><br>
                        </div>

                        <div class="row">
                            <div class="col-md-12">
                                <g:if test='${flash.message}'>
                                    <div class="alert alert-danger" role="alert">
                                        ${flash.message}
                                    </div>
                                </g:if>
                            </div>
                        </div>
                    </div>

                    <div class="form-bottom">
                        <form action='${postUrl}' method='POST' id='loginForm' class='login-form' autocomplete='off'>
                            <div class="form-group">
                                %{--<label class="sr-only" for="form-username">Username</label>--}%
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-user fa-lg fa-fw"></i>
                                    </span>
                                    <input type="text" name='j_username' id='username' class="form-username form-control
                                     <g:if test='${flash.message}'>errorinput</g:if>" placeholder="User name..." required autofocus>
                                </div>
                            </div>

                            <div class="form-group">
                                %{--<label class="sr-only" for="form-password ">Password</label>--}%
                                <div class="input-group">
                                    <span class="input-group-addon">
                                        <i class="fa fa-key fa-lg fa-fw"></i>
                                    </span>
                                    <input type="password" name='j_password' id='password' class="form-password form-control
                                    <g:if test='${flash.message}'>errorinput</g:if>" placeholder="Password.." required>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-xs-6">
                                    <div class="checkbox icheck">
                                        <label for="remember_me">
                                            <input type='checkbox' name='${rememberMeParameter}' id='remember_me'
                                                   <g:if test='${hasCookie}'>checked='checked'</g:if>>
                                            <g:message code="springSecurity.login.remember.me.label"/>
                                        </label>
                                    </div>
                                </div><!-- /.col -->
                                <div class="col-xs-6">
                                    <button type="submit" class="btn btn-primary btn-block btn-flat">Sign In</button>
                                </div><!-- /.col -->
                            </div>
                            %{--<button class="btn" type="submit">Sign in</button>--}%
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    $(function () {
        $('input').iCheck({
            checkboxClass: 'icheckbox_square-blue',
            radioClass: 'iradio_square-blue',
            increaseArea: '20%' // optional
        });
    });
</script>
</body>
</html>

