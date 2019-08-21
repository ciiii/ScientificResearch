function getMenuPermissions(getMenuPermissions) {
    if (localStorage.getItem('isEntryLogin')) {
        //入口进入
        Menu.getMenuPermissions('get', function getMenuPermissionsListener(success, obj, strErro) {
            if (success) {
                var curTime = new Date().getTime();
                var url = localStorage.getItem('gatewayUrl');
                let personnel;
                if (localStorage.myUserInfo) {
                    personnel = JSON.parse(localStorage.myUserInfo).人员;
                }
                if (localStorage.userInfo) {
                    personnel = JSON.parse(localStorage.userInfo).人员;
                }
                var postData = {
                    data: {
                        人员: personnel,
                        权限: obj
                    },
                    time: curTime,
                    url: url,
                    dbKey: personnel.DbKey
                }
                localStorage.setItem('info', JSON.stringify(postData));
                sessionStorage.mUserId = personnel.编号;

                getMenuPermissions(true);
            } else {
                getMenuPermissions(false);
                console.info('获取菜单权限失败！');
                console.info(strErro);
            }
        });
        console.info(111)
    } else {
        //手动登录
        console.info(222)
        localStorage.setItem('Authorization', sessionStorage.Authorization);
        getMenuPermissions(true);
    }
}