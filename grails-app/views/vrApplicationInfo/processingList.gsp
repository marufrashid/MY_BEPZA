<%@ page import="com.bepza.vr.VrApplicationInfo" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'vrApplicationInfo.label', default: 'Visa Application')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
    <!-- Bootstrap date Picker -->
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'bootstrap-datepicker.min.css')}">
    <script src="${resource(dir: 'js', file: 'bootstrap-datepicker.min.js')}"></script>
</head>

<body>
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            Visa Application List
        </h1>
        %{--<ul class="top-links">
            <li>
                <g:link class="btn btn-block btn-primary btn-xs" action="add">
                    <i class="fa fa-plus"></i>New Application</g:link>
            </li>
        </ul>--}%
    </section>
    <!-- /.content-header -->
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
    <!-- Search box Start-->
        <div class="box box-info">
            <g:form action="searchProcessingList" method="get">
                <div class="box-header with-border">
                    <h3 class="box-title"><g:message code="cpEntrprsMst.search.label" default="Search"/></h3>

                    <div class="box-tools pull-right">
                        <button class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip"
                                title="Collapse"><i class="fa fa-minus"></i></button>
                        %{--<button class="btn btn-box-tool" data-widget="remove" data-toggle="tooltip" title="Remove"><i class="fa fa-times"></i></button>--}%
                    </div>
                </div>

                <div class="box-body">
                    <div class="row">
                        <div class="col-md-2">
                            <div class="form-group">
                                <label>Application ID #</label>
                                <g:textField name="code" id="code"
                                             value="${params?.code}" class="form-control input-sm"/>
                            </div><!-- /.form-group -->
                        </div><!-- /.col -->
                        <div class="col-md-4">
                            <div class="form-group">
                                <label>Firm Name</label>
                                <g:textField name="entrprsName" id="entrprsName"
                                             value="${params?.entrprsName}" class="form-control input-sm"/>
                            </div><!-- /.form-group -->
                        </div><!-- /.col -->
                        <div class="col-md-2">
                            <div class="form-group">
                                <label>Submit Date (From)</label>
                                <g:textField name="fromDate" id="fromDate"
                                             value="${params?.fromDate}" class="form-control input-sm datePick"/>
                            </div><!-- /.form-group -->
                        </div><!-- /.col -->
                        <div class="col-md-2">
                            <div class="form-group">
                                <label>Submit Date (To)</label>
                                <g:textField name="toDate" id="toDate"
                                             value="${params?.toDate}" class="form-control input-sm datePick"/>
                            </div><!-- /.form-group -->
                        </div><!-- /.col -->
                        <div class="col-md-2">
                            <div class="form-group">
                                <label style="color: white">aa</label>
                                <button type="submit" class="btn btn-primary pull-right form-control">
                                    <i class="fa fa-search"></i>Search
                                </button>
                            </div><!-- /.form-group -->
                        </div>
                    </div><!-- /.row -->
                </div><!-- /.box-body -->
                %{--<div class="box-footer">
                    <button type="submit" class="btn btn-primary pull-right"><i class="fa fa-search"></i>Search
                    </button>
                </div>--}%<!-- /.box-footer-->
            </g:form>
        </div><!-- /.box --><!-- Serch box -->
    <!-- Serch box Finish-->
        <div class="row">
            <div class="col-xs-12">
                <div class="box box-primary">

                    <div class="box-body table-responsive no-padding">
                        <table class="table table-hover">
                            <thead>
                            <tr>

                                <g:sortableColumn style="text-align: left;" property="code"
                                                  title="${message(code: 'vrApplicationInfo.code.label', default: 'Application Identification No')}"/>

                                <th style="text-align: left;"><g:message code="vrApplicationInfo.enterprise.label"
                                               default="Enterprise Name"/></th>

                                <g:sortableColumn style="text-align: left;" property="visaCategory"
                                                  title="${message(code: 'vrApplicationInfo.visaCategory.label', default: 'Visa Category')}"/>

                                <th style="text-align: left;"><g:message code="vrApplicationInfo.applicantName.label"
                                                                         default="Applicant Name"/></th>

                                <th style="text-align: left;"><g:message code="vrApplicationInfo.currentStatus.label"
                                                                         default="Current Status"/></th>
                                %{--<th style="text-align: left;"><g:message code="vrApplicationInfo.previousStatus.label"
                                               default="Previous Status"/></th>--}%

                                <th style="text-align: left;"><g:message code="vrApplicationInfo.submitDate.label" default="Submit Date"/></th>

                                <th style="text-align: left;"><g:message code="vrApplicationInfo.modifiedDate.label2"
                                               default="Last Process Date"/></th>

                                <th style="text-align: left;">Actions</th>
                            </tr>
                            </thead>
                            <tbody>
                           <g:if test="${vrApplicationInfoInstanceList}">
                            <g:each in="${vrApplicationInfoInstanceList}" status="i" var="vrApplicationInfoInstance">
                                <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                                    <td><g:link action="show"
                                                id="${vrApplicationInfoInstance?.id}">${fieldValue(bean: vrApplicationInfoInstance, field: "code")}</g:link></td>

                                    <td>${fieldValue(bean: vrApplicationInfoInstance, field: "enterprise")}</td>

                                    <td>${fieldValue(bean: vrApplicationInfoInstance, field: "visaCategory")}</td>

                                    <td>${vrApplicationInfoInstance?.visaCategory?.keyword=="VISA_CATEGORY_FPI" || vrApplicationInfoInstance?.visaCategory?.keyword=="VISA_CATEGORY_FE"?vrApplicationInfoInstance?.nameOfForFamMember:vrApplicationInfoInstance?.nameOfForeigner}</td>

                                    <td>${fieldValue(bean: vrApplicationInfoInstance, field: "currentStatus")}</td>
                                    %{--<td>${fieldValue(bean: vrApplicationInfoInstance, field: "previousStatus")}</td>--}%

                                    <td><g:formatDate date="${vrApplicationInfoInstance?.submitDate}"
                                                      format="${grailsApplication.config.grails.date.format}"></g:formatDate></td>

                                    <td><g:formatDate date="${vrApplicationInfoInstance?.modifiedDate}"
                                                      format="${grailsApplication.config.grails.date.format}"></g:formatDate></td>

                                    <td>
                                        <div class="list-action">

                                           <sec:access url="/vrApplicationInfo/process/${vrApplicationInfoInstance?.id}">
                                            <g:link action="openProcessingForm" id="${vrApplicationInfoInstance?.id}" title="Process" alt="Process">
                                                <i class="fa fa-user-plus"></i>
                                                Process
                                            </g:link>
                                           </sec:access>

                                        </div>
                                    </td>

                                </tr>
                            </g:each>
                           </g:if>
                            <g:else>
                                <tr class="odd" >
                                    <td style="text-align: center" colspan="8">
                                        <label style="font-weight: bold;color: red;text-align: center;">There is no application in your desk.</label>
                                    </td>
                                </tr>
                            </g:else>
                            </tbody>
                        </table>
                    </div><!-- /.box-body -->
                </div><!-- /.box -->
            </div>
        </div>

        <div class="row">
            <div class="col-xs-12">
                <div class="pagination pull-right" id="pagination">
                    <g:paginate total="${vrApplicationInfoInstanceTotal ?: 0}" params="${params}"/>
                </div>
            </div>
        </div>
        %{--<div class="pagination">
            <g:paginate total="${vrApplicationInfoInstanceCount ?: 0}" />
        </div>--}%
        %{--</div>--}%
    </section>
</div>

<script type="text/javascript">
    $(document).ready(function () {

        $('.datePick').datepicker({format: "${grailsApplication.config.grails.date.formatUI}", autoclose: true});

    });

</script>

</body>
</html>


