<%@ page import="com.bepza.auth.User" %>
<div class="">
    %{--<div class="form-group">
        <label for="role" class="col-sm-2 control-label">Designation</label>

        <div class="col-sm-6">
            <g:select name="designation.id"
                      id="designation"
                      from="${designationList}"
                      optionKey="id"
                      noSelection="['': '--Select--']"
                      value="${userInstance?.designation?.id}" class="form-control select2"/>
        </div>
    </div>--}%

    <div class="form-group ${hasErrors(bean: userInstance, field: 'fullName', 'has-error')}">
        <label for="fullName" class="col-sm-2 control-label required">Full Name
        </label>

        <div class="col-sm-6">
            <g:textField name="fullName" id="fullName"
                         value="${userInstance?.fullName}" class="form-control"/>
        </div>
    </div>

    <div class="form-group ${hasErrors(bean: userInstance, field: 'username', 'has-error')}">
        <label for="username" class="col-sm-2 control-label required">Username
        </label>

        <div class="col-sm-6">
            <g:textField name="username" id="username"
                         value="${userInstance?.username}" class="form-control"/>
        </div>
    </div>
    <g:if test="${actionName == 'edit'}">
        <div class="form-group">
            <label class="col-sm-2 control-label">Old Password</label>

            <div class="col-sm-6">
                <span>******</span>
            </div>
        </div>

        <div class="form-group ${hasErrors(bean: userInstance, field: 'password', 'has-error')}">
            <label for="passwordNew" class="col-sm-2 control-label required">New Password
            </label>

            <div class="col-sm-6">
                <g:passwordField name="passwordNew" id="passwordNew" value=""
                                 autocomplete="off" class="form-control" placeholder="Leave blank to keep unchanged."/>
            </div>
        </div>
    </g:if>
    <g:else>
        <div class="form-group ${hasErrors(bean: userInstance, field: 'password', 'has-error')}">
            <label for="password" class="col-sm-2 control-label required">Password
            </label>

            <div class="col-sm-6">
                <g:passwordField name="password" id="password" value=""
                                 autocomplete="off" class="form-control"/>
            </div>
        </div>
    </g:else>

    <div class="form-group ${hasErrors(bean: userInstance, field: 'cellNo', 'has-error')}">
        <label for="cellNo" class="col-sm-2 control-label required">cell No
        </label>

        <div class="col-sm-6">
            <g:textField name="cellNo" id="cellNo"
                         value="${userInstance?.cellNo}" class="form-control"/>
        </div>
    </div>

    <div class="form-group ${hasErrors(bean: userInstance, field: 'email', 'has-error')}">
        <label for="email" class="col-sm-2 control-label required">Email</label>

        <div class="col-sm-6">
            <g:textField name="email" id="email"
                         value="${userInstance?.email}" class="form-control"/>
        </div>
    </div>



    <div class="form-group">
        <label for="role" class="col-sm-2 control-label required">Role
        </label>

        <div class="col-sm-6">
            <g:select name="role"
                      id="role"
                      from="${com.bepza.auth.Role.list()}"
                      optionKey="id"
                      value="${userRole*.id}"
                      multiple="true" class="form-control select2"/>
        </div>
    </div>

    %{--<div class="form-group">
        <label for="role" class="col-sm-2 control-label">Zone</label>

        <div class="col-sm-6">
            <g:select name="zone.id"
                      id="zoneId"
                      from="${zoneList}"
                      optionKey="id"
                      noSelection="['': '--Select--']"
                      value="${userInstance?.zone?.id}" class="form-control"/>
        </div>
    </div>--}%

    %{--<div class="form-group">
        <label for="role" class="col-sm-2 control-label">Enterprise</label>

        <div class="col-sm-6">
            <g:select name="enterprise.id"
                      id="enterpriseId"
                      from="${enterpriseList}"
                      optionKey="id"
                      noSelection="['': '--Select--']"
                      value="${userInstance?.enterprise?.id}"
                      class="form-control select2"/>
        </div>
    </div>--}%

    <div class="form-group">
        <label class="col-sm-2 control-label">Signature</label>

        <div class="col-sm-6">
            <div class="input-group ${hasErrors(bean: userInstance, field: 'signature', 'has-error')}">
                <span class="input-group-btn">
                    <span class="btn btn-primary btn-file">
                        Browse &hellip;
                        <input type="file" id="signature" name="signature"
                               class="fl" value="${userInstance?.signature}">
                    </span>
                </span>
                <input type="text" class="form-control tf" readonly="readonly" id="docNameProxy"
                       placeholder="Browse your file" value="${userInstance?.signature}">

                <g:hiddenField name="signatureOld"
                               value="${userInstance?.signature}"></g:hiddenField>

            </div>
            <g:renderErrors bean="${userInstance}" field="signature"/>
            <g:if test="${userInstance?.signature}">
                <g:img dir="files/employee/signature" file="${userInstance?.signature}"></g:img>
            </g:if>
        </div>
    </div>

    <div class="form-group ${hasErrors(bean: userInstance, field: 'enabled', 'has-error')}">
        <label for="enabled" class="col-sm-2 control-label">Enabled?</label>

        <div class="col-sm-6">
            <g:checkBox name="enabled" value="${userInstance?.enabled ?: true}"/>
        </div>
    </div>


    <g:if test="${actionName == 'edit'}">
        <div class="form-group ${hasErrors(bean: userInstance, field: 'accountLocked', 'has-error')}">
            <label for="accountLocked" class="col-sm-2 control-label">Account Locked?</label>

            <div class="col-sm-6">
                <g:checkBox name="accountLocked" value="${userInstance?.accountLocked}"/>
            </div>
        </div>

        <div class="form-group ${hasErrors(bean: userInstance, field: 'accountExpired', 'has-error')}">
            <label for="accountExpired" class="col-sm-2 control-label">Account Expired?</label>

            <div class="col-sm-6">
                <g:checkBox name="accountExpired" value="${userInstance?.accountExpired}"/>
            </div>
        </div>

        <div class="form-group ${hasErrors(bean: userInstance, field: 'passwordExpired', 'has-error')}">
            <label for="passwordExpired"
                   class="col-sm-2 control-label">Password Expired?</label>

            <div class="col-sm-6">
                <g:checkBox name="passwordExpired" value="${userInstance?.passwordExpired}"/>
            </div>
        </div>

    </g:if>
