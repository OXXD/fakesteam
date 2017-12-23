// discovery_queue
$(()=>{
    var $dq = $("#discovery_queue");
    $dq.on("click", ".dq_item", function(e) {
        $this = $(this);
        $this.prev().removeClass().addClass("dq_item dq_pos1").prevAll().removeClass().addClass("dq_item dq_pos0");
        $this.removeClass().addClass("dq_item dq_pos2");
        $this.nextAll().removeClass().addClass("dq_item");
        $this.next().addClass("dq_pos3").next().addClass("dq_pos4").next().addClass("dq_pos5").nextAll().addClass("dq_pos6");

        // var $dq2 = $(".dq_pos2");
        // $dq2.html(`<a href="javascript:;">${$dq2.html()}</a>`);
    });
    

});