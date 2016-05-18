<%@ page import="com.bepza.auth.Requestmap" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'requestmap.label', default: 'Role Permission')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            Role Permission List
        </h1>
        <ul class="top-links">
            %{--<li><g:link class="btn btn-block btn-primary btn-xs" url="/"><i class="fa fa-home"></i>Home</g:link></li>--}%
            <li><g:link class="btn btn-block btn-primary btn-xs" action="add"><i
                    class="fa fa-plus"></i>Add New Role Permission</g:link></li>
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
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>URL Path</label>
                                <g:textField name="urlPath" id="urlPath"
                                             value="${params?.urlPath}" class="form-control input-sm"/>
                            </div><!-- /.form-group -->
                        </div><!-- /.col -->
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Config Attribute</label>
                                <g:textField name="configAttribute" id="configAttribute"
                                             value="${params?.configAttribute}" class="form-control input-sm"/>
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
                                <g:sortableColumn style="text-align: left;" property="url"
                                                  title="${message(code: 'requestmap.url.label', default: 'Url')}"/>

                                %{--<g:sortableColumn property="httpMethod"
                                                  title="${message(code: 'requestmap.httpMethod.label', default: 'HTTP Method')}"/>--}%

                                <g:sortableColumn style="text-align: left;" property="configAttribute"
                                                  title="${message(code: 'requestmap.configAttribute.label', default: 'Role(s)')}"/>

                                <g:sortableColumn style="text-align: left;" property="created"
                                                  title="${message(code: 'requestmap.created.label', default: 'Created')}"/>

                                <g:sortableColumn style="text-align: left;" property="createdBy"
                                                  title="${message(code: 'requestmap.createdBy.label', default: 'Created By')}"/>

                                <th style="text-align: left;">Actions</th>
                            </tr>
                            </thead>
                            <tbody>
                            <g:each in="${requestmapInstanceList}" status="i" var="requestmapInstance">
                                <tr>
                                    <td>${fieldValue(bean: requestmapInstance, field: "url")}</td>

                                    %{--<td>${fieldValue(bean: requestmapInstance, field: "httpMethod")}</td>--}%

                                    <td>
                                        <g:set var="configAttributeList"
                                               value="${requestmapInstance?.configAttribute.split(',')}"></g:set>
                                        <g:each in="${configAttributeList}" status="j" var="configAttribute">
                                            ${j+1}. ${configAttribute}<br>
                                        </g:each>
                                    </td>

                                    <td><g:formatDate date="${requestmapInstance.created}"/></td>

                                    <td>${fieldValue(bean: requestmapInstance, field: "createdBy")}</td>

                                    <td>
                                        <div class="list-action">
                                            <sec:access url="/requestmap/show/${requestmapInstance.id}">
                                                <g:link action="show" id="${requestmapInstance.id}" title="View"
                                                        alt="View"><i class="fa fa-file-text-o"></i>View</g:link>
                                            </sec:access>
                                            <sec:access url="/requestmap/edit/${requestmapInstance.id}">
                                                <g:link action="edit" id="${requestmapInstance.id}"><i
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
                <div class="pagination pull-right" id="pagination">
                    <g:paginate total="${requestmapInstanceTotal ?: 0}" params="${params}"/>
                </div>
            </div>
        </div>

    </section><!-- /.content -->
</div><!-- /.content-wrapper -->

</body>
</html>
