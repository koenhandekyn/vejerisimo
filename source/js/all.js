//= require jquery/jquery.min
//= require bootstrap/bootstrap
//= require ie8
//= require _jquery_mobile_touch_subset

function showalert(message,alerttype) {
  $('#alert_placeholder').append('<div id="alertdiv" class="alert ' +  alerttype + '"><a class="close" data-dismiss="alert">×</a><span>'+message+'</span></div>')
  setTimeout(function() {
    $("#alertdiv").remove();
  }, 10000);
}

$(document).ready(function() {
  $('form[name=contact]').on('submit', on_submit);
});

