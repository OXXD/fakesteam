// http://jsfiddle.net/TheGAFF/aQrER/

// $(function () {
//     $(".paragraph").click(function () {
//         var expanded = $(this).is(".expanded");
//         if (expanded) 
//         {
//             $(this).transition({ 'max-height': '4em', overflow: 'hidden' }, 500, 'in', function () {$(this).removeClass("expanded"); });
//         } 
//         else 
//         {
//             $(this).transition({ 'max-height': $(this).get(0).scrollHeight, overflow: ''}, 500, 'out', function () { $(this).addClass("expanded"); });
//         }
//     });
// });

// https://stackoverflow.com/questions/16028878/animating-max-height-with-css-transitions
// http://css3.bradshawenterprises.com/animating_height/

// highlight_player_area 图片切换功能
$(() => {
    var $img = $(".highlight_player_area img"),
        $highlight_strip = $(".highlight_strip_scroll"),
        $highlight_selector = $(".highlight_selector"),
        $highlight_player = $(".highlight_player_area"),
        $screentshotModal = $(".screenshot_modal"),
        $screentshotContentModal = $(".screenshot_modal_content");
    var itemIndex = 0;

    var data = {
        length: 14
    };

    function updateItemIndex() {
        itemIndex = $highlight_strip.children(".selected").index();
    }

    function updateImg() {
        var src = $highlight_strip.children(`:eq(${itemIndex+1})`).children().attr("src");
        src = "img/app/" + src.slice(8, src.indexOf(".116")) + ".600x338.jpg";
        $img.attr("src", src);
    }

    $highlight_strip.on("click", ".highlight_strip_item", function(e) {
        var $this = $(this);
        var src = $this.children("img").attr("src");
        src = "img/app/" + src.slice(8, src.indexOf(".116")) + ".600x338.jpg";
        itemIndex = $this.index();
        $highlight_selector.css("left", (itemIndex - 1) * 120);
        $img.attr("src", src);
        $this.addClass("selected").siblings().removeClass("selected");
        updateItemIndex();
    });


    // highlight_player_area 下的 slider 功能
    var canMove = false;
    var $box = $(".page_header .slider-box"),
        $btn = $(".page_header .slider-btn");

    $box.mousedown(() => {
        canMove = true;
    });

    $box.mouseup(() => {
        canMove = false;
    });

    // $box.mouseleave(() => {
    //     canMove = false;
    // });

    var BTNWIDTH = parseInt($box.css("width")) / data.length;
    var MAXWIDTH = parseInt($box.css("width")) - BTNWIDTH;
    $box.mousemove(function(e) {
        if ($(e.target).is(".slider-box")) {
            $btn.css("transition", "");
            var l = BTNWIDTH / 2;
            l = e.offsetX - l;

            // 左右边界处理
            l < 0 && (l = 0);
            l > MAXWIDTH && (l = MAXWIDTH);

            if (canMove) {
                // $btn.css("left", l);
                // $highlight_strip.css("left", -l);
            }
            // $box.mousedown(() => $btn.css("left", l));
        }
    });

    $(".next").click(function(e) {
        // canMove = false;
        $btn.css("transition", "all .1s linear");
        var l = parseInt($btn.css("left"));
        // if (l < MAXWIDTH - BTNWIDTH) {
        //     $btn.css("left", l + BTNWIDTH);
        // } else {
        //     $btn.css("left", MAXWIDTH);
        // }

        if (itemIndex < data.length - 1) {
            if (itemIndex < data.length - 4) {
                $highlight_strip.css("left", -itemIndex * 120);
            }
            updateItemIndex();
            updateImg();
            $highlight_strip.children(`:eq(${itemIndex+1})`).addClass("selected").siblings().removeClass("selected");
            $highlight_selector.css("left", itemIndex * 120);
        }

    });
    $(".prev").click(function(e) {
        // canMove = false;
        $btn.css("transition", "all .1s linear");
        var l = parseInt($btn.css("left"));
        // if (l > 0 + BTNWIDTH) {
        //     $btn.css("left", l - BTNWIDTH);
        // } else {
        //     $btn.css("left", 0);
        // }

        console.log(itemIndex);
        if (itemIndex > 0) {
            $highlight_strip.children(`:eq(${itemIndex})`).addClass("selected").siblings().removeClass("selected");
            itemIndex--;
            $highlight_selector.css("left", itemIndex * 120);
            if (itemIndex < data.length - 4) {
                $highlight_strip.css("left", -itemIndex * 120);
            }
            updateImg();
        }

    });

    // 显示大图
    var i = $highlight_strip.children(".selected").index();
    $highlight_player.on("click", "img", function(e) {
        $screentshotModal.show();
        $screentshotContentModal.show();

        i = $highlight_strip.children(".selected").index();
        $screentshotContentModal.children(".screenshot_count").html(`${i} / ${data.length}张截图`);

        var src = $highlight_strip.children(".selected").children().attr("src");
        src = "img/app/" + src.slice(8, src.indexOf(".116")) + ".1920x1080.jpg";
        $screentshotContentModal.children("img").attr("src", src);
    });
    // 大图上下一张切换
    $screentshotContentModal.on("click", ".next_screenshot", function(e) {
        if (i < data.length) {
            i++;
            $screentshotContentModal.children(".screenshot_count").html(`${i} / ${data.length}张截图`);
            var src = $highlight_strip.children(`:eq(${i})`).children().attr("src");
            src = "img/app/" + src.slice(8, src.indexOf(".116")) + ".1920x1080.jpg";
            $screentshotContentModal.children("img").attr("src", src);
        }
    });
    $screentshotContentModal.on("click", ".prev_screenshot", function(e) {
        if (i > 1) {
            i--;
            $screentshotContentModal.children(".screenshot_count").html(`${i} / ${data.length}张截图`);
            var src = $highlight_strip.children(`:eq(${i})`).children().attr("src");
            src = "img/app/" + src.slice(8, src.indexOf(".116")) + ".1920x1080.jpg";
            $screentshotContentModal.children("img").attr("src", src);
        }
    });

    // 隐藏 screentshotModal  screentshotContentModal
    $screentshotModal.on("click", function(e) {
        console.log(this);
        // e.stopPropagation();
        $screentshotModal.hide();
        $screentshotContentModal.hide();
    });
});

