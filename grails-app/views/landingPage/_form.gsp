<%@ page import="com.bepza.common.LandingPage" %>

<div class="form-group ${hasErrors(bean: landingPageInstance, field: 'userRole', 'has-error')}">
    <label for="userRoleId" class="col-sm-3 control-label required">User Role</label>

    <div class="col-sm-6">
        <g:select name="userRole.id"
                  id="userRoleId"
                  from="${com.bepza.auth.Role.list()}" optionKey="id"
                  value="${landingPageInstance?.userRole?.id}"
                  noSelection="['': '--Select--']"
                  class="form-control select2"/>
    </div>
</div>

<div class="form-group ${hasErrors(bean: landingPageInstance, field: 'pageUrl', 'has-error')}">
    <label for="pageUrl" class="col-sm-3 control-label required">Landing Page URL</label>

    <div class="col-sm-6">
        <g:textField name="pageUrl" id="pageUrl"
                     value="${landingPageInstance?.pageUrl}" class="form-control"/>
    </div>
</div>

<div class="form-group ${hasErrors(bean: landingPageInstance, field: 'isActive', 'has-error')}">
    <label for="enabled" class="col-sm-3 control-label">Active?</label>

    <div class="col-sm-6">
        <g:checkBox name="enabled" value="${landingPageInstance?.isActive ?: true}"/>
    </div>
</div>
<script type="text/javascript">
    $(document).ready(function () {
        //Initialize Select2 Elements
        $(".select2").select2();
    });
</script>