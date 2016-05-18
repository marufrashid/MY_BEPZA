<%@ page import="com.bepza.auth.Menu" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'menu.label', default: 'Menu')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            Menu List
        </h1>
        <ul class="top-links">
            %{--<li><g:link class="btn btn-block btn-primary btn-xs" url="/"><i class="fa fa-home"></i>Home</g:link></li>--}%
            <li><g:link class="btn btn-block btn-primary btn-xs" action="add"><i
                    class="fa fa-plus"></i>Add New Menu</g:link></li>
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
                        <div class="col-md-4">
                            <div class="form-group">
                                <label>URL Path</label>
                                <g:textField name="urlPath" id="urlPath"
                                             value="${params?.urlPath}" class="form-control input-sm"/>
                            </div><!-- /.form-group -->
                        </div><!-- /.col -->
                        <div class="col-md-4">
                            <div class="form-group">
                                <label>Menu Title</label>
                                <g:textField name="title" id="title"
                                             value="${params?.title}" class="form-control input-sm"/>
                            </div><!-- /.form-group -->
                        </div><!-- /.col -->
                        <div class="col-md-4">
                            <div class="form-group">
                                <label>Parent Menu</label>
                                <g:select id="parentMenu" class="form-control select2 input-sm" name="parentMenuId"
                                          from="${menuInstanceListDD}"
                                          optionKey="${{ it.id }}" optionValue="${{ it.title }}"
                                          value="${params?.parentMenuId}"
                                          noSelection="['': 'Select One']" />
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
                                <g:sortableColumn style="text-align: left;" property="title"
                                                  title="${message(code: 'menu.title.label', default: 'Title')}"/>

                                <g:sortableColumn style="text-align: left;" property="urlPath"
                                                  title="${message(code: 'menu.urlPath.label', default: 'Url Path')}"/>

                                <g:sortableColumn style="text-align: left;" property="description"
                                                  title="${message(code: 'menu.description.label', default: 'Description')}"/>

                                <g:sortableColumn style="text-align: left;" property="parentMenu"
                                                  title="${message(code: 'menu.parentMenu.label', default: 'Parent Menu')}"/>

                                <g:sortableColumn style="text-align: left;" property="menuType"
                                                  title="${message(code: 'menu.menuType.label', default: 'Menu Type')}"/>

                                <th style="text-align: left;">Actions</th>
                            </tr>
                            </thead>
                            <tbody>
                            <g:each in="${menuInstanceList}" status="i" var="menuInstance">

                                <tr>
                                    <td>${fieldValue(bean: menuInstance, field: "title")}</td>

                                    <td>${fieldValue(bean: menuInstance, field: "urlPath")}</td>

                                    <td>${fieldValue(bean: menuInstance, field: "description")}</td>

                                    <td>${fieldValue(bean: menuInstance?.parentMenu, field: "title")}</td>

                                    <td>${fieldValue(bean: menuInstance, field: "menuType")}</td>

                                    <td>
                                        <div class="list-action">
                                            <sec:access url="/menu/edit/${menuInstance.id}">
                                                <g:link action="show" id="${menuInstance.id}" title="View"
                                                        alt="View"><i class="fa fa-file-text-o"></i>View</g:link>
                                            </sec:access>
                                            <sec:access url="/menu/edit/${menuInstance.id}">
                                                <g:link action="edit" id="${menuInstance.id}"><i
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
                    <g:paginate total="${menuInstanceTotal ?: 0}" params="${params}"/>
                </div>
            </div>
        </div>

    </section><!-- /.content -->
</div><!-- /.content-wrapper -->

<script type="text/javascript">
    $(function () {
        $(".select2").select2();
    });
</script>
</body>
</html>
