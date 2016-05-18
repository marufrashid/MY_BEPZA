<!DOCTYPE html>
<html>
<head>
    <meta name='layout' content='main'/>
    <title><g:message code="springSecurity.denied.title"/></title>
</head>

<body>
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            <g:message code="springSecurity.denied.title"/>!
        </h1>
        <ul class="top-links">
            <li><g:link class="btn btn-block btn-primary btn-xs" url="${request.contextPath}/"><i class="fa fa-home"></i>Home</g:link></li>
        </ul>
    </section>

    <!-- Main content -->
    <section class="content">
        <!-- flash message -->

        <div class="alert alert-danger alert-dismissable">
            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
            <i class="icon fa fa-remove"></i>
            <g:message code="springSecurity.denied.message"/>
        </div>

        <!-- flash message end -->

    </section><!-- /.content -->
</div><!-- /.content-wrapper -->

</body>
</html>
