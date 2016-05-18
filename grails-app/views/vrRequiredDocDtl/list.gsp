<%@ page import="com.bepza.vr.VrRequiredDocDtl" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'vrRequiredDocDtl.label', default: 'Required Document')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<div class="content-wrapper">

    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            Required Document List
        </h1>
        <ul class="top-links">
            <li><g:link class="btn btn-block btn-primary btn-xs" action="add">
                <i class="fa fa-plus"></i>Add</g:link></li>
        </ul>
    </section>
    <!-- /.content-header -->

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

        <div class="box box-info">
            <g:form action="list" method="get">
                <div class="box-header with-border">
                    <h3 class="box-title">Search</h3>

                    <div class="box-tools pull-right">
                        <button class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip"
                                title="Collapse"><i class="fa fa-minus"></i></button>
                    </div>
                </div>

                <div class="box-body">
                    <div class="row">
                        <div class="col-md-5">
                            <div class="form-group">
                                <label>Document Name</label>
                                <g:textField name="docTypeName" id="docTypeName"
                                             value="${params?.docTypeName}" class="form-control input-sm"/>
                            </div><!-- /.form-group -->
                        </div><!-- /.col -->
                        <div class="col-md-5">
                            <div class="form-group">
                                <label>Is Mandatory</label>
                                <g:select from="${['Mandatory', 'Not Mandatory']}" name="isMandatory" id="isMandatory"
                                          value="${params?.isMandatory}" class="form-control input-sm"
                                          noSelection="${['': 'Select One']}"/>
                            </div><!-- /.form-group -->
                        </div><!-- /.col -->
                        <div class="col-md-2">
                            <div class="form-group">

                                <div>&nbsp;</div>
                                <button type="submit" class="btn btn-primary pull-right"><i
                                        class="fa fa-search"></i>Search
                                </button>
                            </div><!-- /.form-group -->
                        </div><!-- /.col -->
                    </div><!-- /.row -->
                </div><!-- /.box-body -->
            </g:form>
        </div>

        <div class="row">
            <div class="col-xs-12">
                <div class="box box-primary">

                    <div class="box-body table-responsive no-padding">
                        <table class="table table-hover">
                            <thead>
                            <tr>

                                <g:sortableColumn property="docTypeName"
                                                  title="${message(code: 'vrRequiredDocDtl.docTypeName.label', default: 'Document Name')}"/>

                                <g:sortableColumn property="docTypeDescription"
                                                  title="${message(code: 'vrRequiredDocDtl.docTypeDescription.label', default: 'Description')}"/>

                                <g:sortableColumn property="fileSizeByte"
                                                  title="${message(code: 'vrRequiredDocDtl.fileSizeByte.label', default: 'File Size(Byte)')}"/>

                                <g:sortableColumn property="allowedExtensions"
                                                  title="${message(code: 'vrRequiredDocDtl.allowedExtensions.label', default: 'Allowed Extensions')}"/>

                                <g:sortableColumn property="isActive"
                                                  title="${message(code: 'vrRequiredDocDtl.isActive.label', default: 'Is Active?')}"/>
                                <g:sortableColumn property="isMandatory"
                                                  title="${message(code: 'vrRequiredDocDtl.isMandatory.label', default: 'Is Mandatory?')}"/>


                                <th style="width: 150px;text-align: center">Action</th>

                            </tr>
                            </thead>
                            <tbody>

                            <g:each in="${scpRequiredDocInstanceList}" status="i" var="vrRequiredDocDtlInstance">
                                <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                                    <td style="text-align: center;"><g:link action="show"
                                                id="${vrRequiredDocDtlInstance.id}">${fieldValue(bean: vrRequiredDocDtlInstance, field: "docTypeName")}</g:link></td>

                                    <td style="text-align: center;">${fieldValue(bean: vrRequiredDocDtlInstance, field: "docTypeDescription")}</td>

                                    <td style="text-align: center;">${fieldValue(bean: vrRequiredDocDtlInstance, field: "fileSizeByte")}</td>

                                    <td style="text-align: center;">${fieldValue(bean: vrRequiredDocDtlInstance, field: "allowedExtensions")}</td>

                                    <td style="text-align: center;">${vrRequiredDocDtlInstance.isActive == true ? "Active" : "Inactive"}</td>
                                    <td style="text-align: center;">${vrRequiredDocDtlInstance.isMandatory == true ? "Mandatory" : "Not Mandatory"}</td>

                                    <td style="text-align: center">
                                        <div class="list-action">
                                            <sec:access url="/vrRequiredDocDtl/show/${vrRequiredDocDtlInstance.id}">
                                                <g:link action="show" id="${vrRequiredDocDtlInstance.id}" title="View"
                                                        alt="View"><i class="fa fa-file-text-o"></i>View</g:link>
                                            </sec:access>
                                            <sec:access url="/vrRequiredDocDtl/edit/${vrRequiredDocDtlInstance.id}">
                                                <g:link action="edit" id="${vrRequiredDocDtlInstance.id}"><i
                                                        class="fa fa-fw fa-edit"></i>Edit</g:link>
                                            </sec:access>
                                        </div>
                                    </td>

                                </tr>
                            </g:each>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-xs-12">
                <div class="pagination pull-right" id="pagination">
                    <g:paginate total="${vrRequiredDocDtlInstanceCount ?: 0}"/>
                </div>
            </div>
        </div>
    </section>
</div>
<script type="text/javascript">
    $(document).ready(function () {
        $('.cDate').datepicker();
    });
</script>
</body>
</html>
