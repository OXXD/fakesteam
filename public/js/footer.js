$(() => {
    // ajax({
    //     type:"get",
    //     url:"footer.html"
    // }).then(html =>{
    //     document.getElementById("footer").innerHTML = html;
    // });
    $("#footer").load("footer.html", () => {});
});