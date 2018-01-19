$(() => {
    $("#header").load("header.html", () => {
        // 用户登录
        var $loginList = $('.header-right'),
            $welcomeList = $('.weclome_list');

        $.ajax({
            type: "get",
            url: "/user/islogin",
            success: function(response) {
                if (response.code == 1) {
                    console.log(response);
                    $loginList.hide();
                    $welcomeList.show().find('#uname').html(response.user.uname);
                } else {
                    $welcomeList.hide();
                    $loginList.show();
                }
            },
            error: function() {
                alert('网络故障');
            }
        });

        // 登录返回功能
        $('.lgon-btn').click((e) => {
            e.preventDefault();
            location = "login.html?back=" + location.href;
        });

        // 注销
        $('#logout').click(() => {
            $.ajax({
                type: "get",
                url: "/user/logout",
                success: function(response) {
                    location.reload(true);
                },
                error: function() {
                    alert('网络异常');
                }
            });
        });
    });

});