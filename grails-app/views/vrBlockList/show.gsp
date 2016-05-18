<%@ page import="com.bepza.vr.VrBlockList" %>

<%@ page import="com.bepza.vr.VrBlockList" %>

<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'vrBlockList.label', default: 'Required Document')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            Required Document Details
        </h1>
        <ul class="top-links">
            <li><g:link class="btn btn-block btn-primary btn-xs" action="list"><i
                    class="fa fa-reorder"></i>list</g:link></li>
            <sec:access url="/vrBlockList/create">
                <li><g:link class="btn btn-block btn-primary btn-xs" action="add"><i
                        class="fa fa-plus"></i>Add</g:link></li>
            </sec:access>
            <sec:access url="/vrBlockList/edit/${vrBlockListInstance?.id}">%{--approvalEnterpriseGroup--}%
                <li><g:link class="btn btn-block btn-warning btn-xs" action="edit"
                            id="${vrBlockListInstance?.id}"><i
                            class="fa fa-fw fa-edit"></i>Edit</g:link></li>
            </sec:access>
            <sec:access url="/vrBlockList/delete/${vrBlockListInstance?.id}">
                <li><g:link class="btn btn-block btn-danger btn-xs" action="delete"
                            id="${vrBlockListInstance?.id}"
                            onclick="return confirm('Are you sure you want to delete this record?');"><i
                            class="fa fa-trash"></i>Delete</g:link></li>
            </sec:access>
        </ul>
    </section>

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
        <div class="row">
            <div class="col-xs-12">

                <div class="box box-primary">
                    <div class="box-header">
                        %{-- <fieldset><legend class="text-green"><g:message code="vrBlockList.documentType.label"
                                                                         default="Document Type"/></legend>--}%

                        <div class="row">
                            <div class="col-md-12">
                                %{--<table class="table table-bordered">
                                    <tr>
                                        <th><g:message code="vrBlockList.docFor.label"
                                                       default="Document For:"/></th>
                                        <td>${vrBlockListInstance?.docFor}</td>
                                        <th></th>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <th><g:message code="vrBlockList.docTypeName.label"
                                                       default="Document Name:"/></th>
                                        <td>${vrBlockListInstance?.docTypeName}</td>
                                        <th><g:message code="vrBlockList.docTypeDescription.label"
                                                       default="Document Description:"/></th>
                                        <td>${vrBlockListInstance?.docTypeDescription}</td>
                                    </tr>
                                    <tr>
                                        <th><g:message code="vrBlockList.fileSizeByte.label"
                                                       default="File Size(In Byte):"/></th>
                                        <td>${vrBlockListInstance?.fileSizeByte}</td>

                                        <th><g:message code="vrBlockList.allowedExtensions.label"
                                                       default="Allowed Extensions:"/></th>
                                        <td>${vrBlockListInstance?.allowedExtensions}</td>
                                    </tr>
                                    <tr>
                                        <th><g:message code="vrBlockList.remarks.label" default="Remarks:"/></th>
                                        <td>${vrBlockListInstance?.remarks}</td>
                                        <th><g:message code="vrBlockList.sortOrder.label"
                                                       default="Sort Order:"/></th>
                                        <td>${vrBlockListInstance?.sortOrder}</td>
                                    </tr>
                                    <tr>
                                        <th><g:message code="vrBlockList.isActive.label" default="Is Active?"/></th>
                                        <td>${vrBlockListInstance?.isActive == true ? "Active" : "Inactive"}</td>
                                        <th><g:message code="vrBlockList.isMandatory.label" default="Is Mandatory ?"/></th>
                                        <td>${vrBlockListInstance?.isMandatory == true ? "Mandatory" : "Not Mandatory"}</td>
                                    </tr>
                                    <tr>
                                        <th><g:message code="vrBlockList.createdBy.label"
                                                       default="Created By:"/></th>
                                        <td>${vrBlockListInstance?.createdBy}</td>
                                        <th><g:message code="vrBlockList.createdDate.label"
                                                       default="Created Date:"/></th>
                                        <td><g:formatDate
                                                date="${vrBlockListInstance?.createdDate}"/></td>
                                    </tr>
                                    <tr>
                                        <th><g:message code="vrBlockList.modifiedBy.label"
                                                       default="Modified By:"/></th>
                                        <td>${vrBlockListInstance?.modifiedBy}</td>
                                        <th><g:message code="vrBlockList.modifiedDate.label"
                                                       default="Modified Date:"/></th>
                                        <td><g:formatDate date="${vrBlockListInstance?.modifiedDate}"/></td>
                                    </tr>
                                </table>--}%
                                <ol class="property-list vrBlockList">

                                    <g:if test="${vrBlockListInstance?.code}">
                                        <li class="fieldcontain">
                                            <span id="code-label" class="property-label"><g:message
                                                    code="vrBlockList.code.label" default="Code"/></span>

                                            <span class="property-value" aria-labelledby="code-label"><g:fieldValue
                                                    bean="${vrBlockListInstance}" field="code"/></span>

                                        </li>
                                    </g:if>

                                    <g:if test="${vrBlockListInstance?.enterprise}">
                                        <li class="fieldcontain">
                                            <span id="enterprise-label" class="property-label"><g:message
                                                    code="vrBlockList.enterprise.label" default="Enterprise"/></span>

                                            <span class="property-value" aria-labelledby="enterprise-label"><g:link
                                                    controller="cpEntrprsMst" action="show"
                                                    id="${vrBlockListInstance?.enterprise?.id}">${vrBlockListInstance?.enterprise?.encodeAsHTML()}</g:link></span>

                                        </li>
                                    </g:if>

                                    <g:if test="${vrBlockListInstance?.nameOfForeigner}">
                                        <li class="fieldcontain">
                                            <span id="nameOfForeigner-label" class="property-label"><g:message
                                                    code="vrBlockList.nameOfForeigner.label"
                                                    default="Name Of Foreigner"/></span>

                                            <span class="property-value"
                                                  aria-labelledby="nameOfForeigner-label"><g:fieldValue
                                                    bean="${vrBlockListInstance}" field="nameOfForeigner"/></span>

                                        </li>
                                    </g:if>

                                    <g:if test="${vrBlockListInstance?.passportNo}">
                                        <li class="fieldcontain">
                                            <span id="passportNo-label" class="property-label"><g:message
                                                    code="vrBlockList.passportNo.label" default="Passport No"/></span>

                                            <span class="property-value"
                                                  aria-labelledby="passportNo-label"><g:fieldValue
                                                    bean="${vrBlockListInstance}" field="passportNo"/></span>

                                        </li>
                                    </g:if>

                                    <g:if test="${vrBlockListInstance?.nationality}">
                                        <li class="fieldcontain">
                                            <span id="nationality-label" class="property-label"><g:message
                                                    code="vrBlockList.nationality.label" default="Nationality"/></span>

                                            <span class="property-value" aria-labelledby="nationality-label"><g:link
                                                    controller="allLookup" action="show"
                                                    id="${vrBlockListInstance?.nationality?.id}">${vrBlockListInstance?.nationality?.encodeAsHTML()}</g:link></span>

                                        </li>
                                    </g:if>

                                    <g:if test="${vrBlockListInstance?.placeOfIssue}">
                                        <li class="fieldcontain">
                                            <span id="placeOfIssue-label" class="property-label"><g:message
                                                    code="vrBlockList.placeOfIssue.label"
                                                    default="Place Of Issue"/></span>

                                            <span class="property-value"
                                                  aria-labelledby="placeOfIssue-label"><g:fieldValue
                                                    bean="${vrBlockListInstance}" field="placeOfIssue"/></span>

                                        </li>
                                    </g:if>

                                    <g:if test="${vrBlockListInstance?.dateOfIssue}">
                                        <li class="fieldcontain">
                                            <span id="dateOfIssue-label" class="property-label"><g:message
                                                    code="vrBlockList.dateOfIssue.label"
                                                    default="Date Of Issue"/></span>

                                            <span class="property-value"
                                                  aria-labelledby="dateOfIssue-label"><g:formatDate
                                                    date="${vrBlockListInstance?.dateOfIssue}"/></span>

                                        </li>
                                    </g:if>

                                    <g:if test="${vrBlockListInstance?.dateOfBirth}">
                                        <li class="fieldcontain">
                                            <span id="dateOfBirth-label" class="property-label"><g:message
                                                    code="vrBlockList.dateOfBirth.label"
                                                    default="Date Of Birth"/></span>

                                            <span class="property-value"
                                                  aria-labelledby="dateOfBirth-label"><g:formatDate
                                                    date="${vrBlockListInstance?.dateOfBirth}"/></span>

                                        </li>
                                    </g:if>

                                    <g:if test="${vrBlockListInstance?.isActive}">
                                        <li class="fieldcontain">
                                            <span id="isActive-label" class="property-label"><g:message
                                                    code="vrBlockList.isActive.label" default="Is Active"/></span>

                                            <span class="property-value"
                                                  aria-labelledby="isActive-label"><g:formatBoolean
                                                    boolean="${vrBlockListInstance?.isActive}"/></span>

                                        </li>
                                    </g:if>

                                    <g:if test="${vrBlockListInstance?.createdDate}">
                                        <li class="fieldcontain">
                                            <span id="createdDate-label" class="property-label"><g:message
                                                    code="vrBlockList.createdDate.label" default="Created Date"/></span>

                                            <span class="property-value"
                                                  aria-labelledby="createdDate-label"><g:formatDate
                                                    date="${vrBlockListInstance?.createdDate}"/></span>

                                        </li>
                                    </g:if>

                                    <g:if test="${vrBlockListInstance?.createdBy}">
                                        <li class="fieldcontain">
                                            <span id="createdBy-label" class="property-label"><g:message
                                                    code="vrBlockList.createdBy.label" default="Created By"/></span>

                                            <span class="property-value" aria-labelledby="createdBy-label"><g:link
                                                    controller="user" action="show"
                                                    id="${vrBlockListInstance?.createdBy?.id}">${vrBlockListInstance?.createdBy?.encodeAsHTML()}</g:link></span>

                                        </li>
                                    </g:if>

                                    <g:if test="${vrBlockListInstance?.modifiedDate}">
                                        <li class="fieldcontain">
                                            <span id="modifiedDate-label" class="property-label"><g:message
                                                    code="vrBlockList.modifiedDate.label"
                                                    default="Modified Date"/></span>

                                            <span class="property-value"
                                                  aria-labelledby="modifiedDate-label"><g:formatDate
                                                    date="${vrBlockListInstance?.modifiedDate}"/></span>

                                        </li>
                                    </g:if>

                                    <g:if test="${vrBlockListInstance?.modifiedBy}">
                                        <li class="fieldcontain">
                                            <span id="modifiedBy-label" class="property-label"><g:message
                                                    code="vrBlockList.modifiedBy.label" default="Modified By"/></span>

                                            <span class="property-value" aria-labelledby="modifiedBy-label"><g:link
                                                    controller="user" action="show"
                                                    id="${vrBlockListInstance?.modifiedBy?.id}">${vrBlockListInstance?.modifiedBy?.encodeAsHTML()}</g:link></span>

                                        </li>
                                    </g:if>

                                </ol>
                            </div>
                        </div>
                    </fieldset>

                    </div><!-- /.box-body -->
                </div><!-- /.box -->
            </div>
        </div>

    </section>
