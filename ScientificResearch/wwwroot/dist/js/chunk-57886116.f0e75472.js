(window["webpackJsonp"]=window["webpackJsonp"]||[]).push([["chunk-57886116"],{"02f4":function(t,n,e){var i=e("4588"),a=e("be13");t.exports=function(t){return function(n,e){var o,s,c=String(a(n)),r=i(e),u=c.length;return r<0||r>=u?t?"":void 0:(o=c.charCodeAt(r),o<55296||o>56319||r+1===u||(s=c.charCodeAt(r+1))<56320||s>57343?t?c.charAt(r):o:t?c.slice(r,r+2):s-56320+(o-55296<<10)+65536)}}},"0390":function(t,n,e){"use strict";var i=e("02f4")(!0);t.exports=function(t,n,e){return n+(e?i(t,n).length:1)}},"0496":function(t,n,e){"use strict";var i=function(){var t=this,n=t.$createElement,e=t._self._c||n;return e("div",[e("ul",{directives:[{name:"show",rawName:"v-show",value:t.condition,expression:"condition"}],staticClass:"logo"},[t._m(0)])])},a=[function(){var t=this,n=t.$createElement,i=t._self._c||n;return i("li",[i("img",{attrs:{src:e("2949"),alt:"科研logo"}})])}],o=(e("cadf"),e("551c"),e("097d"),{data:function(){return{condition:!0}},mounted:function(){},methods:{}}),s=o,c=(e("d53f"),e("2877")),r=Object(c["a"])(s,i,a,!1,null,"5cccfc6d",null);r.options.__file="search.vue";n["a"]=r.exports},"0bfb":function(t,n,e){"use strict";var i=e("cb7c");t.exports=function(){var t=i(this),n="";return t.global&&(n+="g"),t.ignoreCase&&(n+="i"),t.multiline&&(n+="m"),t.unicode&&(n+="u"),t.sticky&&(n+="y"),n}},"0d75":function(t,n,e){"use strict";var i=e("caa9"),a=e.n(i);a.a},"11c1":function(t,n,e){},"11e9":function(t,n,e){var i=e("52a7"),a=e("4630"),o=e("6821"),s=e("6a99"),c=e("69a8"),r=e("c69a"),u=Object.getOwnPropertyDescriptor;n.f=e("9e1e")?u:function(t,n){if(t=o(t),n=s(n,!0),r)try{return u(t,n)}catch(e){}if(c(t,n))return a(!i.f.call(t,n),t[n])}},"19f8":function(t,n,e){"use strict";var i=function(){var t=this,n=t.$createElement,e=t._self._c||n;return e("van-panel",{staticClass:"box",attrs:{title:"审核"}},[e("i",{staticClass:"icon iconfont icon-guanbi",on:{click:t.back}}),e("van-cell-group",[e("van-field",{attrs:{label:"审核说明：",type:"textarea",placeholder:"请输入审核说明···",rows:"5",autosize:t.maxHeight},model:{value:t.value,callback:function(n){t.value=n},expression:"value"}}),e("div",{staticClass:"btn"},[e("van-button",{attrs:{type:"primary",size:"small"},on:{click:t.pass}},[t._v("通过")]),e("van-button",{attrs:{type:"warning",size:"small"},on:{click:t.fail}},[t._v("不通过")]),e("van-button",{attrs:{type:"danger",size:"small"},on:{click:t.termination}},[t._v("终止")])],1)],1)],1)},a=[],o=(e("cadf"),e("551c"),e("097d"),{props:["message"],data:function(){return{value:"",maxHeight:{maxHeight:90},state:{pass:1,fail:-1,termination:-2}}},mounted:function(){},methods:{back:function(){this.$emit("getMessage"),this.value=""},pass:function(){var t=this,n={"步骤编号":this.message.步骤编号,"状态值":this.state.pass,"备注":this.value};this.$http.auditStep(n).then(function(n){200!=n.status||"OK"!=n.statusText?t.$toast({duration:1500,message:n.error}):t.$toast.success({duration:1500,message:"操作成功！"})}),this.back()},fail:function(){var t=this,n={"步骤编号":this.message.步骤编号,"状态值":this.state.fail,"备注":this.value};this.$http.auditStep(n).then(function(n){200!=n.status||"OK"!=n.statusText?t.$toast({duration:1500,message:n.error}):t.$toast.success({duration:1500,message:"操作成功！"})}),this.back()},termination:function(){var t=this,n={"步骤编号":this.message.步骤编号,"状态值":this.state.termination,"备注":this.value};this.$http.auditStep(n).then(function(n){200!=n.status||"OK"!=n.statusText?t.$toast({duration:1500,message:n.error}):t.$toast.success({duration:1500,message:"操作成功！"})}),this.back()}}}),s=o,c=(e("0d75"),e("2877")),r=Object(c["a"])(s,i,a,!1,null,"346a3803",null);r.options.__file="audit.vue";n["a"]=r.exports},"1e4b":function(t,n,e){"use strict";e.r(n);var i=function(){var t=this,n=t.$createElement,e=t._self._c||n;return e("div",[e("search"),e("section",[e("div",{staticClass:"backlogBox"},[e("div",{staticClass:"backlog"},[t._m(0),e("span",{on:{click:t.more}},[t._v("\n          更多\n          "),e("i",{staticClass:"icon iconfont icon-you"})])]),e("van-swipe",{staticClass:"backlogContent",attrs:{autoplay:3e3,vertical:"","show-indicators":!1}},t._l(t.KYList,function(n,i){return e("van-swipe-item",{key:i},[e("span",{on:{click:function(e){t.newsItem(n.编号)}}},[e("i",{staticClass:"iocn iconfont icon-tongzhi"}),t._v("\n            "+t._s(n.通知名称)+"\n          ")])])}),1)],1),t._m(1),e("div",{staticClass:"backlogBox"},[t._m(2),e("toDoList",{ref:"toDoList"})],1)]),e("navFooter")],1)},a=[function(){var t=this,n=t.$createElement,e=t._self._c||n;return e("span",[e("i",{staticClass:"icon iconfont icon-tongzhi1"}),e("span",[t._v("通知公告")])])},function(){var t=this,n=t.$createElement,e=t._self._c||n;return e("div",{staticClass:"box"},[e("div",[e("div",{staticClass:"boxI"},[e("i",{staticClass:"iocn iconfont icon-diyiming"})]),e("div",{staticClass:"boxContent"},[e("p",[t._v("第一作者")]),e("span",[t._v("10")])])]),e("div",[e("div",{staticClass:"boxI"},[e("i",{staticClass:"iocn iconfont icon-xiangmu1"})]),e("div",{staticClass:"boxContent"},[e("p",[t._v("横项")]),e("span",[t._v("15")])])]),e("div",[e("div",{staticClass:"boxI"},[e("i",{staticClass:"iocn iconfont icon-xiangmu"})]),e("div",{staticClass:"boxContent"},[e("p",[t._v("纵项")]),e("span",[t._v("17")])])]),e("div",[e("div",{staticClass:"boxI"},[e("i",{staticClass:"iocn iconfont icon-feiyong"})]),e("div",{staticClass:"boxContentX"},[e("p",[t._v("费用")]),e("span",[t._v("3728元")])])])])},function(){var t=this,n=t.$createElement,e=t._self._c||n;return e("div",{staticClass:"backlog"},[e("span",[e("i",{staticClass:"icon iconfont icon-liti"}),e("span",[t._v("我的待办")])])])}],o=e("f499"),s=e.n(o),c=(e("3b2b"),e("a481"),e("ac6a"),e("0496")),r=function(){var t=this,n=t.$createElement,e=t._self._c||n;return e("van-list",{attrs:{finished:t.finished,"finished-text":"没有更多了"},on:{load:t.onLoad},model:{value:t.loading,callback:function(n){t.loading=n},expression:"loading"}},[t._l(t.list,function(n,i){return e("div",{key:i,staticClass:"backContentBox"},[e("div",{staticClass:"bacnButtom"},[e("ul",{on:{click:function(e){t.goDetails(n,n.项目编号)}}},[e("li",[t._v(t._s(n.流程名称))]),e("li",[e("span",[t._v("项目名称：")]),e("span",[t._v(t._s(n.项目名称))])]),e("li",[e("span",[t._v("步骤名称：")]),e("span",[t._v(t._s(n.步骤名称))])]),e("li",[e("span",[t._v("发起人姓名：")]),e("span",[t._v(t._s(n.发起人姓名))])]),e("li",[e("i",{staticClass:"currentState"},[t._v(t._s(n.状态名称))]),e("i",{staticClass:"stepState"},[t._v(t._s(n.步骤状态说明))])]),e("li",{staticClass:"contentSpan"},[e("span",[t._v("当前步骤：")]),e("span",[t._v(t._s(n.步骤名称)+" - "+t._s(n.步骤状态说明))])]),e("li",[e("span",[t._v("创建时间：")]),e("span",[t._v(t._s(t.startTime(n.流程创建时间)))])])]),e("div",{staticClass:"audit"},[e("span",{directives:[{name:"show",rawName:"v-show",value:t.isShow,expression:"isShow"}],on:{click:function(e){t.audit(n)}}},[t._v("审核")])])])])}),e("van-popup",{staticClass:"popup",model:{value:t.show,callback:function(n){t.show=n},expression:"show"}},[e("Audit",{attrs:{message:t.message},on:{getMessage:t.getMessage}})],1)],2)},u=[],l=e("19f8"),f={components:{Audit:l["a"]},data:function(){return{index:1,size:15,list:[],loading:!1,finished:!1,show:!1,isShow:!1,message:"",typeList:{"论文成果":"paperDetails","著作成果":"workDetails","专利成果":"patentDetails","获奖成果":"resultsDetails","纵向项目申报":"YDeclarationDetails","纵向项目中检":"YProcessInspectionDetails","纵向项目经费到账":"YFundsToTheAccount","横向项目":"XDetails","横向项目经费到账":"XFundsToTheAccount"}}},mounted:function(){localStorage.token&&this.getBacklog()},methods:{getMessage:function(){this.show=!1},getBacklog:function(){var t=this;this.$http.getBacklogProcess(this.index,this.size).then(function(n){console.log(n,"获取待办流程"),t.list=n.data.list,t.list.forEach(function(n,e){"待审核"===n.步骤状态说明&&(t.isShow=!0)})}).catch(function(t){console.log(t)})},goDetails:function(t,n){for(var e in this.typeList)e==t.流程名称&&this.$router.push({path:"/".concat(this.typeList[e]),name:"".concat(this.typeList[e]),params:{item:n}})},audit:function(t){this.message=t,this.show=!0},onLoad:function(){var t=this;setTimeout(function(){for(var n=0;n<0;n++)t.list.push(t.list.length+1);t.loading=!1,t.list.length>=0&&(t.finished=!0)},500)},startTime:function(t){if(null!=t)return t.slice(0,10)}}},p=f,v=(e("adfb"),e("2877")),h=Object(v["a"])(p,r,u,!1,null,"4a32e240",null);h.options.__file="toDoList.vue";var d=h.exports,g=e("2c4b"),b={components:{search:c["a"],toDoList:d,navFooter:g["a"]},data:function(){return{isLoading:!1,index:1,size:15,KYList:[]}},mounted:function(){var t=this,n=JSON.parse(localStorage.getItem("personnel")),e={"人员编号":n.编号,index:this.index,size:this.size};this.$http.getToViewNewsList(e).then(function(n){n.data.list.forEach(function(n,e){t.KYList.push(n)})})},methods:{onRefresh:function(){var t=this;setTimeout(function(){t.$refs.toDoList.getBacklog(),t.$toast("刷新成功"),t.isLoading=!1},500)},getUrlKey:function(t){return decodeURIComponent((new RegExp("[?|&]"+t+"=([^&;]+?)(&|#|;|$)").exec(location.href)||[,""])[1].replace(/\+/g,"%20"))||null},getCodeApi:function(t,n){var e=encodeURIComponent(t),i="snsapi_base",a="wx5e45aca8fcb270f1",o="https://open.weixin.qq.com/connect/oauth2/authorize?appid=".concat(a,"&redirect_uri=").concat(e,"&response_type=code&scope=").concat(i,"&state=").concat(n,"#wechat_redirect");return o},more:function(){this.$router.push("/KYMoreList")},newsItem:function(t){this.$router.push({path:"/KYNewsDetails",name:"KYNewsDetails",params:{item:t}})}},created:function(){var t=this;if(document.title="科研管理 - 主页",!localStorage.token){var n=this.getUrlKey("code");n?this.$http.LoginWithOpenId(n).then(function(n){console.log(n,"res```````"),localStorage.personnel=s()(n.data.人员),localStorage.token="".concat(n.data.token_type," ").concat(n.data.access_token),console.log(localStorage.token,"localStorage.token  ????????"),t.$refs.toDoList.getBacklog()}):(this.$router.push("/login"),this.$notify("没有权限，请绑定！"))}}},m=b,_=(e("616a"),Object(v["a"])(m,i,a,!1,null,"4fb20ba4",null));_.options.__file="index.vue";n["default"]=_.exports},"214f":function(t,n,e){"use strict";e("b0c5");var i=e("2aba"),a=e("32e9"),o=e("79e5"),s=e("be13"),c=e("2b4c"),r=e("520a"),u=c("species"),l=!o(function(){var t=/./;return t.exec=function(){var t=[];return t.groups={a:"7"},t},"7"!=="".replace(t,"$<a>")}),f=function(){var t=/(?:)/,n=t.exec;t.exec=function(){return n.apply(this,arguments)};var e="ab".split(t);return 2===e.length&&"a"===e[0]&&"b"===e[1]}();t.exports=function(t,n,e){var p=c(t),v=!o(function(){var n={};return n[p]=function(){return 7},7!=""[t](n)}),h=v?!o(function(){var n=!1,e=/a/;return e.exec=function(){return n=!0,null},"split"===t&&(e.constructor={},e.constructor[u]=function(){return e}),e[p](""),!n}):void 0;if(!v||!h||"replace"===t&&!l||"split"===t&&!f){var d=/./[p],g=e(s,p,""[t],function(t,n,e,i,a){return n.exec===r?v&&!a?{done:!0,value:d.call(n,e,i)}:{done:!0,value:t.call(e,n,i)}:{done:!1}}),b=g[0],m=g[1];i(String.prototype,t,b),a(RegExp.prototype,p,2==n?function(t,n){return m.call(t,this,n)}:function(t){return m.call(t,this)})}}},2949:function(t,n,e){t.exports=e.p+"img/homeLogo.ab37f1a1.jpg"},"3b2b":function(t,n,e){var i=e("7726"),a=e("5dbc"),o=e("86cc").f,s=e("9093").f,c=e("aae3"),r=e("0bfb"),u=i.RegExp,l=u,f=u.prototype,p=/a/g,v=/a/g,h=new u(p)!==p;if(e("9e1e")&&(!h||e("79e5")(function(){return v[e("2b4c")("match")]=!1,u(p)!=p||u(v)==v||"/a/i"!=u(p,"i")}))){u=function(t,n){var e=this instanceof u,i=c(t),o=void 0===n;return!e&&i&&t.constructor===u&&o?t:a(h?new l(i&&!o?t.source:t,n):l((i=t instanceof u)?t.source:t,i&&o?r.call(t):n),e?this:f,u)};for(var d=function(t){t in u||o(u,t,{configurable:!0,get:function(){return l[t]},set:function(n){l[t]=n}})},g=s(l),b=0;g.length>b;)d(g[b++]);f.constructor=u,u.prototype=f,e("2aba")(i,"RegExp",u)}e("7a56")("RegExp")},"520a":function(t,n,e){"use strict";var i=e("0bfb"),a=RegExp.prototype.exec,o=String.prototype.replace,s=a,c="lastIndex",r=function(){var t=/a/,n=/b*/g;return a.call(t,"a"),a.call(n,"a"),0!==t[c]||0!==n[c]}(),u=void 0!==/()??/.exec("")[1],l=r||u;l&&(s=function(t){var n,e,s,l,f=this;return u&&(e=new RegExp("^"+f.source+"$(?!\\s)",i.call(f))),r&&(n=f[c]),s=a.call(f,t),r&&s&&(f[c]=f.global?s.index+s[0].length:n),u&&s&&s.length>1&&o.call(s[0],e,function(){for(l=1;l<arguments.length-2;l++)void 0===arguments[l]&&(s[l]=void 0)}),s}),t.exports=s},"52a7":function(t,n){n.f={}.propertyIsEnumerable},"53a0":function(t,n,e){},"58ba":function(t,n,e){},"5dbc":function(t,n,e){var i=e("d3f4"),a=e("8b97").set;t.exports=function(t,n,e){var o,s=n.constructor;return s!==e&&"function"==typeof s&&(o=s.prototype)!==e.prototype&&i(o)&&a&&a(t,o),t}},"5f1b":function(t,n,e){"use strict";var i=e("23c6"),a=RegExp.prototype.exec;t.exports=function(t,n){var e=t.exec;if("function"===typeof e){var o=e.call(t,n);if("object"!==typeof o)throw new TypeError("RegExp exec method returned something other than an Object or null");return o}if("RegExp"!==i(t))throw new TypeError("RegExp#exec called on incompatible receiver");return a.call(t,n)}},"616a":function(t,n,e){"use strict";var i=e("11c1"),a=e.n(i);a.a},"8b97":function(t,n,e){var i=e("d3f4"),a=e("cb7c"),o=function(t,n){if(a(t),!i(n)&&null!==n)throw TypeError(n+": can't set as prototype!")};t.exports={set:Object.setPrototypeOf||("__proto__"in{}?function(t,n,i){try{i=e("9b43")(Function.call,e("11e9").f(Object.prototype,"__proto__").set,2),i(t,[]),n=!(t instanceof Array)}catch(a){n=!0}return function(t,e){return o(t,e),n?t.__proto__=e:i(t,e),t}}({},!1):void 0),check:o}},9093:function(t,n,e){var i=e("ce10"),a=e("e11e").concat("length","prototype");n.f=Object.getOwnPropertyNames||function(t){return i(t,a)}},a21f:function(t,n,e){var i=e("584a"),a=i.JSON||(i.JSON={stringify:JSON.stringify});t.exports=function(t){return a.stringify.apply(a,arguments)}},a481:function(t,n,e){"use strict";var i=e("cb7c"),a=e("4bf8"),o=e("9def"),s=e("4588"),c=e("0390"),r=e("5f1b"),u=Math.max,l=Math.min,f=Math.floor,p=/\$([$&`']|\d\d?|<[^>]*>)/g,v=/\$([$&`']|\d\d?)/g,h=function(t){return void 0===t?t:String(t)};e("214f")("replace",2,function(t,n,e,d){return[function(i,a){var o=t(this),s=void 0==i?void 0:i[n];return void 0!==s?s.call(i,o,a):e.call(String(o),i,a)},function(t,n){var a=d(e,t,this,n);if(a.done)return a.value;var f=i(t),p=String(this),v="function"===typeof n;v||(n=String(n));var b=f.global;if(b){var m=f.unicode;f.lastIndex=0}var _=[];while(1){var x=r(f,p);if(null===x)break;if(_.push(x),!b)break;var y=String(x[0]);""===y&&(f.lastIndex=c(p,o(f.lastIndex),m))}for(var w="",k=0,C=0;C<_.length;C++){x=_[C];for(var $=String(x[0]),S=u(l(s(x.index),p.length),0),E=[],L=1;L<x.length;L++)E.push(h(x[L]));var O=x.groups;if(v){var D=[$].concat(E,S,p);void 0!==O&&D.push(O);var I=String(n.apply(void 0,D))}else I=g($,p,S,E,O,n);S>=k&&(w+=p.slice(k,S)+I,k=S+$.length)}return w+p.slice(k)}];function g(t,n,i,o,s,c){var r=i+t.length,u=o.length,l=v;return void 0!==s&&(s=a(s),l=p),e.call(c,l,function(e,a){var c;switch(a.charAt(0)){case"$":return"$";case"&":return t;case"`":return n.slice(0,i);case"'":return n.slice(r);case"<":c=s[a.slice(1,-1)];break;default:var l=+a;if(0===l)return e;if(l>u){var p=f(l/10);return 0===p?e:p<=u?void 0===o[p-1]?a.charAt(1):o[p-1]+a.charAt(1):e}c=o[l-1]}return void 0===c?"":c})}})},aae3:function(t,n,e){var i=e("d3f4"),a=e("2d95"),o=e("2b4c")("match");t.exports=function(t){var n;return i(t)&&(void 0!==(n=t[o])?!!n:"RegExp"==a(t))}},adfb:function(t,n,e){"use strict";var i=e("53a0"),a=e.n(i);a.a},b0c5:function(t,n,e){"use strict";var i=e("520a");e("5ca1")({target:"RegExp",proto:!0,forced:i!==/./.exec},{exec:i})},caa9:function(t,n,e){},d53f:function(t,n,e){"use strict";var i=e("58ba"),a=e.n(i);a.a},f499:function(t,n,e){t.exports=e("a21f")}}]);