(window["webpackJsonp"]=window["webpackJsonp"]||[]).push([["chunk-17c393ae"],{"070a":function(t,e,n){"use strict";var i=n("bab2"),s=n.n(i);s.a},"21a7":function(t,e,n){t.exports=n.p+"img/2230625_03.6eadb917.png"},"267e":function(t,e,n){"use strict";var i=n("521a"),s=n.n(i);s.a},"35ce":function(t,e,n){"use strict";var i=n("5394"),s=n.n(i);s.a},"3dab":function(t,e,n){},"521a":function(t,e,n){},5394:function(t,e,n){},6721:function(t,e,n){"use strict";var i=function(){var t=this,e=t.$createElement,n=t._self._c||e;return n("footer",{staticClass:"footer_nav"},[n("van-tabbar",{attrs:{"active-color":"#1296db"},model:{value:t.active,callback:function(e){t.active=e},expression:"active"}},[n("van-tabbar-item",{attrs:{icon:"home-o",to:"/"}},[t._v("首页")]),n("van-tabbar-item",{attrs:{icon:"hot-o",to:"/alternative"}},[t._v("前沿")]),n("van-tabbar-item",{attrs:{icon:"service-o",to:"/alternative"}},[t._v("视听")]),n("van-tabbar-item",{attrs:{icon:"volume-o",to:"/alternative"}},[t._v("公告")]),n("van-tabbar-item",{attrs:{icon:"user-o",to:"/homePersonal"}},[t._v("我的")])],1),n("div",{staticClass:"empty"})],1)},s=[],o=(n("cadf"),n("551c"),n("097d"),{data:function(){return{footerlist:[],active:0}},mounted:function(){},methods:{}}),a=o,c=(n("070a"),n("2877")),r=Object(c["a"])(a,i,s,!1,null,"562b3e2b",null);r.options.__file="homeFooter.vue";e["a"]=r.exports},"6cc3":function(t,e,n){t.exports=n.p+"img/2607599.248717b1.jpg"},"6df0":function(t,e,n){"use strict";var i=n("3dab"),s=n.n(i);s.a},a21f:function(t,e,n){var i=n("584a"),s=i.JSON||(i.JSON={stringify:JSON.stringify});t.exports=function(t){return s.stringify.apply(s,arguments)}},b263:function(t,e,n){t.exports=n.p+"img/logo.af96feb7.png"},b29b:function(t,e,n){t.exports=n.p+"img/2852659.f8676099.jpg"},b963:function(t,e,n){t.exports=n.p+"img/2607601.76b18c9f.jpg"},bab2:function(t,e,n){},bb51:function(t,e,n){"use strict";n.r(e);var i=function(){var t=this,e=t.$createElement,i=t._self._c||e;return i("div",[i("div",{staticClass:"nav"},[i("img",{attrs:{src:n("b263"),alt:"科研logo"}}),t.personnel?t._e():i("span",{on:{click:t.toLogin}},[t._v("登 录")])]),i("van-pull-refresh",{on:{refresh:t.onRefresh},model:{value:t.isLoading,callback:function(e){t.isLoading=e},expression:"isLoading"}},[i("div",{staticClass:"section"},[i("swipe"),i("div",{staticClass:"listBox"},[i("iocnList",{on:{getKYNews:t.getKYNews,getPersonnel:t.getPersonnel}})],1),i("div",{staticClass:"A_News_box"},[i("div",{staticClass:"newsTitle"},[i("h3",[t._v("新闻")]),i("span",{on:{click:t.ZKMore}},[t._v("\n            更多\n            "),i("i",{staticClass:"icon iconfont icon-you"})])]),t._l(t.list,function(e,n){return i("ul",{key:n,staticClass:"A_News",on:{click:function(n){t.ZKNewsDetails(e)}}},[i("li",[i("p",[t._v(t._s(e.标题))])]),i("li",[i("i",{staticClass:"icon iconfont icon-tongzhi"}),t._v("\n            "+t._s(t.startTime(e.建立时间))+"\n          ")])])})],2),i("div",{directives:[{name:"show",rawName:"v-show",value:t.isShow,expression:"isShow"}],staticClass:"A_News_box"},[i("div",{staticClass:"newsTitle"},[i("h3",[t._v("科研新闻")]),i("span",{on:{click:t.KYmore}},[t._v("\n            更多\n            "),i("i",{staticClass:"icon iconfont icon-you"})])]),t._l(t.KYList,function(e,n){return i("ul",{key:n,staticClass:"A_News",on:{click:function(n){t.KYNewsDetails(e.编号)}}},[i("li",[i("p",[t._v(t._s(e.通知名称))])]),i("li",[i("i",{staticClass:"icon iconfont icon-tongzhi"}),i("span",[t._v(t._s(e.通知类型))]),t._v("\n            "+t._s(t.startTime(e.建立时间))+"\n          ")])])})],2)],1)]),i("HomeFooter")],1)},s=[],o=function(){var t=this,e=t.$createElement,i=t._self._c||e;return i("div",{staticClass:"swipe"},[i("van-swipe",{attrs:{autoplay:3e3,"indicator-color":"white"}},[i("van-swipe-item",[i("img",{attrs:{src:n("21a7"),alt:""}})]),i("van-swipe-item",[i("img",{attrs:{src:n("6cc3"),alt:""}})]),i("van-swipe-item",[i("img",{attrs:{src:n("b963"),alt:""}})]),i("van-swipe-item",[i("img",{attrs:{src:n("b29b"),alt:""}})])],1)],1)},a=[],c=(n("cadf"),n("551c"),n("097d"),{data:function(){return{}},mounted:function(){},methods:{}}),r=c,l=(n("35ce"),n("2877")),u=Object(l["a"])(r,o,a,!1,null,"0469cad4",null);u.options.__file="swipe.vue";var p=u.exports,f=function(){var t=this,e=t.$createElement,n=t._self._c||e;return n("div",[n("ul",t._l(t.iocnList,function(e,i){return n("li",{key:i},[e.手机链接地址!=t.upToDateUrl?n("a",{on:{click:function(n){t.path(e)}}},[n("img",{attrs:{src:e.Logo,alt:e.名称}}),n("p",[t._v(t._s(e.名称))])]):n("a",{attrs:{href:t.upToDateUrl}},[n("img",{attrs:{src:e.Logo,alt:e.名称}}),n("p",[t._v(t._s(e.名称))])])])}),0)])},h=[],d=n("f499"),v=n.n(d),m=(n("3b2b"),n("a481"),{data:function(){return{iocnList:[],upToDateUrl:"https://www.uptodate.com/contents/search"}},created:function(){},mounted:function(){this.getServiceName()},methods:{getUrlKey:function(t){return decodeURIComponent((new RegExp("[?|&]"+t+"=([^&;]+?)(&|#|;|$)").exec(location.href)||[,""])[1].replace(/\+/g,"%20"))||null},getCodeApi:function(t){var e=encodeURIComponent(window.location.href),n="snsapi_base",i="wx5e45aca8fcb270f1",s="https://open.weixin.qq.com/connect/oauth2/authorize?appid=".concat(i,"&redirect_uri=").concat(e,"&response_type=code&scope=").concat(n,"&state=").concat(t,"&connect_redirect=1#wechat_redirect");window.location.replace(s)},getServiceName:function(){var t=this,e=localStorage.getItem("personnel");if(null!==e){e=JSON.parse(localStorage.getItem("personnel"));var n={"医院名称":e.DbKey};return this.$http.getServiceList(n).then(function(e){console.log(e,"222"),t.iocnList=e.data}),this.$emit("getPersonnel"),void this.$emit("getKYNews")}var i=this.getUrlKey("code");i?this.$http.LoginWithOpenId(i).then(function(e){if(console.log(e,"111"),void 0===e){i={"医院名称":""};t.$http.getServiceList(i).then(function(e){t.iocnList=e.data})}else{localStorage.personnel=v()(e.data.人员),localStorage.token="".concat(e.data.token_type," ").concat(e.data.access_token),t.$emit("getPersonnel");var n=e.data.人员.DbKey,i={"医院名称":n};t.$http.getServiceList(i).then(function(e){t.iocnList=e.data,t.$emit("getKYNews")})}}):this.getCodeApi("123")},path:function(t){null===t.手机链接地址?this.$toast.fail({duration:1e3,message:"请先购买服务!"}):this.$router.push({path:t.手机链接地址,query:{accountId:t.编号}})}}}),g=m,w=(n("267e"),Object(l["a"])(g,f,h,!1,null,"72d1cc04",null));w.options.__file="iocnList.vue";var _=w.exports,b=n("6721"),N={name:"home",components:{swipe:p,iocnList:_,HomeFooter:b["a"]},data:function(){return{isLoading:!1,list:[],index:1,size:3,total:0,KYList:[],isShow:!1,personnel:null}},mounted:function(){this.getPrimaryNews()},methods:{toLogin:function(){null===this.personnel&&(console.log(this.personnel,"sssssssssddddd"),this.$router.push("/guidance"))},getPersonnel:function(){this.personnel=JSON.parse(localStorage.getItem("personnel")),console.log(this.personnel,">>>>>")},getPrimaryNews:function(){var t=this,e={index:this.index,size:this.size};this.$http.getNewsList(e).then(function(e){console.log(e,"res````111111"),t.list=e.data.list,t.total=e.data.total})},getKYNews:function(){var t=this,e=JSON.parse(localStorage.getItem("personnel")),n={"人员编号":e.编号,index:this.index,size:this.size};this.$http.getToViewNewsList(n).then(function(e){t.KYList=e.data.list,t.isShow=!0})},ZKNewsDetails:function(t){this.$router.push({path:"/ZKNewsDetails",name:"ZKNewsDetails",params:{item:t}})},ZKMore:function(){this.$router.push("/ZKMoreList")},KYNewsDetails:function(t){this.$router.push({path:"/KYNewsDetails",name:"KYNewsDetails",params:{item:t}})},KYmore:function(){this.$router.push("/KYMoreList")},onRefresh:function(){var t=this;setTimeout(function(){t.getPrimaryNews(),t.$toast("刷新成功"),t.isLoading=!1},500)},startTime:function(t){if(null!=t)return t.slice(0,10)}}},L=N,x=(n("6df0"),Object(l["a"])(L,i,s,!1,null,"68e8d88d",null));x.options.__file="Home.vue";e["default"]=x.exports},f499:function(t,e,n){t.exports=n("a21f")}}]);