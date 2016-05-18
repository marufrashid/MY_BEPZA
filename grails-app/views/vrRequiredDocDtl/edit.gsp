<%@ page import="com.bepza.vr.VrRequiredDocDtl" %>
<!DOCTYPE html>
<html>
<head>
	<meta name="layout" content="main">
	<g:set var="entityName" value="${message(code: 'vrRequiredDocDtl.label', default: 'Required Document')}"/>
	<title><g:message code="default.edit.label" args="[entityName]"/></title>
</head>

<body>
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>
			Edit Required Document
		</h1>
		<ul class="top-links">
			<li><g:link class="btn btn-block btn-primary btn-xs" action="add"><i
					class="fa fa-plus"></i>Add</g:link></li>
			<li><g:link class="btn btn-block btn-primary btn-xs" action="list"><i
					class="fa fa-reorder"></i>List</g:link></li>
		</ul>
	</section>
	<!-- /.content-header -->

	<section class="content">
	<!-- flash message -->
		<g:if test="${flash.success}">
			<div class="alert alert-success alert-dismissable">
				<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
				<i class="icon fa fa-check"></i>
				${flash.success}
			</div>
		</g:if>
		<g:elseif test="${flash.error}">
			<div class="alert alert-danger alert-dismissable">
				<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
				<i class="icon fa fa-remove"></i>
				${flash.error}
			</div>
		</g:elseif>
		<g:elseif test="${flash.message}">
			<div class="alert alert-info alert-dismissable">
				<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
				<i class="icon fa fa-info"></i>
				${flash.message}
			</div>
		</g:elseif>
	<!-- flash message end -->

		<div class="row">
			<div class="col-xs-12">

				<!-- Horizontal Form -->
				<div class="box box-primary">
				%{-- <div class="box-header with-border">
                        <h3 class="box-title">Document Type Edit Form</h3>
                    </div>--}%<!-- /.box-header -->
				<!-- form start -->
					<g:form url="${request.queryString ? request.forwardURI + '?' + request.queryString : request.forwardURI}"
							method="post"
							class="form-horizontal rqDocTypeForm">
						<div class="box-body">
							<g:hiddenField name="id" value="${vrRequiredDocDtlInstance.id}"></g:hiddenField>
							<g:render template="form"/>
						</div>

						<div class="box-footer">
							<sec:access url="/vrRequiredDocDtl/delete/${vrRequiredDocDtlInstance.id}">
								<g:link action="delete" id="${vrRequiredDocDtlInstance.id}" class="btn btn-danger"><i
										class="fa fa-trash"></i>Delete
								</g:link>
							</sec:access>
							<button type="submit" class="btn btn-primary pull-right"><i class="fa fa-save"></i>Update
							</button>
						</div><!-- /.box-footer -->
					</g:form>
				</div><!-- /.box -->
			</div>
		</div>

	</section><!-- /.content -->
</div><!-- /.content-wrapper -->
</body>
</html>

