// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/

//  'noclose' plugin does not allow to collapse
// (function($, undefined) {
//     "use strict";
//     $.jstree.plugins.noclose = function() {
//         this.close_node = $.noop;
//     };
// })(jQuery);

// Renders JStree sidebar
$(document).on('turbolinks:load',function() {
    $('#jstree_div').jstree({
        // Uncomment for Context Menu and Drag-n-Drop plugins
        // "plugins" : [
        //     "contextmenu",
        //     "dnd"
        // ]
    }).on('ready.jstree', function () {
        $('#jstree_div').jstree('open_all');
    });
});


// Checks children if parent is checked
$(function () {
    $("input[type='checkbox']").change(function () {
        $(this).parent().parent().children('ul').find("input[type='checkbox']").prop('checked', this.checked);
    });
});