// 更多类似产品滚动逻辑 store_horizontal_autoslider
$(() => {
    var $slider = $(".store_horizontal_autoslider");

    var data = {
        length: $slider.children().length
    };

    var moved = 0;

    function move(dir = 1) {
        moved += dir;
        console.log(moved);
        if (moved < data.length - 2 && moved >= 0) {
            $slider.css("left", -moved * 210);
        }
    }

    var canMove = false;
    var $box = $(".page_content .slider-box"),
        $btn = $(".page_content .slider-btn");

    $box.mousedown(() => {
        canMove = true;
    });

    $box.mouseup(() => {
        canMove = false;
    });

    $box.mouseleave(() => {
        canMove = false;
    });

    var BTNWIDTH = Math.floor(parseInt($box.css("width")) / (data.length - 2));
    var MAXWIDTH = parseInt($box.css("width")) - parseInt($btn.css("width"));
    console.log(BTNWIDTH);
    console.log(MAXWIDTH);
    // TODO 待改动拖动逻辑
    // $box.mousemove(function(e) {
    //     if ($(e.target).is(".slider-box")) {
    //         $btn.css("transition", "");
    //         var l = BTNWIDTH / 2;
    //         l = e.offsetX - l;

    //         // 左右边界处理
    //         l < 0 && (l = 0);
    //         l > MAXWIDTH && (l = MAXWIDTH);

    //         var m = Math.ceil(l / MAXWIDTH * 10);
    //         if (m > data.length - 3) m = data.length - 3;
    //         console.log(m);
    //         if (canMove) {
    //             moved = m;
    //             $btn.css("left", l);
    //             $slider.css("left", -m * 210);
    //         }
    //         $box.mousedown(() => $btn.css("left", l));
    //     }
    // });

    $(".page_content .next").click(function(e) {
        // canMove = false;
        $btn.css("transition", "all .1s linear");
        var l = parseInt($btn.css("left"));
        if (l < MAXWIDTH - BTNWIDTH) {
            $btn.css("left", l + BTNWIDTH);
        } else {
            $btn.css("left", MAXWIDTH);
        }

        move(1);
        if (moved > data.length - 3) moved = data.length - 3;
    });
    $(".page_content .prev").click(function(e) {
        // canMove = false;
        $btn.css("transition", "all .1s linear");
        var l = parseInt($btn.css("left"));
        if (l > 0 + BTNWIDTH) {
            $btn.css("left", l - BTNWIDTH);
        } else {
            $btn.css("left", 0);
        }

        move(-1);
        if (moved < 0) moved = 0;
    });
});