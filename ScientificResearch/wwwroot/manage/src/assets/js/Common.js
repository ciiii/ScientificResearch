import Vue from 'vue'

//时间格式化
export function formatDate(date, fmt) {
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
            fmt = fmt.replace(RegExp.$1, RegExp.$1.length === 1 ? str : padLeftZero(str))
        }
    }
    return fmt
}

function padLeftZero(str) {
    return ('00' + str).substr(str.length)
}

Vue.filter('dataFormat', function (value, fmt) {
    let getDate = new Date(value);
    let o = {
        'M+': getDate.getMonth() + 1,
        'd+': getDate.getDate(),
        'h+': getDate.getHours(),
        'm+': getDate.getMinutes(),
        's+': getDate.getSeconds(),
        'q+': Math.floor((getDate.getMonth() + 3) / 3),
        'S': getDate.getMilliseconds()
    };
    if (/(y+)/.test(fmt)) {
        fmt = fmt.replace(RegExp.$1, (getDate.getFullYear() + '').substr(4 - RegExp.$1.length))
    }
    for (let k in o) {
        if (new RegExp('(' + k + ')').test(fmt)) {
            fmt = fmt.replace(RegExp.$1, (RegExp.$1.length === 1) ? (o[k]) : (('00' + o[k]).substr(('' + o[k]).length)))
        }
    }
    return fmt;
});

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

//两个对象属性匹配
export function matchingProperty(objA, objB) {
    for (let i in objA) {
        if (objB[i] && objB[i] != 'undefined') {
            objA[i] = objB[i];
        }
    }
    return objA
}


//url 中文参数乱码
export function getUrl(url) {
    return decodeURI(encodeURI(encodeURI(url)))
}

//只能输入中文、字母、数字格式，不能有特殊字符
export function chineseEnglishNumber(e) {
    e.target.value = e.target.value.replace(/[^\w\u4E00-\u9FA5]/g, ''); //清除"字母、数字"以外的字符
}


//过滤特殊字符
export function clearSpecialChar(e) {
    e.target.value = e.target.value.replace(/[^[0-9a-zA-Z\-]/g, ''); //清除"字母、数字"以外的字符
}

