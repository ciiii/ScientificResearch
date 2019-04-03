function getMenuPermissions(getMenuPermissions) {
    if (localStorage.myUserInfo&&) {
        Menu.getMenuPermissions('get', function getMenuPermissionsListener(success, obj, strErro) {
            if (success) {
                var curTime = new Date().getTime();
                var url = localStorage.getItem('gatewayUrl');
                var personnel = JSON.parse(localStorage.myUserInfo).人员;
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
    } else {
        localStorage.setItem('Authorization', sessionStorage.Authorization);
        getMenuPermissions(true);

    }
}
