// discovery_queue
$(()=>{
    var $dq = $("#discovery_queue");
    $dq.on("click", ".dq_item", function(e) {
        $this = $(this);
        $this.prev().removeClass().addClass("dq_item dq_pos1").prevAll().removeClass().addClass("dq_item dq_pos0");
        $this.removeClass().addClass("dq_item dq_pos2");
        $this.nextAll().removeClass().addClass("dq_item");
        $this.next().addClass("dq_pos3").next().addClass("dq_pos4").next().addClass("dq_pos5").nextAll().addClass("dq_pos6");


        // 为当前激活的(dq_pos2)添加链接(a 标签的 href 属性)
        $this.siblings().children("a").removeAttr("href");
        $this.children("a").attr("href",$this.data("appid"));
    });

    //  只允许 dq_pos2 的超链接能被点击跳转到产品页
    $dq.on("click", ".dq_item>a", function (e) {
        if(!$(this).parent().hasClass("dq_pos2"))
        e.preventDefault();
    });
    

});