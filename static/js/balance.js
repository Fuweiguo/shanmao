$(function () {
    console.log("js")
    // $('.goods').each(function () {
    //     console.log("总价")
    //     var $content = $(this).find('.total')
    //
    // })
    //
    //

    // 计算总价
    function total(){
        var n= $('.price').length;
        var sums = 0;

       for (var m=0;m<n;m++) {
            console.log("for")
           var sum = parseFloat($('.price').eq(m).text())* parseInt($('.num').eq(m).text());
           console.log(sum)
           sums += sum;

       }
        // 设置显示
        $('.total').html(parseInt(sums))
    }
    total()

    // 下单
    $('#generateorder').click(function () {
        console.log("点击")
        $.get('/mt/generateorder/', function (response) {
            console.log(response)
            console.log('下单中')
            if (response.status == 1){  // 订单详情页
                window.open('/mt/orderdetail/' + response.identifier + '/', target='_self')
            }
        })
    })
})