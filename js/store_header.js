(()=>{
    ajax({
        type:"get",
        url:"store_header.html"
    }).then(html =>{
        document.getElementById("store_header").innerHTML = html;
        window.onscroll = ()=>{
            var scrollTop = document.documentElement.scrollTop || document.body.scrollTop;
            var store_nav = document.getElementById("store_nav");
            if (scrollTop > 250) {
                store_nav.className = "fixed";
            } else {
                store_nav.className = "";
            }
        };
    });
})();