//= require jquery/jquery
//= require bootstrap/bootstrap
//= require_tree .

// $(document).ready(function(e){
//     var carousel = $(this).find('.carousel').hide();
//     var deferreds = [];
//     var imgs = $('.carousel', this).find('img');
//     // loop over each img
//     imgs.each(function(){
//         var self = $(this);
//         var datasrc = self.attr('data-src');
//         if (datasrc) {
//             var d = $.Deferred();
//             self.one('load', d.resolve)
//                 .attr("src", datasrc)
//                 .attr('data-src', '');
//             deferreds.push(d.promise());
//         }
//     });

//     $.when.apply($, deferreds).done(function(){
//         $('#ajaxloader').hide();
//         carousel.fadeIn(1000);
//     });
// });