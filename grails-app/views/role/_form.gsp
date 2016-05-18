<%@ page import="com.bepza.auth.Role" %>

<div class="">
    <div class="form-group ${hasErrors(bean: roleInstance, field: 'authority', 'has-error')}">
        <label for="authority" class="col-sm-2 control-label">Authority
            <span class="required-indicator" style="color: red">*</span>
        </label>

        <div class="col-sm-6">
            <g:textField name="authority" id="authority"
                         placeholder="Should be uppercase with underscore join and start with ROLE_ prefix."
                         value="${roleInstance?.authority}" class="form-control"/>
        </div>
    </div>

    <div class="form-group ${hasErrors(bean: roleInstance, field: 'description', 'has-error')}">
        <label for="description" class="col-sm-2 control-label">Description</label>

        <div class="col-sm-6">
            <g:textField name="description" id="description" placeholder="Description about the role."
                         value="${roleInstance?.description}" class="form-control"/>
        </div>
    </div>

</div>

<script type="text/javascript">
    $(function () {

        $('.formValRole').each(function () {
            $(this).bootstrapValidator({
                message: 'This value is not valid',
                feedbackIcons: {
                    valid: 'glyphicon glyphicon-ok',
                    invalid: 'glyphicon glyphicon-remove',
                    validating: 'glyphicon glyphicon-refresh'
                },
                fields: {

                    authority: {
                        validators: {
                            notEmpty: {
                                message: 'Authority is required and cannot be empty'
                            },
                            regexp: {
                                regexp: /^(ROLE_?)[A-Z_]+$/,
                                message: 'The Authority start with ROLE_ and uppercase only '
                            }
                        }
                    }
                }
            });
        });
    });
</script>

<link rel="stylesheet"
      href="http://cdnjs.cloudflare.com/ajax/libs/jquery.bootstrapvalidator/0.5.3/css/bootstrapValidator.min.css"/>
<script type="text/javascript" src="${resource(dir: "js", file: "bootstrapValidator.min.js")}"></script>