</div><!-- /.content-wrapper -->
</body>
</html>

%{--












<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'vrBlockList.label', default: 'VrBlockList')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-vrBlockList" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-vrBlockList" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list vrBlockList">
			
				<g:if test="${vrBlockListInstance?.code}">
				<li class="fieldcontain">
					<span id="code-label" class="property-label"><g:message code="vrBlockList.code.label" default="Code" /></span>
					
						<span class="property-value" aria-labelledby="code-label"><g:fieldValue bean="${vrBlockListInstance}" field="code"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${vrBlockListInstance?.enterprise}">
				<li class="fieldcontain">
					<span id="enterprise-label" class="property-label"><g:message code="vrBlockList.enterprise.label" default="Enterprise" /></span>
					
						<span class="property-value" aria-labelledby="enterprise-label"><g:link controller="cpEntrprsMst" action="show" id="${vrBlockListInstance?.enterprise?.id}">${vrBlockListInstance?.enterprise?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${vrBlockListInstance?.nameOfForeigner}">
				<li class="fieldcontain">
					<span id="nameOfForeigner-label" class="property-label"><g:message code="vrBlockList.nameOfForeigner.label" default="Name Of Foreigner" /></span>
					
						<span class="property-value" aria-labelledby="nameOfForeigner-label"><g:fieldValue bean="${vrBlockListInstance}" field="nameOfForeigner"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${vrBlockListInstance?.passportNo}">
				<li class="fieldcontain">
					<span id="passportNo-label" class="property-label"><g:message code="vrBlockList.passportNo.label" default="Passport No" /></span>
					
						<span class="property-value" aria-labelledby="passportNo-label"><g:fieldValue bean="${vrBlockListInstance}" field="passportNo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${vrBlockListInstance?.nationality}">
				<li class="fieldcontain">
					<span id="nationality-label" class="property-label"><g:message code="vrBlockList.nationality.label" default="Nationality" /></span>
					
						<span class="property-value" aria-labelledby="nationality-label"><g:link controller="allLookup" action="show" id="${vrBlockListInstance?.nationality?.id}">${vrBlockListInstance?.nationality?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${vrBlockListInstance?.placeOfIssue}">
				<li class="fieldcontain">
					<span id="placeOfIssue-label" class="property-label"><g:message code="vrBlockList.placeOfIssue.label" default="Place Of Issue" /></span>
					
						<span class="property-value" aria-labelledby="placeOfIssue-label"><g:fieldValue bean="${vrBlockListInstance}" field="placeOfIssue"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${vrBlockListInstance?.dateOfIssue}">
				<li class="fieldcontain">
					<span id="dateOfIssue-label" class="property-label"><g:message code="vrBlockList.dateOfIssue.label" default="Date Of Issue" /></span>
					
						<span class="property-value" aria-labelledby="dateOfIssue-label"><g:formatDate date="${vrBlockListInstance?.dateOfIssue}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${vrBlockListInstance?.dateOfBirth}">
				<li class="fieldcontain">
					<span id="dateOfBirth-label" class="property-label"><g:message code="vrBlockList.dateOfBirth.label" default="Date Of Birth" /></span>
					
						<span class="property-value" aria-labelledby="dateOfBirth-label"><g:formatDate date="${vrBlockListInstance?.dateOfBirth}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${vrBlockListInstance?.isActive}">
				<li class="fieldcontain">
					<span id="isActive-label" class="property-label"><g:message code="vrBlockList.isActive.label" default="Is Active" /></span>
					
						<span class="property-value" aria-labelledby="isActive-label"><g:formatBoolean boolean="${vrBlockListInstance?.isActive}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${vrBlockListInstance?.createdDate}">
				<li class="fieldcontain">
					<span id="createdDate-label" class="property-label"><g:message code="vrBlockList.createdDate.label" default="Created Date" /></span>
					
						<span class="property-value" aria-labelledby="createdDate-label"><g:formatDate date="${vrBlockListInstance?.createdDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${vrBlockListInstance?.createdBy}">
				<li class="fieldcontain">
					<span id="createdBy-label" class="property-label"><g:message code="vrBlockList.createdBy.label" default="Created By" /></span>
					
						<span class="property-value" aria-labelledby="createdBy-label"><g:link controller="user" action="show" id="${vrBlockListInstance?.createdBy?.id}">${vrBlockListInstance?.createdBy?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${vrBlockListInstance?.modifiedDate}">
				<li class="fieldcontain">
					<span id="modifiedDate-label" class="property-label"><g:message code="vrBlockList.modifiedDate.label" default="Modified Date" /></span>
					
						<span class="property-value" aria-labelledby="modifiedDate-label"><g:formatDate date="${vrBlockListInstance?.modifiedDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${vrBlockListInstance?.modifiedBy}">
				<li class="fieldcontain">
					<span id="modifiedBy-label" class="property-label"><g:message code="vrBlockList.modifiedBy.label" default="Modified By" /></span>
					
						<span class="property-value" aria-labelledby="modifiedBy-label"><g:link controller="user" action="show" id="${vrBlockListInstance?.modifiedBy?.id}">${vrBlockListInstance?.modifiedBy?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			

			
			</ol>
			<g:form url="[resource:vrBlockListInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${vrBlockListInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
--}%
