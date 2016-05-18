
<%@ page import="com.bepza.common.AllCodeDef" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'allCodeDef.label', default: 'AllCodeDef')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-allCodeDef" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-allCodeDef" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list allCodeDef">
			
				<g:if test="${allCodeDefInstance?.code}">
				<li class="fieldcontain">
					<span id="code-label" class="property-label"><g:message code="allCodeDef.code.label" default="Code" /></span>
					
						<span class="property-value" aria-labelledby="code-label"><g:fieldValue bean="${allCodeDefInstance}" field="code"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${allCodeDefInstance?.tableName}">
				<li class="fieldcontain">
					<span id="tableName-label" class="property-label"><g:message code="allCodeDef.tableName.label" default="Table Name" /></span>
					
						<span class="property-value" aria-labelledby="tableName-label"><g:fieldValue bean="${allCodeDefInstance}" field="tableName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${allCodeDefInstance?.cdLength}">
				<li class="fieldcontain">
					<span id="cdLength-label" class="property-label"><g:message code="allCodeDef.cdLength.label" default="Cd Length" /></span>
					
						<span class="property-value" aria-labelledby="cdLength-label"><g:fieldValue bean="${allCodeDefInstance}" field="cdLength"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${allCodeDefInstance?.dscrptn}">
				<li class="fieldcontain">
					<span id="dscrptn-label" class="property-label"><g:message code="allCodeDef.dscrptn.label" default="Dscrptn" /></span>
					
						<span class="property-value" aria-labelledby="dscrptn-label"><g:fieldValue bean="${allCodeDefInstance}" field="dscrptn"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${allCodeDefInstance?.nxtVal}">
				<li class="fieldcontain">
					<span id="nxtVal-label" class="property-label"><g:message code="allCodeDef.nxtVal.label" default="Nxt Val" /></span>
					
						<span class="property-value" aria-labelledby="nxtVal-label"><g:fieldValue bean="${allCodeDefInstance}" field="nxtVal"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${allCodeDefInstance?.pojoClass}">
				<li class="fieldcontain">
					<span id="pojoClass-label" class="property-label"><g:message code="allCodeDef.pojoClass.label" default="Pojo Class" /></span>
					
						<span class="property-value" aria-labelledby="pojoClass-label"><g:fieldValue bean="${allCodeDefInstance}" field="pojoClass"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${allCodeDefInstance?.prefix}">
				<li class="fieldcontain">
					<span id="prefix-label" class="property-label"><g:message code="allCodeDef.prefix.label" default="Prefix" /></span>
					
						<span class="property-value" aria-labelledby="prefix-label"><g:fieldValue bean="${allCodeDefInstance}" field="prefix"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${allCodeDefInstance?.entryDate}">
				<li class="fieldcontain">
					<span id="entryDate-label" class="property-label"><g:message code="allCodeDef.entryDate.label" default="Entry Date" /></span>
					
						<span class="property-value" aria-labelledby="entryDate-label"><g:formatDate date="${allCodeDefInstance?.entryDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${allCodeDefInstance?.modifiedDate}">
				<li class="fieldcontain">
					<span id="modifiedDate-label" class="property-label"><g:message code="allCodeDef.modifiedDate.label" default="Modified Date" /></span>
					
						<span class="property-value" aria-labelledby="modifiedDate-label"><g:formatDate date="${allCodeDefInstance?.modifiedDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${allCodeDefInstance?.entryByUserId}">
				<li class="fieldcontain">
					<span id="entryByUserId-label" class="property-label"><g:message code="allCodeDef.entryByUserId.label" default="Entry By User Id" /></span>
					
						<span class="property-value" aria-labelledby="entryByUserId-label"><g:link controller="user" action="show" id="${allCodeDefInstance?.entryByUserId?.id}">${allCodeDefInstance?.entryByUserId?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${allCodeDefInstance?.modifiedByUserId}">
				<li class="fieldcontain">
					<span id="modifiedByUserId-label" class="property-label"><g:message code="allCodeDef.modifiedByUserId.label" default="Modified By User Id" /></span>
					
						<span class="property-value" aria-labelledby="modifiedByUserId-label"><g:link controller="user" action="show" id="${allCodeDefInstance?.modifiedByUserId?.id}">${allCodeDefInstance?.modifiedByUserId?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:allCodeDefInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${allCodeDefInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
