//= require jquery/jquery
//= require sass-bootstrap/js/carousel
//= require bootstrap-touch-carousel/dist/js/bootstrap-touch-carousel
//#= require bxslider-4/dist/jquery.bxslider.min
//= require_tree .

$(document).ready(function(e){
    var carousel = $(this).find('.carousel').hide();
    var deferreds = [];
    var imgs = $('.carousel', this).find('img');
    // loop over each img
    imgs.each(function(){
        var self = $(this);
        var datasrc = self.attr('data-src');
        if (datasrc) {
            var d = $.Deferred();
            self.one('load', d.resolve)
                .attr("src", datasrc)
                .attr('data-src', '');
            deferreds.push(d.promise());
        }
    });

    $.when.apply($, deferreds).done(function(){
        $('#ajaxloader').hide();
        carousel.fadeIn(1000);
    });
});