<%@ page import="com.bepza.auth.Menu" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'menu.label', default: 'Menu')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            Menu Detail
        </h1>
        <ul class="top-links">
            <li><g:link class="btn btn-block btn-primary btn-xs" action="list"><i
                    class="fa fa-reorder"></i>Menu List</g:link></li>
            <li><g:link class="btn btn-block btn-primary btn-xs" action="add"><i
                    class="fa fa-plus"></i>Add New Menu</g:link></li>
            <sec:access url="/menu/edit/${menuInstance.id}">
                <li><g:link class="btn btn-block btn-warning btn-xs" action="edit" id="${menuInstance?.id}"><i
                        class="fa fa-fw fa-edit"></i>Edit Menu</g:link></li>
            </sec:access>
            <sec:access url="/menu/delete/${menuInstance.id}">
                <li><g:link class="btn btn-block btn-danger btn-xs" action="delete" id="${menuInstance?.id}"
                            onclick="return confirm('Are you sure you want to delete this record?');"><i
                            class="fa fa-trash"></i>Delete Menu</g:link></li>
            </sec:access>
        </ul>
    </section>

    <!-- Main content -->
    <section class="content">

        <div class="row">
            <div class="col-xs-12">

                <div class="box box-primary">
                    <div class="box-header">
                        <h3 class="box-title">Menu Detail View</h3>
                    </div><!-- /.box-header -->
                    <div class="box-body no-padding">
                        <table class="table table-striped">
                            <g:if test="${menuInstance?.title}">
                                <tr>
                                    <th>Menu Title</th>
                                    <td>${menuInstance?.title}</td>
                                </tr>
                            </g:if>
                            <g:if test="${menuInstance?.toolTip}">
                                <tr>
                                    <th>Toll Tip</th>
                                    <td>${menuInstance?.toolTip}</td>
                                </tr>
                            </g:if>
                            <g:if test="${menuInstance?.description}">
                                <tr>
                                    <th>Description</th>
                                    <td>${menuInstance?.description}</td>
                                </tr>
                            </g:if>

                            <g:if test="${menuInstance?.urlPath}">
                                <tr>
                                    <th>URL Path</th>
                                    <td>${menuInstance?.urlPath}</td>
                                </tr>
                            </g:if>

                            <g:if test="${menuInstance?.menuClass}">
                                <tr>
                                    <th>Menu Class</th>
                                    <td>${menuInstance?.menuClass}</td>
                                </tr>
                            </g:if>

                            <g:if test="${menuInstance?.menuType}">
                                <tr>
                                    <th>Menu Type</th>
                                    <td>${menuInstance?.menuType}</td>
                                </tr>
                            </g:if>

                            <g:if test="${menuInstance?.isExternal}">
                                <tr>
                                    <th>Extrernal?</th>
                                    <td><g:formatBoolean boolean="${menuInstance?.isExternal}" false="No"
                                                         true="Yes"></g:formatBoolean></td>
                                </tr>
                            </g:if>

                            <g:if test="${menuInstance?.isOpenNewTab}">
                                <tr>
                                    <th>Open in New Tab?</th>
                                    <td><g:formatBoolean boolean="${menuInstance?.isOpenNewTab}" false="No"
                                                         true="Yes"></g:formatBoolean></td>
                                </tr>
                            </g:if>

                            <g:if test="${menuInstance?.isActive}">
                                <tr>
                                    <th>Active?</th>
                                    <td><g:formatBoolean boolean="${menuInstance?.isActive}" false="No"
                                                         true="Yes"></g:formatBoolean></td>
                                </tr>
                            </g:if>

                            <g:if test="${menuInstance?.sortOrder}">
                                <tr>
                                    <th>Sort Order</th>
                                    <td>${menuInstance?.sortOrder}</td>
                                </tr>
                            </g:if>

                            <g:if test="${menuInstance?.created}">
                                <tr>
                                    <th>Created At</th>
                                    <td><g:formatDate
                                            date="${menuInstance?.created}"/></td>
                                </tr>
                            </g:if>
                            <g:if test="${menuInstance?.createdBy}">
                                <tr>
                                    <th>Created By</th>
                                    <td>${menuInstance?.createdBy}</td>
                                </tr>
                            </g:if>
                            <g:if test="${menuInstance?.modified}">
                                <tr>
                                    <th>Modified at</th>
                                    <td><g:formatDate
                                            date="${menuInstance?.modified}"/></td>
                                </tr>
                            </g:if>
                            <g:if test="${menuInstance?.modifiedBy}">
                                <tr>
                                    <th>Modified By</th>
                                    <td>${menuInstance?.modifiedBy}</td>
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