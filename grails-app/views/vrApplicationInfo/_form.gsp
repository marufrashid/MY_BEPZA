<%@ page import="com.bepza.vr.VrApplicationInfo" %>
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
                ${userEnterprise?.entrprsName}
            </div>
        </div>

        <div class="col-md-4">
            <div class="form-group ${hasErrors(bean: vrApplicationInfoInstance, field: 'enterprise', 'has-error')}">
                <label><g:message code="cpEntrprsMst.allLookupBusinessTypeId.label2"
                                  default="Type of Enterprise"/> :</label>
                ${userEnterprise?.allLookupBusinessTypeId?.title}
            </div>
        </div>

        <div class="col-md-4">
            <div class="form-group ${hasErrors(bean: vrApplicationInfoInstance, field: 'enterprise', 'has-error')}">
                <label><g:message code="cpEntrprsMst.zoneId.label" default="Zone"/> :</label>
                ${userEnterprise?.zoneId?.name}
            </div>
        </div>
    </div>

</fieldset>

<div class="row">

    <div class="col-md-4">
        <div class="form-group ${hasErrors(bean: vrApplicationInfoInstance, field: 'visaCategory', 'has-error')}">
            <label class="required">
                <g:message code="vrApplicationInfo.visaCategory.label" default="Visa Category"/>
            </label>
            <g:select id="visaCategory" name="visaCategory.id"
                      from="${visaCategoryList}" onchange="showHideDivByVisaCategory('visaCategory');"
                      optionKey="keyword" noSelection="['': '--Select--']"
                      value="${vrApplicationInfoInstance?.visaCategory?.keyword}"
                      class="form-control input-sm"/>
            <g:renderErrors bean="${vrApplicationInfoInstance}" field="visaCategory"/>
        </div>
    </div>

</div>
<g:if test="${vrApplicationInfoInstance?.code}">
    <div class="row">
        <div class="col-md-4">
            <div class="form-group ${hasErrors(bean: vrApplicationInfoInstance, field: 'code', 'has-error')}">
                <label>
                    <g:message code="vrApplicationInfo.code.label" default="Application Identification No"/> :
                </label>
                ${vrApplicationInfoInstance?.code}
            </div>
        </div>
    </div>
