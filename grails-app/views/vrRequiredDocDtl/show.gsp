<%@ page import="com.bepza.vr.VrRequiredDocDtl" %>

<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'vrRequiredDocDtl.label', default: 'Required Document')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            Required Document Details
        </h1>
        <ul class="top-links">
            <li><g:link class="btn btn-block btn-primary btn-xs" action="list"><i
                    class="fa fa-reorder"></i>list</g:link></li>
            <sec:access url="/vrRequiredDocDtl/create">
                <li><g:link class="btn btn-block btn-primary btn-xs" action="add"><i
                        class="fa fa-plus"></i>Add</g:link></li>
            </sec:access>
            <sec:access url="/vrRequiredDocDtl/edit/${vrRequiredDocDtlInstance?.id}">%{--approvalEnterpriseGroup--}%
                <li><g:link class="btn btn-block btn-warning btn-xs" action="edit"
                            id="${vrRequiredDocDtlInstance?.id}"><i
                            class="fa fa-fw fa-edit"></i>Edit</g:link></li>
            </sec:access>
            <sec:access url="/vrRequiredDocDtl/delete/${vrRequiredDocDtlInstance?.id}">
                <li><g:link class="btn btn-block btn-danger btn-xs" action="delete"
                            id="${vrRequiredDocDtlInstance?.id}"
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
                       %{-- <fieldset><legend class="text-green"><g:message code="vrRequiredDocDtl.documentType.label"
                                                                        default="Document Type"/></legend>--}%

                            <div class="row">
                                <div class="col-md-12">
                                    <table class="table table-bordered">
                                        <tr>
                                            <th><g:message code="vrRequiredDocDtl.docFor.label"
                                                           default="Document For:"/></th>
                                            <td>${vrRequiredDocDtlInstance?.docFor}</td>
                                            <th></th>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <th><g:message code="vrRequiredDocDtl.docTypeName.label"
                                                           default="Document Name:"/></th>
                                            <td>${vrRequiredDocDtlInstance?.docTypeName}</td>
                                            <th><g:message code="vrRequiredDocDtl.docTypeDescription.label"
                                                           default="Document Description:"/></th>
                                            <td>${vrRequiredDocDtlInstance?.docTypeDescription}</td>
                                        </tr>
                                        <tr>
                                            <th><g:message code="vrRequiredDocDtl.fileSizeByte.label"
                                                           default="File Size(In Byte):"/></th>
                                            <td>${vrRequiredDocDtlInstance?.fileSizeByte}</td>

                                            <th><g:message code="vrRequiredDocDtl.allowedExtensions.label"
                                                           default="Allowed Extensions:"/></th>
                                            <td>${vrRequiredDocDtlInstance?.allowedExtensions}</td>
                                        </tr>
                                        <tr>
                                            <th><g:message code="vrRequiredDocDtl.remarks.label" default="Remarks:"/></th>
                                            <td>${vrRequiredDocDtlInstance?.remarks}</td>
                                            <th><g:message code="vrRequiredDocDtl.sortOrder.label"
                                                           default="Sort Order:"/></th>
                                            <td>${vrRequiredDocDtlInstance?.sortOrder}</td>
                                        </tr>
                                        <tr>
                                            <th><g:message code="vrRequiredDocDtl.isActive.label" default="Is Active?"/></th>
                                            <td>${vrRequiredDocDtlInstance?.isActive == true ? "Active" : "Inactive"}</td>
                                            <th><g:message code="vrRequiredDocDtl.isMandatory.label" default="Is Mandatory ?"/></th>
                                            <td>${vrRequiredDocDtlInstance?.isMandatory == true ? "Mandatory" : "Not Mandatory"}</td>
                                        </tr>
                                        <tr>
                                            <th><g:message code="vrRequiredDocDtl.createdBy.label"
                                                           default="Created By:"/></th>
                                            <td>${vrRequiredDocDtlInstance?.createdBy}</td>
                                            <th><g:message code="vrRequiredDocDtl.createdDate.label"
                                                           default="Created Date:"/></th>
                                            <td><g:formatDate
                                                    date="${vrRequiredDocDtlInstance?.createdDate}"/></td>
                                        </tr>
                                        <tr>
                                            <th><g:message code="vrRequiredDocDtl.modifiedBy.label"
                                                           default="Modified By:"/></th>
                                            <td>${vrRequiredDocDtlInstance?.modifiedBy}</td>
                                            <th><g:message code="vrRequiredDocDtl.modifiedDate.label"
                                                           default="Modified Date:"/></th>
                                            <td><g:formatDate date="${vrRequiredDocDtlInstance?.modifiedDate}"/></td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                        </fieldset>

                    </div><!-- /.box-body -->
                </div><!-- /.box -->
            </div>
        </div>

    </section>
</div><!-- /.content-wrapper -->
</body>
</html>


