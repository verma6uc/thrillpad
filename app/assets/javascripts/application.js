// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require twitter/bootstrap
//= require underscore
//= require_self


var do_on_load = function () {
    $('#container').isotope('reLayout');
    var $container = $('#container');
    $('#container').isotope({
        // options
        itemSelector: '.item',
        layoutMode: 'fitRows',
        getSortData: {
            symbol: function ($elem) {
                return $elem.attr('data-symbol');
            },
            category: function ($elem) {
                return $elem.attr('data-category');
            },
            number: function ($elem) {
                return parseInt($elem.find('.number').text(), 10);
            },
            weight: function ($elem) {
                return parseFloat($elem.find('.weight').text().replace(/[\(\)]/g, ''));
            },
            name: function ($elem) {
                return $elem.find('.name').text();
            }
        }
    });
    $('#filters a').click(function () {
        var selector = $(this).attr('data-filter');
        $('#container').isotope({
            filter: selector
        });
        $('#container').isotope('reLayout')
        return false;
    });
    /* */
    var $optionSets = $('#options .option-set'),
        $optionLinks = $optionSets.find('a');

    $optionLinks.click(function () {
        var $this = $(this);
        // don't proceed if already selected
        if ($this.hasClass('selected')) {
            return false;
        }
        var $optionSet = $this.parents('.option-set');
        $optionSet.find('.selected').removeClass('selected');
        $this.addClass('selected');

        // make option object dynamically, i.e. { filter: '.my-filter-class' }
        var options = {},
            key = $optionSet.attr('data-option-key'),
            value = $this.attr('data-option-value');
        // parse 'false' as false boolean
        value = value === 'false' ? false : value;
        options[ key ] = value;
        if (key === 'layoutMode' && typeof changeLayoutMode === 'function') {
            // changes in layout modes need extra logic
            changeLayoutMode($this, options)
        } else {
            // otherwise, apply new options
            $container.isotope(options);
        }

        return false;
    });

    $('#trip_id').on('keypress', function () {
        //alert("aaa" + document.getElementById("trip_id").value);
        //get Element via ajax
        //alert(document.getElementById("trip_id").value);
        $.ajax({
            url: "/loc/" + document.getElementById("trip_id").value,
            success: function (result) {
                $("#div1").html(result);
            }
        });
    })


}
$(document).ready(do_on_load)
$(window).bind('page:change', do_on_load)