</g:if>
<div id="div1" style="display: none">
    <g:form url="${request.queryString ? request.forwardURI + '?' + request.queryString : request.forwardURI}"
            enctype="multipart/form-data" id="div1Form" method="post">
        <fieldset><legend class="text-yellow"><g:message code="vrApplicationInfo.vrApplicant.label"
                                                         default="Particulars of the Expatriate for whom the Employment is required"/></legend>
            <g:hiddenField name="id" value="${vrApplicationInfoInstance?.id}"></g:hiddenField>
            <g:hiddenField name="visaCategory" id="visaCategoryDiv1"
                           value="${vrApplicationInfoInstance?.visaCategory?.id}"></g:hiddenField>
            <g:hiddenField name="enterprise" id="enterprise" value="${userEnterprise?.id}"></g:hiddenField>
            <g:hiddenField name="statusKey" id="statusKey"
                           value="${vrApplicationInfoInstance?.currentStatus?.keyword}"></g:hiddenField>
            <g:hiddenField name="actionType" id="actionType" value=""></g:hiddenField>
            <div class="row">
                <div class="col-md-4">
                    <div class="form-group ${hasErrors(bean: vrApplicationInfoInstance, field: 'nameOfForeigner', 'has-error')}">
                        <label class="required">
                            <g:message code="vrApplicationInfo.nameOfForeigner.label" default="Name of Foreigner"/>
                        </label>
                        <g:textField name="nameOfForeigner" id="nameOfForeigner"
                                     value="${vrApplicationInfoInstance?.nameOfForeigner}" required="required"
                                     class="form-control input-sm"/>
                        <g:renderErrors bean="${vrApplicationInfoInstance}" field="nameOfForeigner"/>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="form-group ${hasErrors(bean: vrApplicationInfoInstance, field: 'designation', 'has-error')}">
                        <label class="required">
                            <g:message code="vrApplicationInfo.designation.label" default="Designation"/>
                        </label>
                        <g:select id="designation" name="designation.id"
                                  from="${designationList}"
                                  optionKey="id" noSelection="['': '--Select--']"
                                  value="${vrApplicationInfoInstance?.designation?.id}"
                                  class="form-control input-sm"/>
                        <g:renderErrors bean="${vrApplicationInfoInstance}" field="designation"/>

                    </div>
                </div>

                <div class="col-md-4">
                    <div class="form-group ${hasErrors(bean: vrApplicationInfoInstance, field: 'nationality', 'has-error')}">
                        <label class="required">
                            <g:message code="vrApplicationInfo.nationality.label" default="Nationality"/>
                        </label>
                        <g:select id="nationality" name="nationality.id"
                                  from="${nationalityList}"
                                  optionKey="id" noSelection="['': '--Select--']"
                                  value="${vrApplicationInfoInstance?.nationality?.id}"
                                  class="form-control input-sm"/>
                        <g:renderErrors bean="${vrApplicationInfoInstance}" field="nationality"/>
                    </div>
                </div>

            </div>

            <div class="row">
                <div class="col-md-4">
                    <div class="form-group ${hasErrors(bean: vrApplicationInfoInstance, field: 'dateOfBirth', 'has-error')}">
                        <label class="required">
                            <g:message code="vrApplicationInfo.dateOfBirth.label" default="Date of Birth"/>
                        </label>
                        <g:textField name="dateOfBirth" id="dateOfBirth"
                                     placeholder="${grailsApplication.config.grails.date.formatUI}"
                                     value="${vrApplicationInfoInstance?.dateOfBirth?.format(grailsApplication.config.grails.date.format)}"
                                     class="form-control input-sm datePick"/>
                        <g:renderErrors bean="${vrApplicationInfoInstance}" field="dateOfBirth"/>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="form-group ${hasErrors(bean: vrApplicationInfoInstance, field: 'passportNo', 'has-error')}">
                        <label class="required">
                            <g:message code="vrApplicationInfo.passportNo.label" default="Passport No"/>
                        </label>
                        <g:textField name="passportNo" id="passportNo"
                                     value="${vrApplicationInfoInstance?.passportNo}"
                                     class="form-control input-sm"/>
                        <g:renderErrors bean="${vrApplicationInfoInstance}" field="passportNo"/>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="form-group ${hasErrors(bean: vrApplicationInfoInstance, field: 'passportIssueDate', 'has-error')}">
                        <label class="required">
                            <g:message code="vrApplicationInfo.passportIssueDate.label" default="Passport Issue Date"/>
                        </label>
                        <g:textField name="passportIssueDate" id="passportIssueDate"
                                     placeholder="${grailsApplication.config.grails.date.formatUI}"
                                     value="${vrApplicationInfoInstance?.passportIssueDate?.format(grailsApplication.config.grails.date.format)}"
                                     class="form-control input-sm datePick"/>
                        <g:renderErrors bean="${vrApplicationInfoInstance}" field="passportIssueDate"/>
                    </div>
                </div>

            </div>

            <div class="row">
                <div class="col-md-4">
                    <div class="form-group ${hasErrors(bean: vrApplicationInfoInstance, field: 'passportExpireDate', 'has-error')}">
                        <label class="required">
                            <g:message code="vrApplicationInfo.passportExpireDate.label"
                                       default="Passport Expire Date"/>
                        </label>
                        <g:textField name="passportExpireDate" id="passportExpireDate"
                                     placeholder="${grailsApplication.config.grails.date.formatUI}"
                                     value="${vrApplicationInfoInstance?.passportExpireDate?.format(grailsApplication.config.grails.date.format)}"
                                     class="form-control input-sm datePick"/>
                        <g:renderErrors bean="${vrApplicationInfoInstance}" field="passportExpireDate"/>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="form-group ${hasErrors(bean: vrApplicationInfoInstance, field: 'purpose', 'has-error')}">
                        <label class="required">
                            <g:message code="vrApplicationInfo.purpose.label" default="Purpose"/>
                        </label>
                        <g:textArea name="purpose"
                                    id="purpose"
                                    class="form-control input-sm txtArea"
                                    value="${vrApplicationInfoInstance?.purpose}"/>
                        <g:renderErrors bean="${vrApplicationInfoInstance}" field="purpose"/>

                    </div>
                </div>

            </div>

        </fieldset>
        <fieldset>
            <legend class="text-yellow">
                Upload Supporting Documents
                <g:if test="${actionName == 'add'}">(<small style="margin-left: 10px;">
                    <g:checkBox name="ipRequiredDocExclude" value="${params?.ipRequiredDocExclude}"></g:checkBox>
                    Upload documents later</small>)
                </g:if>
            </legend>

            <div class="box box-info">
                <div class="box-body no-padding">
                    <table class="table table-condensed">
                        <tr>
                            <th style="width: 10px">#</th>
                            <th>Supporting Documents Type</th>
                            <th>Document Name</th>
                            <g:if test="${actionName != 'add'}">
                                <th>Uploaded Documents</th>
                            </g:if>
                            <th>Attach Related Supporting Documents (*.pdf) (File size max. 1MB)</th>
                        </tr>
                        <g:each in="${requiredDocTypes}" status="i" var="requiredDocType">
                            <g:set var="vrSelectedRequiredDoc" value="${null}"></g:set>
                            <g:each in="${vrRequiredDocList}" var="vrRequiredDoc">
                                <g:if test="${vrRequiredDoc?.docType?.id == requiredDocType?.ID}">
                                    <g:set var="vrSelectedRequiredDoc" value="${vrRequiredDoc}"></g:set>
                                </g:if>
                            </g:each>
                            <tr>
                                <td>
                                    <g:if test="${vrSelectedRequiredDoc?.docType?.id == requiredDocType?.ID}">
                                        <g:checkBox name="vrRequiredDocument[${i}].requiredDocId" checked="true"
                                                    id="requiredDocId_${i}"
                                                    value="${requiredDocType?.ID}"></g:checkBox>
                                    </g:if>
                                    <g:else>
                                        <g:checkBox name="vrRequiredDocument[${i}].requiredDocId" checked="false"
                                                    id="requiredDocId_${i}"
                                                    value="${requiredDocType?.ID}"></g:checkBox>
                                    </g:else>
                                    <g:hiddenField name="vrRequiredDocument[${i}].typeId"
                                                   value="${requiredDocType?.ID}"></g:hiddenField>
                                    <g:hiddenField name="vrRequiredDocument[${i}].id"
                                                   value="${vrSelectedRequiredDoc?.id}"></g:hiddenField>
                                </td>
                                <td>
                                    <label class="${requiredDocType?.IS_MANDATORY ? 'required' : 'optional'}">${requiredDocType?.DOC_TYPE_NAME}</label>
                                </td>
                                <td>
                                    <div class="input-group ${hasErrors(bean: vrSelectedRequiredDoc, field: 'userGivenDocName', 'has-error')}">
                                        <input type="text" class="form-control tf"
                                               id="vrRequiredDocument[${i}].userGivenDocName"
                                               name="vrRequiredDocument[${i}].userGivenDocName"
                                               value="${vrSelectedRequiredDoc?.userGivenDocName}">

                                    </div>
                                </td>
                                <g:if test="${actionName != 'add'}">
                                    <td>
                                        <g:if test="${vrSelectedRequiredDoc?.docUrl}">
                                            <g:link target="_blank" url="${vrSelectedRequiredDoc?.docUrl}"
                                                    title="Click Here To See The Document">
                                                <i class="fa fa-fw fa-file-pdf-o"></i>
                                            </g:link>
                                        </g:if>
                                    </td>
                                </g:if>
                                <td class="col-md-5">
                                    <div class="input-group ${hasErrors(bean: vrSelectedRequiredDoc, field: 'docName', 'has-error')}">
                                        <span class="input-group-btn">
                                            <span class="btn btn-primary btn-file">
                                                Browse &hellip;
                                                <input type="file" id="docName_${i}"
                                                       name="vrRequiredDocument[${i}].docName"
                                                       class="fl" value="${vrSelectedRequiredDoc?.docName}">
                                            </span>
                                        </span>
                                        <input type="text" class="form-control tf" readonly="readonly"
                                               id="docNameProxy_${i}"
                                               placeholder="Browse your file" value="${vrSelectedRequiredDoc?.docName}">
                                        <g:renderErrors bean="${vrSelectedRequiredDoc}" field="docName"/>
                                        <g:hiddenField name="vrRequiredDocument[${i}].docNameOld"
                                                       value="${vrSelectedRequiredDoc?.docName}"></g:hiddenField>
                                        <g:hiddenField name="vrRequiredDocument[${i}].docSizeOld"
                                                       value="${vrSelectedRequiredDoc?.docSize}"></g:hiddenField>
                                    </div>

                                </td>
                            </tr>
                        </g:each>
                    </table>
                </div><!-- /.box-body -->

            </div><!-- /.box -->

        </fieldset>

        <fieldset><legend class="text-yellow"><g:message
                code="vrApplicationInfo.remarkForBackOrForwardTheApplication.label"
                default="Remarks For Back or Forward the Application"/></legend>

            <div class="col-md-12">
                <div class="form-group ${hasErrors(bean: vrApplicationInfoInstance, field: 'remarks', 'has-error')}">
                    <label>
                        <g:message code="vrApplicationInfo.remarks.label" default="Remarks"/>
                    </label>
                    <g:textArea name="remarks"
                                id="remarks"
                                class="form-control input-sm txtArea"
                                value="${vrApplicationInfoInstance?.remarks}"/>
                    <g:renderErrors bean="${vrApplicationInfoInstance}" field="remarks"/>

                </div>
            </div>

            <div class="col-md-12">
                <div class="form-group ${hasErrors(bean: vrApplicationInfoInstance, field: 'currentStatus', 'has-error')}">
                    <label>
                        <g:message code="vrApplicationInfo.currentStatus.label" default="Current Status"/> :
                    </label>
                    <label style="font-weight: bold;color: red;">${vrApplicationInfoInstance?.currentStatus}</label>

                </div>
            </div>

        </fieldset>

        <div class="box-footer">

            <button type="submit" id="submit" class="btn btn-primary pull-left"
                    onclick="submitForm('submit', 'actionType', 'div1Form');" style="margin-right: 1%;">
                <i class="fa fa-save"></i>
                <span id="submitBtnLbl">Submit Visa Application</span>
            </button>

            <button type="submit" id="draft" class="btn btn-primary pull-left"
                    onclick="submitForm('draft', 'actionType', 'div1Form');" style="margin-right: 1%;">
                <i class="fa fa-save"></i>
                <span id="draftSubmitBtnLbl">Save the application as a draft</span>
            </button>
            <g:if test="${currentServerMemberRole != 'ROLE_VR_MAKER'}">
                <button type="submit" id="back" onclick="submitForm('back', 'actionType', 'div1Form');"
                        class="btn btn-primary pull-left" style="margin-right: 1%;">
                    <i class="fa fa-save"></i>
                    <span id="backBtnLbl">Send Back The Application</span>
                </button>
            </g:if>

        %{--<div class="pull-left" style="padding: 5px 0px 0px 15px;">
            <g:checkBox name="isSaveAsDraft" value="${vrApplicationInfoInstance?.isSaveAsDraft}" />&nbsp;&nbsp;
            <label for="isSaveAsDraft">Save the application as a draft</label>
        </div>--}%

            <button type="reset" class="btn btn-warning pull-right">
                <i class="fa fa-hand-paper-o"></i>
                Reset the Form
            </button>
        </div><!-- /.box-footer -->
    </g:form>
