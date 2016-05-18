/** Created by hoshen.mahmud on 04-Feb-16.
 *======================================================================================================================================================*/
jQuery(document).ready(function () {
    //"use strict";
    jQuery(document).on('click', '#cbRecipient', function () {
        if ($(this).prop('checked')) {
            $(".recipient").each(function () {
                $(this).prop('checked', true);
            });
            $("#lblRecipient").text("Deselect All");
        } else {
            $(".recipient").each(function () {
                $(this).prop('checked', false);
            });
            $("#lblRecipient").text("Select All");
        }
    });
});

$("#notificationAndMessaging").dataTable({
    sPaginationType : "full_numbers",	//for first/last button in padding
    lengthMenu: [[5, 10, 15, 25, 50, -1], [5, 10, 15, 25, 50, "All"]],  //or lengthMenu: [ 10, 25, 50, 75, 100 ]
    responsive: true,
    dom: 'T<"clear">lfrtip',
    oTableTools: {
        sSwfPath: "../resources/plugins/datatables/extensions/TableTools/swf/copy_csv_xls_pdf.swf",
        //aButtons: ["copy", "csv", "print"]
    },
});
/*======================================================================================================================================================*/