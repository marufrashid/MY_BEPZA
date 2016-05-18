<%@ page import="com.bepza.auth.User" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            User Detail%{--
            <small>view application user detail</small>--}%
        </h1>
        <ul class="top-links">
            <li><g:link class="btn btn-block btn-primary btn-xs" action="list"><i
                    class="fa fa-reorder"></i>User List</g:link></li>
            <li><g:link class="btn btn-block btn-warning btn-xs" action="add"><i
                    class="fa fa-fw fa-plus"></i>Add New User</g:link></li>
            <sec:access url="/user/edit/${userInstance.id}">
                <li><g:link class="btn btn-block btn-warning btn-xs" action="edit" id="${userInstance?.id}"><i
                        class="fa fa-fw fa-edit"></i>Edit User</g:link></li>
            </sec:access>
            %{--<sec:access url="/user/delete/${userInstance.id}">
                <li><g:link class="btn btn-block btn-danger btn-xs" action="delete" id="${userInstance?.id}"
                            onclick="return confirm('Are you sure you want to delete this record?');"><i
                            class="fa fa-trash"></i>Delete</g:link></li>
            </sec:access>--}%
        </ul>
    </section>

    <!-- Main content -->
    <section class="content">

        <div class="row">
            <div class="col-xs-12">

                <div class="box box-primary">
                    %{--<div class="box-header">
                        <h3 class="box-title">User Detail View</h3>
                    </div>--}%<!-- /.box-header -->
                    <div class="box-body no-padding">
                        <table class="table table-striped">
                           %{-- <g:if test="${userInstance?.designation}">
                                <tr>
                                    <th>Designation</th>
                                    <td>${userInstance?.designation}</td>
                                </tr>
                            </g:if>--}%
                            <g:if test="${userInstance?.fullName}">
                                <tr>
                                    <th>Full Name</th>
                                    <td>${userInstance?.fullName}</td>
                                </tr>
                            </g:if>
                            <g:if test="${userInstance?.username}">
                                <tr>
                                    <th>Username</th>
                                    <td>${userInstance?.username}</td>
                                </tr>
                            </g:if>
                            <g:if test="${userInstance?.email}">
                                <tr>
                                    <th>Email</th>
                                    <td>${userInstance?.email}</td>
                                </tr>
                            </g:if>

                            <g:if test="${userRole}">
                                <tr>
                                    <th>Role</th>
                                    <td>${userRole.join(', ')}</td>
                                </tr>
                            </g:if>

                            %{--<g:if test="${userInstance?.zone}">
                                <tr>
                                    <th>Zone</th>
                                    <td>${userInstance?.zone}</td>
                                </tr>
                            </g:if>--}%

                            %{--<g:if test="${userInstance?.enterprise}">
                                <tr>
                                    <th>Enterprise</th>
                                    <td>${userInstance?.enterprise}</td>
                                </tr>
                            </g:if>--}%

                            <tr>
                                <th>Enabled?</th>
                                <td><g:formatBoolean
                                        boolean="${userInstance?.enabled}" true="Yes" false="No"/></td>
                            </tr>
                            <tr>
                                <th>Account Locked?</th>
                                <td><g:formatBoolean
                                        boolean="${userInstance?.accountLocked}" true="Yes" false="No"/></td>
                            </tr>
                            <tr>
                                <th>Account Expired?</th>
                                <td><g:formatBoolean
                                        boolean="${userInstance?.accountExpired}" true="Yes" false="No"/></td>
                            </tr>
                            <tr>
                                <th>Password Expired?</th>
                                <td><g:formatBoolean
                                        boolean="${userInstance?.passwordExpired}" true="Yes" false="No"/></td>
                            </tr>
                            <g:if test="${userInstance?.created}">
                                <tr>
                                    <th>Created at</th>
                                    <td><g:formatDate
                                            date="${userInstance?.created}"/></td>
                                </tr>
                            </g:if>
                            <g:if test="${userInstance?.createdBy}">
                                <tr>
                                    <th>Created By</th>
                                    <td>${userInstance?.createdBy}</td>
                                </tr>
                            </g:if>
                            <g:if test="${userInstance?.modified}">
                                <tr>
                                    <th>Modified at</th>
                                    <td><g:formatDate
                                            date="${userInstance?.created}"/></td>
                                </tr>
                            </g:if>
                            <g:if test="${userInstance?.modifiedBy}">
                                <tr>
                                    <th>Modified By</th>
                                    <td>${userInstance?.modifiedBy}</td>
                                </tr>
                            </g:if>
                            <g:if test="${userInstance?.signature}">
                                <tr>
                                    <th>Signature</th>
                                    <td><g:img dir="files/employee/signature"
                                               file="${userInstance?.signature}"></g:img></td>
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