</div>

<div id="div2" style="display: none">
    <g:form url="${request.queryString ? request.forwardURI + '?' + request.queryString : request.forwardURI}"
            enctype="multipart/form-data" method="post" id="div1Form2">
        <fieldset><legend class="text-yellow"><g:message code="vrApplicationInfo.vrApplicant.label2"
                                                         default="Particulars of the Applicant"/></legend>
            <g:hiddenField name="id" value="${vrApplicationInfoInstance?.id}"></g:hiddenField>
            <g:hiddenField name="visaCategory" id="visaCategoryDiv2"
                           value="${vrApplicationInfoInstance?.visaCategory?.id}"></g:hiddenField>
            <g:hiddenField name="enterprise" id="enterprise" value="${userEnterprise?.id}"></g:hiddenField>
            <g:hiddenField name="statusKey" id="statusKey"
                           value="${vrApplicationInfoInstance?.currentStatus?.keyword}"></g:hiddenField>
            <g:hiddenField name="actionType" id="actionType2" value=""></g:hiddenField>
            <div class="row">
                <div class="col-md-4">
                    <div class="form-group ${hasErrors(bean: vrApplicationInfoInstance, field: 'foreignerRefNo', 'has-error')}">
                        <label class="required">
                            <g:message code="vrApplicationInfo.foreignerRefNo.label" default="Foreigner Ref. No."/>
                        </label>
                        <g:select id="foreignerRefNo" class="form-control select2" style="width: 100%;"
                                  name="foreignerRefNo"
                                  from="${visaIssuedForeignerRefNoList}"
                                  optionKey="${{ it.code }}" optionValue="${{ it.code }}"
                                  value="${vrApplicationInfoInstance?.foreignerRefNo}"
                                  noSelection="['': 'Select One']"
                                  onchange="getForeignerDtl('foreignerRefNo','nameOfForeigner2','foreignerSummary');"/>
                        <g:renderErrors bean="${vrApplicationInfoInstance}" field="foreignerRefNo"/>

                        %{--<g:textField name="foreignerRefNo" id="foreignerRefNo"
                                     value="${vrApplicationInfoInstance?.foreignerRefNo}"
                                     class="form-control input-sm"/>
                        <g:renderErrors bean="${vrApplicationInfoInstance}" field="foreignerRefNo"/>--}%
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="form-group ${hasErrors(bean: vrApplicationInfoInstance, field: 'nameOfForeigner', 'has-error')}">
                        <label class="required">
                            <g:message code="vrApplicationInfo.nameOfForeigner.label" default="Name of Foreigner"/>
                        </label>
                        <g:textField name="nameOfForeigner" id="nameOfForeigner2"
                                     value="${vrApplicationInfoInstance?.nameOfForeigner}"
                                     class="form-control input-sm"/>
                        <g:renderErrors bean="${vrApplicationInfoInstance}" field="nameOfForeigner"/>
                        %{--<g:select id="nameOfForeigner" class="form-control select2" style="width: 100%;"
                                  name="nameOfForeigner"
                                  from="${nameOfForeignerList}"
                                  optionKey="${{ it.id }}" optionValue="${{ it.nameOfForeigner }}"
                                  value="${vrApplicationInfoInstance?.id}"
                                  noSelection="['': 'Select One']"/>
                        <g:renderErrors bean="${vrApplicationInfoInstance}" field="nameOfForeigner"/>--}%
                    </div>
                </div>


                <div class="col-md-4">
                    <div class="form-group ${hasErrors(bean: vrApplicationInfoInstance, field: 'foreignerSummary', 'has-error')}">
                        <label class="required">
                            <g:message code="vrApplicationInfo.foreignerSummary.label" default="Foreigner Summary"/>
                        </label>
                        <g:textField name="foreignerSummary" id="foreignerSummary"
                                     value="${vrApplicationInfoInstance?.foreignerSummary}" readonly="readonly"
                                     class="form-control input-sm"/>
                        <g:renderErrors bean="${vrApplicationInfoInstance}" field="foreignerSummary"/>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-4">
                    <div class="form-group ${hasErrors(bean: vrApplicationInfoInstance, field: 'nameOfForFamMember', 'has-error')}">
                        <label class="required">
                            <g:message code="vrApplicationInfo.nameOfForFamMember.label" default="Name of Person"/>
                        </label>
                        <g:textField name="nameOfForFamMember" id="nameOfForFamMember"
                                     value="${vrApplicationInfoInstance?.nameOfForFamMember}"
                                     class="form-control input-sm"/>
                        <g:renderErrors bean="${vrApplicationInfoInstance}" field="nameOfForFamMember"/>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="form-group ${hasErrors(bean: vrApplicationInfoInstance, field: 'designation', 'has-error')}">
                        <label class="required">
                            <g:message code="vrApplicationInfo.designation.label" default="Designation"/>
                        </label>
                        <g:select id="designation" name="designation.id"
                                  from="${designationList}"
                                  optionKey="id" noSelection="['': '--Select--']"
                                  value="${vrApplicationInfoInstance?.designation?.id}"
                                  class="form-control input-sm"/>
                        <g:renderErrors bean="${vrApplicationInfoInstance}" field="designation"/>

                    </div>
                </div>

                <div class="col-md-4">
                    <div class="form-group ${hasErrors(bean: vrApplicationInfoInstance, field: 'nationality', 'has-error')}">
                        <label class="required">
                            <g:message code="vrApplicationInfo.nationality.label" default="Nationality"/>
                        </label>
                        <g:select id="nationality" name="nationality.id"
                                  from="${nationalityList}"
                                  optionKey="id" noSelection="['': '--Select--']"
                                  value="${vrApplicationInfoInstance?.nationality?.id}"
                                  class="form-control input-sm"/>
                        <g:renderErrors bean="${vrApplicationInfoInstance}" field="nationality"/>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-4">
                    <div class="form-group ${hasErrors(bean: vrApplicationInfoInstance, field: 'dateOfBirth', 'has-error')}">
                        <label class="required">
                            <g:message code="vrApplicationInfo.dateOfBirth.label" default="Date of Birth"/>
                        </label>
                        <g:textField name="dateOfBirth" id="dateOfBirth"
                                     placeholder="${grailsApplication.config.grails.date.formatUI}"
                                     value="${vrApplicationInfoInstance?.dateOfBirth?.format(grailsApplication.config.grails.date.format)}"
                                     class="form-control input-sm datePick"/>
                        <g:renderErrors bean="${vrApplicationInfoInstance}" field="dateOfBirth"/>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="form-group ${hasErrors(bean: vrApplicationInfoInstance, field: 'passportNo', 'has-error')}">
                        <label class="required">
                            <g:message code="vrApplicationInfo.passportNo.label" default="Passport No"/>
                        </label>
                        <g:textField name="passportNo" id="passportNo"
                                     value="${vrApplicationInfoInstance?.passportNo}"
                                     class="form-control input-sm"/>
                        <g:renderErrors bean="${vrApplicationInfoInstance}" field="passportNo"/>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="form-group ${hasErrors(bean: vrApplicationInfoInstance, field: 'passportIssueDate', 'has-error')}">
                        <label class="required">
                            <g:message code="vrApplicationInfo.passportIssueDate.label" default="Passport Issue Date"/>
                        </label>
                        <g:textField name="passportIssueDate" id="passportIssueDate"
                                     placeholder="${grailsApplication.config.grails.date.formatUI}"
                                     value="${vrApplicationInfoInstance?.passportIssueDate?.format(grailsApplication.config.grails.date.format)}"
                                     class="form-control input-sm datePick"/>
                        <g:renderErrors bean="${vrApplicationInfoInstance}" field="passportIssueDate"/>
                    </div>
                </div>

            </div>

            <div class="row">
                <div class="col-md-4">
                    <div class="form-group ${hasErrors(bean: vrApplicationInfoInstance, field: 'passportExpireDate', 'has-error')}">
                        <label class="required">
                            <g:message code="vrApplicationInfo.passportExpireDate.label"
                                       default="Passport Expire Date"/>
                        </label>
                        <g:textField name="passportExpireDate" id="passportExpireDate"
                                     placeholder="${grailsApplication.config.grails.date.formatUI}"
                                     value="${vrApplicationInfoInstance?.passportExpireDate?.format(grailsApplication.config.grails.date.format)}"
                                     class="form-control input-sm datePick"/>
                        <g:renderErrors bean="${vrApplicationInfoInstance}" field="passportExpireDate"/>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="form-group ${hasErrors(bean: vrApplicationInfoInstance, field: 'relation', 'has-error')}">
                        <label class="required">
                            <g:message code="vrApplicationInfo.relation.label" default="Relation with the Foreigner"/>
                        </label>
                        <g:textField name="relation" id="relation"
                                     value="${vrApplicationInfoInstance?.relation}"
                                     class="form-control input-sm"/>
                        <g:renderErrors bean="${vrApplicationInfoInstance}" field="relation"/>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="form-group ${hasErrors(bean: vrApplicationInfoInstance, field: 'purpose', 'has-error')}">
                        <label class="required">
                            <g:message code="vrApplicationInfo.purpose.label" default="Purpose"/>
                        </label>
                        <g:textArea name="purpose"
                                    id="purpose"
                                    class="form-control input-sm txtArea"
                                    value="${vrApplicationInfoInstance?.purpose}"/>
                        <g:renderErrors bean="${vrApplicationInfoInstance}" field="purpose"/>
                    </div>
                </div>

            </div>

        </fieldset>
        <fieldset>
            <legend class="text-yellow">
                Upload Supporting Documents
                <g:if test="${actionName == 'add'}">(<small style="margin-left: 10px;">
                    <g:checkBox name="ipRequiredDocExclude" value="${params?.ipRequiredDocExclude}"></g:checkBox>
                    Upload documents later</small>)
                </g:if>
            </legend>

            <div class="box box-info">
                <div class="box-body no-padding">
                    <table class="table table-condensed">
                        <tr>
                            <th style="width: 10px">#</th>
                            <th>Supporting Documents Type</th>
                            <th>Document Name</th>
                            <g:if test="${actionName != 'add'}">
                                <th>Uploaded Documents</th>
                            </g:if>
                            <th>Attach Related Supporting Documents (*.pdf) (File size max. 1MB)</th>
                        </tr>
                        <g:each in="${requiredDocTypes}" status="i" var="requiredDocType">
                            <g:set var="vrSelectedRequiredDoc" value="${null}"></g:set>
                            <g:each in="${vrRequiredDocList}" var="vrRequiredDoc">
                                <g:if test="${vrRequiredDoc?.docType?.id == requiredDocType?.ID}">
                                    <g:set var="vrSelectedRequiredDoc" value="${vrRequiredDoc}"></g:set>
                                </g:if>
                            </g:each>
                            <tr>
                                <td>
                                    <g:if test="${vrSelectedRequiredDoc?.docType?.id == requiredDocType?.ID}">
                                        <g:checkBox name="vrRequiredDocument[${i}].requiredDocId" checked="true"
                                                    id="requiredDocId_${i}"
                                                    value="${requiredDocType?.ID}"></g:checkBox>
                                    </g:if>
                                    <g:else>
                                        <g:checkBox name="vrRequiredDocument[${i}].requiredDocId" checked="false"
                                                    id="requiredDocId_${i}"
                                                    value="${requiredDocType?.ID}"></g:checkBox>
                                    </g:else>
                                    <g:hiddenField name="vrRequiredDocument[${i}].typeId"
                                                   value="${requiredDocType?.ID}"></g:hiddenField>
                                    <g:hiddenField name="vrRequiredDocument[${i}].id"
                                                   value="${vrSelectedRequiredDoc?.id}"></g:hiddenField>
                                </td>
                                <td>
                                    <label class="${requiredDocType?.IS_MANDATORY ? 'required' : 'optional'}">${requiredDocType?.DOC_TYPE_NAME}</label>
                                </td>
                                <td>
                                    <div class="input-group ${hasErrors(bean: vrSelectedRequiredDoc, field: 'userGivenDocName', 'has-error')}">
                                        <input type="text" class="form-control tf"
                                               id="vrRequiredDocument[${i}].userGivenDocName"
                                               name="vrRequiredDocument[${i}].userGivenDocName"
                                               value="${vrSelectedRequiredDoc?.userGivenDocName}">

                                    </div>
                                </td>
                                <g:if test="${actionName != 'add'}">
                                    <td>
                                        <g:if test="${vrSelectedRequiredDoc?.docUrl}">
                                            <g:link target="_blank" url="${vrSelectedRequiredDoc?.docUrl}"
                                                    title="Click Here To See The Document">
                                                <i class="fa fa-fw fa-file-pdf-o"></i>
                                            </g:link>
                                        </g:if>
                                    </td>
                                </g:if>
                                <td class="col-md-5">
                                    <div class="input-group ${hasErrors(bean: vrSelectedRequiredDoc, field: 'docName', 'has-error')}">
                                        <span class="input-group-btn">
                                            <span class="btn btn-primary btn-file">
                                                Browse &hellip;
                                                <input type="file" id="docName_${i}"
                                                       name="vrRequiredDocument[${i}].docName"
                                                       class="fl" value="${vrSelectedRequiredDoc?.docName}">
                                            </span>
                                        </span>
                                        <input type="text" class="form-control tf" readonly="readonly"
                                               id="docNameProxy_${i}"
                                               placeholder="Browse your file" value="${vrSelectedRequiredDoc?.docName}">
                                        <g:renderErrors bean="${vrSelectedRequiredDoc}" field="docName"/>
                                        <g:hiddenField name="vrRequiredDocument[${i}].docNameOld"
                                                       value="${vrSelectedRequiredDoc?.docName}"></g:hiddenField>
                                        <g:hiddenField name="vrRequiredDocument[${i}].docSizeOld"
                                                       value="${vrSelectedRequiredDoc?.docSize}"></g:hiddenField>
                                    </div>

                                </td>
                            </tr>
                        </g:each>
                    </table>
                </div><!-- /.box-body -->

            </div><!-- /.box -->

        </fieldset>
        <fieldset><legend class="text-yellow"><g:message
                code="vrApplicationInfo.remarkForBackOrForwardTheApplication.label"
                default="Remarks For Back or Forward the Application"/></legend>

            <div class="col-md-12">
                <div class="form-group ${hasErrors(bean: vrApplicationInfoInstance, field: 'remarks', 'has-error')}">
                    <label>
                        <g:message code="vrApplicationInfo.remarks.label" default="Remarks"/>
                    </label>
                    <g:textArea name="remarks"
                                id="remarks"
                                class="form-control input-sm txtArea"
                                value="${vrApplicationInfoInstance?.remarks}"/>
                    <g:renderErrors bean="${vrApplicationInfoInstance}" field="remarks"/>

                </div>
            </div>

            <div class="col-md-12">
                <div class="form-group ${hasErrors(bean: vrApplicationInfoInstance, field: 'currentStatus', 'has-error')}">
                    <label>
                        <g:message code="vrApplicationInfo.currentStatus.label" default="Current Status"/> :
                    </label>
                    <label style="font-weight: bold;color: red;">${vrApplicationInfoInstance?.currentStatus}</label>

                </div>
            </div>

        </fieldset>

        <div class="box-footer">

            <button type="submit" id="submit2" class="btn btn-primary pull-left"
                    onclick="submitForm('submit', 'actionType2', 'div1Form2');" style="margin-right: 1%;">
                <i class="fa fa-save"></i>
                <span id="submitBtnLbl2">Submit Visa Application</span>
            </button>

            <button type="submit" id="draft" class="btn btn-primary pull-left"
                    onclick="submitForm('draft', 'actionType2', 'div1Form2');" style="margin-right: 1%;">
                <i class="fa fa-save"></i>
                <span id="draftSubmitBtnLbl2">Save the application as a draft</span>
            </button>
            <g:if test="${currentServerMemberRole != 'ROLE_VR_MAKER'}">
                <button type="submit" id="back2" onclick="submitForm('back', 'actionType2', 'div1Form2');"
                        class="btn btn-primary pull-left" style="margin-right: 1%;">
                    <i class="fa fa-save"></i>
                    <span id="backBtnLbl2">Send Back The Application</span>
                </button>
            </g:if>

        %{--<div class="pull-left" style="padding: 5px 0px 0px 15px;">
            <g:checkBox name="isSaveAsDraft" value="${vrApplicationInfoInstance?.isSaveAsDraft}" />&nbsp;&nbsp;
            <label for="isSaveAsDraft">Save the application as a draft</label>
        </div>--}%

            <button type="reset" class="btn btn-warning pull-right">
                <i class="fa fa-hand-paper-o"></i>
                Reset the Form
            </button>
        </div><!-- /.box-footer -->
    </g:form>
