<%@ page import="com.bepza.common.AllLookup" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'allLookup.label', default: 'All Lookup')}"/>
    <title><g:message code="default.create.label" args="[entityName]"/></title>
</head>

<body>
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            Add New Lookup
            %{--<small>add application user</small>--}%
        </h1>
        <ul class="top-links">
            %{--<li><g:link class="btn btn-block btn-primary btn-xs" url="/"><i class="fa fa-home"></i>Home</g:link></li>--}%
            <li><g:link class="btn btn-block btn-primary btn-xs" action="list"><i
                    class="fa fa-reorder"></i>Lookup Data List</g:link></li>
        </ul>
    </section>

    <!-- Main content -->
    <section class="content">

        <div class="row">
            <div class="col-xs-12">

                <!-- Horizontal Form -->
                <div class="box box-primary">
                    %{--<div class="box-header with-border">
                        <h3 class="box-title">Add New Lookup</h3>
                    </div>--}%<!-- /.box-header -->


                    <g:form action="add" method="post" class="formValLookUp form-horizontal">
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
