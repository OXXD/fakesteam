$(() => {
    // 登录
    var $loginBtn = $('.loginbox_btn>.login_btn>a'),
        $uname = $('#uname'),
        $upwd = $('#upwd');

    $loginBtn.click((e) => {
        e.preventDefault();
        var uname = $uname.val(),
            upwd = $upwd.val();
        if (!uname) {
            $uname.next().css({ opacity: 1 });
        } else {
            $uname.next().css({ opacity: 0 });
        }
        if (!upwd) {
            $upwd.next().css({ opacity: 1 });
        } else {
            $upwd.next().css({ opacity: 0 });
        }
        if (!uname || !upwd) return;
        $.ajax({
            type: "post",
            url: "/user/login",
            data: { uname, upwd },
            success: function(response) {
                if (response.code == 1) {
                    var back = location.search.slice(6);
                    location = back;
                } else {
                    alert(response.msg);
                }
            },
            error: function() {
                alert('网络异常');
            }
        });
    });



});