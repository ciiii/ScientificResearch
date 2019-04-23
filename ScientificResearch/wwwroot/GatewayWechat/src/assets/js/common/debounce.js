/**
 * 函数防抖 (只执行最后一次点击)
 * @param fn
 * @param delay
 * @returns {Function}
 * @constructor
 */
export function _debounce(fn, delay) {
    var delay = delay || 200;
    var timer;
    return function() {
        var th = this;
        var args = arguments;
        if (timer) {
            clearTimeout(timer);
        }
        timer = setTimeout(function() {
            timer = null;
            fn.apply(th, args);
        }, delay);
    };
}