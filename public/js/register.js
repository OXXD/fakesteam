$(() => {
    // 注册功能
    var $uname = $('#uname'),
        $upwd = $('#upwd'),
        $cpwd = $('#cpwd'),
        $email = $('#email'),
        $cemail = $('#cemail'),
        $captcha = $('#captcha'),
        $loginBtn = $('.login_btn>a'),
        $form = $('#registerForm'),
        $captchaImg = $('.captcha_img'),
        $refresh = $('.refresh');

    var isEmptyCheckd = false,
        isChecked = false;

    function validate(el) {
        var $el = $(el),
            val = $el.val();
        if (!val) {
            $el.next().css({ opacity: 1 });
            return false;
        } else {
            $el.next().css({ opacity: 0 });
            return true;
        }
    }

    function regValidate(el, reg, msg) {
        var $el = $(el),
            val = $el.val();
        if (!reg.test(val)) {
            $el.next().html(msg).css({ opacity: 1 });
            return false;
        } else {
            $el.next().css({ opacity: 0 });
            return true;
        }
    }

    $uname.blur(function() {
        validate(this);
    });
    $upwd.blur(function() {
        validate(this);
    });
    $cpwd.blur(function() {
        validate(this);
    });
    $email.blur(function() {
        validate(this);
    });
    $cemail.blur(function() {
        validate(this);
    });
    // $captcha.blur(function() {
    //     validate(this);
    // });

    // 注册验证
    $loginBtn.click(function(e) {
        e.preventDefault();
        if (validate($uname) && validate($upwd) && validate($cpwd) && validate($email) && validate($cemail) && validate($captcha)) {
            console.log('empty check passed');
            if (
                regValidate($uname, /^\w{3,18}$/i, '用户名任意字符 3-18 位') && regValidate($upwd, /^\w{3,18}$/i, '密码 3-18 位') &&
                regValidate($cpwd, /^\w{3,18}$/i, '密码 3-18 位') &&
                regValidate($email, /^[\da-zA-z]+@[\da-zA-z]+.[\da-zA-z]+$/i, '请输入正确的邮箱格式') &&
                regValidate($cemail, /^[\da-zA-z]+@[\da-zA-z]+.[\da-zA-z]+$/i, '请输入正确的邮箱格式')) {
                console.log('reg regValidate passed');
                if ($upwd.val() != $cpwd.val()) {
                    $cpwd.next().html('两次密码不一致').css({ opacity: 1 });
                    return;
                } else {
                    $cpwd.next().css({ opacity: 0 });
                }
                if ($email.val() != $cemail.val()) {
                    $cemail.next().html('两次邮箱不一致').css({ opacity: 1 });
                    return;
                } else {
                    $cemail.next().css({ opacity: 0 });
                }
                console.log('checkd');
                console.log($form.serialize());
                $.ajax({
                    type: "get",
                    url: "/user/register",
                    data: $form.serialize(),
                    success: function(response) {
                        console.log(response);
                        if (response.code > 0) {
                            alert(response.msg);
                            location = 'login.html';
                        } else {
                            alert(response.msg);
                        }
                    },
                    error: function() {
                        alert('网络故障');
                    }
                });
            }
        }
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