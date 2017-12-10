(() => {
    ajax({
        type: "get",
        url: "store_header.html"
    }).then(html => {
        document.getElementById("store_header").innerHTML = html;
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
        // var ul = document.querySelector("#store_nav>ul");
        // ul.onmouseover = e => {
        //     // console.log(e.target);
        // };
        // JQuery 实现尝试
/*         $("#store_nav>ul>li").mouseover(function(e) {
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

        $("#store_nav>ul>li").hover(function(e){
            $(this).children(".dropdown").toggle();
        });
    });
})();