/** Created by hoshen.mahmud on 25-Nov-15.** ======================================================================================================================================================*/var isExcludeCpEntrprsOffclRprstvDtl = false, isExcludeCpEntrprsSponsorDtl = false, isExcludeCpEntrprsAcknldgeDocDtl = false, isExcludeCpEntrprsMachineryDtl = false, isExcludeCpEntrprsRawMtrlDtl = false, isExcludeCpEntrprsPrdctnPrgrmDtl = false, isExcludeCpEntrprsPrdctMktDtl = false, isExcludeCpEntrprsPrjctnOfExpDtl = false, isExcludeCpEntrprsUtltyRqrmntDtl = false, isExcludeCpEntrprsSrvcRqrmntDtl = false, isExcludeCpEntrprsPrdctDtl = false;
jQuery(document).ready(function () {
    $("#excludeCpEntrprsOffclRprstvDtl, #excludeCpEntrprsSponsorDtl, #excludeCpEntrprsPrdctDtl, #excludeCpEntrprsMachineryDtl, #excludeCpEntrprsRawMtrlDtl, #excludeCpEntrprsPrdctnPrgrmDtl, #excludeCpEntrprsPrdctMktDtl, #excludeCpEntrprsPrjctnOfExpDtl, #excludeCpEntrprsUtltyRqrmntDtl, #excludeCpEntrprsSrvcRqrmntDtl, #excludeCpEntrprsAcknldgeDocDtl").find('*').each(function () {
        $(this).prop('disabled', false);
    });
});
function excludeDetail(detailId) {
    if (detailId == 'excludeCpEntrprsOffclRprstvDtl') {
        if (isExcludeCpEntrprsOffclRprstvDtl == true) {
            $("#excludeCpEntrprsOffclRprstvDtl").find('*').each(function () {
                $(this).prop('disabled', false);
            });
            $('#showHideCpEntrprsOffclRprstvDtl').removeClass('fa-plus').addClass('fa-minus');
            $('#showHideCpEntrprsOffclRprstvDtl').text(' Exclude');
            $('#excludeCpEntrprsOffclRprstvDtl').show();
            isExcludeCpEntrprsOffclRprstvDtl = false;
        } else {
            $("#excludeCpEntrprsOffclRprstvDtl").find('*').each(function () {
                $(this).prop('disabled', true);
            });
            $('#showHideCpEntrprsOffclRprstvDtl').removeClass('fa-minus').addClass('fa-plus');
            $('#showHideCpEntrprsOffclRprstvDtl').text(' Include');
            $('#excludeCpEntrprsOffclRprstvDtl').hide();
            isExcludeCpEntrprsOffclRprstvDtl = true;
        }
    } else if (detailId == 'excludeCpEntrprsSponsorDtl') {
        if (isExcludeCpEntrprsSponsorDtl == true) {
            $("#excludeCpEntrprsSponsorDtl").find('*').each(function () {
                $(this).prop('disabled', false);
            });
            $('#showHideCpEntrprsSponsorDtl').removeClass('fa-plus').addClass('fa-minus');
            $('#showHideCpEntrprsSponsorDtl').text(' Exclude');
            $('#excludeCpEntrprsSponsorDtl').show();
            $(this).parent().find('fa-minus').remove().add('fa-plus');
            isExcludeCpEntrprsSponsorDtl = false;
        } else {
            $("#excludeCpEntrprsSponsorDtl").find('*').each(function () {
                $(this).prop('disabled', true);
            });
            $('#showHideCpEntrprsSponsorDtl').removeClass('fa-minus').addClass('fa-plus');
            $('#showHideCpEntrprsSponsorDtl').text(' Include');
            $('#excludeCpEntrprsSponsorDtl').hide();
            $(this).parent().find('fa-plus').remove().add('fa-minus');
            isExcludeCpEntrprsSponsorDtl = true;
        }
    } else if (detailId == 'excludeCpEntrprsPrdctDtl') {
        if (isExcludeCpEntrprsPrdctDtl == true) {
            $("#excludeCpEntrprsPrdctDtl").find('*').each(function () {
                $(this).prop('disabled', false);
            });
            $('#showHideCpEntrprsPrdctDtl').removeClass('fa-plus').addClass('fa-minus');
            $('#showHideCpEntrprsPrdctDtl').text(' Exclude');
            $('#excludeCpEntrprsPrdctDtl').show();
            $(this).parent().find('fa-minus').remove().add('fa-plus');
            isExcludeCpEntrprsPrdctDtl = false;
        } else {
            $("#excludeCpEntrprsPrdctDtl").find('*').each(function () {
                $(this).prop('disabled', true);
            });
            $('#showHideCpEntrprsPrdctDtl').removeClass('fa-minus').addClass('fa-plus');
            $('#showHideCpEntrprsPrdctDtl').text(' Include');
            $('#excludeCpEntrprsPrdctDtl').hide();
            $(this).parent().find('fa-plus').remove().add('fa-minus');
            isExcludeCpEntrprsPrdctDtl = true;
        }
    } else if (detailId == 'excludeCpEntrprsMachineryDtl') {
        if (isExcludeCpEntrprsMachineryDtl == true) {
            $("#excludeCpEntrprsMachineryDtl").find('*').each(function () {
                $(this).prop('disabled', false);
            });
            $('#showHideCpEntrprsMachineryDtl').removeClass('fa-plus').addClass('fa-minus');
            $('#showHideCpEntrprsMachineryDtl').text(' Exclude');
            $('#excludeCpEntrprsMachineryDtl').show();
            $(this).parent().find('fa-minus').remove().add('fa-plus');
            isExcludeCpEntrprsMachineryDtl = false;
        } else {
            $("#excludeCpEntrprsMachineryDtl").find('*').each(function () {
                $(this).prop('disabled', true);
            });
            $('#showHideCpEntrprsMachineryDtl').removeClass('fa-minus').addClass('fa-plus');
            $('#showHideCpEntrprsMachineryDtl').text(' Include');
            $('#excludeCpEntrprsMachineryDtl').hide();
            $(this).parent().find('fa-plus').remove().add('fa-minus');
            isExcludeCpEntrprsMachineryDtl = true;
        }
    } else if (detailId == 'excludeCpEntrprsRawMtrlDtl') {
        if (isExcludeCpEntrprsRawMtrlDtl == true) {
            $("#excludeCpEntrprsRawMtrlDtl").find('*').each(function () {
                $(this).prop('disabled', false);
            });
            $('#showHideCpEntrprsRawMtrlDtl').removeClass('fa-plus').addClass('fa-minus');
            $('#showHideCpEntrprsRawMtrlDtl').text(' Exclude');
            $('#excludeCpEntrprsRawMtrlDtl').show();
            $(this).parent().find('fa-minus').remove().add('fa-plus');
            isExcludeCpEntrprsRawMtrlDtl = false;
        } else {
            $("#excludeCpEntrprsRawMtrlDtl").find('*').each(function () {
                $(this).prop('disabled', true);
            });
            $('#showHideCpEntrprsRawMtrlDtl').removeClass('fa-minus').addClass('fa-plus');
            $('#showHideCpEntrprsRawMtrlDtl').text(' Include');
            $('#excludeCpEntrprsRawMtrlDtl').hide();
            $(this).parent().find('fa-plus').remove().add('fa-minus');
            isExcludeCpEntrprsRawMtrlDtl = true;
        }
    } else if (detailId == 'excludeCpEntrprsPrdctnPrgrmDtl') {
        if (isExcludeCpEntrprsPrdctnPrgrmDtl == true) {
            $("#excludeCpEntrprsPrdctnPrgrmDtl").find('*').each(function () {
                $(this).prop('disabled', false);
            });
            $('#showHideCpEntrprsPrdctnPrgrmDtl').removeClass('fa-plus').addClass('fa-minus');
            $('#showHideCpEntrprsPrdctnPrgrmDtl').text(' Exclude');
            $('#excludeCpEntrprsPrdctnPrgrmDtl').show();
            $(this).parent().find('fa-minus').remove().add('fa-plus');
            isExcludeCpEntrprsPrdctnPrgrmDtl = false;
        } else {
            $("#excludeCpEntrprsPrdctnPrgrmDtl").find('*').each(function () {
                $(this).prop('disabled', true);
            });
            $('#showHideCpEntrprsPrdctnPrgrmDtl').removeClass('fa-minus').addClass('fa-plus');
            $('#showHideCpEntrprsPrdctnPrgrmDtl').text(' Include');
            $('#excludeCpEntrprsPrdctnPrgrmDtl').hide();
            $(this).parent().find('fa-plus').remove().add('fa-minus');
            isExcludeCpEntrprsPrdctnPrgrmDtl = true;
        }
    } else if (detailId == 'excludeCpEntrprsPrdctMktDtl') {
        if (isExcludeCpEntrprsPrdctMktDtl == true) {
            $("#excludeCpEntrprsPrdctMktDtl").find('*').each(function () {
                $(this).prop('disabled', false);
            });
            $('#showHideCpEntrprsPrdctMktDtl').removeClass('fa-plus').addClass('fa-minus');
            $('#showHideCpEntrprsPrdctMktDtl').text(' Exclude');
            $('#excludeCpEntrprsPrdctMktDtl').show();
            $(this).parent().find('fa-minus').remove().add('fa-plus');
            isExcludeCpEntrprsPrdctMktDtl = false;
        } else {
            $("#excludeCpEntrprsPrdctMktDtl").find('*').each(function () {
                $(this).prop('disabled', true);
            });
            $('#showHideCpEntrprsPrdctMktDtl').removeClass('fa-minus').addClass('fa-plus');
            $('#showHideCpEntrprsPrdctMktDtl').text(' Include');
            $('#excludeCpEntrprsPrdctMktDtl').hide();
            $(this).parent().find('fa-plus').remove().add('fa-minus');
            isExcludeCpEntrprsPrdctMktDtl = true;
        }
    } else if (detailId == 'excludeCpEntrprsPrjctnOfExpDtl') {
        if (isExcludeCpEntrprsPrjctnOfExpDtl == true) {
            $("#excludeCpEntrprsPrjctnOfExpDtl").find('*').each(function () {
                $(this).prop('disabled', false);
            });
            $('#showHideCpEntrprsPrjctnOfExpDtl').removeClass('fa-plus').addClass('fa-minus');
            $('#showHideCpEntrprsPrjctnOfExpDtl').text(' Exclude');
            $('#excludeCpEntrprsPrjctnOfExpDtl').show();
            $(this).parent().find('fa-minus').remove().add('fa-plus');
            isExcludeCpEntrprsPrjctnOfExpDtl = false;
        } else {
            $("#excludeCpEntrprsPrjctnOfExpDtl").find('*').each(function () {
                $(this).prop('disabled', true);
            });
            $('#showHideCpEntrprsPrjctnOfExpDtl').removeClass('fa-minus').addClass('fa-plus');
            $('#showHideCpEntrprsPrjctnOfExpDtl').text(' Include');
            $('#excludeCpEntrprsPrjctnOfExpDtl').hide();
            $(this).parent().find('fa-plus').remove().add('fa-minus');
            isExcludeCpEntrprsPrjctnOfExpDtl = true;
        }
    } else if (detailId == 'excludeCpEntrprsUtltyRqrmntDtl') {
        if (isExcludeCpEntrprsUtltyRqrmntDtl == true) {
            $("#excludeCpEntrprsUtltyRqrmntDtl").find('*').each(function () {
                $(this).prop('disabled', false);
            });
            $('#showHideCpEntrprsUtltyRqrmntDtl').removeClass('fa-plus').addClass('fa-minus');
            $('#showHideCpEntrprsUtltyRqrmntDtl').text(' Exclude');
            $('#excludeCpEntrprsUtltyRqrmntDtl').show();
            $(this).parent().find('fa-minus').remove().add('fa-plus');
            isExcludeCpEntrprsUtltyRqrmntDtl = false;
        } else {
            $("#excludeCpEntrprsUtltyRqrmntDtl").find('*').each(function () {
                $(this).prop('disabled', true);
            });
            $('#showHideCpEntrprsUtltyRqrmntDtl').removeClass('fa-minus').addClass('fa-plus');
            $('#showHideCpEntrprsUtltyRqrmntDtl').text(' Include');
            $('#excludeCpEntrprsUtltyRqrmntDtl').hide();
            $(this).parent().find('fa-plus').remove().add('fa-minus');
            isExcludeCpEntrprsUtltyRqrmntDtl = true;
        }
    } else if (detailId == 'excludeCpEntrprsSrvcRqrmntDtl') {
        if (isExcludeCpEntrprsSrvcRqrmntDtl == true) {
            $("#excludeCpEntrprsSrvcRqrmntDtl").find('*').each(function () {
                $(this).prop('disabled', false);
            });
            $('#showHideCpEntrprsSrvcRqrmntDtl').removeClass('fa-plus').addClass('fa-minus');
            $('#showHideCpEntrprsSrvcRqrmntDtl').text(' Exclude');
            $('#excludeCpEntrprsSrvcRqrmntDtl').show();
            $(this).parent().find('fa-minus').remove().add('fa-plus');
            isExcludeCpEntrprsSrvcRqrmntDtl = false;
        } else {
            $("#excludeCpEntrprsSrvcRqrmntDtl").find('*').each(function () {
                $(this).prop('disabled', true);
            });
            $('#showHideCpEntrprsSrvcRqrmntDtl').removeClass('fa-minus').addClass('fa-plus');
            $('#showHideCpEntrprsSrvcRqrmntDtl').text(' Include');
            $('#excludeCpEntrprsSrvcRqrmntDtl').hide();
            $(this).parent().find('fa-plus').remove().add('fa-minus');
            isExcludeCpEntrprsSrvcRqrmntDtl = true;
        }
    } else if (detailId == 'excludeCpEntrprsAcknldgeDocDtl') {
        if (isExcludeCpEntrprsAcknldgeDocDtl == true) {
            $("#excludeCpEntrprsAcknldgeDocDtl").find('*').each(function () {
                $(this).prop('disabled', false);
            });
            $('#showHideCpEntrprsAcknldgeDocDtl').removeClass('fa-plus').addClass('fa-minus');
            $('#showHideCpEntrprsAcknldgeDocDtl').text(' Exclude');
            $('#excludeCpEntrprsAcknldgeDocDtl').show();
            $(this).parent().find('fa-minus').remove().add('fa-plus');
            isExcludeCpEntrprsAcknldgeDocDtl = false;
        } else {
            $("#excludeCpEntrprsAcknldgeDocDtl").find('*').each(function () {
                $(this).prop('disabled', true);
            });
            $('#showHideCpEntrprsAcknldgeDocDtl').removeClass('fa-minus').addClass('fa-plus');
            $('#showHideCpEntrprsAcknldgeDocDtl').text(' Include');
            $('#excludeCpEntrprsAcknldgeDocDtl').hide();
            $(this).parent().find('fa-plus').remove().add('fa-minus');
            isExcludeCpEntrprsAcknldgeDocDtl = true;
        }
    }
}
$(document).ready(function () {
    if ($('#cbIsEffluentsComposition:checked').val() != 'on') {
        $("#divEffluentsComposition").hide();
        $("#effluentsComposition").removeAttr('required', 'required');
    }
    if ($('#cbIsEffluentsInjuriousChemicals:checked').val() != 'on') {
        $("#divEffluentsInjuriousChemicals").hide();
        $("#effluentsInjuriousChemicals").removeAttr('required', 'required');
    }
    if ($('#cbIsEffluentsArrangements:checked').val() != 'on') {
        $("#divEffluentsArrangements").hide();
        $("#effluentsArrangements").removeAttr('required', 'required');
    }
    $('.groupFrgnLocal').each(function () {
        if ($(this).children('input').val() == 'FOREIGN') {
            $(this).find('.btn').toggleClass('active');
            if ($(this).find('.btn-info').size() > 0) {
                $(this).find('.btn').toggleClass('btn-info');
            }
            $(this).find('.btn').toggleClass('btn-default');
            var statusFrgnLocal = $(this).find('.active').text().toLowerCase();
            if (statusFrgnLocal) {
                if (statusFrgnLocal == 'local') {
                    $(this).children('input').val('LOCAL');
                } else {
                    $(this).children('input').val('FOREIGN');
                }
            } else {
                $(this).children('input').val('FOREIGN');
            }
        }
    });
    if ($('#acknowledgeVal').val() == 'false') {
        $(this).find('.btn').toggleClass('active');
        if ($(this).find('.btn-info').size() > 0) {
            $(this).find('.btn').toggleClass('btn-info');
        }
        $(this).find('.btn').toggleClass('btn-default');
    }
});
$('.cp_c1').keyup(function () {
    var cp_c1_st = 0;
    $(this).parent().parent().parent().parent().find('.cp_c1').each(function () {
        var cp_c1 = $(this).val();
        !cp_c1 ? $(this).val(0) : cp_c1_st += parseInt(cp_c1);
    });
    $(this).parent().parent().parent().parent().find('.cp_c1_st').val(cp_c1_st);
    $('.cp_c1_gt').val(parseInt(!$('.cp_c1_rev').val() ? $('.cp_c1_rev').val(0) : $('.cp_c1_rev').val()) - cp_c1_st);
});
$('.cp_c1_rev').keyup(function () {
    $('.cp_c1_gt').val(parseInt(!$(this).val() ? $(this).val(0) : $(this).val()) - parseInt(!$('.cp_c1_st').val() ? $('.cp_c1_st').val(0) : $('.cp_c1_st').val()));
});
$('.mp_c1').keyup(function () {
    var mp_c1_gt = 0, mp_c3 = 0;
    $(this).parent().parent().parent().parent().find('.mp_c1').each(function () {
        var mp_c1 = $(this).val();
        !mp_c1 ? $(this).val(0) : mp_c1_gt += parseInt(mp_c1);
        $(this).parent().parent().parent().find('.mp_c3').val(parseInt(mp_c1 ? mp_c1 : 0) + parseInt($(this).parent().parent().parent().find('.mp_c2').val()));
    });
    $('.mp_c1_gt').val(mp_c1_gt);
    $('.mp_c3_gt').val(parseInt($('.mp_c2_gt').val()) + mp_c1_gt);
});
$('.mp_c2').keyup(function () {
    var mp_c2_gt = 0, mp_c3 = 0;
    $(this).parent().parent().parent().parent().find('.mp_c2').each(function () {
        var mp_c2 = $(this).val();
        !mp_c2 ? $(this).val(0) : mp_c2_gt += parseInt(mp_c2);
        $(this).parent().parent().parent().find('.mp_c3').val(parseInt(mp_c2 ? mp_c2 : 0) + parseInt($(this).parent().parent().parent().find('.mp_c1').val()));
    });
    $('.mp_c2_gt').val(mp_c2_gt);
    $('.mp_c3_gt').val(parseInt($('.mp_c1_gt').val()) + mp_c2_gt);
});
$('.cs_c1').keyup(function () {
    var cs_c1_gt = 0, cs_c3 = 0;
    $(this).parent().parent().parent().parent().find('.cs_c1').each(function () {
        var cs_c1 = $(this).val();
        !cs_c1 ? $(this).val(0) : cs_c1_gt += parseInt(cs_c1);
        $(this).parent().parent().parent().find('.cs_c3').val(parseInt(cs_c1 ? cs_c1 : 0) + parseInt($(this).parent().parent().parent().find('.cs_c2').val()));
    });
    $('.cs_c1_gt').val(cs_c1_gt);
    $('.cs_c3_gt').val(parseInt($('.cs_c2_gt').val()) + cs_c1_gt);
});
$('.cs_c2').keyup(function () {
    var cs_c2_gt = 0, cs_c3 = 0;
    $(this).parent().parent().parent().parent().find('.cs_c2').each(function () {
        var cs_c2 = $(this).val();
        !cs_c2 ? $(this).val(0) : cs_c2_gt += parseInt(cs_c2);
        $(this).parent().parent().parent().find('.cs_c3').val(parseInt(cs_c2 ? cs_c2 : 0) + parseInt($(this).parent().parent().parent().find('.cs_c1').val()));
    });
    $('.cs_c2_gt').val(cs_c2_gt);
    $('.cs_c3_gt').val(parseInt($('.cs_c1_gt').val()) + cs_c2_gt);
});
$('.fe_c1').keyup(function () {
    var fe_c1_gt = 0, fe_c1_st = parseInt(!$('.fe_c1_st').val() ? $('.fe_c1_st').val(0) : $('.fe_c1_st').val());
    $(this).parent().parent().parent().parent().find('.fe_c1').each(function () {
        var fe_c1 = $(this).val();
        !fe_c1 ? $(this).val(0) : fe_c1_gt += parseInt(fe_c1);
    });
    $('.fe_c1_gt').val(fe_c1_st - fe_c1_gt);
});
$('.fe_c2').keyup(function () {
    var fe_c2_gt = 0, fe_c2_st = parseInt(!$('.fe_c2_st').val() ? $('.fe_c2_st').val(0) : $('.fe_c2_st').val());
    $(this).parent().parent().parent().parent().find('.fe_c2').each(function () {
        var fe_c2 = $(this).val();
        !fe_c2 ? $(this).val(0) : fe_c2_gt += parseInt(fe_c2);
    });
    $('.fe_c2_gt').val(fe_c2_st - fe_c2_gt);
});
$('.fe_c3').keyup(function () {
    var fe_c3_gt = 0, fe_c3_st = parseInt(!$('.fe_c3_st').val() ? $('.fe_c3_st').val(0) : $('.fe_c3_st').val());
    $(this).parent().parent().parent().parent().find('.fe_c3').each(function () {
        var fe_c3 = $(this).val();
        !fe_c3 ? $(this).val(0) : fe_c3_gt += parseInt(fe_c3);
    });
    $('.fe_c3_gt').val(fe_c3_st - fe_c3_gt);
});
$('.fe_c4').keyup(function () {
    var fe_c4_gt = 0, fe_c4_st = parseInt(!$('.fe_c4_st').val() ? $('.fe_c4_st').val(0) : $('.fe_c4_st').val());
    $(this).parent().parent().parent().parent().find('.fe_c4').each(function () {
        var fe_c4 = $(this).val();
        !fe_c4 ? $(this).val(0) : fe_c4_gt += parseInt(fe_c4);
    });
    $('.fe_c4_gt').val(fe_c4_st - fe_c4_gt);
});
$('.fe_c5').keyup(function () {
    var fe_c5_gt = 0, fe_c5_st = parseInt(!$('.fe_c5_st').val() ? $('.fe_c5_st').val(0) : $('.fe_c5_st').val());
    $(this).parent().parent().parent().parent().find('.fe_c5').each(function () {
        var fe_c5 = $(this).val();
        !fe_c5 ? $(this).val(0) : fe_c5_gt += parseInt(fe_c5);
    });
    $('.fe_c5_gt').val(fe_c5_st - fe_c5_gt);
});
$('.fe_c1_st').keyup(function () {
    var fe_c1_gt = 0, fe_c1_st = 0;
    fe_c1_st = parseInt(!$(this).val() ? ($(this).val(0), fe_c1_st = 0) : $(this).val());
    $('.fe_c1').each(function () {
        var fe_c1 = $(this).val();
        !fe_c1 ? $(this).val(0) : fe_c1_gt += parseInt(fe_c1);
    });
    $('.fe_c1_gt').val(fe_c1_st - fe_c1_gt);
});
$('.fe_c2_st').keyup(function () {
    var fe_c2_gt = 0, fe_c2_st = 0;
    fe_c2_st = parseInt(!$(this).val() ? ($(this).val(0), fe_c2_st = 0) : $(this).val());
    $('.fe_c2').each(function () {
        var fe_c2 = $(this).val();
        !fe_c2 ? $(this).val(0) : fe_c2_gt += parseInt(fe_c2);
    });
    $('.fe_c2_gt').val(fe_c2_st - fe_c2_gt);
});
$('.fe_c3_st').keyup(function () {
    var fe_c3_gt = 0, fe_c3_st = 0;
    fe_c3_st = parseInt(!$(this).val() ? ($(this).val(0), fe_c3_st = 0) : $(this).val());
    $('.fe_c3').each(function () {
        var fe_c3 = $(this).val();
        !fe_c3 ? $(this).val(0) : fe_c3_gt += parseInt(fe_c3);
    });
    $('.fe_c3_gt').val(fe_c3_st - fe_c3_gt);
});
$('.fe_c4_st').keyup(function () {
    var fe_c4_gt = 0, fe_c4_st = 0;
    fe_c4_st = parseInt(!$(this).val() ? ($(this).val(0), fe_c4_st = 0) : $(this).val());
    $('.fe_c4').each(function () {
        var fe_c4 = $(this).val();
        !fe_c4 ? $(this).val(0) : fe_c4_gt += parseInt(fe_c4);
    });
    $('.fe_c4_gt').val(fe_c4_st - fe_c4_gt);
});
$('.fe_c5_st').keyup(function () {
    var fe_c5_gt = 0, fe_c5_st = 0;
    fe_c5_st = parseInt(!$(this).val() ? ($(this).val(0), fe_c5_st = 0) : $(this).val());
    $('.fe_c5').each(function () {
        var fe_c5 = $(this).val();
        !fe_c5 ? $(this).val(0) : fe_c5_gt += parseInt(fe_c5);
    });
    $('.fe_c5_gt').val(fe_c5_st - fe_c5_gt);
});
$('.fa_c1').keyup(function () {
    var fa_c1_st_1 = 0, fa_c3 = 0;
    $(this).parent().parent().parent().parent().find('.fa_c1').each(function () {
        var fa_c1 = $(this).val();
        !fa_c1 ? $(this).val(0) : fa_c1_st_1 += parseInt(fa_c1);
        $(this).parent().parent().parent().find('.fa_c3').val(parseInt(fa_c1 ? fa_c1 : 0) + parseInt($(this).parent().parent().parent().find('.fa_c2').val()));
    });
    $('.fa_c1_st_1').val(fa_c1_st_1);
    $('.fa_c3_st_1').val(parseInt($('.fa_c2_st_1').val()) + fa_c1_st_1);
    $('.fa_c3_st_2').val(parseInt($('.fa_c1_st_2').val()) + parseInt($('.fa_c2_st_2').val()));
    $('.fa_c1_gt').val(fa_c1_st_1 + parseInt($('.fa_c1_st_2').val()));
    $('.fa_c3_gt').val(parseInt($('.fa_c1_gt').val()) + parseInt($('.fa_c2_gt').val()));
});
$('.fa_c2').keyup(function () {
    var fa_c2_st_1 = 0, fa_c3 = 0;
    $(this).parent().parent().parent().parent().find('.fa_c2').each(function () {
        var fa_c2 = $(this).val();
        !fa_c2 ? $(this).val(0) : fa_c2_st_1 += parseInt(fa_c2);
        $(this).parent().parent().parent().find('.fa_c3').val(parseInt(fa_c2 ? fa_c2 : 0) + parseInt($(this).parent().parent().parent().find('.fa_c1').val()));
    });
    $('.fa_c2_st_1').val(fa_c2_st_1);
    $('.fa_c3_st_1').val(parseInt($('.fa_c1_st_1').val()) + fa_c2_st_1);
    $('.fa_c3_st_2').val(parseInt($('.fa_c1_st_2').val()) + parseInt($('.fa_c2_st_2').val()));
    $('.fa_c2_gt').val(fa_c2_st_1 + parseInt($('.fa_c2_st_2').val()));
    $('.fa_c3_gt').val(parseInt($('.fa_c1_gt').val()) + parseInt($('.fa_c2_gt').val()));
});
$('.fa_c1_st_2').keyup(function () {
    var fa_c1_st_2 = $(this).val();
    !fa_c1_st_2 ? $(this).val(0) : $('.fa_c3_st_2').val(parseInt($(this).val()) + parseInt($('.fa_c2_st_2').val())), $('.fa_c1_gt').val(parseInt($(this).val()) + parseInt($('.fa_c1_st_1').val()));
    $('.fa_c3_gt').val(parseInt($('.fa_c1_gt').val()) + parseInt($('.fa_c2_gt').val()));
});
$('.fa_c2_st_2').keyup(function () {
    var fa_c2_st_2 = $(this).val();
    !fa_c2_st_2 ? $(this).val(0) : $('.fa_c3_st_2').val(parseInt($(this).val()) + parseInt($('.fa_c1_st_2').val())), $('.fa_c2_gt').val(parseInt($(this).val()) + parseInt($('.fa_c2_st_1').val()));
    $('.fa_c3_gt').val(parseInt($('.fa_c1_gt').val()) + parseInt($('.fa_c2_gt').val()));
});
$("#cbIsEffluentsComposition").click(function () {
    if ($('#cbIsEffluentsComposition:checked').val() == 'on') {
        $("#effluentsComposition").attr('required', 'required');
        $("#divEffluentsComposition").show();
    } else {
        $("#effluentsComposition").val('');
        $("#effluentsComposition").removeAttr('required', 'required');
        $("#divEffluentsComposition").hide();
    }
});
$("#cbIsEffluentsInjuriousChemicals").click(function () {
    if ($('#cbIsEffluentsInjuriousChemicals:checked').val() == 'on') {
        $("#effluentsInjuriousChemicals").attr('required', 'required');
        $("#divEffluentsInjuriousChemicals").show();
    } else {
        $("#effluentsInjuriousChemicals").val('');
        $("#effluentsInjuriousChemicals").removeAttr('required', 'required');
        $("#divEffluentsInjuriousChemicals").hide();
    }
});
$("#cbIsEffluentsArrangements").click(function () {
    if ($('#cbIsEffluentsArrangements:checked').val() == 'on') {
        $("#effluentsArrangements").attr('required', 'required');
        $("#divEffluentsArrangements").show();
    } else {
        $("#effluentsArrangements").val('');
        $("#effluentsArrangements").removeAttr('required', 'required');
        $("#divEffluentsArrangements").hide();
    }
});
$('#acknowledgeValGroup').click(function () {
    $(this).find('.btn').toggleClass('active');
    if ($(this).find('.btn-info').size() > 0) {
        $(this).find('.btn').toggleClass('btn-info');
    }
    $(this).find('.btn').toggleClass('btn-default');
    var booleanStatus = $(this).find('.active').text().toLowerCase();
    if (booleanStatus) {
        if (booleanStatus == 'yes' || booleanStatus == 'on' || booleanStatus == '1' || booleanStatus == 'true') {
            $('#acknowledgeVal').val(true);
        } else {
            $('#acknowledgeVal').val(false);
        }
    } else {
        $('#acknowledgeVal').val(false);
    }
});
$('.groupFrgnLocal').click(function () {
    $(this).find('.btn').toggleClass('active');
    if ($(this).find('.btn-info').size() > 0) {
        $(this).find('.btn').toggleClass('btn-info');
    }
    $(this).find('.btn').toggleClass('btn-default');
    var statusFrgnLocal = $(this).find('.active').text().toLowerCase();
    if (statusFrgnLocal) {
        if (statusFrgnLocal == 'local') {
            $(this).children('input').val('LOCAL');
        } else {
            $(this).children('input').val('FOREIGN');
        }
    } else {
        $(this).children('input').val('FOREIGN');
    }
});
/*======================================================================================================================================================*/
