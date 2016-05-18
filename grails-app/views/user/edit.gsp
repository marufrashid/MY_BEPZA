<%@ page import="com.bepza.auth.User" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}"/>
    <title><g:message code="default.edit.label" args="[entityName]"/></title>
</head>

<body>
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            Edit User Information%{--
            <small>edit application user</small>--}%
        </h1>
        <ul class="top-links">
            <li><g:link class="btn btn-block btn-primary btn-xs" action="list"><i
                    class="fa fa-reorder"></i>User List</g:link></li>
        </ul>
    </section>

    <!-- Main content -->
    <section class="content">

        <div class="row">
            <div class="col-xs-12">

                <!-- Horizontal Form -->
                <div class="box box-primary">
                    %{--<div class="box-header with-border">
                        <h3 class="box-title">User Edit Form</h3>
                    </div>--}%<!-- /.box-header -->
                <!-- form start -->
                    <g:form url="[resource: userInstance, action: 'edit']" method="POST"
                            class="form-horizontal formValidation" enctype="multipart/form-data">
                        <div class="box-body">
                            <g:render template="form"></g:render>
                        </div><!-- /.box-body -->
                        <div class="box-footer">
                            %{--<g:link action="delete" id="${userInstance.id}" class="btn btn-danger"><i class="fa fa-trash"></i>Delete
                            </g:link>--}%
                            <div class="form-group">
                                <label class="col-sm-2 control-label"></label>

                                <div class="col-sm-6">
                                    <button type="submit" class="btn btn-primary"><i
                                            class="fa fa-save"></i>Save
                                    </button>
                                </div>
                            </div>
                        </div><!-- /.box-footer -->
                    </g:form>
                </div><!-- /.box -->
            </div>
        </div>

    </section><!-- /.content -->
</div><!-- /.content-wrapper -->

</body>
</html>
