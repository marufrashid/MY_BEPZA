<%@ page import="com.bepza.common.CpEntrprsMst" %>



<div class="fieldcontain ${hasErrors(bean: cpEntrprsMstInstance, field: 'applicationCode', 'error')} ">
	<label for="applicationCode">
		<g:message code="cpEntrprsMst.applicationCode.label" default="Application Code" />
		
	</label>
	<g:textField name="applicationCode" value="${cpEntrprsMstInstance?.applicationCode}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: cpEntrprsMstInstance, field: 'allotmentCode', 'error')} ">
	<label for="allotmentCode">
		<g:message code="cpEntrprsMst.allotmentCode.label" default="Allotment Code" />
		
	</label>
	<g:textField name="allotmentCode" value="${cpEntrprsMstInstance?.allotmentCode}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: cpEntrprsMstInstance, field: 'sanctionCode', 'error')} ">
	<label for="sanctionCode">
		<g:message code="cpEntrprsMst.sanctionCode.label" default="Sanction Code" />
		
	</label>
	<g:textField name="sanctionCode" value="${cpEntrprsMstInstance?.sanctionCode}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: cpEntrprsMstInstance, field: 'entrprsAddressLocal', 'error')} ">
	<label for="entrprsAddressLocal">
		<g:message code="cpEntrprsMst.entrprsAddressLocal.label" default="Entrprs Address Local" />
		
	</label>
	<g:textField name="entrprsAddressLocal" value="${cpEntrprsMstInstance?.entrprsAddressLocal}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: cpEntrprsMstInstance, field: 'code', 'error')} ">
	<label for="code">
		<g:message code="cpEntrprsMst.code.label" default="Code" />
		
	</label>
	<g:textField name="code" maxlength="20" value="${cpEntrprsMstInstance?.code}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: cpEntrprsMstInstance, field: 'applicantName', 'error')} required">
	<label for="applicantName">
		<g:message code="cpEntrprsMst.applicantName.label" default="Applicant Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="applicantName" maxlength="100" required="" value="${cpEntrprsMstInstance?.applicantName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: cpEntrprsMstInstance, field: 'entrprsName', 'error')} required">
	<label for="entrprsName">
		<g:message code="cpEntrprsMst.entrprsName.label" default="Entrprs Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="entrprsName" maxlength="100" required="" value="${cpEntrprsMstInstance?.entrprsName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: cpEntrprsMstInstance, field: 'entrprsAddress', 'error')} ">
	<label for="entrprsAddress">
		<g:message code="cpEntrprsMst.entrprsAddress.label" default="Entrprs Address" />
		
	</label>
	<g:textField name="entrprsAddress" value="${cpEntrprsMstInstance?.entrprsAddress}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: cpEntrprsMstInstance, field: 'entrprsPhoneNumber', 'error')} ">
	<label for="entrprsPhoneNumber">
		<g:message code="cpEntrprsMst.entrprsPhoneNumber.label" default="Entrprs Phone Number" />
		
	</label>
	<g:textField name="entrprsPhoneNumber" value="${cpEntrprsMstInstance?.entrprsPhoneNumber}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: cpEntrprsMstInstance, field: 'entrprsFaxNumber', 'error')} ">
	<label for="entrprsFaxNumber">
		<g:message code="cpEntrprsMst.entrprsFaxNumber.label" default="Entrprs Fax Number" />
		
	</label>
	<g:textField name="entrprsFaxNumber" value="${cpEntrprsMstInstance?.entrprsFaxNumber}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: cpEntrprsMstInstance, field: 'entrprsEmail', 'error')} ">
	<label for="entrprsEmail">
		<g:message code="cpEntrprsMst.entrprsEmail.label" default="Entrprs Email" />
		
	</label>
	<g:field type="email" name="entrprsEmail" value="${cpEntrprsMstInstance?.entrprsEmail}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: cpEntrprsMstInstance, field: 'entrprsMobile', 'error')} ">
	<label for="entrprsMobile">
		<g:message code="cpEntrprsMst.entrprsMobile.label" default="Entrprs Mobile" />
		
	</label>
	<g:textField name="entrprsMobile" value="${cpEntrprsMstInstance?.entrprsMobile}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: cpEntrprsMstInstance, field: 'entrprsEmailOverseas', 'error')} ">
	<label for="entrprsEmailOverseas">
		<g:message code="cpEntrprsMst.entrprsEmailOverseas.label" default="Entrprs Email Overseas" />
		
	</label>
	<g:textField name="entrprsEmailOverseas" value="${cpEntrprsMstInstance?.entrprsEmailOverseas}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: cpEntrprsMstInstance, field: 'entrprsFaxNumberOverseas', 'error')} ">
	<label for="entrprsFaxNumberOverseas">
		<g:message code="cpEntrprsMst.entrprsFaxNumberOverseas.label" default="Entrprs Fax Number Overseas" />
		
	</label>
	<g:textField name="entrprsFaxNumberOverseas" value="${cpEntrprsMstInstance?.entrprsFaxNumberOverseas}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: cpEntrprsMstInstance, field: 'entrprsMobileOverseas', 'error')} ">
	<label for="entrprsMobileOverseas">
		<g:message code="cpEntrprsMst.entrprsMobileOverseas.label" default="Entrprs Mobile Overseas" />
		
	</label>
	<g:textField name="entrprsMobileOverseas" value="${cpEntrprsMstInstance?.entrprsMobileOverseas}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: cpEntrprsMstInstance, field: 'entrprsPhoneNumberOverseas', 'error')} ">
	<label for="entrprsPhoneNumberOverseas">
		<g:message code="cpEntrprsMst.entrprsPhoneNumberOverseas.label" default="Entrprs Phone Number Overseas" />
		
	</label>
	<g:textField name="entrprsPhoneNumberOverseas" value="${cpEntrprsMstInstance?.entrprsPhoneNumberOverseas}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: cpEntrprsMstInstance, field: 'entrprsAddressOverseas', 'error')} ">
	<label for="entrprsAddressOverseas">
		<g:message code="cpEntrprsMst.entrprsAddressOverseas.label" default="Entrprs Address Overseas" />
		
	</label>
	<g:textField name="entrprsAddressOverseas" value="${cpEntrprsMstInstance?.entrprsAddressOverseas}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: cpEntrprsMstInstance, field: 'proposedProjectName', 'error')} ">
	<label for="proposedProjectName">
		<g:message code="cpEntrprsMst.proposedProjectName.label" default="Proposed Project Name" />
		
	</label>
	<g:textField name="proposedProjectName" value="${cpEntrprsMstInstance?.proposedProjectName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: cpEntrprsMstInstance, field: 'landAreaRequired', 'error')} ">
	<label for="landAreaRequired">
		<g:message code="cpEntrprsMst.landAreaRequired.label" default="Land Area Required" />
		
	</label>
	<g:field name="landAreaRequired" value="${fieldValue(bean: cpEntrprsMstInstance, field: 'landAreaRequired')}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: cpEntrprsMstInstance, field: 'flatAreaRequired', 'error')} ">
	<label for="flatAreaRequired">
		<g:message code="cpEntrprsMst.flatAreaRequired.label" default="Flat Area Required" />
		
	</label>
	<g:field name="flatAreaRequired" value="${fieldValue(bean: cpEntrprsMstInstance, field: 'flatAreaRequired')}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: cpEntrprsMstInstance, field: 'fireRiskArrangement', 'error')} ">
	<label for="fireRiskArrangement">
		<g:message code="cpEntrprsMst.fireRiskArrangement.label" default="Fire Risk Arrangement" />
		
	</label>
	<g:textField name="fireRiskArrangement" value="${cpEntrprsMstInstance?.fireRiskArrangement}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: cpEntrprsMstInstance, field: 'safetySecurityMeasures', 'error')} ">
	<label for="safetySecurityMeasures">
		<g:message code="cpEntrprsMst.safetySecurityMeasures.label" default="Safety Security Measures" />
		
	</label>
	<g:textField name="safetySecurityMeasures" value="${cpEntrprsMstInstance?.safetySecurityMeasures}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: cpEntrprsMstInstance, field: 'financeForeignSource', 'error')} ">
	<label for="financeForeignSource">
		<g:message code="cpEntrprsMst.financeForeignSource.label" default="Finance Foreign Source" />
		
	</label>
	<g:textField name="financeForeignSource" value="${cpEntrprsMstInstance?.financeForeignSource}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: cpEntrprsMstInstance, field: 'financeLocalSource', 'error')} ">
	<label for="financeLocalSource">
		<g:message code="cpEntrprsMst.financeLocalSource.label" default="Finance Local Source" />
		
	</label>
	<g:textField name="financeLocalSource" value="${cpEntrprsMstInstance?.financeLocalSource}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: cpEntrprsMstInstance, field: 'sortOrder', 'error')} ">
	<label for="sortOrder">
		<g:message code="cpEntrprsMst.sortOrder.label" default="Sort Order" />
		
	</label>
	<g:field name="sortOrder" type="number" value="${cpEntrprsMstInstance.sortOrder}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: cpEntrprsMstInstance, field: 'isActive', 'error')} ">
	<label for="isActive">
		<g:message code="cpEntrprsMst.isActive.label" default="Is Active" />
		
	</label>
	<g:checkBox name="isActive" value="${cpEntrprsMstInstance?.isActive}" />

