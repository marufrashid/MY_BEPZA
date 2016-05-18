%{--<%@ page import="com.bepza.cp.CpEntrprsMst" %>--}%
<%@ page import="com.bepza.vr.VrApplicationInfo" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName"
           value="${message(code: 'vrApplicationInfo.processingForm.label', default: 'Company Permission Application Processing')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">

    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            <g:message code="default.list.label" args="[entityName]"/>
        </h1>
        <ul class="top-links">
            <li><g:link class="btn btn-block btn-primary btn-xs" action="processingList"><i
                    class="fa fa-reorder"></i>Go to My Desk</g:link></li>
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

            <div class="box box-danger">
                <div class="box-body">
                <g:form id="vrApplicationInfoFrmProcess" url="[resource: vrApplicationInfoInstance, action: 'process']">
                    <g:hiddenField name="id" value="${vrApplicationInfoInstance?.id}"></g:hiddenField>
                    <div class="row">
                        <div class="col-md-12">

                            <div class="col-md-2">
                                <div class="form-group">
                                    <label class="required"><g:message code="vrApplicationInfo.applyStatus.label"
                                                                       default="Apply Status"/></label>
                                    <g:select id="applyStatus" name="statusKey" from="${applyStatusList}"
                                              optionKey="keyword" value="${params?.statusKey}" required=""
                                              noSelection="['': '--Select--']"
                                              class="form-control"/>
                                </div><!-- /.form-group -->
                            </div><!-- /.col -->

                            <div class="col-md-2">
                                <div class="form-group">
                                    <label><g:message code="vrApplicationInfo.submitToGroupId.label"
                                                      default="Send to Desk"/></label>
                                    <g:select id="submitToGroup" name="submitToGroupId" from="${submitToGroupList}"
                                              optionKey="id" value="${params?.submitToGroupId}"
                                              class="form-control"/>
                                </div><!-- /.form-group -->
                            </div><!-- /.col -->

                            <div class="col-md-3">
                                <div class="form-group">
                                    <label><g:message code="vrApplicationInfo.submitToMemberId.label"
                                                      default="Send to Authorized Officer"/></label>
                                    <g:select id="submitToMember" name="submitToMemberId" from="${submitToMemberList}"
                                              optionKey="id" value="${params?.submitToMemberId}"
                                              noSelection="['': '--Select--']"
                                              class="form-control"/>
                                </div><!-- /.form-group -->
                            </div><!-- /.col -->

                            <div class="col-md-3">
                                <div class="form-group">
                                    <label><g:message code="vrApplicationInfo.remarks.label"
                                                      default="Remarks"/></label>
                                    <g:textField name="remarks" id="remarks"
                                                 value="${params?.remarks ?: 'OK'}" class="form-control"/>
                                </div><!-- /.form-group -->
                            </div><!-- /.col -->

                            <div class="col-md-2">
                                <div class="form-group">
                                    <label style="color: white;">Process</label>
                                    <button style="margin-top: 1%;" type="submit" name="submit"
                                            class="btn btn-primary pull-right"><i
                                            class="fa fa-save"></i>Process Application
                                    </button>
                                </div>
                            </div><!-- /.col -->
                        </div>
                    </div>

                    <div class="row" id="regretReasons"
                         style="${params?.statusKey == 'REGRET' ? 'display: block;' : 'display: none;'}">
                        <div class="col-md-12">
                            <div class="col-md-5">
                                <h4 class="box-header with-border text-bold text-blue">Regret reasons</h4>

                                <div class="form-group">
                                    <g:each in="${regretReasonList}" status="i" var="regretReason">
                                        <div class="radio">
                                            <label>
                                                <g:checkBox name="regretReasonKey"
                                                            value="${regretReason?.keyword}" checked="false"
                                                            class="regretReasons"></g:checkBox>
                                                ${regretReason?.title}
                                            </label>
                                        </div>
                                    </g:each>
                                </div>

                                <div class="form-group" id="otherReasonDiv">
                                    <label>If any other reason, please specify</label>

                                    <g:textArea name="otherReason"
                                                id="otherReason"
                                                rows="2"
                                                class="form-control input-sm"></g:textArea>
                                </div>
                            </div>
                        </div>
                    </div>
                </g:form>

                    <!-- Start Information -->
                    <div class="box box-primary">
                        <div class="box-body">

                            <fieldset><legend class="text-yellow">General Information</legend>

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
                                            <label><g:message code="cpEntrprsMst.zoneId.label"
                                                              default="Zone"/> :</label>
                                            ${vrApplicationInfoInstance?.enterprise?.zoneId?.name}
                                        </div>
                                    </div>
                                </div>

                            </fieldset>

                            <div class="box box-info">
                                <div class="box-body">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group ${hasErrors(bean: vrApplicationInfoInstance, field: 'enterprise', 'has-error')}">
                                                <label><g:message code="vrApplicationInfo.visaCategory.label"
                                                                  default="Visa Category"/> :</label>
                                                ${vrApplicationInfoInstance?.visaCategory?.title}
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group ${hasErrors(bean: vrApplicationInfoInstance, field: 'code', 'has-error')}">
                                                <label><g:message code="vrApplicationInfo.code.label"
                                                                  default="Application Identification No"/> :</label>
                                                ${vrApplicationInfoInstance?.code}
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
                                                        <td><g:formatDate
                                                                date="${vrApplicationInfoInstance?.dateOfBirth}"
                                                                format="${grailsApplication.config.grails.date.format}"></g:formatDate></td>
                                                        <th><g:message code="vrApplicationInfo.passportNo.label"
                                                                       default="Passport No"/>:</th>
                                                        <td>${vrApplicationInfoInstance?.passportNo}</td>
                                                        <th><g:message code="vrApplicationInfo.passportIssueDate.label"
                                                                       default="Passport Issue Date"/>:</th>
                                                        <td><g:formatDate
                                                                date="${vrApplicationInfoInstance?.passportIssueDate}"
                                                                format="${grailsApplication.config.grails.date.format}"></g:formatDate></td>
                                                    </tr>
                                                    <tr>
                                                        <th><g:message code="vrApplicationInfo.passportExpireDate.label"
                                                                       default="Passport Expire Date"/>:</th>
                                                        <td><g:formatDate
                                                                date="${vrApplicationInfoInstance?.passportExpireDate}"
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
                                                        <g:each in="${vrRequiredDocList}" status="i"
                                                                var="vrRequiredDoc">
                                                            <tr>
                                                                <td>
                                                                    ${i + 1}
                                                                </td>
                                                                <td>${vrRequiredDocList[i]?.docType?.encodeAsHTML()}</td>
                                                                <td>${vrRequiredDocList[i]?.userGivenDocName}</td>
                                                                <td>
                                                                    <g:link target="_blank"
                                                                            url="${vrRequiredDocList[i]?.docUrl}"
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

                            <div class="box box-primary">
                                <div class="box-body">

                                    <g:if test="${approvalHistoryList}">
                                        <fieldset><legend class="text-yellow"><g:message
                                                code="cpEntrprsMst.applicationProcessHistoryLbl.label"
                                                default="Application Process History"/></legend>

                                            <div class="box box-info">
                                                <div class="box-body">
                                                    <div class="row">
                                                        <div class="col-md-12">
                                                            <table class="table table-hover">
                                                                <thead>
                                                                <tr>
                                                                    <th>#</th>
                                                                    <th>On Desk</th>
                                                                    <th>Processed By</th>
                                                                    <th>Status</th>
                                                                    <th>Process Time</th>
                                                                    <th>Remarks</th>
                                                                </tr>
                                                                </thead>
                                                                <tbody>
                                                                <g:each in="${approvalHistoryList}" status="i"
                                                                        var="approvalHistory">
                                                                    <tr>
                                                                        <td>${i + 1}</td>
                                                                        <td>${approvalHistory?.approvalGroup}</td>
                                                                        <td>${approvalHistory?.approvalGroupMember?.fullName}</td>
                                                                        <td>${approvalHistory?.approvalStatus}</td>
                                                                        <td><g:formatDate
                                                                                date="${approvalHistory?.actionDate}"
                                                                                format="${grailsApplication.config.grails.dateTime.format}"></g:formatDate></td>
                                                                        <td>${approvalHistory?.remarks}</td>
                                                                    </tr>
                                                                </g:each>
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                    </div>
                                                </div><!-- /.box-body -->
                                            </div><!-- /.box -->
                                        </fieldset>
                                    </g:if>

                                </div><!-- /.box-body -->
                            </div>

                        </div><!-- /.box-body -->
                    </div><!-- /.box -->

                    <g:form id="vrApplicationInfoFrmProcess" url="[resource: vrApplicationInfoInstance, action: 'process']">
                        <g:hiddenField name="id" value="${vrApplicationInfoInstance?.id}"></g:hiddenField>
                        <div class="row">
                            <div class="col-md-12">

                                <div class="col-md-2">
                                    <div class="form-group">
                                        <label class="required"><g:message code="vrApplicationInfo.applyStatus.label"
                                                                           default="Apply Status"/></label>
                                        <g:select id="applyStatus2" name="statusKey" from="${applyStatusList}"
                                                  optionKey="keyword" value="${params?.statusKey}" required=""
                                                  noSelection="['': '--Select--']"
                                                  class="form-control"/>
                                    </div><!-- /.form-group -->
                                </div><!-- /.col -->

                                <div class="col-md-2">
                                    <div class="form-group">
                                        <label><g:message code="vrApplicationInfo.submitToGroupId.label"
                                                          default="Send to Desk"/></label>
                                        <g:select id="submitToGroup2" name="submitToGroupId" from="${submitToGroupList}"
                                                  optionKey="id" value="${params?.submitToGroupId}"
                                                  class="form-control"/>
                                    </div><!-- /.form-group -->
                                </div><!-- /.col -->

                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label><g:message code="vrApplicationInfo.submitToMemberId.label"
                                                          default="Send to Authorized Officer"/></label>
                                        <g:select id="submitToMember2" name="submitToMemberId" from="${submitToMemberList}"
                                                  optionKey="id" value="${params?.submitToMemberId}"
                                                  noSelection="['': '--Select--']"
                                                  class="form-control"/>
                                    </div><!-- /.form-group -->
                                </div><!-- /.col -->

                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label><g:message code="vrApplicationInfo.remarks.label"
                                                          default="Remarks"/></label>
                                        <g:textField name="remarks" id="remarks2"
                                                     value="${params?.remarks ?: 'OK'}" class="form-control"/>
                                    </div><!-- /.form-group -->
                                </div><!-- /.col -->

                                <div class="col-md-2">
                                    <div class="form-group">
                                        <label style="color: white;">Process</label>
                                        <button style="margin-top: 1%;" type="submit" name="submit2"
                                                class="btn btn-primary pull-right"><i
                                                class="fa fa-save"></i>Process Application
                                        </button>
                                    </div>
                                </div><!-- /.col -->
                            </div>
                        </div>

                        <div class="row" id="regretReasons2"
                             style="${params?.statusKey == 'REGRET' ? 'display: block;' : 'display: none;'}">
                            <div class="col-md-12">
                                <div class="col-md-5">
                                    <h4 class="box-header with-border text-bold text-blue">Regret reasons</h4>

                                    <div class="form-group">
                                        <g:each in="${regretReasonList}" status="i" var="regretReason">
                                            <div class="radio">
                                                <label>
                                                    <g:checkBox name="regretReasonKey"
                                                                value="${regretReason?.keyword}" checked="false"
                                                                class="regretReasons"></g:checkBox>
                                                    ${regretReason?.title}
                                                </label>
                                            </div>
                                        </g:each>
                                    </div>

                                    <div class="form-group" id="otherReasonDiv2">
                                        <label>If any other reason, please specify</label>

                                        <g:textArea name="otherReason"
                                                    id="otherReason"
                                                    rows="2"
                                                    class="form-control input-sm"></g:textArea>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </g:form>

                <!-- End Information-->
                </div><!-- /.box-body -->
            </div><!-- /.box -->

    </section><!-- /.content -->
