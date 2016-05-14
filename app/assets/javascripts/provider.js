// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/


(function($) {

	var tabs =  $(".tabs li a");

	tabs.click(function() {
		var content = this.hash.replace('/','');
		tabs.removeClass("active");
		$(this).addClass("active");
    $("#content").find('p').hide();
    $(content).fadeIn(200);
	});

})(jQuery);
