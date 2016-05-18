<%@ page import="com.bepza.common.AllLookup" %>

<p>Fields marked with (<span class="required-indicator">*</span>) are mandatory</p>
<hr/>

<div class="">
    <div class="form-group ${hasErrors(bean: userInstance, field: 'parent', 'has-error')}">
        <label for="parent" class="col-sm-2 control-label">Parent</label>

        <div class="col-sm-6">
            <g:select id="parent" name="parent.id"
                      from="${com.bepza.common.AllLookup.findAllByParentIsNullAndIsActive(true, [sort: 'title', order: 'asc'])}"
                      optionKey="id" onchange="getLookupList()" onblur="getLookupList()"
                      value="${allLookupInstance?.parent?.id}" class="form-control select2 input-sm"
                      noSelection="['': '--Select--']"/>
        </div>
    </div>

    <div class="form-group ${hasErrors(bean: allLookupInstance, field: 'keyword', 'has-error')}">
        <label for="keyword" class="col-sm-2 control-label">Keyword
            <span class="required-indicator">*</span>
        </label>

        <div class="col-sm-6">
            <g:textField name="keyword" id="keyword"
                         value="${allLookupInstance?.keyword}" class="form-control"/>
        </div>
    </div>


    <div class="form-group ${hasErrors(bean: allLookupInstance, field: 'title', 'has-error')}">
        <label for="title" class="col-sm-2 control-label">Title
            <span class="required-indicator">*</span>
        </label>

        <div class="col-sm-6">
            <g:textField name="title" id="title" value="${allLookupInstance?.title}"
                         class="form-control"/>
        </div>
    </div>

    <div class="form-group ${hasErrors(bean: allLookupInstance, field: 'sortBy', 'has-error')}">
        <label for="sortBy" class="col-sm-2 control-label">Sort Order</label>

        <div class="col-sm-6">
            <g:textField name="sortBy" id="sortBy" sortBy="" min="" value="${allLookupInstance?.sortBy}"
                         autocomplete="off" class="form-control"/><label id="errmsg" style="color: red"></label>
        </div>
    </div>


    <div class="form-group">
        <label for="isActive" class="col-sm-2 control-label">Is Active?</label>

        <div class="col-sm-6">
            <g:checkBox name="isActive" value="${allLookupInstance?.isActive}"/>
        </div>
    </div>
</div>

<div class="row">
    <div class="col-md-12">
        <div class="" id="lookUpList">

        </div>
    </div>
</div>


<script type="text/javascript">
    $(function () {
        $(".select2").select2();

        $('.formValLookUp').each(function () {
            $(this).bootstrapValidator({
                message: 'This value is not valid',
                feedbackIcons: {
                    valid: 'glyphicon glyphicon-ok',
                    invalid: 'glyphicon glyphicon-remove',
                    validating: 'glyphicon glyphicon-refresh'
                },
                fields: {
                    keyword: {
                        validators: {
                            notEmpty: {
                                message: 'Keyword is required and cannot be empty'
                            },
                            regexp: {
                                regexp: /^[A-Z_]+$/,
                                message: 'Keyword can only consist of Uppercase and underscore'
                            }
                        }
                    },
                    title: {
                        validators: {
                            notEmpty: {
                                message: 'Title is required and cannot be empty'
                            },
                            stringLength: {
                                min: 1,
                                max: 100,
                                message: 'The Title must be more than 1 and less than 100 characters long'
                            }
                        }
                    },
                    sortBy: {
                        validators: {
                            integer: {
                                message: 'The sort order is not an integer number'
                            }
                        }
                    }

                }
            });
        });
    });

    function getLookupList() {
        var parentId = $("#parent").val();
        $.ajax({
            url: "${request.contextPath}/commonAjax/allLookUpParentList",
            data: "parentId=" + parentId,
            success: function (response) {
                $("#lookUpList").html(response);
            },
            error: function (jqXHR, textStatus, errorThrown) {
                console.log(textStatus);
            }
        });
    }
</script>


<link rel="stylesheet"
      href="http://cdnjs.cloudflare.com/ajax/libs/jquery.bootstrapvalidator/0.5.3/css/bootstrapValidator.min.css"/>
<script type="text/javascript" src="${resource(dir: "js", file: "bootstrapValidator.min.js")}"></script>

