function ajax({
    type, //"get"||"post"
    url, //"xxx.php"
    data, //"变量1=值&..."
    dataType, //"json"||"text"
}) {
    dataType = dataType || "text";
    return new Promise(function(resolve) {
        //AJAX 4步             //.then()
        var xhr = new XMLHttpRequest();
        if (type.toLowerCase() == "get" && data !== undefined)
            url += "?" + data;
        xhr.open(type, url, true);
        xhr.onreadystatechange = function() {
            if (xhr.readyState == 4 && xhr.status == 200) {
                if (dataType.toLowerCase() != "json")
                    resolve(xhr.responseText);
                else
                    resolve(JSON.parse(xhr.responseText));
            }
        }
        if (type.toLowerCase() == "post")
            xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        xhr.send(type.toLowerCase() == "post" ? data : null);
    })
}