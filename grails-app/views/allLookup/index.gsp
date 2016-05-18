
<%@ page import="com.bepza.common.AllLookup" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'allLookup.label', default: 'AllLookup')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-allLookup" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-allLookup" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="keyword" title="${message(code: 'allLookup.keyword.label', default: 'Keyword')}" />
					
						<g:sortableColumn property="sortBy" title="${message(code: 'allLookup.sortBy.label', default: 'Sort By')}" />
					
						<g:sortableColumn property="title" title="${message(code: 'allLookup.title.label', default: 'Title')}" />
					
						<g:sortableColumn property="isActive" title="${message(code: 'allLookup.isActive.label', default: 'Is Active')}" />
					
						<th><g:message code="allLookup.parent.label" default="Parent" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${allLookupInstanceList}" status="i" var="allLookupInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${allLookupInstance.id}">${fieldValue(bean: allLookupInstance, field: "keyword")}</g:link></td>
					
						<td>${fieldValue(bean: allLookupInstance, field: "sortBy")}</td>
					
						<td>${fieldValue(bean: allLookupInstance, field: "title")}</td>
					
						<td><g:formatBoolean boolean="${allLookupInstance.isActive}" /></td>
					
						<td>${fieldValue(bean: allLookupInstance, field: "parent")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${allLookupInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
