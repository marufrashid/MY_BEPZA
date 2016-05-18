<%@ page import="com.bepza.auth.Requestmap" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'requestmap.label', default: 'Role Permission')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            Role Permission Detail
        </h1>
        <ul class="top-links">
            <li><g:link class="btn btn-block btn-primary btn-xs" action="list"><i
                    class="fa fa-reorder"></i>Role Permission list</g:link></li>
            <li><g:link class="btn btn-block btn-primary btn-xs" action="add"><i
                    class="fa fa-plus"></i>Add New Role Permission</g:link></li>
            <sec:access url="/requestmap/edit/${requestmapInstance.id}">
                <li><g:link class="btn btn-block btn-warning btn-xs" action="edit" id="${requestmapInstance?.id}"><i
                        class="fa fa-fw fa-edit"></i>Edit Role Permission</g:link></li>
            </sec:access>
            <sec:access url="/requestmap/delete/${requestmapInstance.id}">
                <li><g:link class="btn btn-block btn-danger btn-xs" action="delete" id="${requestmapInstance?.id}"
                            onclick="return confirm('Are you sure you want to delete this record?');"><i
                            class="fa fa-trash"></i>Delete</g:link></li>
            </sec:access>
        </ul>
    </section>

    <!-- Main content -->
    <section class="content">

        <div class="row">
            <div class="col-xs-12">

                <div class="box box-primary">
                    %{--<div class="box-header">
                        <h3 class="box-title">Role Permission Detail</h3>
                    </div>--}%<!-- /.box-header -->
                    <div class="box-body no-padding">
                        <table class="table table-striped">
                            <g:if test="${requestmapInstance?.url}">
                                <tr>
                                    <th>URL Path</th>
                                    <td>${requestmapInstance?.url}</td>
                                </tr>
                            </g:if>
                            <g:if test="${requestmapInstance?.httpMethod}">
                                <tr>
                                    <th>HTTP Method</th>
                                    <td>${requestmapInstance?.httpMethod}</td>
                                </tr>
                            </g:if>
                            <g:if test="${requestmapInstance?.configAttribute}">
                                <tr>
                                    <th>Role(s)</th>
                                    <td>
                                        <g:set var="configAttributeList"
                                               value="${requestmapInstance?.configAttribute.split(',')}"></g:set>
                                        <g:each in="${configAttributeList}" status="j" var="configAttribute">
                                            ${j+1}. ${configAttribute}<br>
                                        </g:each>
                                    </td>
                                </tr>
                            </g:if>

                            <g:if test="${requestmapInstance?.created}">
                                <tr>
                                    <th>Created Date</th>
                                    <td><g:formatDate
                                            date="${requestmapInstance?.created}"/></td>
                                </tr>
                            </g:if>
                            <g:if test="${requestmapInstance?.createdBy}">
                                <tr>
                                    <th>Created By</th>
                                    <td>${requestmapInstance?.createdBy}</td>
                                </tr>
                            </g:if>
                            <g:if test="${requestmapInstance?.modified}">
                                <tr>
                                    <th>Modified Date</th>
                                    <td><g:formatDate
                                            date="${requestmapInstance?.modified}"/></td>
                                </tr>
                            </g:if>
                            <g:if test="${requestmapInstance?.modifiedBy}">
                                <tr>
                                    <th>Modified By</th>
                                    <td>${requestmapInstance?.modifiedBy}</td>
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
