let myCommon = {
    //时间格式化
    formatDate: function (date, fmt) {
        if (/(y+)/.test(fmt)) {
            fmt = fmt.replace(RegExp.$1, (date.getFullYear() + '').substr(4 - RegExp.$1.length))
        }
        let o = {
            'M+': date.getMonth() + 1,
            'd+': date.getDate(),
            'h+': date.getHours(),
            'm+': date.getMinutes(),
            's+': date.getSeconds()
        }
        for (let k in o) {
            if (new RegExp(`(${k})`).test(fmt)) {
                let str = o[k] + ''
                fmt = fmt.replace(RegExp.$1, RegExp.$1.length === 1 ? str : myCommon.padLeftZero(str))
            }
        }
        return fmt
    },
    padLeftZero: function (str) {
        return ('00' + str).substr(str.length)
    },
    //判断Email是否正确
    isEmail:function (str) {
        const reg = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
        return reg.test(str.trim())
    }
}
export default myCommon;