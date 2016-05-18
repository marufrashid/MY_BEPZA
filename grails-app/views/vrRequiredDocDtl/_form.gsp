<%@ page import="com.bepza.vr.VrRequiredDocDtl" %>


<div class="form-group fieldcontain ${hasErrors(bean: vrRequiredDocDtlInstance, field: 'docTypeName', 'has-error')}">
    <label for="docTypeName" class="col-sm-2 control-label required">
        <g:message code="vrRequiredDocDtl.docTypeName.label" default="Document Name"/>
    </label>

    <div class="col-sm-6">
        <g:textField name="docTypeName" value="${vrRequiredDocDtlInstance?.docTypeName}" class="form-control"/>
        <g:renderErrors bean="${vrRequiredDocDtlInstance}" field="docTypeName"/>
    </div>
</div>

<div class="form-group fieldcontain ${hasErrors(bean: vrRequiredDocDtlInstance, field: 'docTypeDescription', 'has-error')}">
    <label for="docTypeDescription" class="col-sm-2 control-label">
        <g:message code="vrRequiredDocDtl.docTypeDescription.label" default="Document Description"/>
    </label>

    <div class="col-sm-6">
        <g:textArea name="docTypeDescription" value="${vrRequiredDocDtlInstance?.docTypeDescription}"  class="form-control"/>
        <g:renderErrors bean="${vrRequiredDocDtlInstance}" field="docTypeDescription"/>
    </div>
</div>

<div class="form-group fieldcontain ${hasErrors(bean: vrRequiredDocDtlInstance, field: 'docFor', 'has-error')}">
    <label for="docFor" class="col-sm-2 control-label">
        <g:message code="vrRequiredDocDtl.docFor.label" default="Document For"/>
    </label>

    <div class="col-sm-6">
        <g:textArea name="docFor" value="${vrRequiredDocDtlInstance?.docFor}"   class="form-control"/>
        <g:renderErrors bean="${vrRequiredDocDtlInstance}" field="docFor"/>
    </div>
</div>

<div class="form-group fieldcontain ${hasErrors(bean: vrRequiredDocDtlInstance, field: 'fileSizeByte', 'has-error')}">
    <label for="fileSizeByte" class="col-sm-2 control-label required">
        <g:message code="vrRequiredDocDtl.fileSizeByte.label" default="File Size(In Byte)"/>
    </label>

    <div class="col-sm-6">
        <g:textField name="fileSizeByte" value="${vrRequiredDocDtlInstance.fileSizeByte}" class="form-control"/>
        <g:renderErrors bean="${vrRequiredDocDtlInstance}" field="fileSizeByte"/>
    </div>
</div>

<div class="form-group fieldcontain ${hasErrors(bean: vrRequiredDocDtlInstance, field: 'allowedExtensions', 'has-error')}">
    <label for="allowedExtensions" class="col-sm-2 control-label required">
        <g:message code="vrRequiredDocDtl.allowedExtensions.label" default="Allowed Extensions"/>
    </label>

    <div class="col-sm-6">
        <g:select name="allowedExtensions" id="allowedExtensions"
                  from="${['pdf', 'doc', 'docx']}"
                  value="${vrRequiredDocDtlInstance?.allowedExtensions}"
                  class="form-control select2Multi"/>
        <g:renderErrors bean="${vrRequiredDocDtlInstance}" field="allowedExtensions"/>
    </div>

</div>

<div class="form-group fieldcontain ${hasErrors(bean: vrRequiredDocDtlInstance, field: 'sortOrder', 'has-error')}">
    <label for="sortOrder" class="col-sm-2 control-label">
        <g:message code="vrRequiredDocDtl.sortOrder.label" default="Sort Order"/>
    </label>

    <div class="col-sm-6">
        <g:textField name="sortOrder" value="${vrRequiredDocDtlInstance.sortOrder}" class="form-control"/>
        <g:renderErrors bean="${vrRequiredDocDtlInstance}" field="sortOrder"/>
    </div>
</div>

<div class="form-group fieldcontain ${hasErrors(bean: vrRequiredDocDtlInstance, field: 'remarks', 'has-error')}">
    <label class="col-sm-2 control-label">
        <g:message code="vrRequiredDocDtl.remarks.label" default="Comments"/>
    </label>

    <div class="col-sm-6">
        <g:textArea name="remarks" value="${vrRequiredDocDtlInstance?.remarks}"
                    class="form-control"/>
    </div>
</div>

<div class="form-group fieldcontain ${hasErrors(bean: vrRequiredDocDtlInstance, field: 'isActive', 'has-error')}">
    <label for="isActive" class="col-sm-2 control-label">
        <g:message code="vrRequiredDocDtl.isActive.label" default="Is Active?"/>
    </label>

    <div class="col-sm-6">
        <g:checkBox name="isActive" value="${vrRequiredDocDtlInstance?.isActive}"/>
    </div>
</div>

<div class="form-group fieldcontain ${hasErrors(bean: vrRequiredDocDtlInstance, field: 'isMandatory', 'error')} ">
    <label for="isMandatory" class="col-sm-2 control-label">
        <g:message code="vrRequiredDocDtl.isMandatory.label" default="Is Mandatory?"/>
    </label>

    <div class="col-sm-6">
        <g:checkBox name="isMandatory" value="${vrRequiredDocDtlInstance?.isMandatory}"/>
    </div>
</div>



