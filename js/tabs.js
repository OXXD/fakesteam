
// tabs 切换功能
$(() => {
    var $tabs = $(".tabs");
    $tabs.on("click", ".tab>a", function(e) {
        e.preventDefault();
        $this = $(this);
        var id = $this.attr("href");
        $this.parent().addClass("active").siblings().removeClass("active");
        $(id).addClass("active").siblings().removeClass("active");
        $(id).children().first().trigger("mouseenter"); // 为点击出现的第一项 tab_item 触发事件添加 class 并显示
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
