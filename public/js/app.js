// http://jsfiddle.net/TheGAFF/aQrER/

// $(function () {
//     $(".paragraph").click(function () {
//         var expanded = $(this).is(".expanded");
//         if (expanded) 
//         {
//             $(this).transition({ 'max-height': '4em', overflow: 'hidden' }, 500, 'in', function () {$(this).removeClass("expanded"); });
//         } 
//         else 
//         {
//             $(this).transition({ 'max-height': $(this).get(0).scrollHeight, overflow: ''}, 500, 'out', function () { $(this).addClass("expanded"); });
//         }
//     });
// });

// https://stackoverflow.com/questions/16028878/animating-max-height-with-css-transitions
// http://css3.bradshawenterprises.com/animating_height/

// highlight_player_area 图片切换功能
$(() => {
    var $img = $(".highlight_player_area img"),
        $highlight_strip = $(".highlight_strip_scroll"),
        $highlight_selector = $(".highlight_selector"),
        $highlight_player = $(".highlight_player_area"),
        $screentshotModal = $(".screenshot_modal"),
        $screentshotContentModal = $(".screenshot_modal_content"),
        $glance = $('.glance');
    var itemIndex = 0;

    var $box = $(".page_header .slider-box"),
    $btn = $(".page_header .slider-btn");
    var BTNWIDTH_copy = 0;

    var data = [];

    // loadProductByAppid
    var appid = location.search;
    appid = appid.split("=")[1];

    function loadProductByAppid(appid) {
        $.ajax({
            type: "get",
            url: "/product",
            data: {
                appid: appid
            },
            success: function (response) {
                var appdetail = response.data;
                $(document).attr('title', appdetail.name);
                var imgs = response.imgs;
                var html = `<div class="highlight_selector"></div>`;
                for (const item of imgs) {
                    if (item.sm.indexOf('header.jpg') > 0) {
                        $glance.children('.game_header_image').attr('src', item.sm);
                    }
                    if (item.md) {
                        data.push(item);
                        html += `<div class="highlight_strip_item screenshot">
                                     <img src="${item.sm}" alt="">
                                 </div>`;
                    }
                }
                $img.attr('src', data[0].md);
                $highlight_strip.html(html).css({
                    width: data.length * 120
                });
                $highlight_strip.children(":eq(1)").addClass("selected");
                $highlight_selector = $(".highlight_selector"); // 动态生成的 selector 所以需要重新选择

                // $galance app 右栏详情
                $glance.children('.game_description_snippet').html(appdetail.desc);
                // console.log(appdetail);
                var releaseDate = new Date(appdetail.release_date);
                $glance.find('.user_reviews .release_date .date').html(releaseDate.getFullYear() + "年" + releaseDate.getMonth() + "月" + releaseDate.getDay() + "日");
                $glance.find('.dev_row').first().children('.summary').html(`<a href="search.html">${appdetail.developer}</a>`);
                $glance.find('.dev_row').last().children('.summary').html(`<a href="search.html">${appdetail.publisher}</a>`);
                var tags = appdetail.tag_list.split(',');
                // console.log(tags);
                html = "";
                for (let i = 0; i < 4; i++) {
                    html += `<a href="search.html?tag=${tags[i]}" class="app_tag">${tags[i]}</a> `
                }
                $glance.children(".glance_tags_box").children(".glance_tags").html(html);

                // apphub 标题和 breadcrumbs
                $('.apphub').children("h2").html(appdetail.name);
                html = "";
                html = ` <a href="search.html">所有游戏</a>
                        <span>&gt;</span>
                        <a href="search.html">${appdetail.genres}</a>
                        <span>&gt;</span>
                        <span>${appdetail.name}</span>`
                $('.breadcrumbs').html(html);


                // 捆绑包
                $('.game_area_purchase').children(":gt(0)").hide();
                if (appdetail.appid == 292030) {
                    $('.game_area_purchase').children(":gt(0)").show();
                }
                html = `<div class="game_purchase_price">￥${appdetail.price}</div><a href="#" class="btn_green" data-appid="${appdetail.appid}">添加至购物车</a>`
                $('.game_area_purchase').children().first().find('h1').html(`购买 ${appdetail.name}`).next().children().html(html);
                html = "";
                var platforms = appdetail.supported_systems.split(',');
                for (var platform of platforms) {
                    html += `<span class="platform_img ${platform}"></span>`;
                }
                $('.game_area_purchase').children().first().find('.platforms').html(html);

                // leftcol 和 rightcol
                $('.page_content>.leftcol').children(".game_page_autocollapse_box").first().find(".game_area_description").html(appdetail.desc_full);
                html =
                    `<b>名称:</b> ${appdetail.name}
                    <br>
                    <b>类型:</b>
                    <a href="game.html?tag=${appdetail.genres}"> ${appdetail.genres}</a>
                    <br>
                    <b>开发商:</b>
                    <a href="search.html?dev=${appdetail.developer}"> ${appdetail.developer}</a>
                    <br>
                    <b>发行商:</b>
                    <a href="search.html?dev=${appdetail.publisher}"> ${appdetail.publisher}</a>
                    <br>
                    <b>发行日期:</b> ${releaseDate.getFullYear() + "年" + releaseDate.getMonth() + "月" + releaseDate.getDay() + "日"}`;
                $('.page_content>.rightcol').children(".game_detail").children().children().first().html(html);

                // highlight_player_area 下的 slider 功能
                var canMove = false;
                var $box = $(".page_header .slider-box"),
                    $btn = $(".page_header .slider-btn");
                var BTNWIDTH = Math.floor(parseInt($box.css("width")) / data.length);
                var MAXWIDTH = parseInt($box.css("width")) - parseInt($btn.css("width"));

                BTNWIDTH_copy = BTNWIDTH;

                $box.mousedown(() => {
                    canMove = true;
                });

                $box.mouseup(() => {
                    canMove = false;
                });

                // $box.mouseleave(() => {
                //     canMove = false;
                // });


                $box.mousemove(function (e) {
                    if ($(e.target).is(".slider-box")) {
                        var l = BTNWIDTH / 2;
                        l = e.offsetX - l;

                        // 左右边界处理
                        l < 0 && (l = 0);
                        l > MAXWIDTH && (l = MAXWIDTH);

                        if (canMove) {
                            // $btn.css("left", l);
                            // $highlight_strip.css("left", -l);
                        }
                        // $box.mousedown(() => $btn.css("left", l));
                    }
                });

                $(".next").click(function (e) {
                    // var l = parseInt($btn.css("left"));
                    // if (l < MAXWIDTH - BTNWIDTH) {
                    //     $btn.css("left", l + BTNWIDTH);
                    // } else {
                    //     $btn.css("left", MAXWIDTH);
                    // }

                    if (itemIndex < data.length - 1) {
                        // if (i < data.length - 4) { $highlight_strip.css("left", -i * 120); }
                        var i = itemIndex;
                        if (i >= data.length - 4) i = data.length - 5;
                        $highlight_strip.css("left", -i * 120);

                        updateItemIndex();
                        updateImg();
                        $highlight_strip.children(`:eq(${itemIndex+1})`).addClass("selected").siblings().removeClass("selected");
                        $highlight_selector.css("left", itemIndex * 120);
                    }

                });
                $(".prev").click(function (e) {
                    // var l = parseInt($btn.css("left"));
                    // if (l > 0 + BTNWIDTH) {
                    //     $btn.css("left", l - BTNWIDTH);
                    // } else {
                    //     $btn.css("left", 0);
                    // }

                    if (itemIndex > 0) {
                        $highlight_strip.children(`:eq(${itemIndex})`).addClass("selected").siblings().removeClass("selected");
                        itemIndex--;
                        $highlight_selector.css("left", itemIndex * 120);
                        if (itemIndex < data.length - 4) {
                            $highlight_strip.css("left", -itemIndex * 120);
                        }
                        updateImg();
                    }

                });
            },
            error: function () {
                alert('网络异常');
            }
        });
    }

    loadProductByAppid(appid);

    // 展开阅读
    var $game_page_autocollapse_readmore = $('.game_page_autocollapse_readmore');
    $game_page_autocollapse_readmore.click(function () {
        var $this = $(this);
        $this.parent().prev().css({
            maxHeight: $this.parent().prev().children().css('height')
        });
        $this.parent().hide();
    });

    function updateItemIndex() {
        itemIndex = $highlight_strip.children(".selected").index();
    }

    function updateImg() {
        var src = $highlight_strip.children(`:eq(${itemIndex+1})`).children().attr("src");
        src = "img/app/" + src.slice(8, src.indexOf(".116")) + ".600x338.jpg";
        $img.attr("src", src);
    }

    // 小图点击事件
    $highlight_strip.on("click", ".highlight_strip_item", function (e) {
        var $this = $(this);
        var src = $this.children("img").attr("src");
        src = "img/app/" + src.slice(8, src.indexOf(".116")) + ".600x338.jpg";
        itemIndex = $this.index();
        $highlight_selector.css("left", (itemIndex - 1) * 120);
        // $btn.css("left", itemIndex * BTNWIDTH_copy);
        $img.attr("src", src);
        $this.addClass("selected").siblings().removeClass("selected");
        updateItemIndex();
    });

    // 显示大图
    var i = $highlight_strip.children(".selected").index();
    $highlight_player.on("click", "img", function (e) {
        $screentshotModal.show();
        $screentshotContentModal.show();

        i = $highlight_strip.children(".selected").index();
        $screentshotContentModal.children(".screenshot_count").html(`${i} / ${data.length}张截图`);

        var src = $highlight_strip.children(".selected").children().attr("src");
        src = "img/app/" + src.slice(8, src.indexOf(".116")) + ".1920x1080.jpg";
        $screentshotContentModal.children("img").attr("src", src);
    });
    // 大图上下一张切换
    $screentshotContentModal.on("click", ".next_screenshot", function (e) {
        if (i < data.length) {
            i++;
            $screentshotContentModal.children(".screenshot_count").html(`${i} / ${data.length}张截图`);
            var src = $highlight_strip.children(`:eq(${i})`).children().attr("src");
            src = "img/app/" + src.slice(8, src.indexOf(".116")) + ".1920x1080.jpg";
            $screentshotContentModal.children("img").attr("src", src);
        }
    });
    $screentshotContentModal.on("click", ".prev_screenshot", function (e) {
        if (i > 1) {
            i--;
            $screentshotContentModal.children(".screenshot_count").html(`${i} / ${data.length}张截图`);
            var src = $highlight_strip.children(`:eq(${i})`).children().attr("src");
            src = "img/app/" + src.slice(8, src.indexOf(".116")) + ".1920x1080.jpg";
            $screentshotContentModal.children("img").attr("src", src);
        }
    });

    // 隐藏 screentshotModal  screentshotContentModal
    $screentshotModal.on("click", function (e) {
        // e.stopPropagation();
        $screentshotModal.hide();
        $screentshotContentModal.hide();
    });
});

