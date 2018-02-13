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
$(function () {
    $('.add-section').click(function () {
        var parent = this;
        $(document).on('ajax:success', function () {
            $('#section_parent_id').val(function () {
                return $(parent).attr('data-attribute');
            });
        });
    });
});

// Opens inline form for Test Case creation
$(function () {
    $('.add-case').click(function () {
        $(this).parent().next().css('display', 'inline-block');
    });
});

// Hides inline form for Test Case creation
// $(function () {
//     $('.form-inline').find('close').click(function () {
//         $(this).closest('.inlineTestCase').hide();
//     })
// });

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
