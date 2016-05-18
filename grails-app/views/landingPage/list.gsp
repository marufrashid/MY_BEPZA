<%@ page import="com.bepza.common.LandingPage" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'landingPage.label', default: 'Landing Page')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            Landing Page List
        </h1>
        <ul class="top-links">
            <li><g:link class="btn btn-block btn-primary btn-xs" action="add"><i
                    class="fa fa-plus"></i>Add new landing page</g:link></li>
        </ul>
    </section>

    <!-- Main content -->
    <section class="content">
    <!-- flash message -->
        <g:if test="${flash.success}">
            <div class="alert alert-success alert-dismissable">
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                <i class="icon fa fa-check"></i>
                ${flash.success}
            </div>
        </g:if>
        <g:elseif test="${flash.error}">
            <div class="alert alert-danger alert-dismissable">
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                <i class="icon fa fa-remove"></i>
                ${flash.error}
            </div>
        </g:elseif>
        <g:elseif test="${flash.message}">
            <div class="alert alert-info alert-dismissable">
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                <i class="icon fa fa-info"></i>
                ${flash.message}
            </div>
        </g:elseif>
    <!-- flash message end -->
        <div class="row">
            <div class="col-xs-12">
                <div class="box box-primary">

                    <div class="box-body table-responsive no-padding">
                        <table class="table table-hover">
                            <thead>
                            <tr>
                                <th><g:message code="landingPage.userRole.label" default="User Role"/></th>

                                <g:sortableColumn property="pageUrl"
                                                  title="${message(code: 'landingPage.pageUrl.label', default: 'Page Url')}"/>

                                <g:sortableColumn property="isActive"
                                                  title="${message(code: 'landingPage.isActive.label', default: 'Is Active')}"/>

                                <g:sortableColumn property="entryDate"
                                                  title="${message(code: 'landingPage.entryDate.label', default: 'Entry Date')}"/>

                                <th>Actions</th>
                            </tr>
                            </thead>
                            <tbody>
                            <g:each in="${landingPageInstanceList}" status="i" var="landingPageInstance">
                                <tr>
                                    <td>${fieldValue(bean: landingPageInstance, field: "userRole")}</td>

                                    <td>${fieldValue(bean: landingPageInstance, field: "pageUrl")}</td>

                                    <td><g:formatBoolean boolean="${landingPageInstance.isActive}" true="Yes"
                                                         false="No"/></td>

                                    <td><g:formatDate date="${landingPageInstance.entryDate}"/></td>

                                    <td>
                                        <div class="list-action">
                                            <sec:access url="/landingPage/show/${landingPageInstance.id}">
                                                <g:link action="show" id="${landingPageInstance.id}" title="View"
                                                        alt="View"><i class="fa fa-file-text-o"></i>View</g:link>
                                            </sec:access>
                                            <sec:access url="/landingPage/edit/${landingPageInstance.id}">
                                                <g:link action="edit" id="${landingPageInstance.id}"><i
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
                        <g:paginate total="${landingPageInstanceCount ?: 0}"/>
                        %{--</li>--}%

                    </div>
                </div>
            </div>
        </div>

    </section><!-- /.content -->
</div><!-- /.content-wrapper -->
</body>
</html>