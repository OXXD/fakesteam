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
        // JQuery 实现尝试
        /*$("#store_nav>ul>li").mouseover(function(e) {
                    // console.log("-------------mouseover---------");
                    // console.log(this); // this -> #store_nav>ul>li
                    // $(this).children(".dropdown").css("display", "block");
                    $(this).children(".dropdown").show();
                }).mouseout(function() {
                    // console.log("-------------mouseout---------");
                    // console.log(this);
                    // console.log($(this).children());
                    // $(this).children(".dropdown").css("display", "none");
                    $(this).children(".dropdown").hide();
                }); */

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
    });
});