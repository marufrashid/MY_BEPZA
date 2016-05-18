<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title><g:layoutTitle default="Home Accounting"/></title>
    <link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon">
    <link rel="icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon">
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- Bootstrap 3.3.5 -->
    <link rel="stylesheet" href="${resource(dir: 'resources', file: 'bootstrap/css/bootstrap.min.css')}">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="${resource(dir: 'resources', file: 'dist/css/AdminLTE.min.css')}">
    <!-- iCheck -->
    <link rel="stylesheet" href="${resource(dir: 'resources', file: 'plugins/iCheck/square/blue.css')}">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <g:layoutHead/>
</head>

<body class="hold-transition login-page">

<g:layoutBody/>

<!-- jQuery 2.1.4 -->
<script src="${resource(dir: 'resources', file: 'plugins/jQuery/jQuery-2.1.4.min.js')}"></script>
<!-- Bootstrap 3.3.5 -->
<script src="${resource(dir: 'resources', file: 'bootstrap/js/bootstrap.min.js')}"></script>
<!-- iCheck -->
<script src="${resource(dir: 'resources', file: 'plugins/iCheck/icheck.min.js')}"></script>
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
