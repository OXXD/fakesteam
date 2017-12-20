// 切换 main_capsule 的图片
$(() => {
    $(".store_capsule").mouseenter(function() {
        var $info = $(this).children(".info");
        // var src = $info.prev().attr("src");
        var src = $(this).children(".main_capsule").data("src");
        $info.on("mouseenter", "img", function() {
            $info.prev().attr("src", $(this).attr("src"));
        }).on("mouseleave", "img", function() {
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
    // console.log(data, data.length);
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
    $carouselThumbs.on("click", "div", function() {
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

// opacity carousel 透明度轮播
$(() => {
    var $carouselItems = $(".special_offers .carousel_items");
    var data = {
        length: $carouselItems.children().length
    };
    var $carouselThumbs = $(".special_offers .carousel_thumbs");
    $carouselThumbs.html("<div></div>".repeat(data.length)).children().first().addClass("focus");

    const WAIT = 5000,
        DURA = 1000;
    var moved = 0,
        timer = null;

    /**
     * opacity carousel 透明轮播方法
     */
    function show(dir = 1) {
        moved += dir;
        // console.log(moved);
        if (moved == data.length) {
            moved = 0;
        }
        $carouselItems.children(`:eq(${moved})`).addClass("active").siblings().removeClass("active");
        $carouselThumbs.children(`:eq(${moved})`).addClass("focus").siblings().removeClass("focus");
    }

    // uncomment next line to start opacity carousel
    timer = setInterval(show, WAIT);

    /**
     * special_offers 轮播
     * 鼠标移入暂停轮播
     */
    $(".special_offers").on("mouseenter", ".special_offers", function(e) {
        clearInterval(timer);
        timer = null;
    });
    $(".special_offers").on("mouseleave", ".special_offers", function(e) {
        timer = setInterval(show, WAIT);
    });
    // arrow
    $(".special_offers .arrow.right").click(() => {
        show();
    });
    $(".special_offers .arrow.left").click(() => {
        if (moved == 0) {
            $carouselItems.children(`:eq(${data.length})`).addClass("active").siblings().removeClass("active");
            moved = data.length;
        }
        show(-1);
    });

    // thumbs
    $carouselThumbs.on("click", "div", function(e) {
        var i = $(this).index();
        moved = i - 1;
        show();
    });

});

// tabs 切换功能
$(() => {
    var $tabs = $(".tabs");
    $tabs.on("click", ".tab>a", function(e) {
        e.preventDefault();
        $this = $(this);
        var id = $this.attr("href");
        $this.parent().addClass("active").siblings().removeClass("active");
        $(id).addClass("active").siblings().removeClass("active");
        console.log($(id).children().first().trigger("mouseenter")); // 为点击出现的第一项 tab_item 触发事件添加 class 并显示
    });

    // tab_item 二级菜单切换功能
    var $tabItem = $(".tab_item"),
        $tabRightcol = $(".tab_rightcol>.tab_preview_container");
    $tabItem.mouseenter(function(e) {
        var $this = $(this);
        var id = $this.attr("data-appid");
        $this.addClass("active").siblings().removeClass("active");
        $tabRightcol.children(`[data-appid=${id}]`).addClass("active").siblings().removeClass("active");
    });
});