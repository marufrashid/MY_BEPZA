
<%@ page import="com.bepza.common.CpEntrprsMst" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'cpEntrprsMst.label', default: 'CpEntrprsMst')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-cpEntrprsMst" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-cpEntrprsMst" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list cpEntrprsMst">
			
				<g:if test="${cpEntrprsMstInstance?.applicationCode}">
				<li class="fieldcontain">
					<span id="applicationCode-label" class="property-label"><g:message code="cpEntrprsMst.applicationCode.label" default="Application Code" /></span>
					
						<span class="property-value" aria-labelledby="applicationCode-label"><g:fieldValue bean="${cpEntrprsMstInstance}" field="applicationCode"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${cpEntrprsMstInstance?.allotmentCode}">
				<li class="fieldcontain">
					<span id="allotmentCode-label" class="property-label"><g:message code="cpEntrprsMst.allotmentCode.label" default="Allotment Code" /></span>
					
						<span class="property-value" aria-labelledby="allotmentCode-label"><g:fieldValue bean="${cpEntrprsMstInstance}" field="allotmentCode"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${cpEntrprsMstInstance?.sanctionCode}">
				<li class="fieldcontain">
					<span id="sanctionCode-label" class="property-label"><g:message code="cpEntrprsMst.sanctionCode.label" default="Sanction Code" /></span>
					
						<span class="property-value" aria-labelledby="sanctionCode-label"><g:fieldValue bean="${cpEntrprsMstInstance}" field="sanctionCode"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${cpEntrprsMstInstance?.entrprsAddressLocal}">
				<li class="fieldcontain">
					<span id="entrprsAddressLocal-label" class="property-label"><g:message code="cpEntrprsMst.entrprsAddressLocal.label" default="Entrprs Address Local" /></span>
					
						<span class="property-value" aria-labelledby="entrprsAddressLocal-label"><g:fieldValue bean="${cpEntrprsMstInstance}" field="entrprsAddressLocal"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${cpEntrprsMstInstance?.code}">
				<li class="fieldcontain">
					<span id="code-label" class="property-label"><g:message code="cpEntrprsMst.code.label" default="Code" /></span>
					
						<span class="property-value" aria-labelledby="code-label"><g:fieldValue bean="${cpEntrprsMstInstance}" field="code"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${cpEntrprsMstInstance?.applicantName}">
				<li class="fieldcontain">
					<span id="applicantName-label" class="property-label"><g:message code="cpEntrprsMst.applicantName.label" default="Applicant Name" /></span>
					
						<span class="property-value" aria-labelledby="applicantName-label"><g:fieldValue bean="${cpEntrprsMstInstance}" field="applicantName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${cpEntrprsMstInstance?.entrprsName}">
				<li class="fieldcontain">
					<span id="entrprsName-label" class="property-label"><g:message code="cpEntrprsMst.entrprsName.label" default="Entrprs Name" /></span>
					
						<span class="property-value" aria-labelledby="entrprsName-label"><g:fieldValue bean="${cpEntrprsMstInstance}" field="entrprsName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${cpEntrprsMstInstance?.entrprsAddress}">
				<li class="fieldcontain">
					<span id="entrprsAddress-label" class="property-label"><g:message code="cpEntrprsMst.entrprsAddress.label" default="Entrprs Address" /></span>
					
						<span class="property-value" aria-labelledby="entrprsAddress-label"><g:fieldValue bean="${cpEntrprsMstInstance}" field="entrprsAddress"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${cpEntrprsMstInstance?.entrprsPhoneNumber}">
				<li class="fieldcontain">
					<span id="entrprsPhoneNumber-label" class="property-label"><g:message code="cpEntrprsMst.entrprsPhoneNumber.label" default="Entrprs Phone Number" /></span>
					
						<span class="property-value" aria-labelledby="entrprsPhoneNumber-label"><g:fieldValue bean="${cpEntrprsMstInstance}" field="entrprsPhoneNumber"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${cpEntrprsMstInstance?.entrprsFaxNumber}">
				<li class="fieldcontain">
					<span id="entrprsFaxNumber-label" class="property-label"><g:message code="cpEntrprsMst.entrprsFaxNumber.label" default="Entrprs Fax Number" /></span>
					
						<span class="property-value" aria-labelledby="entrprsFaxNumber-label"><g:fieldValue bean="${cpEntrprsMstInstance}" field="entrprsFaxNumber"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${cpEntrprsMstInstance?.entrprsEmail}">
				<li class="fieldcontain">
					<span id="entrprsEmail-label" class="property-label"><g:message code="cpEntrprsMst.entrprsEmail.label" default="Entrprs Email" /></span>
					
						<span class="property-value" aria-labelledby="entrprsEmail-label"><g:fieldValue bean="${cpEntrprsMstInstance}" field="entrprsEmail"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${cpEntrprsMstInstance?.entrprsMobile}">
				<li class="fieldcontain">
					<span id="entrprsMobile-label" class="property-label"><g:message code="cpEntrprsMst.entrprsMobile.label" default="Entrprs Mobile" /></span>
					
						<span class="property-value" aria-labelledby="entrprsMobile-label"><g:fieldValue bean="${cpEntrprsMstInstance}" field="entrprsMobile"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${cpEntrprsMstInstance?.entrprsEmailOverseas}">
				<li class="fieldcontain">
					<span id="entrprsEmailOverseas-label" class="property-label"><g:message code="cpEntrprsMst.entrprsEmailOverseas.label" default="Entrprs Email Overseas" /></span>
					
						<span class="property-value" aria-labelledby="entrprsEmailOverseas-label"><g:fieldValue bean="${cpEntrprsMstInstance}" field="entrprsEmailOverseas"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${cpEntrprsMstInstance?.entrprsFaxNumberOverseas}">
				<li class="fieldcontain">
					<span id="entrprsFaxNumberOverseas-label" class="property-label"><g:message code="cpEntrprsMst.entrprsFaxNumberOverseas.label" default="Entrprs Fax Number Overseas" /></span>
					
						<span class="property-value" aria-labelledby="entrprsFaxNumberOverseas-label"><g:fieldValue bean="${cpEntrprsMstInstance}" field="entrprsFaxNumberOverseas"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${cpEntrprsMstInstance?.entrprsMobileOverseas}">
				<li class="fieldcontain">
					<span id="entrprsMobileOverseas-label" class="property-label"><g:message code="cpEntrprsMst.entrprsMobileOverseas.label" default="Entrprs Mobile Overseas" /></span>
					
						<span class="property-value" aria-labelledby="entrprsMobileOverseas-label"><g:fieldValue bean="${cpEntrprsMstInstance}" field="entrprsMobileOverseas"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${cpEntrprsMstInstance?.entrprsPhoneNumberOverseas}">
				<li class="fieldcontain">
					<span id="entrprsPhoneNumberOverseas-label" class="property-label"><g:message code="cpEntrprsMst.entrprsPhoneNumberOverseas.label" default="Entrprs Phone Number Overseas" /></span>
					
						<span class="property-value" aria-labelledby="entrprsPhoneNumberOverseas-label"><g:fieldValue bean="${cpEntrprsMstInstance}" field="entrprsPhoneNumberOverseas"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${cpEntrprsMstInstance?.entrprsAddressOverseas}">
				<li class="fieldcontain">
					<span id="entrprsAddressOverseas-label" class="property-label"><g:message code="cpEntrprsMst.entrprsAddressOverseas.label" default="Entrprs Address Overseas" /></span>
					
						<span class="property-value" aria-labelledby="entrprsAddressOverseas-label"><g:fieldValue bean="${cpEntrprsMstInstance}" field="entrprsAddressOverseas"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${cpEntrprsMstInstance?.proposedProjectName}">
				<li class="fieldcontain">
					<span id="proposedProjectName-label" class="property-label"><g:message code="cpEntrprsMst.proposedProjectName.label" default="Proposed Project Name" /></span>
					
						<span class="property-value" aria-labelledby="proposedProjectName-label"><g:fieldValue bean="${cpEntrprsMstInstance}" field="proposedProjectName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${cpEntrprsMstInstance?.landAreaRequired}">
				<li class="fieldcontain">
					<span id="landAreaRequired-label" class="property-label"><g:message code="cpEntrprsMst.landAreaRequired.label" default="Land Area Required" /></span>
					
						<span class="property-value" aria-labelledby="landAreaRequired-label"><g:fieldValue bean="${cpEntrprsMstInstance}" field="landAreaRequired"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${cpEntrprsMstInstance?.flatAreaRequired}">
				<li class="fieldcontain">
					<span id="flatAreaRequired-label" class="property-label"><g:message code="cpEntrprsMst.flatAreaRequired.label" default="Flat Area Required" /></span>
					
						<span class="property-value" aria-labelledby="flatAreaRequired-label"><g:fieldValue bean="${cpEntrprsMstInstance}" field="flatAreaRequired"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${cpEntrprsMstInstance?.fireRiskArrangement}">
				<li class="fieldcontain">
					<span id="fireRiskArrangement-label" class="property-label"><g:message code="cpEntrprsMst.fireRiskArrangement.label" default="Fire Risk Arrangement" /></span>
					
						<span class="property-value" aria-labelledby="fireRiskArrangement-label"><g:fieldValue bean="${cpEntrprsMstInstance}" field="fireRiskArrangement"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${cpEntrprsMstInstance?.safetySecurityMeasures}">
				<li class="fieldcontain">
					<span id="safetySecurityMeasures-label" class="property-label"><g:message code="cpEntrprsMst.safetySecurityMeasures.label" default="Safety Security Measures" /></span>
					
						<span class="property-value" aria-labelledby="safetySecurityMeasures-label"><g:fieldValue bean="${cpEntrprsMstInstance}" field="safetySecurityMeasures"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${cpEntrprsMstInstance?.financeForeignSource}">
				<li class="fieldcontain">
					<span id="financeForeignSource-label" class="property-label"><g:message code="cpEntrprsMst.financeForeignSource.label" default="Finance Foreign Source" /></span>
					
						<span class="property-value" aria-labelledby="financeForeignSource-label"><g:fieldValue bean="${cpEntrprsMstInstance}" field="financeForeignSource"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${cpEntrprsMstInstance?.financeLocalSource}">
				<li class="fieldcontain">
					<span id="financeLocalSource-label" class="property-label"><g:message code="cpEntrprsMst.financeLocalSource.label" default="Finance Local Source" /></span>
					
						<span class="property-value" aria-labelledby="financeLocalSource-label"><g:fieldValue bean="${cpEntrprsMstInstance}" field="financeLocalSource"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${cpEntrprsMstInstance?.sortOrder}">
				<li class="fieldcontain">
					<span id="sortOrder-label" class="property-label"><g:message code="cpEntrprsMst.sortOrder.label" default="Sort Order" /></span>
					
						<span class="property-value" aria-labelledby="sortOrder-label"><g:fieldValue bean="${cpEntrprsMstInstance}" field="sortOrder"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${cpEntrprsMstInstance?.isActive}">
				<li class="fieldcontain">
					<span id="isActive-label" class="property-label"><g:message code="cpEntrprsMst.isActive.label" default="Is Active" /></span>
					
						<span class="property-value" aria-labelledby="isActive-label"><g:formatBoolean boolean="${cpEntrprsMstInstance?.isActive}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${cpEntrprsMstInstance?.remarks}">
				<li class="fieldcontain">
					<span id="remarks-label" class="property-label"><g:message code="cpEntrprsMst.remarks.label" default="Remarks" /></span>
					
						<span class="property-value" aria-labelledby="remarks-label"><g:fieldValue bean="${cpEntrprsMstInstance}" field="remarks"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${cpEntrprsMstInstance?.entryByUserId}">
				<li class="fieldcontain">
					<span id="entryByUserId-label" class="property-label"><g:message code="cpEntrprsMst.entryByUserId.label" default="Entry By User Id" /></span>
					
						<span class="property-value" aria-labelledby="entryByUserId-label"><g:link controller="user" action="show" id="${cpEntrprsMstInstance?.entryByUserId?.id}">${cpEntrprsMstInstance?.entryByUserId?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${cpEntrprsMstInstance?.entryDate}">
				<li class="fieldcontain">
					<span id="entryDate-label" class="property-label"><g:message code="cpEntrprsMst.entryDate.label" default="Entry Date" /></span>
					
						<span class="property-value" aria-labelledby="entryDate-label"><g:formatDate date="${cpEntrprsMstInstance?.entryDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${cpEntrprsMstInstance?.modifiedDate}">
				<li class="fieldcontain">
					<span id="modifiedDate-label" class="property-label"><g:message code="cpEntrprsMst.modifiedDate.label" default="Modified Date" /></span>
					
						<span class="property-value" aria-labelledby="modifiedDate-label"><g:formatDate date="${cpEntrprsMstInstance?.modifiedDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${cpEntrprsMstInstance?.modifiedByUserId}">
				<li class="fieldcontain">
					<span id="modifiedByUserId-label" class="property-label"><g:message code="cpEntrprsMst.modifiedByUserId.label" default="Modified By User Id" /></span>
					
						<span class="property-value" aria-labelledby="modifiedByUserId-label"><g:link controller="user" action="show" id="${cpEntrprsMstInstance?.modifiedByUserId?.id}">${cpEntrprsMstInstance?.modifiedByUserId?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${cpEntrprsMstInstance?.enterpriseLogoPath}">
				<li class="fieldcontain">
					<span id="enterpriseLogoPath-label" class="property-label"><g:message code="cpEntrprsMst.enterpriseLogoPath.label" default="Enterprise Logo Path" /></span>
					
						<span class="property-value" aria-labelledby="enterpriseLogoPath-label"><g:fieldValue bean="${cpEntrprsMstInstance}" field="enterpriseLogoPath"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:cpEntrprsMstInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${cpEntrprsMstInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
