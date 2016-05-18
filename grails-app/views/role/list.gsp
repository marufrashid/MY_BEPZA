<%@ page import="com.bepza.auth.Role" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'role.label', default: 'Role')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            Role List
        </h1>
        <ul class="top-links">
            %{--<li><g:link class="btn btn-block btn-primary btn-xs" url="/"><i class="fa fa-home"></i>Home</g:link></li>--}%
            <li><g:link class="btn btn-block btn-primary btn-xs" action="add"><i
                    class="fa fa-plus"></i>Add New Role</g:link></li>
        </ul>
    </section>

    <div>&nbsp;</div>

    <!-- Main content -->
    <section class="content">
        <!-- Serch box -->
        <div class="box box-info">
            <g:form action="list" method="get">
                <div class="box-header with-border">
                    <h3 class="box-title">Search</h3>

                    <div class="box-tools pull-right">
                        <button class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip"
                                title="Collapse"><i class="fa fa-minus"></i></button>
                        %{--<button class="btn btn-box-tool" data-widget="remove" data-toggle="tooltip" title="Remove"><i class="fa fa-times"></i></button>--}%
                    </div>
                </div>

                <div class="box-body">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Authority Name</label>
                                <g:textField name="authority" id="authority"
                                             value="${params?.authority}" class="form-control input-sm"/>
                            </div><!-- /.form-group -->
                        </div><!-- /.col -->
                    </div><!-- /.row -->
                </div><!-- /.box-body -->
                <div class="box-footer">
                    <button type="submit" class="btn btn-primary pull-right"><i class="fa fa-search"></i>Search
                    </button>
                </div><!-- /.box-footer-->
            </g:form>
        </div><!-- /.box -->

        <div class="row">
            <div class="col-xs-12">
                <div class="box box-primary">

                    <div class="box-body table-responsive no-padding">
                        <table class="table table-hover">
                            <thead>
                            <tr>
                                <g:sortableColumn style="text-align: left;" property="authority"
                                                  title="${message(code: 'Role.authority.label', default: 'Authority')}"/>

                                <g:sortableColumn style="text-align: left;" property="description"
                                                  title="${message(code: 'Role.description.label', default: 'Description')}"/>

                                <g:sortableColumn style="text-align: left;" property="created"
                                                  title="${message(code: 'Role.created.label', default: 'Created')}"/>

                                <g:sortableColumn style="text-align: left;" property="createdBy"
                                                  title="${message(code: 'Role.createdBy.label', default: 'Created By')}"/>

                                <th style="text-align: left;">Actions</th>
                            </tr>
                            </thead>
                            <tbody>
                            <g:each in="${roleInstanceList}" status="i" var="roleInstance">
                                <tr>
                                    <td>${fieldValue(bean: roleInstance, field: "authority")}</td>

                                    <td>${fieldValue(bean: roleInstance, field: "description")}</td>

                                    <td><g:formatDate date="${roleInstance.created}"/></td>

                                    <td>${fieldValue(bean: roleInstance, field: "createdBy")}</td>

                                    <td>
                                        <div class="list-action">
                                            <sec:access url="/role/edit/${roleInstance.id}">
                                                <g:link action="show" id="${roleInstance.id}" title="View"
                                                        alt="View"><i class="fa fa-file-text-o"></i>View</g:link>
                                            </sec:access>
                                            <sec:access url="/role/edit/${roleInstance.id}">
                                                <g:link action="edit" id="${roleInstance.id}"><i
                                                        class="fa fa-fw fa-edit"></i>Edit</g:link>
                                            </sec:access>
                                        </div>
                                    </td>

                                </tr>
                            </g:each>

                            </tbody>

                        </table>
                    </div><!-- /.box-body -->
                </div><!-- /.box -->
            </div>
        </div>

        <div class="row">
            <div class="col-xs-12">
                %{--<div class="dataTables_paginate paging_simple_numbers" id="example2_paginate">--}%
                <div class="col-xs-12" id="">
                    <div class="pagination pull-right" id="pagination">
                        %{--<li>--}%
                        <g:paginate total="${roleInstanceCount ?: 0}"/>
                        %{--</li>--}%

                    </div>
                </div>
            </div>
        </div>

    </section><!-- /.content -->
</div><!-- /.content-wrapper -->
</body>
</html>
