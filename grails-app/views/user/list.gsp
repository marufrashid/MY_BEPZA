<%@ page import="com.bepza.auth.User" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            User List%{--
            <small>applicatin user list</small>--}%
        </h1>
        <ul class="top-links">
            %{--<li><g:link class="btn btn-block btn-primary btn-xs" url="/"><i class="fa fa-home"></i>Home</g:link></li>--}%
            <li><g:link class="btn btn-block btn-primary btn-xs" action="add"><i
                    class="fa fa-plus"></i>Add New User</g:link></li>
        </ul>
    </section>

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
                        %{--<div class="col-md-4">
                            <div class="form-group">
                                <label>Designation</label>
                                <g:select from="${designationList}" name="designationId" id="designationId"
                                          noSelection="['': '--Select--']" optionKey="id"
                                          value="${params?.designationId}" class="form-control input-sm select2"/>
                            </div><!-- /.form-group -->
                        </div>--}%<!-- /.col -->
                        <div class="col-md-4">
                            <div class="form-group">
                                <label>Full Name</label>
                                <g:textField name="fullName" id="fullName"
                                             value="${params?.fullName}" class="form-control input-sm"/>
                            </div><!-- /.form-group -->
                        </div><!-- /.col -->
                        <div class="col-md-4">
                            <div class="form-group">
                                <label>Username</label>
                                <g:textField name="username" id="username"
                                             value="${params?.username}" class="form-control input-sm"/>
                            </div><!-- /.form-group -->
                        </div><!-- /.col -->

                        <div class="col-md-4">
                            <div class="form-group">
                                <label>Role</label>
                                <g:select from="${com.bepza.auth.Role.list()}" name="roleId" id="roleId"
                                          optionKey="id"
                                          noSelection="['': '--Select--']"
                                          value="${params?.roleId}" class="form-control input-sm select2"/>
                            </div><!-- /.form-group -->
                        </div><!-- /.col -->
                        %{--<div class="col-md-4">--}%
                            %{--<div class="form-group">
                                <label>Zone</label>
                                <g:select name="zoneId"
                                          id="zoneId"
                                          from="${zoneList}"
                                          optionKey="id"
                                          noSelection="['': '--Select--']"
                                          value="${params?.zoneId}"
                                          class="form-control"/>
                            </div>--}%<!-- /.form-group -->
                        %{--</div><!-- /.col -->--}%
                        %{--<div class="col-md-4">--}%
                            %{--<div class="form-group">
                                <label>Enterprise</label>
                                <g:select name="enterpriseId"
                                          id="enterpriseId"
                                          from="${enterpriseList}"
                                          optionKey="id"
                                          noSelection="['': '--Select--']"
                                          value="${params?.enterpriseId}"
                                          class="form-control select2"/>
                            </div>--}%<!-- /.form-group -->
                        %{--</div><!-- /.col -->--}%
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
                                <g:sortableColumn style="text-align: left;" property="fullName"
                                                  title="${message(code: 'user.fullName.label', default: 'Full Name')}"/>

                                <g:sortableColumn style="text-align: left;" property="username"
                                                  title="${message(code: 'user.username.label', default: 'User Id')}"/>

                                <g:sortableColumn style="text-align: left;" property="email"
                                                  title="${message(code: 'user.email.label', default: 'Email')}"/>
                                <g:sortableColumn style="text-align: left;" property="cellNo"
                                                  title="${message(code: 'user.cellNo.label', default: 'Cell No')}"/>

                                %{--<th>Zone</th>
                                <th>Enterprise</th>--}%
                                <th style="text-align: left;">Actions</th>
                            </tr>
                            </thead>
                            <tbody>
                            <g:each in="${userInstanceList}" status="i" var="userInstance">
                                <tr>
                                    <td>${userInstance?.fullName}</td>

                                    <td>${fieldValue(bean: userInstance, field: "username")}</td>

                                    <td>${fieldValue(bean: userInstance, field: "email")}</td>

                                    <td>${fieldValue(bean: userInstance, field: "cellNo")}</td>

                                    %{--<td>${fieldValue(bean: userInstance, field: "zone")}</td>

                                    <td>${fieldValue(bean: userInstance, field: "enterprise")}</td>--}%

                                    <td>
                                        <div class="list-action">
                                            <sec:access url="/user/edit/${userInstance.id}">
                                                <g:link action="show" id="${userInstance.id}" title="View"
                                                        alt="View"><i class="fa fa-file-text-o"></i>View</g:link>
                                            </sec:access>
                                            <sec:access url="/user/edit/${userInstance.id}">
                                                <g:link action="edit" id="${userInstance.id}"><i
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
                    <div class="pagination pull-right">
                        %{--<li>--}%
                        <g:paginate total="${userInstanceTotal ?: 0}" params="${params}"/>
                        %{--</li>--}%

                    </div>
                </div>
            </div>
        </div>

    </section><!-- /.content -->
</div><!-- /.content-wrapper -->
<script type="text/javascript">
    $(document).ready(function () {
        //Initialize Select2 Elements
        $(".select2").select2();

        $("#zoneId").change(function () {
            var zoneId = $(this).val();
            $.ajax({
                url: "${request.contextPath}/commonAjax/getEnterpriseByZoneId",
                data: "zoneId=" + zoneId,
                success: function (data, textStatus, jqXHR) {
                    console.log(data);
                    $("#enterpriseId").html(data);
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    console.log(textStatus);
                }
            });
        });
    });
</script>
</body>
</html>
