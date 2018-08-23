$(function () {
    if (localStorage.getItem('info') != null) {
        get('info', 1000 * 60 * 10)//过期时间为10分钟
    }

    function get(key, exp) {
        var data = localStorage.getItem(key);
        var dataObj = JSON.parse(data);
        if (new Date().getTime() - dataObj.time < exp) {
            location.href = '/IMIS/views/index.html';
        } else {
            console.log('登录信息已过期');
            localStorage.removeItem('info');
            sessionStorage.removeItem('userInfo');
        }
    }

    $('input, textarea').placeholder();
    var userId, password;

    if (localStorage.ImisLoginInfo) {
        var loginInfo = JSON.parse(localStorage.ImisLoginInfo);
        $('#userId').val(loginInfo.userId);
        $('#password').val(loginInfo.password);
        $('.remember').attr('checked', true);
    }

    $(window).keydown(function (evt) {
        evt = window.event || evt;
        if (evt.keyCode == 13) {
            var userId = $('#userId').val();
            var password = $('#password').val();
            remember(userId, password);
            login(userId, password);
        }
    });

    $('.btn-login').on("click", function () {
        userId = $('#userId').val();
        password = $('#password').val();
        remember(userId, password);
        login(userId, password);
    });

    $('.remember').on('change', function () {
        if (!this.checked) {
            localStorage.removeItem('ImisLoginInfo');
        }
    });

    function remember(userId, password) {
        if ($('.remember').is(':checked')) {
            var loginInfo = {
                userId: userId,
                password: password,
                dbKey: "string"
            }
            localStorage.ImisLoginInfo = JSON.stringify(loginInfo);
        }
    }

    function login(userId, password) {
        if (userId == '' || password == '') {
            $(".login-tip").html('帐号/密码不能为空！');
        } else {
            User.userLogin('post', userId, password, function userLoginListener(success, obj, strErro) {
                var tip;
                $('.login-tip').removeClass('login-tip-success');
                if (success) {
                    var curTime = new Date().getTime();
                    localStorage.setItem('info', JSON.stringify({data: obj, time: curTime}));
                    sessionStorage.mUserId = obj.人员.编号;
                    tip = '登录成功！';
                    $('.login-tip').addClass('login-tip-success');
                    $('.login-tip').html(tip);
                    location.href = '/IMIS/views/index.html';
                } else {
                    tip = '帐号/密码错误！';
                    console.info(strErro);
                }
                $('.login-tip').html(tip);
                setTimeout(function () {
                    $('.login-tip').html('');
                }, 3000);
            });
        }
    }
});