// 更多类似产品滚动逻辑 store_horizontal_autoslider
$(() => {
    var $slider = $(".store_horizontal_autoslider");

    var data = {
        length: $slider.children().length
    };

    var moved = 0;

    function move(dir = 1) {
        moved += dir;
        console.log(moved);
        if (moved < data.length - 2 && moved >= 0) {
            $slider.css("left", -moved * 210);
        }
    }

    var canMove = false;
    var $box = $(".page_content .slider-box"),
        $btn = $(".page_content .slider-btn");

    $box.mousedown(() => {
        canMove = true;
    });

    $box.mouseup(() => {
        canMove = false;
    });

    $box.mouseleave(() => {
        canMove = false;
    });

    var BTNWIDTH = Math.floor(parseInt($box.css("width")) / (data.length - 2));
    var MAXWIDTH = parseInt($box.css("width")) - parseInt($btn.css("width"));
    console.log(BTNWIDTH);
    console.log(MAXWIDTH);
    // TODO 待改动拖动逻辑
    // $box.mousemove(function(e) {
    //     if ($(e.target).is(".slider-box")) {
    //         $btn.css("transition", "");
    //         var l = BTNWIDTH / 2;
    //         l = e.offsetX - l;

    //         // 左右边界处理
    //         l < 0 && (l = 0);
    //         l > MAXWIDTH && (l = MAXWIDTH);

    //         var m = Math.ceil(l / MAXWIDTH * 10);
    //         if (m > data.length - 3) m = data.length - 3;
    //         console.log(m);
    //         if (canMove) {
    //             moved = m;
    //             $btn.css("left", l);
    //             $slider.css("left", -m * 210);
    //         }
    //         $box.mousedown(() => $btn.css("left", l));
    //     }
    // });

    $(".page_content .next").click(function (e) {
        // canMove = false;
        $btn.css("transition", "all .1s linear");
        var l = parseInt($btn.css("left"));
        if (l < MAXWIDTH - BTNWIDTH) {
            $btn.css("left", l + BTNWIDTH);
        } else {
            $btn.css("left", MAXWIDTH);
        }

        move(1);
        if (moved > data.length - 3) moved = data.length - 3;
    });
    $(".page_content .prev").click(function (e) {
        // canMove = false;
        $btn.css("transition", "all .1s linear");
        var l = parseInt($btn.css("left"));
        if (l > 0 + BTNWIDTH) {
            $btn.css("left", l - BTNWIDTH);
        } else {
            $btn.css("left", 0);
        }

        move(-1);
        if (moved < 0) moved = 0;
    });
});

// 添加至购物车功能
$(()=>{
    $(".game_purchase_action").on("click", "a",function(e){
        e.preventDefault();
        console.log(this);
        var $this = $(this);
        var appid = $this.data("appid");
        $.ajax({
            type: "get",
            url: "/cart/addCart",
            data: {appid},
            success: function (response) {
                if (response.code > 0) {
                    alert("添加成功, 跳转到购物车页面...");
                    location = "cart.html";
                } else if(response.code == -2) {
                    alert("尚未登录，跳转到登录页面...");
                    location = "login.html";
                } else {
                    console.log(response);
                    alert(response.msg);
                }
            },
            error: function() {
                alert("网络故障");
            }
        });
    });
});