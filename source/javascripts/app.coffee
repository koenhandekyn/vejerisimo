$ ->
	console.log("DOM is ready")
	console.log($("#carousel-top"))
	$(".carousel").on "swiperight", ->
		$(this).carousel('prev');
	$(".carousel").on "swipeleft", ->
		$(this).carousel('next');
