<%@ page import="com.bepza.vr.VrBlockList" %>



<div class="fieldcontain ${hasErrors(bean: vrBlockListInstance, field: 'code', 'error')} ">
	<label for="code">
		<g:message code="vrBlockList.code.label" default="Code" />
		
	</label>
	<g:textField name="code" value="${vrBlockListInstance?.code}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: vrBlockListInstance, field: 'enterprise', 'error')} ">
	<label for="enterprise">
		<g:message code="vrBlockList.enterprise.label" default="Enterprise" />
		
	</label>
	<g:select id="enterprise" name="enterprise.id" from="${com.bepza.cp.CpEntrprsMst.list()}" optionKey="id" value="${vrBlockListInstance?.enterprise?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: vrBlockListInstance, field: 'nameOfForeigner', 'error')} required">
	<label for="nameOfForeigner">
		<g:message code="vrBlockList.nameOfForeigner.label" default="Name Of Foreigner" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nameOfForeigner" required="" value="${vrBlockListInstance?.nameOfForeigner}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: vrBlockListInstance, field: 'passportNo', 'error')} required">
	<label for="passportNo">
		<g:message code="vrBlockList.passportNo.label" default="Passport No" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="passportNo" required="" value="${vrBlockListInstance?.passportNo}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: vrBlockListInstance, field: 'nationality', 'error')} ">
	<label for="nationality">
		<g:message code="vrBlockList.nationality.label" default="Nationality" />
		
	</label>
	<g:select id="nationality" name="nationality.id" from="${com.bepza.common.AllLookup.list()}" optionKey="id" value="${vrBlockListInstance?.nationality?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: vrBlockListInstance, field: 'placeOfIssue', 'error')} ">
	<label for="placeOfIssue">
		<g:message code="vrBlockList.placeOfIssue.label" default="Place Of Issue" />
		
	</label>
	<g:textField name="placeOfIssue" value="${vrBlockListInstance?.placeOfIssue}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: vrBlockListInstance, field: 'dateOfIssue', 'error')} ">
	<label for="dateOfIssue">
		<g:message code="vrBlockList.dateOfIssue.label" default="Date Of Issue" />
		
	</label>
	<g:datePicker name="dateOfIssue" precision="day"  value="${vrBlockListInstance?.dateOfIssue}" default="none" noSelection="['': '']" />

</div>

<div class="fieldcontain ${hasErrors(bean: vrBlockListInstance, field: 'dateOfBirth', 'error')} ">
	<label for="dateOfBirth">
		<g:message code="vrBlockList.dateOfBirth.label" default="Date Of Birth" />
		
	</label>
	<g:datePicker name="dateOfBirth" precision="day"  value="${vrBlockListInstance?.dateOfBirth}" default="none" noSelection="['': '']" />

</div>

<div class="fieldcontain ${hasErrors(bean: vrBlockListInstance, field: 'isActive', 'error')} ">
	<label for="isActive">
		<g:message code="vrBlockList.isActive.label" default="Is Active" />
		
	</label>
	<g:checkBox name="isActive" value="${vrBlockListInstance?.isActive}" />

</div>

<div class="fieldcontain ${hasErrors(bean: vrBlockListInstance, field: 'createdDate', 'error')} required">
	<label for="createdDate">
		<g:message code="vrBlockList.createdDate.label" default="Created Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="createdDate" precision="day"  value="${vrBlockListInstance?.createdDate}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: vrBlockListInstance, field: 'createdBy', 'error')} required">
	<label for="createdBy">
		<g:message code="vrBlockList.createdBy.label" default="Created By" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="createdBy" name="createdBy.id" from="${com.bepza.auth.User.list()}" optionKey="id" required="" value="${vrBlockListInstance?.createdBy?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: vrBlockListInstance, field: 'modifiedDate', 'error')} ">
	<label for="modifiedDate">
		<g:message code="vrBlockList.modifiedDate.label" default="Modified Date" />
		
	</label>
	<g:datePicker name="modifiedDate" precision="day"  value="${vrBlockListInstance?.modifiedDate}" default="none" noSelection="['': '']" />

</div>

<div class="fieldcontain ${hasErrors(bean: vrBlockListInstance, field: 'modifiedBy', 'error')} ">
	<label for="modifiedBy">
		<g:message code="vrBlockList.modifiedBy.label" default="Modified By" />
		
	</label>
	<g:select id="modifiedBy" name="modifiedBy.id" from="${com.bepza.auth.User.list()}" optionKey="id" value="${vrBlockListInstance?.modifiedBy?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>



