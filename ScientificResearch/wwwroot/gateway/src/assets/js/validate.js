//验证是否是邮箱
export function isEmail(str) {
    const reg = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
    return reg.test(str.trim())
}

//只能输入数字格式
export function onlyNum(that) {
    that.value = that.value.replace(/\D/g, "");
}

//只能输入中文、字母、数字格式，不能有特殊字符
export function onlyOther(that) {
    that.value = that.value.replace(/[^\w\u4E00-\u9FA5]/g, '');
}

//只能输入字母、数字格式
export function onlyNumLetter(that) {
    that.value = that.value.replace(/[^\w\.\/]/ig, '');
}

//只能输入正整数
export function clearNoNumInt(obj) {
    obj.value = obj.value.replace(/[^\d]/g, ""); //清除"数字"以外的字符
}

//只能输入字母跟空格
export function clearNoLetter(obj) {
    obj.value = obj.value.replace(/[^a-z\s?]/ig, "");  //清除"字母跟空格"以外的字符
}

//只能输入汉字
export function clearNoChinese(obj) {
    obj.value = obj.value.replace(/[^\u4E00-\u9FA5]/g, "");  //清除"中文汉字"以外的字符
}

//过滤特殊字符
export function clearSpecialChar(obj) {
    obj.value = obj.value.replace(/[^[0-9a-zA-Z\-]/g, ""); //清除"字母、数字"以外的字符

}

//身份证号码是否正确15-18位
export function isCardNo(obj) {
    const reg = /(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/;
    return reg.test(obj)

}

//判断手机号码是否正确
export function tel(obj) {
    const myreg = /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1}))+\d{8})$/;
    return myreg.test(obj)
}

//输出字符长度
export function len(s) {
    var l = 0;
    var a = s.split("");
    for (var i = 0; i < a.length; i++) {
        if (a[i].charCodeAt(0) < 299) {
            l++;
        } else {
            l += 2;
        }
    }
    return l;
}