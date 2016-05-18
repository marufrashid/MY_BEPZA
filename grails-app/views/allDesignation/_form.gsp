<%@ page import="com.bepza.common.AllDesignation" %>



<div class="fieldcontain ${hasErrors(bean: allDesignationInstance, field: 'code', 'error')} required">
	<label for="code">
		<g:message code="allDesignation.code.label" default="Code" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="code" maxlength="30" required="" value="${allDesignationInstance?.code}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: allDesignationInstance, field: 'designationName', 'error')} required">
	<label for="designationName">
		<g:message code="allDesignation.designationName.label" default="Designation Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="designationName" maxlength="100" required="" value="${allDesignationInstance?.designationName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: allDesignationInstance, field: 'shortName', 'error')} ">
	<label for="shortName">
		<g:message code="allDesignation.shortName.label" default="Short Name" />
		
	</label>
	<g:textField name="shortName" maxlength="20" value="${allDesignationInstance?.shortName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: allDesignationInstance, field: 'sortOrder', 'error')} ">
	<label for="sortOrder">
		<g:message code="allDesignation.sortOrder.label" default="Sort Order" />
		
	</label>
	<g:field name="sortOrder" type="number" value="${allDesignationInstance.sortOrder}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: allDesignationInstance, field: 'isActive', 'error')} ">
	<label for="isActive">
		<g:message code="allDesignation.isActive.label" default="Is Active" />
		
	</label>
	<g:checkBox name="isActive" value="${allDesignationInstance?.isActive}" />

</div>

<div class="fieldcontain ${hasErrors(bean: allDesignationInstance, field: 'remarks', 'error')} ">
	<label for="remarks">
		<g:message code="allDesignation.remarks.label" default="Remarks" />
		
	</label>
	<g:textArea name="remarks" cols="40" rows="5" maxlength="500" value="${allDesignationInstance?.remarks}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: allDesignationInstance, field: 'entryDate', 'error')} ">
	<label for="entryDate">
		<g:message code="allDesignation.entryDate.label" default="Entry Date" />
		
	</label>
	<g:datePicker name="entryDate" precision="day"  value="${allDesignationInstance?.entryDate}" default="none" noSelection="['': '']" />

</div>

<div class="fieldcontain ${hasErrors(bean: allDesignationInstance, field: 'modifiedDate', 'error')} ">
	<label for="modifiedDate">
		<g:message code="allDesignation.modifiedDate.label" default="Modified Date" />
		
	</label>
	<g:datePicker name="modifiedDate" precision="day"  value="${allDesignationInstance?.modifiedDate}" default="none" noSelection="['': '']" />

</div>

<div class="fieldcontain ${hasErrors(bean: allDesignationInstance, field: 'entryByUserId', 'error')} ">
	<label for="entryByUserId">
		<g:message code="allDesignation.entryByUserId.label" default="Entry By User Id" />
		
	</label>
	<g:select id="entryByUserId" name="entryByUserId.id" from="${com.bepza.auth.User.list()}" optionKey="id" value="${allDesignationInstance?.entryByUserId?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: allDesignationInstance, field: 'modifiedByUserId', 'error')} ">
	<label for="modifiedByUserId">
		<g:message code="allDesignation.modifiedByUserId.label" default="Modified By User Id" />
		
	</label>
	<g:select id="modifiedByUserId" name="modifiedByUserId.id" from="${com.bepza.auth.User.list()}" optionKey="id" value="${allDesignationInstance?.modifiedByUserId?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>

