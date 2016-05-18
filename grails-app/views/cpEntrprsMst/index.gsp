
<%@ page import="com.bepza.common.CpEntrprsMst" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'cpEntrprsMst.label', default: 'CpEntrprsMst')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-cpEntrprsMst" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-cpEntrprsMst" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="applicationCode" title="${message(code: 'cpEntrprsMst.applicationCode.label', default: 'Application Code')}" />
					
						<g:sortableColumn property="allotmentCode" title="${message(code: 'cpEntrprsMst.allotmentCode.label', default: 'Allotment Code')}" />
					
						<g:sortableColumn property="sanctionCode" title="${message(code: 'cpEntrprsMst.sanctionCode.label', default: 'Sanction Code')}" />
					
						<g:sortableColumn property="entrprsAddressLocal" title="${message(code: 'cpEntrprsMst.entrprsAddressLocal.label', default: 'Entrprs Address Local')}" />
					
						<g:sortableColumn property="code" title="${message(code: 'cpEntrprsMst.code.label', default: 'Code')}" />
					
						<g:sortableColumn property="applicantName" title="${message(code: 'cpEntrprsMst.applicantName.label', default: 'Applicant Name')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${cpEntrprsMstInstanceList}" status="i" var="cpEntrprsMstInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${cpEntrprsMstInstance.id}">${fieldValue(bean: cpEntrprsMstInstance, field: "applicationCode")}</g:link></td>
					
						<td>${fieldValue(bean: cpEntrprsMstInstance, field: "allotmentCode")}</td>
					
						<td>${fieldValue(bean: cpEntrprsMstInstance, field: "sanctionCode")}</td>
					
						<td>${fieldValue(bean: cpEntrprsMstInstance, field: "entrprsAddressLocal")}</td>
					
						<td>${fieldValue(bean: cpEntrprsMstInstance, field: "code")}</td>
					
						<td>${fieldValue(bean: cpEntrprsMstInstance, field: "applicantName")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${cpEntrprsMstInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
