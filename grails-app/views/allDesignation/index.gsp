
<%@ page import="com.bepza.common.AllDesignation" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'allDesignation.label', default: 'AllDesignation')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-allDesignation" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-allDesignation" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="code" title="${message(code: 'allDesignation.code.label', default: 'Code')}" />
					
						<g:sortableColumn property="designationName" title="${message(code: 'allDesignation.designationName.label', default: 'Designation Name')}" />
					
						<g:sortableColumn property="shortName" title="${message(code: 'allDesignation.shortName.label', default: 'Short Name')}" />
					
						<g:sortableColumn property="sortOrder" title="${message(code: 'allDesignation.sortOrder.label', default: 'Sort Order')}" />
					
						<g:sortableColumn property="isActive" title="${message(code: 'allDesignation.isActive.label', default: 'Is Active')}" />
					
						<g:sortableColumn property="remarks" title="${message(code: 'allDesignation.remarks.label', default: 'Remarks')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${allDesignationInstanceList}" status="i" var="allDesignationInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${allDesignationInstance.id}">${fieldValue(bean: allDesignationInstance, field: "code")}</g:link></td>
					
						<td>${fieldValue(bean: allDesignationInstance, field: "designationName")}</td>
					
						<td>${fieldValue(bean: allDesignationInstance, field: "shortName")}</td>
					
						<td>${fieldValue(bean: allDesignationInstance, field: "sortOrder")}</td>
					
						<td><g:formatBoolean boolean="${allDesignationInstance.isActive}" /></td>
					
						<td>${fieldValue(bean: allDesignationInstance, field: "remarks")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${allDesignationInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
