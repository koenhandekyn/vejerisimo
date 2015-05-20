(($) ->
 $ ->
  		console.log("DOM is ready")
  		console.log($("#carousel-top"))
  		$(".carousel").on "swiperight", ->
  			$(this).carousel('next');
  		$(".carousel").on "swipeleft", ->
  			$(this).carousel('prev');
)(jQuery)

$(document).ready ->
  $('.bxslider').bxSlider
    mode: 'fade'
    captions: true
  return