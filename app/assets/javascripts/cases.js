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