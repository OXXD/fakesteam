// 切换 main_capsule 的图片
$(() => {
    $(".store_capsule").mouseenter(function () {
        var $info = $(this).children(".info");
        // var src = $info.prev().attr("src");
        var src = $(this).children(".main_capsule").data("src");
        $info.on("mouseenter", "img", function () {
            $info.prev().attr("src", $(this).attr("src"));
        }).on("mouseleave", "img", function () {
            $info.prev().attr("src", src);
        });
    });

    // img 做法(TODO)
    // $(".store_capsule").mouseenter(function(){
    //         var $info = $(this).children(".info");
    //         // var src = $info.prev().attr("src");
    //         var src = $(this).children(".main_capsule").data("src");
    //         $info.on("mouseenter", "img", function() {
    //             console.log($(this).attr("src"));
    //             $info.prev().css({
    //                 backgroundImage:`url(${$(this).attr("src")})`
    //             });
    //         }).on("mouseleave", "img", function() {
    //             console.log(src);
    //             $info.prev().css({
    //                 backgroundImage:`url(${src})`
    //             });
    //         });
    //     });
});

// carousel 轮播
$(() => {
    // 获取和修改数据, DOM
    const WIDTH = 960;
    var $carouselItems = $(".home_cluster .carousel_items");
    // var data = $carouselItems.children();
    var data = {
        length: $carouselItems.children().length - 1
    };
    console.log(data, data.length);
    var $carouselThumbs = $(".home_cluster .carousel_thumbs");
    $carouselThumbs.html("<div></div>".repeat(data.length)).children().first().addClass("focus");
    $carouselItems.css("width", WIDTH * (data.length + 1)); // data.length+1

    // 定义移动需要用的变量
    const WAIT = 3000,
        DURA = 1000;
    var moved = 0,
        timer = null;

    // 定义移动方法
    function move(dir = 1) {
        moved += dir;
        $carouselItems.animate({
            left: -WIDTH * moved
        }, DURA, () => {
            if (moved == data.length) { // data.length
                $carouselItems.css("left", 0);
                moved = 0;
            }
            $carouselThumbs.children(`:eq(${moved})`).addClass("focus").siblings().removeClass("focus");
        });
    }

    // 启动定时器
    timer = setInterval(move, WAIT);

    // 鼠标移入时暂停动画，左右按钮事件绑定
    $(".home_cluster").hover(
        () => {
            clearInterval(timer);
            timer = null;
        },
        () => {
            timer = setInterval(move, WAIT);
        }
    );
    $(".home_cluster .arrow.right").click(() => {
        if (!$carouselItems.is(":animated")) move();
    });
    $(".home_cluster .arrow.left").click(() => {
        if (!$carouselItems.is(":animated")) {
            if (moved == 0) {
                $carouselItems.css("left", -WIDTH * (data.length));
                moved = data.length;
            }
            move(-1);
        }
    });

    // 下方小点事件绑定
    $carouselThumbs.on("click", "div", function () {
        var $thumbs = $(this);
        var i = $thumbs.index();
        moved = i;
        $carouselItems.stop(true).animate({
            left: -WIDTH * moved
        }, DURA, () => {
            $carouselThumbs.children(`:eq(${i})`).addClass("focus").siblings().removeClass("focus");
        });
    });

});