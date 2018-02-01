// tabs 切换功能
$(() => {
    var $tabs = $(".tabs");
    $tabs.on("click", ".tab>a", function (e) {
        e.preventDefault();
        $this = $(this);
        var id = $this.attr("href");
        $this.parent().addClass("active").siblings().removeClass("active");
        $(id).addClass("active").siblings().removeClass("active");
        $(id).children().first().trigger("mouseenter"); // 为点击出现的第一项 tab_item 触发事件添加 class 并显示
    });

    // tab_item 二级菜单切换功能
    var $tabContent = $(".tabs_content"),
        $tabRightcol = $(".tab_rightcol>.tab_preview_container");
    $tabContent.on('mouseenter', '.tab_item', function (e) {
        var $this = $(this);
        var id = $this.attr("data-appid");
        $this.addClass("active").siblings().removeClass("active");
        $tabRightcol.children(`[data-appid=${id}]`).addClass("active").siblings().removeClass("active");
    });

    $.ajax({
        type: "get",
        url: "/index",
        success: function (response) {
            console.log(response);
            var html = "";
            for (const item of response) {
                var platforms = item.supported_systems.split(','),
                    str = '',
                    tagsStr = '',
                    random3 = Math.ceil(Math.random() * 3);
                for (var platform of platforms) {
                    str += `<span class="platform_img ${platform}"></span>`;
                }
                var tags = item.tag_list.split(',');
                for (let i = 0; i < 4; i++) {
                    tagsStr += `<span>,${tags[i]}</span> `
                }
                html += `<a data-appid="${item.appid}" href="app.html?appid=${item.appid}" class="tab_item">
                            <img src="${item.sm}" alt="">
                            <div class="discount_block">
                                <div class="discount_pct" style="display:${
                                    Math.floor(Math.random() * 2) >= 1 ? 'none' : ''
                                }">-${Math.ceil(Math.random() * 7)}0%</div>
                                <div class="discount_price">
                                    <div class="discountprice">¥ ${item.price}</div>
                                </div>
                            </div>
                            <div class="tab_item_content">
                                <div class="tab_item_name">${item.name}</div>
                                <div class="tab_item_details">
                                    ${str}
                                    <div class="tab_item_tags">
                                    ${tagsStr.slice(7)}
                                    </div>
                                </div>
                            </div>
                        </a>`
            }
            $tabContent.children('#tab_content_newrelease').html(html).children().first().addClass('active');
            $tabContent.children('#tab_content_upcoming').html(html);
            html = "";
            for (const item of response.reverse()) {
                var platforms = item.supported_systems.split(','),
                    str = '',
                    tagsStr = '',
                    random3 = Math.ceil(Math.random() * 3);
                for (var platform of platforms) {
                    str += `<span class="platform_img ${platform}"></span>`;
                }
                var tags = item.tag_list.split(',');
                for (let i = 0; i < 4; i++) {
                    tagsStr += `<span>,${tags[i]}</span> `
                }
                html += `<a data-appid="${item.appid}" href="app.html?appid=${item.appid}" class="tab_item">
                            <img src="${item.sm}" alt="">
                            <div class="discount_block">
                                <div class="discount_pct" style="display:${
                                    Math.floor(Math.random() * 2) >= 1 ? 'none' : ''
                                }">-${Math.ceil(Math.random() * 7)}0%</div>
                                <div class="discount_price">
                                    <div class="discountprice">¥ ${item.price}</div>
                                </div>
                            </div>
                            <div class="tab_item_content">
                                <div class="tab_item_name">${item.name}</div>
                                <div class="tab_item_details">
                                    ${str}
                                    <div class="tab_item_tags">
                                    ${tagsStr.slice(7)}
                                    </div>
                                </div>
                            </div>
                        </a>`
            }
            $tabContent.children('#tab_content_topsellers').html(html);
            $tabContent.children('#tab_content_specials').html(html);
        },
        error: function () {
            alert('网络故障');
        }
    });
});