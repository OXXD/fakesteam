$(() => {
    // ajax({
    //     type:"get",
    //     url:"header.html"
    // }).then(html =>{
    //     document.getElementById("header").innerHTML = html;
    // });
    $("#header").load("header.html", () => {});
});