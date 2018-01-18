// slider 功能
$(() => {
    var canMove = false;
    var $box = $(".slider-box"),
        $btn = $(".slider-btn");

    $box.mousedown(() => {
        canMove = true;
    });

    $box.mouseup(() => {
        canMove = false;
    });

    // $box.mouseleave(() => {
    //     canMove = false;
    // });

    var BTNWIDTH = parseInt($btn.css("width"));
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
                $btn.css("left", l);
            }
            $box.mousedown(() => $btn.css("left", l));
        }
    });

    $(".next").click(function(e) {
        // canMove = false;
        $btn.css("transition", "all .1s linear");
        var l = parseInt($btn.css("left"));
        if (l < MAXWIDTH - BTNWIDTH) {
            $btn.css("left", l + BTNWIDTH);
        } else {
            $btn.css("left", MAXWIDTH);
        }

    });
    $(".prev").click(function(e) {
        // canMove = false;
        $btn.css("transition", "all .1s linear");
        var l = parseInt($btn.css("left"));
        if (l > 0 + BTNWIDTH) {
            $btn.css("left", l - BTNWIDTH);
        } else {
            $btn.css("left", 0);
        }
    });
});