$(document).ready(function () {
    if ($('#case_template').val() === 'checklist') {
        $('#checklist-container').show();
        $('#testcase-container').hide();
    } else {
        $('#checklist-container').hide();
        $('#testcase-container').show();
    }
});

$(function () {
    $('#case_template').change(function () {
        $('#checklist-container').toggle();
        $('#testcase-container').toggle();
    })
});

$(function () {
    $('#steps-control').on('cocoon:before-insert', function(e, insertedItem) {
        var prev_position = $(this).find('.step-positions').last().children().first().val();
        var new_position = parseInt(prev_position) + 1;
        var new_position_container = $(insertedItem).find('.step-positions').last().children();
        $(new_position_container).first().val(new_position);
        $(new_position_container).last().text(new_position);
    })
});
