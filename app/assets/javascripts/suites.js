// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/

// Renders JStree sidebar
$(document).on('turbolinks:load',function() {
    $('#jstree_div').jstree().on('ready.jstree', function () {
        $('#jstree_div').jstree('open_all');
    });
});

// Checks children if parent is checked
$(document).on('turbolinks:load',function () {
    $("input[type='checkbox']").change(function () {
        $(this).parent().parent().children('ul').find("input[type='checkbox']").prop('checked', this.checked);
    });
});

// Appends parent_id of a section right into the pop-up form
// TODO: Still requires page refresh
$(document).on('turbolinks:load',function () {
    $('.add-section').click(function () {
        var parent = $(this).attr('data-attribute');
        setTimeout(function () {
            $('#section_parent_id').val(parent);
            }, 1500);
        });
});

// TODO: Scroll on jstree_div click
// $(function(){
//     $('#jstree_div a').click(function () {
//         var text = $(this).text();
//         // Finds span.text() within #cases div
//         var point = $('#cases span').filter(function () {
//             return $(this).text == text;
//         });
//         // Scrolls down to searched element
//         $('html, body').animate({
//             scrollTop: $(point).offset().top
//         }, 300);
//     });
// });
