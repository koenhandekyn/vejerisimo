//= require jquery/dist/jquery.min
//= require bootstrap/bootstrap
//= require _async_include.min
/// require _jquery_mobile_touch_subset

function showalert(message,alerttype) {
  $('#alert_placeholder').append('<div id="alertdiv" class="alert ' +  alerttype + '"><a class="close" data-dismiss="alert">×</a><span>'+message+'</span></div>')
  setTimeout(function() {
    $("#alertdiv").remove();
  }, 10000);
}

var on_submit;

$(function() {
  $('form[name=contact]').on('submit', on_submit);
  console.log('form initialised')
});

$(function() {
  return $(".carousel.slide.lazy-img").on("slide.bs.carousel", function(ev) {
    console.log("loading images");
    var lazy;
    lazy = $(ev.relatedTarget).find("img[data-src]");
    lazy.attr("src", lazy.data('src'));
    lazy.removeAttr("data-src");
  });
});

$(function() {
  return $(".carousel.slide.lazy-bg").on("slide.bs.carousel", function(ev) {
    console.log("loading background images");
    var lazy;
    lazy = $(ev.relatedTarget).find(".img[data-src]");
    var url = "url('"+lazy.data('src')+"')";
    lazy.css("background-image", url);
    lazy.removeAttr("data-src");
  });
});
