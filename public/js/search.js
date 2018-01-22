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
    var $tbc = $(".tab_filter_control"),
        $search = $('.search-results_container'),
        $page_summary = $('.page_summary'),
        $pages = $('.pages'),
        psize = 15;
    $tbc.on("click", function(e) {
        $(this).toggleClass("checked");
        // TODO: 发送 AJAX 请求分类搜索逻辑
    });

    // 分页搜索功能
    function loadSearchResult(pno = 1, pageSize = 15, kw = '') {
        $.ajax({
            type: "get",
            url: "/search",
            data: { pno, pageSize, kw },
            success: function(response) {
                console.log(response);
                var html = "",
                    data = response.data;
                for (const item of data) {
                    var platforms = item.supported_systems.split(","),
                        str = "",
                        releaseDate = new Date(item.release_date),
                        random3 = Math.ceil(Math.random() * 3);
                    for (var platform of platforms) {
                        str += `<span class="platform_img ${platform}"></span>`;
                    }
                    html += `<a href="app.html?appid=${item.appid}" class="search_result_row">
                                <div class="col search_capsule">
                                    <img src="${item.sm}" alt="">
                                </div>
                                <div class="col search_name ellipsis">
                                    <span class="title ellipsis">${item.name}</span>
                                    <p>
                                       ${str}
                                    </p>
                                </div>
                                <div class="col search_released ellipsis">${releaseDate.getFullYear() + "年" + releaseDate.getMonth() + "月" + releaseDate.getDay() + "日"}</div>
                                <div class="col search_review_score">
                                    <span class="search_review_summary ${random3 == 1? 'positive': random3 == 2 ? 'mixed' : 'negative'}"></span>
                                </div>
                                <div class="col discount_block sm">
                                    <span class="discount_pct" style="display:${Math.floor(Math.random() * 2) >= 1? "none":""}">-${Math.ceil(Math.random()*7)}0%</span>
                                </div>
                                <div class="col discount_block sm search_price">
                                    <div class="discount_price">
                                        <p class="discountprice">¥ ${item.price}</p>
                                    </div>
                                </div>
                            </a>`;
                }
                $search.html(html);

                var page = parseInt(response.pno),
                    pageCount = response.pageCount;

                html = `<span class="page_btn prev">&lt;</span>`;
                (page - 2 > 0) && (html += `<span class="pagelink">${page-2}</span>`);
                (page - 1 > 0) && (html += `<span class="pagelink">${page-1}</span>`);
                html += `<span class="pagelink">${page}</span>`;
                (page + 1 <= pageCount) && (html += `<span class="pagelink">${page + 1}</span>`);
                (page + 2 <= pageCount) && (html += `<span class="pagelink">${page + 2}</span>`);
                $pages.html(html).append(`<span class="page_btn next">&gt;</span>`);
                // 当前页码显示及上一页下一页禁用
                $pages.children(`:contains(${page})`).addClass("active");
                if (page == 1) {
                    $pages.children().first().addClass("disabled");
                }
                if (page == pageCount || pageCount == 0) {
                    $pages.children().last().addClass("disabled");
                }

                // 页码结果数量计算
                html = `正在显示第
                <span class="start">${(page-1) * pageSize + 1}</span> -
                <span class="end">${page * pageSize > response.totalRecord ? response.totalRecord : page * pageSize}</span> 个, 共
                <span class="total">${response.totalRecord}</span> 个结果`;
                $page_summary.html(html);
            },
            error: function() {
                alert("网络故障");
            }
        });
    }

    loadSearchResult();

    // 页码点击事件
    $pages.on('click', 'span', function() {
        var $this = $(this);
        if (!$this.is('.disabled') && !$this.is('.active')) {
            if ($this.is('.prev')) {
                loadSearchResult(parseInt($pages.children(".active").html()) - 1, psize);
            } else if ($this.is('.next')) {
                loadSearchResult(parseInt($pages.children(".active").html()) + 1, psize);
            } else {
                loadSearchResult($this.html(), psize);
            }
        }
    })
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