</div><!-- /.content-wrapper -->

<script type="text/javascript">
    $(document).ready(function () {

        $("#applyStatus").change(function () {
            var status = this.value;
            var currentServeGroupId = ${vrApplicationInfoInstance?.currentServeGroup?.id};
            if (status) {
                if (status == 'REGRET') {
                    $("#submitToGroup").attr("disabled", "disabled").html('<option value="">Select One</option>');
                    $("#submitToMember").attr("disabled", "disabled").html('<option value="">Select One</option>');
                    $("#remarks").attr("disabled", "disabled");
                    $("#regretReasons").show();
                    /*if ($('input[name="regretReasonKey"]').is(':checked')) {
                     $("button[name='submit']").removeAttr("disabled");
                     } else {
                     $("button[name='submit']").attr("disabled", "disabled");
                     }*/

                } else if (status == 'FORWARDED') {
                    $("#submitToGroup").attr("disabled", "disabled").html('<option value="">Select One</option>');
                    $("#submitToMember").attr("disabled", "disabled").html('<option value="">Select One</option>');
                    $("#remarks").removeAttr("disabled");
                    $("#regretReasons").hide();
                    $("button[name='submit']").removeAttr("disabled");
                } else if (status == 'DELEGATE') {
                    $("#submitToGroup").removeAttr("disabled");
                    $("#submitToMember").removeAttr("disabled");
                    $("#remarks").removeAttr("disabled");
                    //$("button[name='submit']").attr("disabled", "disabled");
                    $("#regretReasons").hide();
                    $.ajax({
                        url: "${request.contextPath}/commonAjax/getCurrentApprovalGroupDD",
                        data: "currentGroupId=" + currentServeGroupId,
                        success: function (data, textStatus, jqXHR) {
                            console.log(data);
                            $("#submitToGroup").html(data);
                            $("#submitToMember").html('<option value="">Select One</option>');
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            console.log(textStatus);
                            alert("Internal server error!");
                        }
                    });
                } else {
                    $("#submitToGroup").removeAttr("disabled");
                    $("#submitToMember").removeAttr("disabled");
                    $("#remarks").removeAttr("disabled");
                    $("button[name='submit']").removeAttr("disabled");
                    $("#regretReasons").hide();
                    $.ajax({
                        url: "${request.contextPath}/commonAjax/getNextApprovalGroupDD",
                        data: "currentGroupId=" + currentServeGroupId,
                        success: function (data, textStatus, jqXHR) {
                            console.log(data);
                            $("#submitToGroup").html(data);
                            $("#submitToMember").html('<option value="">Select One</option>');
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            console.log(textStatus);
                            alert("Internal server error!");
                        }
                    });
                }
            }
        });

        $("#applyStatus2").change(function () {
            var status = this.value;
            var currentServeGroupId = ${vrApplicationInfoInstance?.currentServeGroup?.id};
            if (status) {
                if (status == 'REGRET') {
                    $("#submitToGroup2").attr("disabled", "disabled").html('<option value="">Select One</option>');
                    $("#submitToMember2").attr("disabled", "disabled").html('<option value="">Select One</option>');
                    $("#remarks2").attr("disabled", "disabled");
                    $("#regretReasons2").show();
                    /*if ($('input[name="regretReasonKey"]').is(':checked')) {
                     $("button[name='submit']").removeAttr("disabled");
                     } else {
                     $("button[name='submit']").attr("disabled", "disabled");
                     }*/

                } else if (status == 'FORWARDED') {
                    $("#submitToGroup2").attr("disabled", "disabled").html('<option value="">Select One</option>');
                    $("#submitToMember2").attr("disabled", "disabled").html('<option value="">Select One</option>');
                    $("#remarks2").removeAttr("disabled");
                    $("#regretReasons2").hide();
                    $("button[name='submit2']").removeAttr("disabled");
                } else if (status == 'DELEGATE') {
                    $("#submitToGroup2").removeAttr("disabled");
                    $("#submitToMember2").removeAttr("disabled");
                    $("#remarks2").removeAttr("disabled");
                    //$("button[name='submit']").attr("disabled", "disabled");
                    $("#regretReasons2").hide();
                    $.ajax({
                        url: "${request.contextPath}/commonAjax/getCurrentApprovalGroupDD",
                        data: "currentGroupId=" + currentServeGroupId,
                        success: function (data, textStatus, jqXHR) {
                            console.log(data);
                            $("#submitToGroup2").html(data);
                            $("#submitToMember2").html('<option value="">Select One</option>');
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            console.log(textStatus);
                            alert("Internal server error!");
                        }
                    });
                } else {
                    $("#submitToGroup2").removeAttr("disabled");
                    $("#submitToMember2").removeAttr("disabled");
                    $("#remarks2").removeAttr("disabled");
                    $("button[name='submit2']").removeAttr("disabled");
                    $("#regretReasons2").hide();
                    $.ajax({
                        url: "${request.contextPath}/commonAjax/getNextApprovalGroupDD",
                        data: "currentGroupId=" + currentServeGroupId,
                        success: function (data, textStatus, jqXHR) {
                            console.log(data);
                            $("#submitToGroup2").html(data);
                            $("#submitToMember2").html('<option value="">Select One</option>');
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            console.log(textStatus);
                            alert("Internal server error!");
                        }
                    });
                }
            }
        });


        /*$("#applyStatus").change(function () {
            var status = this.value;
            var currentServeGroupId = ${vrApplicationInfoInstance?.currentServeGroup?.id};
            if (status) {
                if (status == 'REGRET') {
                    $.ajax({
                        url: "${request.contextPath}/commonAjax/getLowerGroupDD",
                        data: "currentGroupId=" + currentServeGroupId,
                        success: function (data, textStatus, jqXHR) {
                            console.log(data);
                            $("#submitToGroup").html(data);
                            $("#submitToMember").html('<option value="">--Select--</option>');
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            console.log(textStatus);
                            alert("Internal server error!");
                        }
                    });
                }
                else {
                    $("#submitToGroup").removeAttr("disabled");
                    $("#submitToMember").removeAttr("disabled");
                    $("#remarks").removeAttr("disabled");
                    $("button[name='submit']").removeAttr("disabled");
                    $("#regretReasons").hide();
                    $.ajax({
                        url: "${request.contextPath}/commonAjax/getNextApprovalGroupDD",
                        data: "currentGroupId=" + currentServeGroupId,
                        success: function (data, textStatus, jqXHR) {
                            console.log(data);
                            $("#submitToGroup").html(data);
                            $("#submitToMember").html('<option value="">--Select--</option>');
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            console.log(textStatus);
                            alert("Internal server error!");
                        }
                    });
                }
            }
        });*/

        $("input:radio[name='regretReasonKey']").click(function () {
            $("button[name='submit']").removeAttr("disabled");
            var regretReasonKey = $("input[name='regretReasonKey']:checked").val();
            if (regretReasonKey == 'OTHERS') {
                $("#otherReasonDiv").show();
            } else {
                $("#otherReasonDiv").hide();
            }
        });

        $("#submitToGroup").change(function () {
            var groupId = this.value;
            //alert(groupId); return;
            if (groupId) {
                $.ajax({
                    url: "${request.contextPath}/commonAjax/getApprovalGroupMemberDD",
                    data: "groupId=" + groupId,
                    success: function (data, textStatus, jqXHR) {
                        console.log(data);
                        $("#submitToMember").html(data);
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        console.log(textStatus);
                        alert("Internal server error!");
                    }
                });
            } else {
                $("#submitToMember").html('<option value="">--Select--</option>');
            }
        });



        $("#zoneId").change(function () {
            var zoneId = $(this).val();
            var allottedPlotId = $("#allottedPlotId").val();
            var unallottedPlotId = $("#unallottedPlotId").val();
            var actionName = $("#actionName").val();
            var methodName = "";
            if (actionName == "create") {
                methodName = "getAllActiveUnAllotedPlotByZoneIdDDForCreate"
            } else {
                methodName = "getAllActiveUnAllotedPlotByZoneIdDD"
            }

            // alert(allottedPlotId+"-- "+unallottedPlotId);
            $.ajax({
                url: "${request.contextPath}/commonAjax/" + methodName,
                data: "zoneId=" + zoneId + "&allottedPlotId=" + allottedPlotId + "&unallottedPlotId=" + unallottedPlotId,
                success: function (data, textStatus, jqXHR) {
                    console.log(data);
                    $("#psaPlotId").html(data);
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    console.log(textStatus);
                }
            });
        });
        $("#zoneId").change(function () {
            var zoneId = $(this).val();
            var allottedSfbId = $("#allottedSfbId").val();
            var unallottedSfbId = $("#unallottedSfbId").val();
            var actionName = $("#actionName").val();
            var methodName = "";
            if (actionName == "create") {
                methodName = "getAllActiveUnAllotedSfbByZoneIdDDForCreate"
            } else {
                methodName = "getAllActiveUnAllotedSfbByZoneIdDD"
            }
            $.ajax({
                url: "${request.contextPath}/commonAjax/" + methodName,
                data: "zoneId=" + zoneId + "&allottedSfbId=" + allottedSfbId + "&unallottedSfbId=" + unallottedSfbId,
                success: function (data, textStatus, jqXHR) {
                    console.log(data);
                    $("#psaSfbId").html(data);
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    console.log(textStatus);
                }
            });
        });


    });

    function getTtlPlotArea(fld1Id, fld2Id) {//getTtlPlotArea('psaPlotId','landAreaByVerifier')
        var fld1Val = document.getElementById(fld1Id).value;
        document.getElementById(fld2Id).value = fld1Val;
        var fld = document.getElementById(fld1Id);
        var values = [];
        for (var i = 0; i < fld.options.length; i++) {
            if (fld.options[i].selected) {
                values.push(fld.options[i].value);
            }
        }
        alert(values);
        document.getElementById(fld2Id).value = values;
    }









</script>

</body>
</html>
