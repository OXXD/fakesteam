$(() => {
    // dailydeal_timer
    var dailydealDate = new Date();

    function dailydeal_timer() {
        var end = new Date(dailydealDate);
        var now = new Date();
        end.setHours(end.getHours() + 24); // 暂时逻辑永远比当前多 24 小时
        var s = parseInt((end - now) / 1000);
        if (s > 0) {
            var d = parseInt(s / 3600 / 24);
            var h = parseInt((s % (3600 * 24)) / 3600);
            var m = parseInt((s % 3600) / 60);
            var s = s % 60;

            // 添 0 判断
            if (d < 10) d = "0" + d;
            if (h < 10) h = "0" + h;
            if (m < 10) m = "0" + m;
            if (s < 10) s = "0" + s;

            // console.log(h + ":" + m + ":" + s);
            $(".dailydeal_timer").html(h + ":" + m + ":" + s);
        } else {
            $(".dailydeal_timer").html("00:00:00");
            clearInterval(timer);
            timer = null;
        }
    }

    var timer = setInterval(dailydeal_timer, 1000); // dailydeal_timer 定时器
});

// spotlight carousel 透明轮播
$(() => {
    var $carouselItems = $(".spotlight .carousel_items");
    var data = {
        length: $carouselItems.children().length
    };
    var moved = 0;

    /**
     * opacity carousel 透明轮播方法
     */
    function show(dir = 1) {
        moved += dir;
        // console.log(moved);
        if (moved == data.length) {
            moved = 0;
        }
        $carouselItems.children(`:eq(${moved})`).addClass("active").siblings().removeClass("active");
        //  slider-box 内的文字(计数)变化
        $(".spotlight_slider .slider-box").children().first().html(moved + 1).siblings().html(data.length);
    }

    // arrow
    $(".spotlight .next").click(() => {
        show();
    });
    $(".spotlight .prev").click(() => {
        if (moved == 0) {
            // $carouselItems.children(`:eq(${data.length})`).addClass("active").siblings().removeClass("active");
            moved = data.length;
        }
        show(-1);
    });
});

$(() => {
    // 检查用户是否登录
    $.ajax({
        type: "get",
        url: "/user/isLogin",
        success: function (response) {
            if (response.code > 0) {
                // var uid = response.user.uid;
                loadCart();
            } else {
                alert("尚未登录, 跳转到登录页面...");
                location = "login.html";
            }
        },
        error: function () {
            alert("网络故障");
        }
    });

    var $cartItemList = $(".cart_item_list"),
        $cartTotal = $(".cart_total"),
        iids = "";

    // 加载用户购物车商品
    function loadCart() {
        $.ajax({
            type: "get",
            url: "/cart",
            success: function (response) {
                console.log(response);
                var html = "",
                    data = response,
                    totalPrice = 0,
                    ckALL = true;
                    iids = "";

                for (var item of data) {
                    if (item.expired != "1") {
                        if (item.is_checked) {
                            totalPrice += item.price * item.count;
                            iids += item.iid + ",";
                        }
                        else ckALL = false;
                        html += `<div class="cart_row">
                                    <div class="cart_item clear">
                                        <div class="item_img">
                                            <a href="app.html?appid=${item.appid}">
                                                <img src="${item.sm}" alt="">
                                            </a>
                                        </div>
                                        <div class="item_desc" >
                                            <div class="select">
                                                <input ${item.is_checked? "checked": ""} type="checkbox" data-iid="${item.iid}">
                                            </div>
                                            <div class="num" data-iid="${item.iid}">
                                                <span class="reduce">-</span>
                                                <input type="text" value="${item.count}">
                                                <span class="add">+</span>
                                            </div>
                                            <a href="app.html?appid=${item.appid}">${item.name}</a>
                                            <br>
                                        </div>
                                        <div class="item_price_box">
                                            <div class="price">￥${item.price}</div>
                                            <a data-iid="${item.iid}" href="#" class="remove">移除</a>
                                        </div>
                                    </div>
                                </div>`;
                    }
                }

                $cartItemList.html(html);
                $cartTotal.children("span").html("¥" + totalPrice);
                if (ckALL) {
                    $(".selectAll").children("input[type=checkbox]").prop("checked", true);
                } else {
                    $(".selectAll").children("input[type=checkbox]").prop("checked", false);
                }
            },
            error: function () {
                alert("网络故障");
            }
        });
    }

    // store_header 页头导航栏购物车数量
    function loadCount() {
        var $cart = $('#cart');
        $.ajax({
            type: "get",
            url: "/cart/count",
            success: function(response) {
                if (response.count > 0) {
                    $cart.find('span').html(`(${response.count})`);
                } else {
                    $cart.find('span').html(``);
                }
            },
            error: function() {
                alert('网络故障');
            }
        });   
    }

    // cartItem 点击事件
    $cartItemList.on("click", ".reduce, .add, .select>input[type=checkbox], .remove", function (e) {
        e.preventDefault();
        var $this = $(this);
        if ($this.is(".reduce, .add")) {
            var n = $this.parent().children(":eq(1)").val(),
                iid = $this.parent().data("iid");
            if ($this.is(".add")) n++;
            else if (n > 1) n--;
            $this.parent().children(":eq(1)").val(n);
            $.ajax({
                type: "get",
                url: "/cart/updateCart",
                data: {
                    iid: iid,
                    count: n
                },
                success: function (response) {
                    if (response.code >0) loadCart();
                    else {
                        console.log(response.msg);
                    }
                },
                error: function () {
                    alert("网络故障");
                }
            });
        } else if ($this.is("[type=checkbox]")) {
            iid = $this.data("iid");
            var checked = $this.prop("checked") ? 1 : 0;
            $.ajax({
                type: "get",
                url: "/cart/selectOne",
                data: {
                    checked,
                    iid
                },
                success: function (response) {
                    if (response.code >0) loadCart();
                    else console.log(response);
                },
                error: function () {
                    alert("网络故障");
                }
            });
        } else if ($this.is(".remove")) {
            iid = $this.data("iid");
            $.ajax({
                type: "get",
                url: "/cart/delete",
                data: {
                    iid
                },
                success: function (response) {
                    if (response.code > 0) {
                        loadCart();
                        loadCount();
                        
                    }
                    else console.log(response);
                },
                error: function () {
                    alert("网络故障");
                }
            });
        }
    });

    // 全选
    $(".checkAll").click(function(){
        var $this = $(this);
        var checked = $this.prop("checked")? 1:0;
        $.ajax({
            type: "get",
            url: "/cart/selectAll",
            data: {checked},
            success: function (response) {
                if(response.code > 0) loadCart();
                else console.log(response);
            },
            error: function() {
                alert("网络故障");
            }
        });
    });
    
    // 多选删除
    $(".remove_all").click(function(e){
        e.preventDefault();
        loadCart();
        iids = iids.slice(0,-1);
        $.ajax({
            type: "get",
            url: "/cart/delete",
            data: {iids},
            success: function (response) {
                if(response.code > 0) {
                    loadCart();
                    loadCount();
                }
                else console.log(response);
            },
            error: function() {
                alert("网络故障");
            }
        });
    });
});