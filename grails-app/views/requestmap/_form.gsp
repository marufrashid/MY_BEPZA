<%@ page import="com.bepza.auth.Requestmap" %>
<div class="">
    <div class="form-group ${hasErrors(bean: requestmapInstance, field: 'url', 'has-error')}">
        <label for="url" class="col-sm-2 control-label">URL Path
            <span class="required-indicator">*</span>
        </label>

        <div class="col-sm-6">
            <g:field type="uri" name="url" id="url"
                     value="${requestmapInstance?.url}" class="form-control"/>
        </div>
    </div>

    <div class="form-group ${hasErrors(bean: requestmapInstance, field: 'httpMethod', 'has-error')}">
        <label for="httpMethod" class="col-sm-2 control-label">HTTP Method</label>

        <div class="col-sm-6">
            <g:select name="httpMethod" from="${org.springframework.http.HttpMethod?.values()}"
                      keys="${org.springframework.http.HttpMethod.values()*.name()}"
                      value="${requestmapInstance?.httpMethod?.name()}" noSelection="['': '']" class="form-control"/>

        </div>
    </div>

    <div class="form-group">
        <label for="httpMethod" class="col-sm-2 control-label">Role
            <span class="required-indicator">*</span>
        </label>

        <div class="col-sm-6">

            <div class="box scroll-div">
                <div class="box-body no-padding">
                    <table class="table table-striped">
                        <g:each in="${com.bepza.auth.Role.list(sort: "authority")}" status="i" var="roleInstance">
                            <tr>
                                <td width="10">
                                    <g:if test="${requestmapInstance?.configAttribute?.split(",")?.contains(roleInstance.authority) || roleInstance.authority == 'ROLE_ADMIN'}">
                                        <g:checkBox name="configAttribute" value="${roleInstance.authority}"
                                                    checked="true"></g:checkBox>
                                    </g:if>
                                    <g:else>
                                        <g:checkBox name="configAttribute" value="${roleInstance.authority}"
                                                    checked="false"></g:checkBox>
                                    </g:else>
                                </td>
                                <td>${roleInstance.authority}</td>
                            </tr>
                        </g:each>
                    </table>
                </div><!-- /.box-body -->
            </div><!-- /.box -->

        </div>
    </div>
</div>

<script type="text/javascript">
    $(function(){
        $('.formValReqMap').each(function(){
            $(this).bootstrapValidator({
                message: 'This value is not valid',
                feedbackIcons: {
                    valid: 'glyphicon glyphicon-ok',
                    invalid: 'glyphicon glyphicon-remove',
                    validating: 'glyphicon glyphicon-refresh'
                },
                fields: {
                    url: {
                        validators: {
                            notEmpty: {
                                message: 'The url path is required and cannot be empty'
                            }/*,
                            regexp: {
                                regexp: /^\/[a-zA-Z/]+$/,
                                message: 'The url path start with / and lowarcase only '
                            }*/

                        }
                    },
                    authority: {
                        validators: {
                            notEmpty: {
                                message: 'Authority is required and cannot be empty'
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