</div>

<div class="fieldcontain ${hasErrors(bean: cpEntrprsMstInstance, field: 'remarks', 'error')} ">
	<label for="remarks">
		<g:message code="cpEntrprsMst.remarks.label" default="Remarks" />
		
	</label>
	<g:textArea name="remarks" cols="40" rows="5" maxlength="500" value="${cpEntrprsMstInstance?.remarks}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: cpEntrprsMstInstance, field: 'entryByUserId', 'error')} ">
	<label for="entryByUserId">
		<g:message code="cpEntrprsMst.entryByUserId.label" default="Entry By User Id" />
		
	</label>
	<g:select id="entryByUserId" name="entryByUserId.id" from="${com.bepza.auth.User.list()}" optionKey="id" value="${cpEntrprsMstInstance?.entryByUserId?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: cpEntrprsMstInstance, field: 'entryDate', 'error')} ">
	<label for="entryDate">
		<g:message code="cpEntrprsMst.entryDate.label" default="Entry Date" />
		
	</label>
	<g:datePicker name="entryDate" precision="day"  value="${cpEntrprsMstInstance?.entryDate}" default="none" noSelection="['': '']" />

</div>

<div class="fieldcontain ${hasErrors(bean: cpEntrprsMstInstance, field: 'modifiedDate', 'error')} ">
	<label for="modifiedDate">
		<g:message code="cpEntrprsMst.modifiedDate.label" default="Modified Date" />
		
	</label>
	<g:datePicker name="modifiedDate" precision="day"  value="${cpEntrprsMstInstance?.modifiedDate}" default="none" noSelection="['': '']" />

</div>

<div class="fieldcontain ${hasErrors(bean: cpEntrprsMstInstance, field: 'modifiedByUserId', 'error')} ">
	<label for="modifiedByUserId">
		<g:message code="cpEntrprsMst.modifiedByUserId.label" default="Modified By User Id" />
		
	</label>
	<g:select id="modifiedByUserId" name="modifiedByUserId.id" from="${com.bepza.auth.User.list()}" optionKey="id" value="${cpEntrprsMstInstance?.modifiedByUserId?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: cpEntrprsMstInstance, field: 'enterpriseLogoPath', 'error')} ">
	<label for="enterpriseLogoPath">
		<g:message code="cpEntrprsMst.enterpriseLogoPath.label" default="Enterprise Logo Path" />
		
	</label>
	<g:textField name="enterpriseLogoPath" value="${cpEntrprsMstInstance?.enterpriseLogoPath}"/>

</div>

