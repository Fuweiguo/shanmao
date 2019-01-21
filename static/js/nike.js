$(function(e) {
	//放大镜
	function magic() {
		var smallImg = $(".picture a");
		var smallArea = $(".magic_small");
		var img = $(".goodImg").clone()
		var bigImg = img.appendTo($("#big_img"));
		var bigArea = $(".magic_box");
		smallArea.width(smallImg.width() / bigImg.width() * bigArea.width());
		smallArea.height(smallImg.height() / bigImg.height() * bigArea.height());

		var cale = bigImg.width() / smallImg.width();
		bigArea.mouseenter(function() {
			bigArea.hide();
		})
		smallImg.mousemove(function(e) {
			bigArea.show()
			var leftSide = smallImg.offset().left;
			var rightSide = leftSide + smallImg.width();
			var topSide = smallImg.offset().top;
			var bottomSide = topSide + smallImg.height();
			if(e.pageX > leftSide && e.pageX <= rightSide && e.pageY < bottomSide && e.pageY > topSide) {
				smallArea.show();
				e.preventDefault();
				var x = e.pageX - leftSide - smallArea.width() / 2;
				var y = e.pageY - topSide - smallArea.height() / 2;

				if(x <= 0) {
					x = 0;
				} else if(x >= smallImg.width() - smallArea.width()) {
					x = smallImg.width() - smallArea.width();
				}
				if(y <= 0) {
					y = 0;
				} else if(y >= smallImg.height() - smallArea.height()) {
					y = smallImg.height() - smallArea.height();
				}

				smallArea.css({
					left: x,
					top: y
				});
				bigImg.css({
					left: -x * cale,
					top: -y * cale
				});
			}
			smallImg.mouseleave(function() {
				smallArea.hide();
				bigArea.hide();
			})
		})
	}
	magic()

	// #商品添加操作
	$('.plus').click(function () {


		var goodsid = $(this).attr('goodsid')
		var $that = $(this)

		var data = {
			'goodsid':goodsid,
		}
		console.log('dddd')

		$.get('/mt/addcart/',data,function (response) {
			console.log('sdfsd')
			if (response.status == 0){
				window.open('/mt/login', target='_self')
			}else if (response.status == 1) {
				$that.prev().show().html(response.number)
				$that.prev().prev().show()
			}
        } )
    })
	// #商品删除
	$('.minus').click(function () {
		console.log('减zzz')

		var goodsid = $(this).attr('goodsid')
        var $that = $(this)

        data = {
            'goodsid':goodsid
        }

        $.get('/mt/subcart/', data, function (response) {
            console.log(response)
            if (response.status == 1){  // 操作成功
                if (response.number > 0) {  // 改变个数
                    $that.next().html(response.number)
                } else {    // 隐藏减和个数
                    $that.next().hide()
                    $that.hide()
                }
            }
        })
    })

})