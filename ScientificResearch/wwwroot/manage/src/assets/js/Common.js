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
}
export default myCommon;

// 防抖
export function _debounce(fn, delay) {

    let newDelay = delay || 200;
    let timer;
    return function () {
        let th = this;
        let args = arguments;
        if (timer) {
            clearTimeout(timer);
        }
        timer = setTimeout(function () {
            timer = null;
            fn.apply(th, args);
        }, newDelay);
    };
}
// 节流
export function _throttle(fn, interval) {
    let last;
    let timer;
    let newInterval = interval || 200;
    return function () {
        let th = this;
        let args = arguments;
        let now = +new Date();
        if (last && now - last < newInterval) {
            clearTimeout(timer);
            timer = setTimeout(function () {
                last = now;
                fn.apply(th, args);
            }, newInterval);
        } else {
            last = now;
            fn.apply(th, args);
        }
    }
}

