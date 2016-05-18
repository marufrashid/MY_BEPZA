
<%@ page import="com.bepza.common.AllLookup" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'allLookup.label', default: 'All Lookup')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>

	<div class="content-wrapper">
		<!-- Content Header (Page header) -->
		<section class="content-header">
			<h1>
				Show AllLookup
				<small></small>
			</h1>
			<ul class="top-links">
				<li><g:link class="btn btn-block btn-primary btn-xs" action="list"><i
						class="fa fa-reorder"></i>All Lookup list</g:link></li>
				<li><g:link class="btn btn-block btn-primary btn-xs" action="add"><i
						class="fa fa-reorder"></i>Add</g:link></li>
					<li><g:link class="btn btn-block btn-warning btn-xs" action="edit" id="${allLookupInstance?.id}"><i
							class="fa fa-fw fa-edit"></i>Edit</g:link></li>

				
					<li><g:link class="btn btn-block btn-danger btn-xs" action="delete" id="${allLookupInstance?.id}"
								onclick="return confirm('Are you sure you want to delete this record?');"><i
								class="fa fa-trash"></i>Delete</g:link></li>
			</ul>
		</section>

		<!-- Main content -->
		<section class="content">

			<div class="row">
				<div class="col-xs-12">

					<div class="box box-primary">
						%{--<div class="box-header">
							<h3 class="box-title">All Lookup Detail View</h3>
						</div>--}%<!-- /.box-header -->
						<div class="box-body no-padding">
							<table class="table table-striped">
								<g:if test="${allLookupInstance?.parent}">
									<tr>
										<th>Parent Lookup</th>
										<td>${allLookupInstance?.parent?.keyword}</td>
									</tr>
								</g:if>
								<g:if test="${allLookupInstance?.keyword}">
									<tr>
										<th>Keyword</th>
										<td>${allLookupInstance?.keyword}</td>
									</tr>
								</g:if>
								<g:if test="${allLookupInstance?.title}">
									<tr>
										<th>Title</th>
										<td>${allLookupInstance?.title}</td>
									</tr>
								</g:if>

								<tr>
									<th>Enabled?</th>
									<td><g:formatBoolean
											boolean="${allLookupInstance?.isActive}" true="Yes" false="No"/></td>
								</tr>
							</table>
						</div><!-- /.box-body -->
					</div><!-- /.box -->
				</div>
			</div>
		</section><!-- /.content -->
	</div><!-- /.content-wrapper -->
	</body>
</html>
