$(document).ready(function () {
	$('.like_link').on('click', function(event) {

		var likeCount = $(this).siblings('.counter')
		event.preventDefault();
		
		$.post(this.href, function(response) {
			likeCount.text(response.new_likes_count);
		})
	})
})