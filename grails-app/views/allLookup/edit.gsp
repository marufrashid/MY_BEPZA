<%@ page import="com.bepza.common.AllLookup" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'allLookup.label', default: 'AllLookup')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
	</head>
	<body>

	<!-- Content Wrapper. Contains page content -->
	<div class="content-wrapper">
		<!-- Content Header (Page header) -->
		<section class="content-header">
			<h1>
				Edit Lookup
				<small></small>
			</h1>
			<ul class="top-links">
				<li><g:link class="btn btn-block btn-primary btn-xs" action="list"><i
						class="fa fa-reorder"></i>All Lookup list</g:link></li>
			</ul>
		</section>

		<!-- Main content -->
		<section class="content">

			<div class="row">
				<div class="col-xs-12">

					<!-- Horizontal Form -->
					<div class="box box-primary">
						%{--<div class="box-header with-border">
							<h3 class="box-title">Lookup Edit Form</h3>
						</div>--}%<!-- /.box-header -->

					<g:form action="update" method="post" class="formValLookUp form-horizontal">
						<g:hiddenField name="id" value="${allLookupInstance?.id}" />
						<g:hiddenField name="version" value="${allLookupInstance?.version}" />
						<div class="box-body">
							<g:render template="form"/>
						</div>
						<div class="box-footer">
							<g:submitButton name="update" class="button blue"
											value="${message(code: 'default.button.update.label', default: 'Update')}"/>
						</div>
					</g:form>

				</div><!-- /.box -->
				</div>
			</div>

	</section><!-- /.content -->
	</div><!-- /.content-wrapper -->

	%{--<div id="container">
		<div id="content-block">
			<!--page heading-->
			<div id="div-title-page">
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td>
							<h2>Edit AllLookup List</h2>
						</td>
					</tr>
				</table>
			</div>
		--}%%{--<a href="#edit-allLookup" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>--}%%{--
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="edit-allLookup" class="content scaffold-edit" role="main">
			--}%%{--<h1><g:message code="default.edit.label" args="[entityName]" /></h1>--}%%{--
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${allLookupInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${allLookupInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>

		</div>
			</div>
		</div>--}%
	</body>
</html>
