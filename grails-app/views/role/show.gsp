<%@ page import="com.bepza.auth.Role" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'role.label', default: 'Role')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            Role Detail%{--
            <small>view application user role detail</small>--}%
        </h1>
        <ul class="top-links">
            <li><g:link class="btn btn-block btn-primary btn-xs" action="list"><i
                    class="fa fa-reorder"></i>Role List</g:link></li>
            <sec:access url="/role/add/">
                <li><g:link class="btn btn-block btn-primary btn-xs" action="add"><i
                        class="fa fa-fw fa-edit"></i>Add New Role</g:link></li>
            </sec:access>
            <sec:access url="/role/edit/${roleInstance.id}">
                <li><g:link class="btn btn-block btn-warning btn-xs" action="edit" id="${roleInstance?.id}"><i
                        class="fa fa-fw fa-edit"></i>Edit Role</g:link></li>
            </sec:access>
            <sec:access url="/role/delete/${roleInstance.id}">
                <li><g:link class="btn btn-block btn-danger btn-xs" action="delete" id="${roleInstance?.id}"
                            onclick="return confirm('Are you sure you want to delete this record?');"><i
                            class="fa fa-trash"></i>Delete Role</g:link></li>
            </sec:access>
        </ul>
    </section>

    <!-- Main content -->
    <section class="content">

        <div class="row">
            <div class="col-xs-12">

                <div class="box box-primary">
                    %{--<div class="box-header">
                        <h3 class="box-title">User Role Detail View</h3>
                    </div>--}%<!-- /.box-header -->
                    <div class="box-body no-padding">
                        <table class="table table-striped">
                            <g:if test="${roleInstance?.authority}">
                                <tr>
                                    <th>Authority</th>
                                    <td>${roleInstance?.authority}</td>
                                </tr>
                            </g:if>
                            <g:if test="${roleInstance?.description}">
                                <tr>
                                    <th>Description</th>
                                    <td>${roleInstance?.description}</td>
                                </tr>
                            </g:if>

                            <g:if test="${roleInstance?.created}">
                                <tr>
                                    <th>Created at</th>
                                    <td><g:formatDate
                                            date="${roleInstance?.created}"/></td>
                                </tr>
                            </g:if>
                            <g:if test="${roleInstance?.createdBy}">
                                <tr>
                                    <th>Created By</th>
                                    <td>${roleInstance?.createdBy}</td>
                                </tr>
                            </g:if>
                            <g:if test="${roleInstance?.modified}">
                                <tr>
                                    <th>Modified at</th>
                                    <td><g:formatDate
                                            date="${roleInstance?.created}"/></td>
                                </tr>
                            </g:if>
                            <g:if test="${roleInstance?.modifiedBy}">
                                <tr>
                                    <th>Modified By</th>
                                    <td>${roleInstance?.modifiedBy}</td>
                                </tr>
                            </g:if>
                        </table>
                    </div><!-- /.box-body -->
                </div><!-- /.box -->
            </div>
        </div>
    </section><!-- /.content -->
</div><!-- /.content-wrapper -->
</body>
</html>
