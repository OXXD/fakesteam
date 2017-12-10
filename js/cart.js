(()=>{
    // dailydeal_timer 
    var dailydealDate = new Date();

    function dailydeal_timer() {
        var end = new Date(dailydealDate);
        var now = new Date();
        end.setHours(end.getHours()+23); // 暂时逻辑永远比当前多 23 小时
        var s = parseInt((end - now) / 1000);
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
    }

    setInterval(dailydeal_timer, 1000); // dailydeal_timer 定时器

/*     function chrismas() {
        var end = new Date("2017/12/25");
        var now = new Date();
        var s = parseInt((end - now) / 1000);
        // var d = s / (24 * 3600);
        // var h = s / 3600;
        // var m = s / 60;
        var d = parseInt(s / 3600 / 24);
        var h = parseInt(s % (3600 * 24) / 3600);
        var m = parseInt(s % 3600 / 60);
        var s = s % 60;
        // timer.innerHTML = "距离平安夜还有" + d + "天" + h + "小时" + m + "分" + s + "秒";
        // console.log(d+":"+h + ":" + m + ":" + s);
    }

    setInterval(chrismas, 1000); */
})();