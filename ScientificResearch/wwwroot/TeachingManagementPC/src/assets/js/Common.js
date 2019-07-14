import Vue from 'vue';

// 时间格式化 'yyyy-MM-dd hh:mm:ss'
export function formatDate(date, fmt) {
  date = new Date(date);
  if (/(y+)/.test(fmt)) {
    fmt = fmt.replace(RegExp.$1, (date.getFullYear() + '').substr(4 - RegExp.$1.length));
  }
  let o = {
    'M+': date.getMonth() + 1,
    'd+': date.getDate(),
    'h+': date.getHours(),
    'm+': date.getMinutes(),
    's+': date.getSeconds()
  };
  for (let k in o) {
    if (new RegExp(`(${k})`).test(fmt)) {
      let str = o[k] + '';
      fmt = fmt.replace(RegExp.$1, RegExp.$1.length === 1 ? str : padLeftZero(str));
    }
  }
  return fmt;
}

function padLeftZero(str) {
  return ('00' + str).substr(str.length);
}

// 防抖
export function _debounce(fn, delay) {
  let newDelay = delay || 200;
  let timer;
  return function() {
    let th = this;
    let args = arguments;
    if (timer) {
      clearTimeout(timer);
    }
    timer = setTimeout(function() {
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
  return function() {
    let th = this;
    let args = arguments;
    let now = +new Date();
    if (last && now - last < newInterval) {
      clearTimeout(timer);
      timer = setTimeout(function() {
        last = now;
        fn.apply(th, args);
      }, newInterval);
    } else {
      last = now;
      fn.apply(th, args);
    }
  };
}

// 两个对象属性匹配
export function matchingProperty(objA, objB) {
  for (let i in objA) {
    if (objB[i] && objB[i] != 'undefined') {
      objA[i] = objB[i];
    }
  }
  return objA;
}

// url 中文参数乱码
export function getUrl(url) {
  return decodeURI(encodeURI(encodeURI(url)));
}

//只能输入数字格式
export function onlyNum(that) {
  that.value = that.value.replace(/\D/g, '');
}

// 只能输入中文、字母、数字格式，不能有特殊字符
export function chineseEnglishNumber(e) {
  e.target.value = e.target.value.replace(/[^\w\u4E00-\u9FA5]/g, ''); // 清除"字母、数字"以外的字符
}

// 过滤特殊字符
export function clearSpecialChar(e) {
  e.target.value = e.target.value.replace(/[^[0-9a-zA-Z\-]/g, ''); // 清除"字母、数字"以外的字符
}

/**
 * @description 格式化金额
 * @param number：要格式化的数字
 * @param decimals：保留几位小数 默认0位
 * @param decPoint：小数点符号 默认.
 * @param thousandsSep：千分位符号 默认为,
 */
Vue.filter('formatMoney', function(number, decimals = 2, decPoint = '.', thousandsSep = ',') {
  number = (number + '').replace(/[^0-9+-Ee.]/g, '');
  let n = !isFinite(+number) ? 0 : +number;
  let prec = !isFinite(+decimals) ? 0 : Math.abs(decimals);
  let sep = (typeof thousandsSep === 'undefined') ? ',' : thousandsSep;
  let dec = (typeof decPoint === 'undefined') ? '.' : decPoint;
  let s = '';
  let toFixedFix = function(n, prec) {
    let k = Math.pow(10, prec);
    return '' + Math.ceil(n * k) / k;
  };
  s = (prec ? toFixedFix(n, prec) : '' + Math.round(n)).split('.');
  let re = /(-?\d+)(\d{3})/;
  while (re.test(s[0])) {
    s[0] = s[0].replace(re, '$1' + sep + '$2');
  }
  if ((s[1] || '').length < prec) {
    s[1] = s[1] || '';
    s[1] += new Array(prec - s[1].length + 1).join('0');
  }
  return s.join(dec);
});

//时间格式化 'yyyy/MM/dd hh:mm:ss'
Vue.filter('dataFormat', function(value, fmt) {
  if (!value) {
    return value;
  }
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
    fmt = fmt.replace(RegExp.$1, (getDate.getFullYear() + '').substr(4 - RegExp.$1.length));
  }
  for (let k in o) {
    if (new RegExp('(' + k + ')').test(fmt)) {
      fmt = fmt.replace(RegExp.$1, (RegExp.$1.length === 1) ? (o[k]) : (('00' + o[k]).substr(('' + o[k]).length)));
    }
  }
  return fmt;
});

Vue.filter('operatorState', function(state) {
  switch (state) {
    case '待完善':
      return '';
    case '待医审核':
      return 'warning';
    case '待审核':
      return 'warning';
    case '审核通过':
      return 'success';
    case '审核不通过':
      return 'danger';
    case '作废':
      return 'danger';
  }
});

Vue.filter('studentStates', function(state) {
  switch (state) {
    case '未报到':
      return 'warning';
    case '退培':
      return 'danger';
    case '已报到':
      return 'success';
    case '轮转计划已安排':
      return '';
    case '在培':
      return 'success';
    case '待结业':
      return 'warning';
    case '结业':
      return 'success';
  }
});

export function setObjArr(name, data) { // localStorage 存储数组对象的方法
  localStorage.setItem(name, JSON.stringify(data));
}

export function getObjArr(name) { // localStorage 获取数组对象的方法
  return JSON.parse(window.localStorage.getItem(name));
}

export function removeLocalStorage(name) { // localStorage 移除数组对象的方法
  localStorage.removeItem(name);
}

export function getInfo() {
  let MY_INFO = {
    data: {},
    url: '/login'
  };
  if (localStorage.getItem('isEntryLogin') == 'true') {
    MY_INFO.data = getObjArr('myUserInfo');
    MY_INFO.url = localStorage.getItem('gatewayUrl');
  } else {
    if (localStorage.getItem('userInfo')) {
      MY_INFO.data = getObjArr('userInfo');
      MY_INFO.url = localStorage.getItem('loginUrl');
    }
  }
  return MY_INFO;
}

// 对象深拷贝
export function deepCopy(data) {
  return JSON.parse(JSON.stringify(data));
}

//数组递归成树结构
export function arrayToJson(treeArray, id, pid) {
  let r = [];
  let tmpMap = {};

  for (let i = 0, l = treeArray.length; i < l; i++) {
    // 以每条数据的id作为obj的key值，数据作为value值存入到一个临时对象里面
    tmpMap[treeArray[i][id]] = treeArray[i];
  }

  for (let i = 0, l = treeArray.length; i < l; i++) {
    let key = tmpMap[treeArray[i][pid]];

    //循环每一条数据的pid，假如这个临时对象有这个key值，就代表这个key对应的数据有children，需要Push进去
    if (key) {
      if (!key['children']) {
        key['children'] = [];
        key['children'].push(treeArray[i]);
      } else {
        key['children'].push(treeArray[i]);
      }
    } else {
      //如果没有这个Key值，那就代表没有父级,直接放在最外层
      r.push(treeArray[i]);
    }
  }
  return r;
}

//成=树结构递归成数组
export let jsonToArray = function(nodes) {
  let r = [];
  if (Array.isArray(nodes)) {
    for (let i = 0, l = nodes.length; i < l; i++) {
      r.push(nodes[i]);
      if (Array.isArray(nodes[i]['children']) && nodes[i]['children'].length > 0)
      //将children递归的push到最外层的数组r里面
      {
        r = r.concat(jsonToArray(nodes[i]['children']));
      }
      delete nodes[i]['children'];
    }
  }
  return r;
};

//获取文件名，也不要参数
export function getHtmlDocName(url) {
  let urlArr = url.split('?');
  let k = urlArr[0], arr = k.split('/');
  return arr[arr.length - 1];
}

//点空白出隐藏
export const clickoutside = {
  // 初始化指令
  bind(el, binding, vnode) {
    function documentHandler(e) {
      // 这里判断点击的元素是否是本身，是本身，则返回
      if (el.contains(e.target)) {
        return false;
      }
      // 判断指令中是否绑定了函数
      if (binding.expression) {
        // 如果绑定了函数 则调用那个函数，此处binding.value就是handleClose方法
        binding.value(e);
      }
    }

    // 给当前元素绑定个私有变量，方便在unbind中可以解除事件监听
    el.__vueClickOutside__ = documentHandler;
    document.addEventListener('click', documentHandler);
  },
  update() {
  },
  unbind(el, binding) {
    // 解除事件监听
    document.removeEventListener('click', el.__vueClickOutside__);
    delete el.__vueClickOutside__;
  }
};

export const pickerOptions = {
  shortcuts: [{
    text: '最近一周',
    onClick(picker) {
      const end = new Date();
      const start = new Date();
      start.setTime(start.getTime() - 3600 * 1000 * 24 * 7);
      picker.$emit('pick', [start, end]);
    }
  }, {
    text: '最近一个月',
    onClick(picker) {
      const end = new Date();
      const start = new Date();
      start.setTime(start.getTime() - 3600 * 1000 * 24 * 30);
      picker.$emit('pick', [start, end]);
    }
  }, {
    text: '最近三个月',
    onClick(picker) {
      const end = new Date();
      const start = new Date();
      start.setTime(start.getTime() - 3600 * 1000 * 24 * 90);
      picker.$emit('pick', [start, end]);
    }
  }]
};

//简单数组去重
export function arrUnique(arr) {
  return Array.from(new Set(arr));
}

//数组对象去重
export function arrObjUnique(arr, id) {
  return arr = arr.reduce((all, next) => all.some((atom) => atom[id] == next[id]) ? all : [...all, next], []);

}

//数组元素快速更换顺序
export function alterItem(arr, index1, index2) {
  arr[index1] = arr.splice(index2, 1, arr[index1])[0];
  return arr;
}

//表格设置选中
export function isSelected(data, arr, _this) {
  data.forEach((item, index) => {
    if (arr.length > 0) {
      arr.forEach((itemB) => {
        if (item.编号 == itemB.编号) {
          _this.$nextTick(function() {
            _this.$refs.multipleTable.toggleRowSelection(data[index], true);
          });
        }
      });
    }
  });
}

//计算两个日期相差天数
export function countDays(date1, date2) {
  let newDate1 = new Date(date1);
  let newDate2 = new Date(date2);
  let days = (newDate2.getTime() - newDate1.getTime()) / (1000 * 60 * 60 * 24);
  return days;
}

//日期加上天数后的新日期.
export function addDay(date, days) {
  let nd = new Date(date);
  nd = nd.getTime();
  nd = nd + days * 24 * 60 * 60 * 1000;
  return nd = formatDate(new Date(nd), 'yyyy-MM-dd');
}

//日期减去天数后的新日期.
export function reduceDay(date, days) {
  let nd = new Date(date);
  nd = nd.getTime();
  nd = nd - days * 24 * 60 * 60 * 1000;
  return nd = formatDate(new Date(nd), 'yyyy-MM-dd');
}

//获取某个时间的时间戳
export function timeStamp(date) {
  return new Date(date).getTime();
}

