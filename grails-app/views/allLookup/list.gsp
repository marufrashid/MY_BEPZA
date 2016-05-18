<%@ page import="com.bepza.common.AllLookup" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <g:set var="entityName" value="${message(code: 'allLookup.label', default: 'All Lookup')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            All Lookup List
            <small></small>
        </h1>
        <ul class="top-links">
            %{--<li><g:link class="btn btn-block btn-primary btn-xs" url="/"><i class="fa fa-home"></i>Home</g:link></li>--}%
            <li><g:link class="btn btn-block btn-primary btn-xs" action="add"><i
                    class="fa fa-plus"></i>Add New Lookup</g:link></li>
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
                                <label>Key Word</label>
                                <g:textField name="keyWord" id="keyWord"
                                             value="${params?.keyWord}" class="form-control input-sm"/>
                            </div><!-- /.form-group -->
                        </div><!-- /.col -->
                        <div class="col-md-4">
                            <div class="form-group">
                                <label>Title</label>
                                <g:textField name="title" id="title"
                                             value="${params?.title}" class="form-control input-sm"/>
                            </div><!-- /.form-group -->
                        </div><!-- /.col -->
                        <div class="col-md-4">
                            <div class="form-group">
                                <label>Parent</label>
                                <g:select id="parentId" name="parentId"
                                          from="${com.bepza.common.AllLookup.findAllByParentIsNullAndIsActive(true, [sort: 'title', order: 'asc'])}"
                                          optionKey="id"
                                          noSelection="['': '--Select--']"
                                          value="${params?.parentId}" class="form-control select2 input-sm"/>
                                %{--value="${params?.parentId}" class="form-control select2 input-sm" style="width: 100%;"/>--}%
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
                                <g:sortableColumn style="text-align: left;" property="parent"
                                                  title="${message(code: 'user.parent.label', default: 'Lookup Type')}" params="${params}"/>

                                <g:sortableColumn style="text-align: left;" property="keyword"
                                                  title="${message(code: 'user.keyword.label', default: 'Keyword')}" params="${params}"/>

                                <g:sortableColumn style="text-align: left;" property="title"
                                                  title="${message(code: 'user.title.label', default: 'Title')}" params="${params}"/>

                                <g:sortableColumn style="text-align: left;" property="isActive"
                                                  title="${message(code: 'user.isActive.label', default: 'Is Active?')}" params="${params}"/>

                                <g:sortableColumn style="text-align: left;" property="sortBy"
                                                  title="${message(code: 'user.sortBy.label', default: 'Sort Order')}" params="${params}"/>


                                <th style="text-align: left;">Actions</th>
                            </tr>
                            </thead>
                            <tbody>
                            <g:each in="${allLookupInstanceList}" status="i" var="allLookupInstance">
                                <tr>
                                    <td>${fieldValue(bean: allLookupInstance, field: "parent")}</td>

                                    <td>${fieldValue(bean: allLookupInstance, field: "keyword")}</td>

                                    <td>${fieldValue(bean: allLookupInstance, field: "title")}</td>

                                    <td><g:formatBoolean boolean="${allLookupInstance?.isActive}" false="No"
                                                         true="Yes"></g:formatBoolean></td>

                                    <td>${fieldValue(bean: allLookupInstance, field: "sortBy")}</td>

                                    <td>
                                        <div class="list-action">
                                            <g:link action="show" id="${allLookupInstance.id}" title="View"
                                                    alt="View"><i class="fa fa-file-text-o"></i>View</g:link>

                                            <g:link action="edit" id="${allLookupInstance.id}"><i
                                                    class="fa fa-fw fa-edit"></i>Edit</g:link>
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
                    <g:paginate total="${allLookupInstanceTotal ?: 0}" params="${params}"/>
                </div>
            </div>
        </div>

    </section><!-- /.content -->
</div><!-- /.content-wrapper -->

%{------------------------------------------------------------}%
<script type="text/javascript">

    $(function () {
        $(".select2").select2();
    });
</script>
</body>
</html>
