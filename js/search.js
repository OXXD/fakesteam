// select_container 下拉菜单功能
$(() => {
    var $selectContainer = $(".select_container");
    $selectContainer.on("click", "a.trigger", function(e) {
        e.preventDefault();
        var $this = $(this);
        if ($this.siblings().hasClass("active")) {
            $this.siblings().removeClass("active").parent().removeClass("active");
        } else {
            $this.siblings().addClass("active").parent().addClass("active");
        }
    });


    $(document.body).on("click", ":has(.select_container.active)", function(e) {
        e.stopPropagation();
        // console.log(this);
        if (!$(this).is(".sortbox")) {
            // console.log("click outside of sortbox");
            // console.log(this);
            if ($selectContainer.is(".active")) {
                $selectContainer.removeClass("active").children(".dropdown_menu").removeClass("active");
            }
        }
    });


});

// 查看全部 expander 展开功能
$(() => {
    var $expander = $(".see_all_expander"),
        $block_content = $(".block_content");
    // 每个 block_content 最多只显示 5 个,多余的隐藏
    for (var block of $block_content) {
        $(block).children(":gt(4)").hide();
    }
    //  展开收起显示全部
    $expander.on("click", function(e) {
        e.preventDefault();
        var $this = $(this);
        if ($this.prev().children(":gt(4)").is(":hidden")) {
            $this.prev().children(":gt(4)").show();
        } else {
            $this.prev().children(":gt(4)").hide();
        }
    });
});

// tab_filter_control 选中功能
$(() => {
    var $tbc = $(".tab_filter_control");
    $tbc.on("click", function(e) {
        $(this).toggleClass("checked");
        // TODO: 发送 AJAX 请求分类搜索逻辑
    });
});

// #tagSuggest tag 搜索显示功能
$(() => {
    var $tagSuggest = $("#tagSuggest");
    $tagSuggest.on("keyup", function(e) {
        var $this = $(this);
        // 显示符合搜索的选项，隐藏不符合的
        $this.siblings(`:contains(${$this.val().toUpperCase()})`).show().siblings(`:not(:contains(${$this.val().toUpperCase()}))`).hide();
        if ($this.val() == "") {
            $this.siblings(`:gt(4)`).hide(); // 输入框为空的时候隐藏大于 5 的选项
        }
        if ($this.siblings(`:contains(${$this.val().toUpperCase()})`).length == 0) {
            $this.siblings().hide(); // 找不到对应的选项时候隐藏所有逇选项
        }
    })
});