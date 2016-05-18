<%@ page import="com.bepza.auth.Menu" %>


<div class="form-group ${hasErrors(bean: menuInstance, field: 'title', 'has-error')} required">
    <label for="title" class="col-sm-2 control-label">
        <g:message code="menuInstance.title.label" default="Menu Title"/>
        <span class="required-indicator">*</span>
    </label>

    <div class="col-sm-6">
        <g:textField name="title" id="title"
                     value="${menuInstance?.title}" class="form-control"/>
    </div>
</div>

<div class="form-group ${hasErrors(bean: menuInstance, field: 'toolTip', 'has-error')}">
    <label for="toolTip" class="col-sm-2 control-label">Tool Tip</label>

    <div class="col-sm-6">
        <g:textField name="toolTip" id="toolTip"
                     value="${menuInstance?.toolTip}" class="form-control"/>
    </div>
</div>

<div class="form-group ${hasErrors(bean: menuInstance, field: 'description', 'has-error')}">
    <label for="description" class="col-sm-2 control-label">Menu Description</label>

    <div class="col-sm-6">
        <g:textField name="description" id="description"
                     value="${menuInstance?.description}" class="form-control"/>
    </div>
</div>

<div class="form-group ${hasErrors(bean: menuInstance, field: 'urlPath', 'has-error')}">
    <label for="urlPath" class="col-sm-2 control-label">
        <g:message code="menuInstance.urlPath.label" default="RUL Path"/>
        <span class="required-indicator">*</span>
    </label>

    <div class="col-sm-6">
        <g:textField name="urlPath" id="urlPath"
                     value="${menuInstance?.urlPath}" class="form-control"/>
    </div>
</div>

<div class="form-group ${hasErrors(bean: menuInstance, field: 'menuClass', 'has-error')}">
    <label for="menuClass" class="col-sm-2 control-label">Menu Class</label>

    <div class="col-sm-6">
        <g:textField name="menuClass" id="menuClass"
                     value="${menuInstance?.menuClass}" class="form-control"/>
    </div>
</div>

<div class="form-group ${hasErrors(bean: menuInstance, field: 'menuType', 'has-error')}">
    <label for="menuType" class="col-sm-2 control-label">Menu Type</label>

    <div class="col-sm-6">
        <g:textField name="menuType" id="menuType" readonly="readonly"
                     value="${menuInstance?.menuType}" class="form-control"/>
    </div>
</div>

<div class="form-group ${hasErrors(bean: menuInstance, field: 'parentMenu', 'has-error')}">
    <label for="parentMenu" class="col-sm-2 control-label">Parent Menu</label>

    <div class="col-sm-6">
        <g:select id="parentMenu" class="form-control select2" name="parentMenu.id" from="${menuInstanceListDD}"
                  optionKey="${{ it.id }}" optionValue="${{ it.title }}" value="${menuInstance?.parentMenu?.id}"
                  noSelection="['': 'Select One']"/>
    </div>
</div>

<div class="form-group ${hasErrors(bean: menuInstance, field: 'isExternal', 'has-error')}">
    <label for="isExternal" class="col-sm-2 control-label">External?</label>

    <div class="col-sm-6">
        <g:checkBox name="isExternal" value="${menuInstance?.isExternal}"/>
    </div>
</div>

<div class="form-group ${hasErrors(bean: menuInstance, field: 'isOpenNewTab', 'has-error')}">
    <label for="isOpenNewTab" class="col-sm-2 control-label">Open in New Tab?</label>

    <div class="col-sm-6">
        <g:checkBox name="isOpenNewTab" value="${menuInstance?.isOpenNewTab}"/>
    </div>
</div>

<div class="form-group ${hasErrors(bean: menuInstance, field: 'isActive', 'has-error')}">
    <label for="isActive" class="col-sm-2 control-label">
        <g:message code="menuInstance.isActive.label" default=" Active?"/>
        <span class="required-indicator">*</span>
    </label>

    <div class="col-sm-6">
        <g:checkBox name="isActive" value="${menuInstance?.isActive}"/>
    </div>
</div>

<div class="form-group ${hasErrors(bean: menuInstance, field: 'sortOrder', 'has-error')}">
    <label for="sortOrder" class="col-sm-2 control-label">Sort Order</label>

    <div class="col-sm-6">
        <g:textField name="sortOrder" id="sortOrder"
                     value="${menuInstance?.sortOrder}" class="form-control"/>
    </div>
</div>
<script type="text/javascript">
    $(function () {

        $(".select2").select2();
        $('.formValMenu').each(function () {
            $(this).bootstrapValidator({
                message: 'This value is not valid',
                feedbackIcons: {
                    valid: 'glyphicon glyphicon-car',
                    invalid: 'glyphicon glyphicon-remove',
                    validating: 'glyphicon glyphicon-refresh'
                },
                fields: {
                    title: {
                        validators: {
                            notEmpty: {
                                message: 'Title is required and cannot be empty'
                            }
                        }
                    },
                    urlPath: {
                        validators: {
                            notEmpty: {
                                message: 'Url Path is required and cannot be empty'
                            }/*,
                            regexp: {
                                regexp: /^\/[a-zA-Z/]+$/,
                                message: 'The url path start with / and lowarcase only '
                            }*/
                        }
                    },
                    isActive: {
                        validators: {
                            notEmpty: {
                                message: 'isActive is required and cannot be empty'
                            }
                        }
                    },
                    sortOrder: {
                        validators: {
                            integer: {
                                message: 'Sort order must be a numeric value'
                            }
                        }
                    }

                }
            });
        });
    });
</script>

<link rel="stylesheet"
      href="http://cdnjs.cloudflare.com/ajax/libs/jquery.bootstrapvalidator/0.5.3/css/bootstrapValidator.min.css">
<script type="text/javascript" src="${resource(dir: "js", file: "bootstrapValidator.min.js")}"></script>