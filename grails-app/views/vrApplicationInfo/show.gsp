<%@ page import="com.bepza.vr.VrApplicationInfo" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/html">
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'vrApplicationInfo.label', default: 'Import Permit')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">

    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            VISA Application Information
        </h1>
        <ul class="top-links">
            <li><g:link class="btn btn-block btn-primary btn-xs" action="list"><i
                    class="fa fa-reorder"></i>list</g:link></li>
            <sec:access url="/vrApplicationInfo/add">
                <g:if test="${currentServerMemberRole == 'ROLE_VR_MAKER'}">
                    <g:link class="btn btn-block btn-primary btn-xs" action="add">
                        <i class="fa fa-plus"></i>New Application</g:link>
                </g:if>
            </sec:access>
        %{--<g:if test="${vrApplicationInfoInstance?.isSaveAsDraft}">--}%
            <sec:access
                    url="/vrApplicationInfo/edit/${vrApplicationInfoInstance?.id}">%{--approvalEnterpriseGroup--}%
                <li><g:link class="btn btn-block btn-warning btn-xs" action="edit"
                            id="${vrApplicationInfoInstance?.id}"><i
                            class="fa fa-fw fa-edit"></i>Edit</g:link></li>
            </sec:access>
        %{--</g:if>--}%
            <g:if test="${vrApplicationInfoInstance?.isSaveAsDraft}">
                <sec:access url="/vrApplicationInfo/delete/${vrApplicationInfoInstance?.id}">
                    <li><g:link class="btn btn-block btn-danger btn-xs" action="delete"
                                id="${vrApplicationInfoInstance?.id}"
                                onclick="return confirm('Are you sure you want to delete this record?');"><i
                                class="fa fa-trash"></i>Delete</g:link></li>
                </sec:access>
            </g:if>
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

        <div class="box box-primary">
            <div class="box-body">
                <g:if test="${vrApplicationInfoInstance?.currentStatus?.keyword == 'REGRET'}">
                    <fieldset>
                        <legend class="text-yellow">
                            <g:message code="vrApplicationInfo.regretReason.label" default="Regret Reason"/>
                        </legend>

                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group ${hasErrors(bean: vrApplicationInfoInstance, field: 'currentStatus', 'has-error')}">
                                    <label><g:message code="vrApplicationInfo.currentStatus.label"
                                                      default="Current Status"/> :</label>
                                    <label style="color:red;  font-weight: bold;">${vrApplicationInfoInstance?.currentStatus}</label>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group ${hasErrors(bean: vrApplicationInfoInstance, field: 'remarks', 'has-error')}">
                                    <label><g:message code="vrApplicationInfo.remarks.label"
                                                      default="Remarks"/> :</label>
                                    <label style="color:red;  font-weight: bold;">${vrApplicationInfoInstance?.remarks}</label>
                                </div>
                            </div>
                        </div>
                    </fieldset>
                </g:if>

                <fieldset>
                    <legend class="text-yellow">
                        <g:message code="vrApplicationInfo.generalInformation.label" default="General Information"/>
                    </legend>

                    <div class="row">
                        <div class="col-md-4">
                            <div class="form-group ${hasErrors(bean: vrApplicationInfoInstance, field: 'enterprise', 'has-error')}">
                                <label><g:message code="vrApplicationInfo.enterprise.label"
                                                  default="Enterprise"/> :</label>
                                ${vrApplicationInfoInstance?.enterprise?.entrprsName}
                            </div>
                        </div>

                        <div class="col-md-4">
                            <div class="form-group ${hasErrors(bean: vrApplicationInfoInstance, field: 'enterprise', 'has-error')}">
                                <label><g:message code="cpEntrprsMst.allLookupBusinessTypeId.label2"
                                                  default="Type of Enterprise"/> :</label>
                                ${vrApplicationInfoInstance?.enterprise?.allLookupBusinessTypeId?.title}
                            </div>
                        </div>

                        <div class="col-md-4">
                            <div class="form-group ${hasErrors(bean: vrApplicationInfoInstance, field: 'enterprise', 'has-error')}">
                                <label><g:message code="cpEntrprsMst.zoneId.label" default="Zone"/> :</label>
                                ${vrApplicationInfoInstance?.enterprise?.zoneId?.name}
                            </div>
                        </div>
                    </div>

                </fieldset>

                <div class="box box-info">
                    <div class="box-body">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group ${hasErrors(bean: vrApplicationInfoInstance, field: 'code', 'has-error')}">
                                    <label><g:message code="vrApplicationInfo.code.label"
                                                      default="Application Identification No"/> :</label>
                                    ${vrApplicationInfoInstance?.code}
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="form-group ${hasErrors(bean: vrApplicationInfoInstance, field: 'enterprise', 'has-error')}">
                                    <label><g:message code="vrApplicationInfo.visaCategory.label"
                                                      default="Visa Category"/> :</label>
                                    ${vrApplicationInfoInstance?.visaCategory?.title}
                                </div>
                            </div>
                        </div>
                    </div><!-- /.box-body -->
                </div><!-- /.box -->

                <fieldset>
                    <g:if test="${vrApplicationInfoInstance?.visaCategory?.keyword == 'VISA_CATEGORY_OTHERS'}">
                        <legend class="text-yellow">
                            <g:message code="vrApplicationInfo.vrApplicant.label"
                                       default="Particulars of the Expatriate for whom the Employment is required"/>
                        </legend>
                    </g:if>
                    <g:elseif
                            test="${vrApplicationInfoInstance?.visaCategory?.keyword == 'VISA_CATEGORY_FPI' || vrApplicationInfoInstance?.visaCategory?.keyword == 'VISA_CATEGORY_FE'}">
                        <legend class="text-yellow">
                            <g:message code="vrApplicationInfo.vrApplicant.label2"
                                       default="Particulars of the Applicant"/>
                        </legend>
                    </g:elseif>
                    <g:elseif
                            test="${vrApplicationInfoInstance?.visaCategory?.keyword == 'VISA_CATEGORY_E' || vrApplicationInfoInstance?.visaCategory?.keyword == 'VISA_CATEGORY_ET' || vrApplicationInfoInstance?.visaCategory?.keyword == 'VISA_CATEGORY_PI' || vrApplicationInfoInstance?.visaCategory?.keyword == 'VISA_CATEGORY_B'}">
                        <legend class="text-yellow">
                            <g:message code="vrApplicationInfo.vrApplicant.label"
                                       default="Particulars of the Expatriate for whom the Employment is required"/>
                        </legend>
                    </g:elseif>
                    <g:else>
                        <legend class="text-yellow">
                            <g:message code="vrApplicationInfo.vrApplicant.label2"
                                       default="Particulars of the Applicant"/>
                        </legend>
                    </g:else>

                <g:if
                        test="${vrApplicationInfoInstance?.visaCategory?.keyword == 'VISA_CATEGORY_FPI' || vrApplicationInfoInstance?.visaCategory?.keyword == 'VISA_CATEGORY_FE'}">
                    <div class="box box-info">
                        <div class="box-body">
                            <div class="row">
                                <div class="col-md-12">
                                    <table class="table table-bordered">
                                        <tr>
                                            <th><g:message code="vrApplicationInfo.foreignerRefNo.label" default="Foreigner Ref. No."/> :</th>
                                            <td>${vrApplicationInfoInstance?.foreignerRefNo}</td>
                                            <th><g:message code="vrApplicationInfo.nameOfForeigner.label" default="Name of Foreigner"/> :</th>
                                            <td>${vrApplicationInfoInstance?.nameOfForeigner}</td>
                                            <th><g:message code="vrApplicationInfo.foreignerSummary.label" default="Foreigner Summary"/>:</th>
                                            <td>${vrApplicationInfoInstance?.foreignerSummary}</td>
                                        </tr>
                                        <tr>
                                            <th><g:message code="vrApplicationInfo.nameOfForFamMember.label"
                                                           default="Name of Person"/> :</th>
                                            <td>${vrApplicationInfoInstance?.nameOfForFamMember}</td>
                                            <th><g:message code="vrApplicationInfo.designation.label"
                                                           default="Designation"/> :</th>
                                            <td>${vrApplicationInfoInstance?.designation?.designationName}</td>
                                            <th><g:message code="vrApplicationInfo.nationality.label"
                                                           default="Nationality"/>:</th>
                                            <td>${vrApplicationInfoInstance?.nationality?.title}</td>
                                        </tr>
                                        <tr>
                                            <th><g:message code="vrApplicationInfo.dateOfBirth.label"
                                                           default="Date of Birth"/>:</th>
                                            <td><g:formatDate date="${vrApplicationInfoInstance?.dateOfBirth}"
                                                              format="${grailsApplication.config.grails.date.format}"></g:formatDate></td>
                                            <th><g:message code="vrApplicationInfo.passportNo.label"
                                                           default="Passport No"/>:</th>
                                            <td>${vrApplicationInfoInstance?.passportNo}</td>
                                            <th><g:message code="vrApplicationInfo.passportIssueDate.label"
                                                           default="Passport Issue Date"/>:</th>
                                            <td><g:formatDate date="${vrApplicationInfoInstance?.passportIssueDate}"
                                                              format="${grailsApplication.config.grails.date.format}"></g:formatDate></td>
                                        </tr>
                                        <tr>
                                            <th><g:message code="vrApplicationInfo.passportExpireDate.label"
                                                           default="Passport Expire Date"/>:</th>
                                            <td><g:formatDate date="${vrApplicationInfoInstance?.passportExpireDate}"
                                                              format="${grailsApplication.config.grails.date.format}"></g:formatDate></td>
                                            <th><g:message code="vrApplicationInfo.relation.label" default="Relation with the Foreigner"/></th>
                                            <td>${vrApplicationInfoInstance?.relation}</td>
                                            <th><g:message code="vrApplicationInfo.purpose.label"
                                                           default="Purpose"/>:</th>
                                            <td>${vrApplicationInfoInstance?.purpose}</td>

                                        </tr>
                                    </table>
                                </div>
                            </div>
                        </div><!-- /.box-body -->
                    </div><!-- /.box -->
                </g:if>
                <g:else>
                    <div class="box box-info">
                        <div class="box-body">
                            <div class="row">
                                <div class="col-md-12">
                                    <table class="table table-bordered">
                                        <tr>
                                            <th><g:message code="vrApplicationInfo.nameOfForeigner.label"
                                                           default="Name of Foreigner"/> :</th>
                                            <td>${vrApplicationInfoInstance?.nameOfForeigner}</td>
                                            <th><g:message code="vrApplicationInfo.designation.label"
                                                           default="Designation"/> :</th>
                                            <td>${vrApplicationInfoInstance?.designation?.designationName}</td>
                                            <th><g:message code="vrApplicationInfo.nationality.label"
                                                           default="Nationality"/>:</th>
                                            <td>${vrApplicationInfoInstance?.nationality?.title}</td>
                                        </tr>
                                        <tr>
                                            <th><g:message code="vrApplicationInfo.dateOfBirth.label"
                                                           default="Date of Birth"/>:</th>
                                            <td><g:formatDate date="${vrApplicationInfoInstance?.dateOfBirth}"
                                                              format="${grailsApplication.config.grails.date.format}"></g:formatDate></td>
                                            <th><g:message code="vrApplicationInfo.passportNo.label"
                                                           default="Passport No"/>:</th>
                                            <td>${vrApplicationInfoInstance?.passportNo}</td>
                                            <th><g:message code="vrApplicationInfo.passportIssueDate.label"
                                                           default="Passport Issue Date"/>:</th>
                                            <td><g:formatDate date="${vrApplicationInfoInstance?.passportIssueDate}"
                                                              format="${grailsApplication.config.grails.date.format}"></g:formatDate></td>
                                        </tr>
                                        <tr>
                                            <th><g:message code="vrApplicationInfo.passportExpireDate.label"
                                                           default="Passport Expire Date"/>:</th>
                                            <td><g:formatDate date="${vrApplicationInfoInstance?.passportExpireDate}"
                                                              format="${grailsApplication.config.grails.date.format}"></g:formatDate></td>
                                            <th><g:message code="vrApplicationInfo.purpose.label"
                                                           default="Purpose"/>:</th>
                                            <td>${vrApplicationInfoInstance?.purpose}</td>
                                            <th></th>
                                            <td></td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                        </div><!-- /.box-body -->
                    </div><!-- /.box -->
                </g:else>

                </fieldset>
                <fieldset><legend class="text-yellow">Supporting Documents</legend>
                    <g:if test="${vrRequiredDocList}">
                        <div class="box box-info">
                            <div class="box-body">
                                <div class="row">
                                    <div class="col-md-12">
                                        <table class="table table-condensed">
                                            <tr>
                                                <th style="width: 10px">#</th>
                                                <th>Supporting Documents Type</th>
                                                <th>Documents Name</th>
                                                <th>Attached Documents</th>
                                            </tr>
                                        %{--<g:each in="${vrApplicationInfoInstance?.vrRequiredDoc.sort{it?.docType?.docTypeName}}" status="i" var="vrRequiredDoc">--}%
                                            <g:each in="${vrRequiredDocList}" status="i" var="vrRequiredDoc">
                                                <tr>
                                                    <td>
                                                        ${i + 1}
                                                    </td>
                                                    <td>${vrRequiredDocList[i]?.docType?.encodeAsHTML()}</td>
                                                    <td>${vrRequiredDocList[i]?.userGivenDocName}</td>
                                                    <td>
                                                        <g:link target="_blank" url="${vrRequiredDocList[i]?.docUrl}"
                                                                title="Click Here To See The Document">
                                                            <i class="fa fa-fw fa-file-pdf-o"></i>
                                                        </g:link>
                                                    </td>
                                                </tr>
                                            </g:each>
                                        </table>
                                    </div>
                                </div>
                            </div><!-- /.box-body -->
                        </div><!-- /.box -->

                    </g:if>
                </fieldset>
                <g:if test="${vrApplicationInfoInstance?.currentStatus?.keyword != 'REGRET'}">
                    <fieldset>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group ${hasErrors(bean: vrApplicationInfoInstance, field: 'currentStatus', 'has-error')}">
                                    <label><g:message code="vrApplicationInfo.currentStatus.label"
                                                      default="Current Status"/> :</label>
                                    ${vrApplicationInfoInstance?.currentStatus}
                                </div>
                            </div>

                            <div class="col-md-12">
                                <div class="form-group ${hasErrors(bean: vrApplicationInfoInstance, field: 'remarks', 'has-error')}">
                                    <label><g:message code="vrApplicationInfo.remarks2.label"
                                                      default="Remarks"/> :</label>
                                    ${vrApplicationInfoInstance?.remarks}
                                </div>
                            </div>
                        </div>
                    </fieldset>
                </g:if>
            </div><!-- /.box-body -->
        </div><!-- /.box -->

    </section><!-- /.content -->
</div><!-- /.content-wrapper -->

</body>
</html>

