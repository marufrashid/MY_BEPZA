<%@ page import="com.bepza.common.LandingPage" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'landingPage.label', default: 'Landing Page Setup')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            Landing Page Detail
        </h1>
        <ul class="top-links">
            <li><g:link class="btn btn-block btn-primary btn-xs" action="list"><i
                    class="fa fa-reorder"></i>Landing page list</g:link></li>
            <sec:access url="/landingPage/add/">
                <li><g:link class="btn btn-block btn-primary btn-xs" action="add"><i
                        class="fa fa-fw fa-plus"></i>Add</g:link></li>
            </sec:access>
            <sec:access url="/landingPage/edit/${landingPageInstance.id}">
                <li><g:link class="btn btn-block btn-warning btn-xs" action="edit" id="${landingPageInstance?.id}"><i
                        class="fa fa-fw fa-edit"></i>Edit</g:link></li>
            </sec:access>
            <sec:access url="/landingPage/delete/${landingPageInstance.id}">
                <li><g:link class="btn btn-block btn-danger btn-xs" action="delete" id="${landingPageInstance?.id}"
                            onclick="return confirm('Are you sure you want to delete this record?');"><i
                            class="fa fa-trash"></i>Delete</g:link></li>
            </sec:access>
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
                    <div class="box-header">
                        <h3 class="box-title">Landing Page Detail View</h3>
                    </div><!-- /.box-header -->
                    <div class="box-body no-padding">
                        <table class="table table-striped">
                            <g:if test="${landingPageInstance?.userRole}">
                                <tr>
                                    <th style="text-align: right;">User Role:</th>
                                    <td>${landingPageInstance?.userRole}</td>
                                </tr>
                            </g:if>
                            <g:if test="${landingPageInstance?.pageUrl}">
                                <tr>
                                    <th style="text-align: right;">Landing Page URL:</th>
                                    <td><g:link uri="${landingPageInstance?.pageUrl}"
                                                target="_blank">${landingPageInstance?.pageUrl}</g:link></td>
                                </tr>
                            </g:if>
                            <g:if test="${landingPageInstance?.isActive}">
                                <tr>
                                    <th style="text-align: right;">Active?:</th>
                                    <td><g:formatBoolean boolean="${landingPageInstance?.isActive}" false="No"
                                                         true="Yes"/></td>
                                </tr>
                            </g:if>

                            <g:if test="${landingPageInstance?.entryDate}">
                                <tr>
                                    <th style="text-align: right;">Entry Date:</th>
                                    <td><g:formatDate
                                            date="${landingPageInstance?.entryDate}"/></td>
                                </tr>
                            </g:if>
                            <g:if test="${landingPageInstance?.entryByUserId}">
                                <tr>
                                    <th style="text-align: right;">Entry By:</th>
                                    <td>${landingPageInstance?.entryByUserId?.fullName}</td>
                                </tr>
                            </g:if>
                            <g:if test="${landingPageInstance?.modifiedDate}">
                                <tr>
                                    <th style="text-align: right;">Modified Date:</th>
                                    <td><g:formatDate
                                            date="${landingPageInstance?.modifiedDate}"/></td>
                                </tr>
                            </g:if>
                            <g:if test="${landingPageInstance?.modifiedByUserId}">
                                <tr>
                                    <th style="text-align: right;">Modified By:</th>
                                    <td>${landingPageInstance?.modifiedByUserId?.fullName}</td>
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