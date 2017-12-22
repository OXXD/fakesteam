$(()=>{
    // dailydeal_timer 
    var dailydealDate = new Date();

    function dailydeal_timer() {
        var end = new Date(dailydealDate);
        var now = new Date();
        end.setHours(end.getHours()+24); // 暂时逻辑永远比当前多 24 小时
        var s = parseInt((end - now) / 1000);
        if(s>0) {

            var d = parseInt(s / 3600 / 24);
            var h = parseInt(s % (3600 * 24) / 3600);
            var m = parseInt(s % 3600 / 60);
            var s = s % 60;
    
            // 添 0 判断
            if(d<10) d="0"+d;
            if(h<10) h="0"+h;
            if(m<10) m="0"+m;
            if(s<10) s="0"+s;
    
            // console.log(h + ":" + m + ":" + s);
            $(".dailydeal_timer").html(h + ":" + m + ":" + s);
        } else {
            $(".dailydeal_timer").html("00:00:00");
            clearInterval(timer);
            timer = null;
        }
    }

    var timer = setInterval(dailydeal_timer, 1000); // dailydeal_timer 定时器

});

// spotlight carousel 透明轮播
$(()=>{
    var $carouselItems = $(".spotlight .carousel_items");
    var data = {
        length: $carouselItems.children().length
    };
    var moved = 0;

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
        //  slider-box 内的文字(计数)变化
        $(".spotlight_slider .slider-box").children().first().html(moved+1).siblings().html(data.length);
    }

    // arrow
    $(".spotlight .next").click(() => {
        show();
    });
    $(".spotlight .prev").click(() => {
        if (moved == 0) {
            // $carouselItems.children(`:eq(${data.length})`).addClass("active").siblings().removeClass("active");
            moved = data.length;
        }
        show(-1);
    });


});