</div>

<div id="div3" style="display: none">
    <g:form url="${request.queryString ? request.forwardURI + '?' + request.queryString : request.forwardURI}"
            enctype="multipart/form-data" method="post" id="div1Form3">
        <fieldset><legend class="text-yellow"><g:message code="vrApplicationInfo.vrApplicant.label"
                                                         default="Particulars of the Expatriate for whom the Employment is required"/></legend>
            <g:hiddenField name="id" value="${vrApplicationInfoInstance.id}"></g:hiddenField>
            <g:hiddenField name="visaCategory" id="visaCategoryDiv3"
                           value="${vrApplicationInfoInstance?.visaCategory?.id}"></g:hiddenField>
            <g:hiddenField name="enterprise" id="enterprise" value="${userEnterprise?.id}"></g:hiddenField>
            <g:hiddenField name="statusKey" id="statusKey"
                           value="${vrApplicationInfoInstance?.currentStatus?.keyword}"></g:hiddenField>
            <g:hiddenField name="actionType" id="actionType3" value=""></g:hiddenField>
            <div class="row">
                <div class="col-md-4">
                    <div class="form-group ${hasErrors(bean: vrApplicationInfoInstance, field: 'nameOfForeigner', 'has-error')}">
                        <label class="required">
                            <g:message code="vrApplicationInfo.nameOfForeigner.label" default="Name of Foreigner"/>
                        </label>
                        <g:textField name="nameOfForeigner" id="nameOfForeigner"
                                     value="${vrApplicationInfoInstance?.nameOfForeigner}"
                                     class="form-control input-sm"/>

                    </div>
                </div>

                <div class="col-md-4">
                    <div class="form-group ${hasErrors(bean: vrApplicationInfoInstance, field: 'designation', 'has-error')}">
                        <label class="required">
                            <g:message code="vrApplicationInfo.designation.label" default="Designation"/>
                        </label>
                        <g:select id="designation" name="designation.id"
                                  from="${designationList}"
                                  optionKey="id" noSelection="['': '--Select--']"
                                  value="${vrApplicationInfoInstance?.designation?.id}"
                                  class="form-control input-sm"/>
                        <g:renderErrors bean="${vrApplicationInfoInstance}" field="designation"/>

                    </div>
                </div>

                <div class="col-md-4">
                    <div class="form-group ${hasErrors(bean: vrApplicationInfoInstance, field: 'nationality', 'has-error')}">
                        <label class="required">
                            <g:message code="vrApplicationInfo.nationality.label" default="Nationality"/>
                        </label>
                        <g:select id="nationality" name="nationality.id"
                                  from="${nationalityList}"
                                  optionKey="id" noSelection="['': '--Select--']"
                                  value="${vrApplicationInfoInstance?.nationality?.id}"
                                  class="form-control input-sm"/>
                        <g:renderErrors bean="${vrApplicationInfoInstance}" field="nationality"/>
                    </div>
                </div>

            </div>

            <div class="row">
                <div class="col-md-4">
                    <div class="form-group ${hasErrors(bean: vrApplicationInfoInstance, field: 'dateOfBirth', 'has-error')}">
                        <label class="required">
                            <g:message code="vrApplicationInfo.dateOfBirth.label" default="Date of Birth"/>
                        </label>
                        <g:textField name="dateOfBirth" id="dateOfBirth"
                                     placeholder="${grailsApplication.config.grails.date.formatUI}"
                                     value="${vrApplicationInfoInstance?.dateOfBirth?.format(grailsApplication.config.grails.date.format)}"
                                     class="form-control input-sm datePick"/>

                    </div>
                </div>

                <div class="col-md-4">
                    <div class="form-group ${hasErrors(bean: vrApplicationInfoInstance, field: 'passportNo', 'has-error')}">
                        <label class="required">
                            <g:message code="vrApplicationInfo.passportNo.label" default="Passport No"/>
                        </label>
                        <g:textField name="passportNo" id="passportNo"
                                     value="${vrApplicationInfoInstance?.passportNo}"
                                     class="form-control input-sm"/>
                        <g:renderErrors bean="${vrApplicationInfoInstance}" field="passportNo"/>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="form-group ${hasErrors(bean: vrApplicationInfoInstance, field: 'passportIssueDate', 'has-error')}">
                        <label class="required">
                            <g:message code="vrApplicationInfo.passportIssueDate.label" default="Passport Issue Date"/>
                        </label>
                        <g:textField name="passportIssueDate" id="passportIssueDate"
                                     placeholder="${grailsApplication.config.grails.date.formatUI}"
                                     value="${vrApplicationInfoInstance?.passportIssueDate?.format(grailsApplication.config.grails.date.format)}"
                                     class="form-control input-sm datePick"/>
                        <g:renderErrors bean="${vrApplicationInfoInstance}" field="passportIssueDate"/>
                    </div>
                </div>

            </div>

            <div class="row">
                <div class="col-md-4">
                    <div class="form-group ${hasErrors(bean: vrApplicationInfoInstance, field: 'passportExpireDate', 'has-error')}">
                        <label class="required">
                            <g:message code="vrApplicationInfo.passportExpireDate.label"
                                       default="Passport Expire Date"/>
                        </label>
                        <g:textField name="passportExpireDate" id="passportExpireDate"
                                     placeholder="${grailsApplication.config.grails.date.formatUI}"
                                     value="${vrApplicationInfoInstance?.passportExpireDate?.format(grailsApplication.config.grails.date.format)}"
                                     class="form-control input-sm datePick"/>

                    </div>
                </div>

                <div class="col-md-4">
                    <div class="form-group ${hasErrors(bean: vrApplicationInfoInstance, field: 'purpose', 'has-error')}">
                        <label class="required">
                            <g:message code="vrApplicationInfo.purpose.label" default="Purpose"/>
                        </label>
                        <g:textArea name="purpose"
                                    id="purpose"
                                    class="form-control input-sm txtArea"
                                    value="${vrApplicationInfoInstance?.purpose}"/>
                        <g:renderErrors bean="${vrApplicationInfoInstance}" field="purpose"/>

                    </div>
                </div>

            </div>

        </fieldset>
        <fieldset>
            <legend class="text-yellow">
                Upload Supporting Documents
                <g:if test="${actionName == 'add'}">(<small style="margin-left: 10px;">
                    <g:checkBox name="ipRequiredDocExclude" value="${params?.ipRequiredDocExclude}"></g:checkBox>
                    Upload documents later</small>)
                </g:if>
            </legend>

            <div class="box box-info">
                <div class="box-body no-padding">
                    <table class="table table-condensed">
                        <tr>
                            <th style="width: 10px">#</th>
                            <th>Supporting Documents Type</th>
                            <th>Document Name</th>
                            <g:if test="${actionName != 'add'}">
                                <th>Uploaded Documents</th>
                            </g:if>
                            <th>Attach Related Supporting Documents (*.pdf) (File size max. 1MB)</th>
                        </tr>
                        <g:each in="${requiredDocTypes}" status="i" var="requiredDocType">
                            <g:set var="vrSelectedRequiredDoc" value="${null}"></g:set>
                            <g:each in="${vrRequiredDocList}" var="vrRequiredDoc">
                                <g:if test="${vrRequiredDoc?.docType?.id == requiredDocType?.ID}">
                                    <g:set var="vrSelectedRequiredDoc" value="${vrRequiredDoc}"></g:set>
                                </g:if>
                            </g:each>
                            <tr>
                                <td>
                                    <g:if test="${vrSelectedRequiredDoc?.docType?.id == requiredDocType?.ID}">
                                        <g:checkBox name="vrRequiredDocument[${i}].requiredDocId" checked="true"
                                                    id="requiredDocId_${i}"
                                                    value="${requiredDocType?.ID}"></g:checkBox>
                                    </g:if>
                                    <g:else>
                                        <g:checkBox name="vrRequiredDocument[${i}].requiredDocId" checked="false"
                                                    id="requiredDocId_${i}"
                                                    value="${requiredDocType?.ID}"></g:checkBox>
                                    </g:else>
                                    <g:hiddenField name="vrRequiredDocument[${i}].typeId"
                                                   value="${requiredDocType?.ID}"></g:hiddenField>
                                    <g:hiddenField name="vrRequiredDocument[${i}].id"
                                                   value="${vrSelectedRequiredDoc?.id}"></g:hiddenField>
                                </td>
                                <td>
                                    <label class="${requiredDocType?.IS_MANDATORY ? 'required' : 'optional'}">${requiredDocType?.DOC_TYPE_NAME}</label>
                                </td>
                                <td>
                                    <div class="input-group ${hasErrors(bean: vrSelectedRequiredDoc, field: 'userGivenDocName', 'has-error')}">
                                        <input type="text" class="form-control tf"
                                               id="vrRequiredDocument[${i}].userGivenDocName"
                                               name="vrRequiredDocument[${i}].userGivenDocName"
                                               value="${vrSelectedRequiredDoc?.userGivenDocName}">

                                    </div>
                                </td>
                                <g:if test="${actionName != 'add'}">
                                    <td>
                                        <g:if test="${vrSelectedRequiredDoc?.docUrl}">
                                            <g:link target="_blank" url="${vrSelectedRequiredDoc?.docUrl}"
                                                    title="Click Here To See The Document">
                                                <i class="fa fa-fw fa-file-pdf-o"></i>
                                            </g:link>
                                        </g:if>
                                    </td>
                                </g:if>
                                <td class="col-md-5">
                                    <div class="input-group ${hasErrors(bean: vrSelectedRequiredDoc, field: 'docName', 'has-error')}">
                                        <span class="input-group-btn">
                                            <span class="btn btn-primary btn-file">
                                                Browse &hellip;
                                                <input type="file" id="docName_${i}"
                                                       name="vrRequiredDocument[${i}].docName"
                                                       class="fl" value="${vrSelectedRequiredDoc?.docName}">
                                            </span>
                                        </span>
                                        <input type="text" class="form-control tf" readonly="readonly"
                                               id="docNameProxy_${i}"
                                               placeholder="Browse your file" value="${vrSelectedRequiredDoc?.docName}">
                                        <g:renderErrors bean="${vrSelectedRequiredDoc}" field="docName"/>
                                        <g:hiddenField name="vrRequiredDocument[${i}].docNameOld"
                                                       value="${vrSelectedRequiredDoc?.docName}"></g:hiddenField>
                                        <g:hiddenField name="vrRequiredDocument[${i}].docSizeOld"
                                                       value="${vrSelectedRequiredDoc?.docSize}"></g:hiddenField>
                                    </div>

                                </td>
                            </tr>
                        </g:each>
                    </table>
                </div><!-- /.box-body -->

            </div><!-- /.box -->

        </fieldset>

        <fieldset><legend class="text-yellow"><g:message
                code="vrApplicationInfo.remarkForBackOrForwardTheApplication.label"
                default="Remarks For Back or Forward the Application"/></legend>

            <div class="col-md-12">
                <div class="form-group ${hasErrors(bean: vrApplicationInfoInstance, field: 'remarks', 'has-error')}">
                    <label>
                        <g:message code="vrApplicationInfo.remarks.label" default="Remarks"/>
                    </label>
                    <g:textArea name="remarks"
                                id="remarks"
                                class="form-control input-sm txtArea"
                                value="${vrApplicationInfoInstance?.remarks}" />
                    <g:renderErrors bean="${vrApplicationInfoInstance}" field="remarks"/>

                </div>
            </div>

            <div class="col-md-12">
                <div class="form-group ${hasErrors(bean: vrApplicationInfoInstance, field: 'currentStatus', 'has-error')}">
                    <label>
                        <g:message code="vrApplicationInfo.currentStatus.label" default="Current Status"/> :
                    </label>
                    <label style="font-weight: bold;color: red;">${vrApplicationInfoInstance?.currentStatus}</label>

                </div>
            </div>

        </fieldset>

        <div class="box-footer">

            <button type="submit" id="submit3" class="btn btn-primary pull-left"
                    onclick="submitForm('submit', 'actionType3', 'div1Form3');" style="margin-right: 1%;">
                <i class="fa fa-save"></i>
                <span id="submitBtnLbl3">Submit Visa Application</span>
            </button>

            <button type="submit" id="draft3" class="btn btn-primary pull-left"
                    onclick="submitForm('draft', 'actionType3', 'div1Form3');" style="margin-right: 1%;">
                <i class="fa fa-save"></i>
                <span id="draftSubmitBtnLbl3">Save the application as a draft</span>
            </button>
            <g:if test="${currentServerMemberRole != 'ROLE_VR_MAKER'}">
                <button type="submit" id="back3" onclick="submitForm('back', 'actionType3', 'div1Form3');"
                        class="btn btn-primary pull-left" style="margin-right: 1%;">
                    <i class="fa fa-save"></i>
                    <span id="backBtnLbl3">Send Back The Application</span>
                </button>
            </g:if>

        %{--<div class="pull-left" style="padding: 5px 0px 0px 15px;">
            <g:checkBox name="isSaveAsDraft" value="${vrApplicationInfoInstance?.isSaveAsDraft}" />&nbsp;&nbsp;
            <label for="isSaveAsDraft">Save the application as a draft</label>
        </div>--}%

            <button type="reset" class="btn btn-warning pull-right">
                <i class="fa fa-hand-paper-o"></i>
                Reset the Form
            </button>
        </div><!-- /.box-footer -->
    </g:form>
