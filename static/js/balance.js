$(function () {
    total()
    // 计算总数
    function total(){
        var sum = 0

        $('.goods').each(function () {
            console.log("sdfsdfsfsddfsf")
            var $content = $(this).find('.content-wrapper')

            // 选中

            var num = $content.find('.num').attr('num')
            var price = $content.find('.price').attr('price')

            sum += num * price

        })

        // 设置显示
        $('.bill .total').html(sum)

    }




    // 下单
    $('#generateorder').click(function () {
        $.get('/axf/generateorder/', function (response) {
            console.log(response)
            if (response.status == 1){  // 订单详情页
                window.open('/axf/orderdetail/' + response.identifier + '/', target='_self')
            }
        })
    })
}