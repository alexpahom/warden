// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/

// Renders JStree sidebar
$(function() {
    $('#jstree_div').jstree().on('ready.jstree', function () {
        // Expands the tree by default
        $('#jstree_div').jstree('open_all')
            // Scrolls #cases to section that clicked within jstree-div
            .on('activate_node.jstree', function(e, data){
                //Finds a section to hover to
           var point = $('#cases').find('span').filter(function () {
               return $(this).text() === data.node.text;
           });
                // Scrolls to it
           $('html, body').animate({
               scrollTop: $(point).offset().top
           }, 300);
        });
    });
});

// Checks children if parent is checked
$(function () {
    $("input[type='checkbox']").change(function () {
        if ($(this).parent().hasClass('section-selection')) {
            $(this).closest('li').find("input[type='checkbox']").prop('checked', this.checked);
        }
    });
});

// Appends parent_id of a section right into the pop-up form
function appendParent(parent) {
    $(document).on('ajax:success', function () {
        $('#section_parent_id').val(parent);
    });
}

// Opens inline form for Test Case creation
$(function () {
    $('.add-case').click(function () {
        $(this).parent().next().css('display', 'inline-block');
    });
});



// JStree sticks to the top of a screen
$(function () {
    var a = function () {
        var win_top = $(window).scrollTop();
        var div_top = $('#scroller').offset().top;
        var sc = $('#jstree_div');
        if (win_top > div_top) {
            sc.css({position: 'fixed', top: '0px'})
        } else {
            sc.css({position: 'relative', top: ''})
        }
    };
    $(window).scroll(a);a()
});

//
$(document).ready(function () {
    $('.form-inline').submit(function (event) {
        event.preventDefault();
        console.log(1);
    });
});

$(function() {
    $('#deleteCases').click(function() {
        var values = [];
        $('.case-selection').each(function(i, val) {
            if (val.checked) {
                values.push(val.getAttribute('value'));
            }
        });
        $.ajax({
            url: $(this).attr('ajax_path'),
            type: 'DELETE',
            data: {ids: values},
            success: function() {
                values.forEach(function (value) {
                    $('tr#case_' + value).remove();
                });
            },
            error: function(jqXHR) {
                window.alert(jqXHR.statusText);
            }
        });
    });
});
