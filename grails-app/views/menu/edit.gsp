<%@ page import="com.bepza.auth.Menu" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'menu.label', default: 'Menu')}"/>
    <title><g:message code="default.edit.label" args="[entityName]"/></title>
</head>

<body>
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            Edit Menu Information
        </h1>
        <ul class="top-links">
            <li><g:link class="btn btn-block btn-primary btn-xs" action="list"><i
                    class="fa fa-reorder"></i>Menu List</g:link></li>
        </ul>
    </section>

    <!-- Main content -->
    <section class="content">

        <div class="row">
            <div class="col-xs-12">

                <!-- Horizontal Form -->
                <div class="box box-primary">
                    %{--<div class="box-header with-border">
                        <h3 class="box-title">Menu Edit Form</h3>
                    </div>--}%<!-- /.box-header -->
                <!-- form start -->
                    <g:form url="[resource: menuInstance, action: 'edit']" method="PUT" class="formValMenu form-horizontal">
                        <div class="box-body">
                            <g:render template="form"></g:render>
                        </div><!-- /.box-body -->
                        <div class="box-footer">
                            <sec:access url="/menu/delete/${menuInstance.id}">
                                <g:link action="delete" id="${menuInstance.id}" class="btn btn-danger"><i
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
