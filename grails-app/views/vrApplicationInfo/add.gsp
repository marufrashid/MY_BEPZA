<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'vrApplicationInfo.label', default: 'Visa Application')}"/>
    <title><g:message code="default.create.label" args="[entityName]"/></title>
    <!-- Bootstrap date Picker -->
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'bootstrap-datepicker.min.css')}">
    <script src="${resource(dir: 'js', file: 'bootstrap-datepicker.min.js')}"></script>

</head>

<body>
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            Visa Application
        </h1>
        <ul class="top-links">
            %{--<li><g:link class="btn btn-block btn-primary btn-xs" url="/"><i class="fa fa-home"></i>Home</g:link></li>--}%

            <li><g:link class="btn btn-block btn-primary btn-xs" action="list">
            <i class="fa fa-reorder"></i>Visa Application List</g:link></li>
        </ul>
    </section>

    <!-- Main content -->
    <section class="content">
    <!-- flash message -->
        <g:if test="${flash.success}">
            <div class="alert alert-success alert-dismissable">
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                <i class="icon fa fa-check"></i>
                ${flash.success}
            </div>
        </g:if>
        <g:elseif test="${flash.error}">
            <div class="alert alert-danger alert-dismissable">
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                <i class="icon fa fa-remove"></i>
                ${flash.error}
            </div>
        </g:elseif>
        <g:elseif test="${flash.message}">
            <div class="alert alert-info alert-dismissable">
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                <i class="icon fa fa-info"></i>
                ${flash.message}
            </div>
        </g:elseif>
    <!-- flash message end -->
        <div class="row">
            <div class="col-xs-12">
                <!-- Horizontal Form -->
                <div class="box box-primary">
                <!-- form start -->
                    %{--<g:form url="${request.queryString ? request.forwardURI + '?' + request.queryString : request.forwardURI}"
                            enctype="multipart/form-data" method="post">--}%
                        <div class="box-body">
                            <g:render template="form"></g:render>
                        </div><!-- /.box-body -->

                    %{--</g:form>--}%
                </div><!-- /.box -->
            </div>
        </div>
    </section><!-- /.content -->
</div><!-- /.content-wrapper -->

</body>
</html>
