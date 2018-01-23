$(() => {
    // 登录
    var $loginBtn = $('.loginbox_btn>.login_btn>a'),
        $uname = $('#uname'),
        $upwd = $('#upwd'),
        $captchaImg = $('.captcha_img'),
        $captcha = $('#captcha'),
        $refresh = $('.refresh');

    $loginBtn.click((e) => {
        e.preventDefault();
        var uname = $uname.val().trim(),
            upwd = $upwd.val(),
            ucaptcha = $captcha.val().trim().toLowerCase();
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
        if (!ucaptcha) {
            $captcha.next().css({ opacity: 1 });
        } else {
            $captcha.next().css({ opacity: 0 });
        }
        if (!uname || !upwd || !ucaptcha) return;
        $.ajax({
            type: "post",
            url: "/user/login",
            data: { uname, upwd, ucaptcha },
            success: function(response) {
                // console.log(response);
                var back = location.search.slice(6);
                if (response.code == 1) {
                    if (!back) {
                        back = 'index.html';
                    }
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

    // 验证码点击事件
    $refresh.click(function() {
        // $captchaImg.attr('src', 'http://127.0.0.1:3500/captcha.svg');

        $captchaImg.load('/captcha.svg');
    });
    $captchaImg.click(function() {
        $captchaImg.load('/captcha.svg');
    });
    $captchaImg.load('/captcha.svg');

});