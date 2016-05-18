<%@ page import="com.bepza.common.AllCodeDef" %>



<div class="fieldcontain ${hasErrors(bean: allCodeDefInstance, field: 'code', 'error')} required">
	<label for="code">
		<g:message code="allCodeDef.code.label" default="Code" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="code" maxlength="100" required="" value="${allCodeDefInstance?.code}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: allCodeDefInstance, field: 'tableName', 'error')} ">
	<label for="tableName">
		<g:message code="allCodeDef.tableName.label" default="Table Name" />
		
	</label>
	<g:textField name="tableName" maxlength="30" value="${allCodeDefInstance?.tableName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: allCodeDefInstance, field: 'cdLength', 'error')} ">
	<label for="cdLength">
		<g:message code="allCodeDef.cdLength.label" default="Cd Length" />
		
	</label>
	<g:field name="cdLength" type="number" value="${allCodeDefInstance.cdLength}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: allCodeDefInstance, field: 'dscrptn', 'error')} ">
	<label for="dscrptn">
		<g:message code="allCodeDef.dscrptn.label" default="Dscrptn" />
		
	</label>
	<g:textArea name="dscrptn" cols="40" rows="5" maxlength="500" value="${allCodeDefInstance?.dscrptn}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: allCodeDefInstance, field: 'nxtVal', 'error')} ">
	<label for="nxtVal">
		<g:message code="allCodeDef.nxtVal.label" default="Nxt Val" />
		
	</label>
	<g:field name="nxtVal" type="number" value="${allCodeDefInstance.nxtVal}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: allCodeDefInstance, field: 'pojoClass', 'error')} ">
	<label for="pojoClass">
		<g:message code="allCodeDef.pojoClass.label" default="Pojo Class" />
		
	</label>
	<g:textField name="pojoClass" maxlength="30" value="${allCodeDefInstance?.pojoClass}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: allCodeDefInstance, field: 'prefix', 'error')} ">
	<label for="prefix">
		<g:message code="allCodeDef.prefix.label" default="Prefix" />
		
	</label>
	<g:textField name="prefix" maxlength="30" value="${allCodeDefInstance?.prefix}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: allCodeDefInstance, field: 'entryDate', 'error')} ">
	<label for="entryDate">
		<g:message code="allCodeDef.entryDate.label" default="Entry Date" />
		
	</label>
	<g:datePicker name="entryDate" precision="day"  value="${allCodeDefInstance?.entryDate}" default="none" noSelection="['': '']" />

</div>

<div class="fieldcontain ${hasErrors(bean: allCodeDefInstance, field: 'modifiedDate', 'error')} ">
	<label for="modifiedDate">
		<g:message code="allCodeDef.modifiedDate.label" default="Modified Date" />
		
	</label>
	<g:datePicker name="modifiedDate" precision="day"  value="${allCodeDefInstance?.modifiedDate}" default="none" noSelection="['': '']" />

</div>

<div class="fieldcontain ${hasErrors(bean: allCodeDefInstance, field: 'entryByUserId', 'error')} ">
	<label for="entryByUserId">
		<g:message code="allCodeDef.entryByUserId.label" default="Entry By User Id" />
		
	</label>
	<g:select id="entryByUserId" name="entryByUserId.id" from="${com.bepza.auth.User.list()}" optionKey="id" value="${allCodeDefInstance?.entryByUserId?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: allCodeDefInstance, field: 'modifiedByUserId', 'error')} ">
	<label for="modifiedByUserId">
		<g:message code="allCodeDef.modifiedByUserId.label" default="Modified By User Id" />
		
	</label>
	<g:select id="modifiedByUserId" name="modifiedByUserId.id" from="${com.bepza.auth.User.list()}" optionKey="id" value="${allCodeDefInstance?.modifiedByUserId?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>

