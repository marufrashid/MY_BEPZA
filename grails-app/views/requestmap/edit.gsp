<%@ page import="com.bepza.auth.Requestmap" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'requestmap.label', default: 'Role Permission')}"/>
    <title><g:message code="default.edit.label" args="[entityName]"/></title>
</head>

<body>
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            Edit Role Permission
        </h1>
        <ul class="top-links">
            <li><g:link class="btn btn-block btn-primary btn-xs" action="list"><i
                    class="fa fa-reorder"></i>Role Permission List</g:link></li>
        </ul>
    </section>

    <!-- Main content -->
    <section class="content">

        <div class="row">
            <div class="col-xs-12">

                <!-- Horizontal Form -->
                <div class="box box-primary">
                    %{--<div class="box-header with-border">
                        <h3 class="box-title">Role Permission Edit Form</h3>
                    </div>--}%<!-- /.box-header -->
                <!-- form start -->
                    <g:form url="[resource: requestmapInstance, action: 'edit']" method="PUT" class="formValReqMap form-horizontal">
                        <div class="box-body">
                            <g:render template="form"></g:render>
                        </div><!-- /.box-body -->
                        <div class="box-footer">
                            <sec:access url="/requestmap/delete/${requestmapInstance.id}">
                                <g:link action="delete" id="${requestmapInstance.id}" class="btn btn-danger"><i
                                        class="fa fa-trash"></i>Delete
                                </g:link>
                            </sec:access>
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
