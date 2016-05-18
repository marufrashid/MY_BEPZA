<%@ page import="com.bepza.vr.VrBlockList" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'vrBlockList.label', default: 'Block List')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<div class="content-wrapper">

    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            Block List
        </h1>
        <ul class="top-links">
            <li><g:link class="btn btn-block btn-primary btn-xs" action="add">
                <i class="fa fa-plus"></i>Add</g:link></li>
        </ul>
    </section>
    <!-- /.content-header -->

    <!-- Main content -->
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

        <div class="box box-info">
            <g:form action="list" method="get">
                <div class="box-header with-border">
                    <h3 class="box-title">Search</h3>

                    <div class="box-tools pull-right">
                        <button class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip"
                                title="Collapse"><i class="fa fa-minus"></i></button>
                    </div>
                </div>

                <div class="box-body">
                    <div class="row">
                        <div class="col-md-5">
                            <div class="form-group">
                                <label>Document Name</label>
                                <g:textField name="docTypeName" id="docTypeName"
                                             value="${params?.docTypeName}" class="form-control input-sm"/>
                            </div><!-- /.form-group -->
                        </div><!-- /.col -->
                        <div class="col-md-5">
                            <div class="form-group">
                                <label>Is Mandatory</label>
                                <g:select from="${['Mandatory', 'Not Mandatory']}" name="isMandatory" id="isMandatory"
                                          value="${params?.isMandatory}" class="form-control input-sm"
                                          noSelection="${['': 'Select One']}"/>
                            </div><!-- /.form-group -->
                        </div><!-- /.col -->
                        <div class="col-md-2">
                            <div class="form-group">

                                <div>&nbsp;</div>
                                <button type="submit" class="btn btn-primary pull-right"><i
                                        class="fa fa-search"></i>Search
                                </button>
                            </div><!-- /.form-group -->
                        </div><!-- /.col -->
                    </div><!-- /.row -->
                </div><!-- /.box-body -->
            </g:form>
        </div>

        <div class="row">
            <div class="col-xs-12">
                <div class="box box-primary">

                    <div class="box-body table-responsive no-padding">
                        <table class="table table-hover">
                            <thead>
                            <tr>

                                <g:sortableColumn property="code"
                                                  title="${message(code: 'vrBlockList.code.label', default: 'Code')}"/>

                                <th><g:message code="vrBlockList.enterprise.label" default="Enterprise"/></th>

                                <g:sortableColumn property="nameOfForeigner"
                                                  title="${message(code: 'vrBlockList.nameOfForeigner.label', default: 'Name Of Foreigner')}"/>

                                <g:sortableColumn property="passportNo"
                                                  title="${message(code: 'vrBlockList.passportNo.label', default: 'Passport No')}"/>

                                <th><g:message code="vrBlockList.nationality.label" default="Nationality"/></th>

                                <g:sortableColumn property="placeOfIssue"
                                                  title="${message(code: 'vrBlockList.placeOfIssue.label', default: 'Place Of Issue')}"/>


                                <th style="width: 150px;text-align: center">Action</th>

                            </tr>
                            </thead>
                            <tbody>

                            <g:each in="${vrBlockListInstanceList}" status="i" var="vrBlockListInstance">
                                <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                                    <td><g:link action="show"
                                                id="${vrBlockListInstance.id}">${fieldValue(bean: vrBlockListInstance, field: "code")}</g:link></td>

                                    <td>${fieldValue(bean: vrBlockListInstance, field: "enterprise")}</td>

                                    <td>${fieldValue(bean: vrBlockListInstance, field: "nameOfForeigner")}</td>

                                    <td>${fieldValue(bean: vrBlockListInstance, field: "passportNo")}</td>

                                    <td>${fieldValue(bean: vrBlockListInstance, field: "nationality")}</td>

                                    <td>${fieldValue(bean: vrBlockListInstance, field: "placeOfIssue")}</td>

                                    <td style="text-align: center">
                                        <div class="list-action">
                                            <sec:access url="/vrBlockList/show/${vrBlockListInstance.id}">
                                                <g:link action="show" id="${vrBlockListInstance.id}" title="View"
                                                        alt="View"><i class="fa fa-file-text-o"></i>View</g:link>
                                            </sec:access>
                                            <sec:access url="/vrBlockList/edit/${vrBlockListInstance.id}">
                                                <g:link action="edit" id="${vrBlockListInstance.id}"><i
                                                        class="fa fa-fw fa-edit"></i>Edit</g:link>
                                            </sec:access>
                                        </div>
                                    </td>

                                </tr>
                            </g:each>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-xs-12">
                <div class="pagination pull-right" id="pagination">
                    <g:paginate total="${vrBlockListInstanceCount ?: 0}"/>
                </div>
            </div>
        </div>
    </section>
</div>
<script type="text/javascript">
    $(document).ready(function () {
        $('.cDate').datepicker();
    });
</script>
</body>
</html>









%{--
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
--}%