</div>

<div id="div4" style="display: none">
    <div class="row">
        <div class="col-md-4">
            <label style="color:darkgreen;font-weight: bold;">
                <g:message code="vrApplicationInfo.plsSelectOneVisaCategory.label"
                           default="Please Select A Visa Category"/>
            </label>
        </div>
    </div>
</div>

<script type="text/javascript">
    $(document).ready(function () {
        //Initialize Select2 Elements
        $(".select2").select2();
        //Initialize datepicker
        $('.datePick').datepicker({format: "${grailsApplication.config.grails.date.formatUI}", autoclose: true});

        showHideDivByVisaCategory('visaCategory');
    });


    // showHideDivByVisaCategory('visaCategory');
    function showHideDivByVisaCategory(fldId) {
        var fldIdVal = document.getElementById(fldId).value;
        if (fldIdVal == "VISA_CATEGORY_OTHERS") {
            document.getElementById("div1").style.display = 'block';
            document.getElementById("div2").style.display = 'none';
            document.getElementById("div3").style.display = 'none';
            document.getElementById("div4").style.display = 'none';
            document.getElementById("visaCategoryDiv1").value = fldIdVal;
        } else if (fldIdVal == "VISA_CATEGORY_FPI" || fldIdVal == "VISA_CATEGORY_FE") {
            document.getElementById("div1").style.display = 'none';
            document.getElementById("div2").style.display = 'block';
            document.getElementById("div3").style.display = 'none';
            document.getElementById("div4").style.display = 'none';
            document.getElementById("visaCategoryDiv2").value = fldIdVal;
        } else if (fldIdVal == "VISA_CATEGORY_E" || fldIdVal == "VISA_CATEGORY_ET" || fldIdVal == "VISA_CATEGORY_PI" || fldIdVal == "VISA_CATEGORY_B") {
            document.getElementById("div1").style.display = 'none';
            document.getElementById("div2").style.display = 'none';
            document.getElementById("div3").style.display = 'block';
            document.getElementById("div4").style.display = 'none';
            document.getElementById("visaCategoryDiv3").value = fldIdVal;
        } else {
            document.getElementById("div1").style.display = 'none';
            document.getElementById("div2").style.display = 'none';
            document.getElementById("div3").style.display = 'none';
            document.getElementById("div4").style.display = 'block';
            //document.getElementById("visaCategoryDiv4").value = fldIdVal;
        }
    }

    function submitForm(btnId, fldId, formId) {//submitForm('submit','actionType','div1Form')
        //alert('submit '+btnId+' actionType '+fldId+' div1Form '+formId)

        document.getElementById(fldId).value = btnId;
        var formObject = document.getElementById(formId);
        formObject.submit();
    }
    //getForeignerDtl('foreignerRefNo','nameOfForeigner','foreignerSummary');
    function getForeignerDtl(fld1Id, fld2Id, fld3Id) {
        var foreignerRefNo = document.getElementById(fld1Id).value;
        //alert("foreignerRefNo "+foreignerRefNo);
        var controllerName = "commonAjax";
        var actionName = "getForeignerDtl";
        $.ajax({
            type: "POST",
            url: '${request.contextPath}/' + controllerName + '/' + actionName,
            dataType: "JSON",
            data: {
                foreignerRefNo: foreignerRefNo
            },
            success:function (response) {
                var json =  response;
                var data = json.message;
                var dataArr=data.split("@MARUF@");
//                alert("dataArr "+dataArr);
//                alert("dataArr[0] "+dataArr[0]);
//                alert("dataArr[1] "+dataArr[1]);
                document.getElementById(fld2Id).value = dataArr[0];
                document.getElementById(fld3Id).value = dataArr[1];
            },
            error: function (jqXHR, textStatus, errorThrown) {
                console.log(textStatus);
                alert(errorThrown);
            }
        });
    }

</script>

