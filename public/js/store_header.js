$(() => {
    // ajax({
    //     type: "get",
    //     url: "store_header.html"
    // }).then(html => {
    //     document.getElementById("store_header").innerHTML = html;
    // });
    $("#store_header").load("store_header.html", () => {
        window.onscroll = () => {
            var scrollTop = document.documentElement.scrollTop || document.body.scrollTop;
            var store_nav = document.getElementById("store_nav");
            if (scrollTop > 250) {
                store_nav.className = "fixed";
            } else {
                store_nav.className = "";
            }
        };

        // 鼠标悬停下拉菜单功能
        $("#store_nav>ul>li").hover(function(e) {
            $(this).children(".dropdown_menu").toggle();
        });

        // 购物车数量功能
        $cart = $('#cart');
        $.ajax({
            type: "get",
            url: "/cart/count",
            success: function(response) {
                if (response.count > 0) {
                    $cart.find('span').html(`(${response.count})`);
                }
            },
            error: function() {
                alert('网络故障');
            }
        });

        // 搜索按钮
        var $btnSearch = $('.btn_search');
        $btnSearch.click(function(e) {
            e.preventDefault();
            var $this = $(this),
                kw = $this.prev().val();
            location = `search.html?kw=${kw}`;
        });
        $btnSearch.prev().keyup(function(e) {
            var $this = $(this);
            if (e.keyCode == 13) {
                var kw = $this.val();
                location = `search.html?kw=${kw}`;
            }
        });

        // 搜索自动补全
        var $searchSuggest = $('.search_suggest');
        $('.searchbox>input').keyup(function() {
            var $this = $(this),
                kw = $this.val();
            $.ajax({
                type: "get",
                url: "/search/autocomplete",
                data: { kw },
                success: function(response) {
                    var html = "<ul>";
                    if (response.length > 0) {
                        for (const item of response) {
                            html += `<li class="ellipsis">
                        <a href="app.html?appid=${item.appid}">${item.name}</a>
                    </li>`
                        }
                        html += "</ul>"
                        $searchSuggest.html(html).show();
                    } else {
                        $searchSuggest.hide();
                    }

                },
                error: function() {
                    alert('网络故障');
                }
            });
        });

        $(document).on('click', function() {
            $searchSuggest.hide();
        });
    });
});