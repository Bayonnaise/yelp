$(document).ready(function() {
	$('.like_link').on('click', function(event) {

		var likeCounter = $(this).siblings('.like_counter')
		event.preventDefault();
		
		$.post(this.href, function(response) {
			likeCounter.text(response.new_likes_count);
		})
	})
})