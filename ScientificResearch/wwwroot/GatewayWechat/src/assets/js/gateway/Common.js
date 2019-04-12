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

export function onlyNum(that) {
    that.value = that.value.replace(/\D/g, "");
}


//UrlEncode
export function UrlEncode(str) {
    return transform(str);
}

export function transform(s) {
    let hex = '';
    let i, t;

    for (i = 0; i < s.length; i++) {
        t = hexfromdec(s.charCodeAt(i));
        if (t == '25') {
            t = '';
        }
        hex += '%' + t;
    }
    return hex;
}

export function hexfromdec(num) {
    if (num > 65535) {
        return ("err!")
    }
    let first = Math.round(num / 4096 - .5);
    let temp1 = num - first * 4096;
    let second = Math.round(temp1 / 256 - .5);
    let temp2 = temp1 - second * 256;
    let third = Math.round(temp2 / 16 - .5);
    let fourth = temp2 - third * 16;
    return ("" + getletter(third) + getletter(fourth));
}

export function getletter(num) {
    if (num < 10) {
        return num;
    } else {
        if (num == 10) {
            return "A"
        }
        if (num == 11) {
            return "B"
        }
        if (num == 12) {
            return "C"
        }
        if (num == 13) {
            return "D"
        }
        if (num == 14) {
            return "E"
        }
        if (num == 15) {
            return "F"
        }
    }
}

export function trim(str){
    return str.replace(/^(\s|\u00A0)+/,'').replace(/(\s|\u00A0)+$/,'');
}
