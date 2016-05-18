<%@ page import="com.bepza.auth.Role" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}"/>
    <title><g:message code="default.create.label" args="[entityName]"/></title>
</head>

<body>
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            Add New User%{--
            <small>add application user</small>--}%
        </h1>
        <ul class="top-links">
            %{--<li><g:link class="btn btn-block btn-primary btn-xs" url="/"><i class="fa fa-home"></i>Home</g:link></li>--}%
            <li><g:link class="btn btn-block btn-primary btn-xs" action="list"><i
                    class="fa fa-reorder"></i>User List</g:link></li>
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
                    %{--<div class="box-header with-border">
                        <h3 class="box-title">Add User Form</h3>
                    </div>--}%<!-- /.box-header -->
                <!-- form start -->
                    <g:form action="add" method="post" class="form-horizontal formValidation" enctype="multipart/form-data">
                        <div class="box-body">
                            <g:render template="form"></g:render>
                        </div><!-- /.box-body -->
                        <div class="box-footer">
                            <button type="reset" class="btn btn-default"><i class="fa fa-hand-paper-o"></i>Cancel
                            </button>
                            <button type="submit" class="btn btn-primary pull-right"><i class="fa fa-save"></i>Save
                            </button>
                        </div><!-- /.box-footer -->
                    </g:form>
                </div><!-- /.box -->
            </div>
        </div>

    </section><!-- /.content -->
</div><!-- /.content-wrapper -->

</body>
</html>