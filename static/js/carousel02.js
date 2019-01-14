$(function() {
				var boxTop = $(".marker").offset().top;
				$(window).scroll(function() {
					var _top = $(document).scrollTop();
					if(_top >= boxTop) {
						$(".move").slideDown("fast");
						$(".return_tips").show();

					  } else {
						$(".move").slideUp("fast");
						$(".return_tips").hide();
					}
				})
			});