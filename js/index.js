(()=>{
    // 切换 main_capsule 的图片
    var $info = $(".info:not(:hidden)");
    var src = $info.prev().attr("src");
    console.log($info);
    $info.on("mouseenter","img",function(){
        $info.prev().attr("src", $(this).attr("src"));
    }).on("mouseleave","img",function(){
        $info.prev().attr("src", src);
    });
})();