</div>
<script type="text/javascript">
    $(document).ready(function () {
        //Initialize Select2 Elements
        $(".select2").select2();

        $("#zoneId").change(function () {
            var zoneId = $(this).val();
            $.ajax({
                url: "${request.contextPath}/commonAjax/getEnterpriseByZoneId",
                data: "zoneId=" + zoneId,
                success: function (data, textStatus, jqXHR) {
                    console.log(data);
                    $("#enterpriseId").html(data);
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    console.log(textStatus);
                }
            });
        });

        /*$('.formValidation').each(function () {
            $(this).bootstrapValidator({
//                container: '#messages',
                message: 'This value is not valid',
                feedbackIcons: {
                    valid: 'glyphicon glyphicon-ok',
                    invalid: 'glyphicon glyphicon-remove',
                    validating: 'glyphicon glyphicon-refresh'
                },
                fields: {
                    fullName: {
                        validators: {
                            notEmpty: {
                                message: 'Full name is required and cannot be empty'
                            }
                        }
                    },
                    username: {
                        validators: {
                            notEmpty: {
                                message: 'Title is required and cannot be empty'
                            }
                        }
                    },
                    password: {
                        validators: {
                            notEmpty: {
                                message: 'Password is required and cannot be empty'
                            },
                            stringLength: {
                                min: 6,
                                max: 30,
                                message: 'The Title must be more than 6 and less than 30 characters long'
                            }
                        }
                    },
                    passwordNew: {
                        validators: {
                            stringLength: {
                                min: 6,
                                max: 30,
                                message: 'The Title must be more than 6 and less than 30 characters long'
                            }
                        }
                    },
                    role: {
                        validators: {
                            notEmpty: {
                                message: 'Role is required and cannot be empty'
                            }
                        }
                    },
                    email: {
                        validators: {
                            emailAddress: {
                                message: 'The email address is not valid'
                            }
                        }
                    }
                }
            });
        });*/
    });
</script>%{--


<link rel="stylesheet"
      href="http://cdnjs.cloudflare.com/ajax/libs/jquery.bootstrapvalidator/0.5.3/css/bootstrapValidator.min.css"/>
<script type="text/javascript" src="${resource(dir: "js", file: "bootstrapValidator.min.js")}"></script>--}%

