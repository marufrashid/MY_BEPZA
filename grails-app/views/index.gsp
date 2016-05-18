<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Welcom to BEPZA</title>
</head>

<body>
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            Welcome to BEPZA
        </h1>
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
                <div class="box box-info">
                    <div class="box-header with-border">
                        <i class="fa fa-info-circle"></i>

                        <h3 class="box-title">About BEPZA</h3>
                    </div>

                    <div class="box-body">
                        <p class="lead justified">In order to stimulate rapid economic growth of the country, particularly through industrialization, the government has adopted an 'Open Door Policy' to attract foreign investment to Bangladesh. The BEPZA is the official organ of the government to promote, attract and facilitate foreign investment in the EPZs. Besides, BEPZA as the competent Authority performs inspection & supervision of the compliances of the enterprises related to social & environmental issues, safety & security at work place in order to maintain harmonious labor-management & industrial relations in EPZs. The primary objective of an EPZ is to provide special areas where potential investors would find a congenial investment climate free from cumbersome procedures.</p>
                        <br><br><br><br><br><br><br><br><br><br>
                    </div>

                    %{--<div class="box-footer">

                    </div>--}%
                </div>
            </div>
        </div>
    </section><!-- /.content -->
</div><!-- /.content-wrapper -->

</body>
</html>
