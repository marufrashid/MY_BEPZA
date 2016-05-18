
<%@ page import="com.bepza.common.AllCodeDef" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'allCodeDef.label', default: 'AllCodeDef')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-allCodeDef" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-allCodeDef" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="code" title="${message(code: 'allCodeDef.code.label', default: 'Code')}" />
					
						<g:sortableColumn property="tableName" title="${message(code: 'allCodeDef.tableName.label', default: 'Table Name')}" />
					
						<g:sortableColumn property="cdLength" title="${message(code: 'allCodeDef.cdLength.label', default: 'Cd Length')}" />
					
						<g:sortableColumn property="dscrptn" title="${message(code: 'allCodeDef.dscrptn.label', default: 'Dscrptn')}" />
					
						<g:sortableColumn property="nxtVal" title="${message(code: 'allCodeDef.nxtVal.label', default: 'Nxt Val')}" />
					
						<g:sortableColumn property="pojoClass" title="${message(code: 'allCodeDef.pojoClass.label', default: 'Pojo Class')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${allCodeDefInstanceList}" status="i" var="allCodeDefInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${allCodeDefInstance.id}">${fieldValue(bean: allCodeDefInstance, field: "code")}</g:link></td>
					
						<td>${fieldValue(bean: allCodeDefInstance, field: "tableName")}</td>
					
						<td>${fieldValue(bean: allCodeDefInstance, field: "cdLength")}</td>
					
						<td>${fieldValue(bean: allCodeDefInstance, field: "dscrptn")}</td>
					
						<td>${fieldValue(bean: allCodeDefInstance, field: "nxtVal")}</td>
					
						<td>${fieldValue(bean: allCodeDefInstance, field: "pojoClass")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${allCodeDefInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
