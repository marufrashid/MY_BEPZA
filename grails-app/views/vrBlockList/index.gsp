
<%@ page import="com.bepza.vr.VrBlockList" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'vrBlockList.label', default: 'VrBlockList')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-vrBlockList" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-vrBlockList" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="code" title="${message(code: 'vrBlockList.code.label', default: 'Code')}" />
					
						<th><g:message code="vrBlockList.enterprise.label" default="Enterprise" /></th>
					
						<g:sortableColumn property="nameOfForeigner" title="${message(code: 'vrBlockList.nameOfForeigner.label', default: 'Name Of Foreigner')}" />
					
						<g:sortableColumn property="passportNo" title="${message(code: 'vrBlockList.passportNo.label', default: 'Passport No')}" />
					
						<th><g:message code="vrBlockList.nationality.label" default="Nationality" /></th>
					
						<g:sortableColumn property="placeOfIssue" title="${message(code: 'vrBlockList.placeOfIssue.label', default: 'Place Of Issue')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${vrBlockListInstanceList}" status="i" var="vrBlockListInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${vrBlockListInstance.id}">${fieldValue(bean: vrBlockListInstance, field: "code")}</g:link></td>
					
						<td>${fieldValue(bean: vrBlockListInstance, field: "enterprise")}</td>
					
						<td>${fieldValue(bean: vrBlockListInstance, field: "nameOfForeigner")}</td>
					
						<td>${fieldValue(bean: vrBlockListInstance, field: "passportNo")}</td>
					
						<td>${fieldValue(bean: vrBlockListInstance, field: "nationality")}</td>
					
						<td>${fieldValue(bean: vrBlockListInstance, field: "placeOfIssue")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${vrBlockListInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
