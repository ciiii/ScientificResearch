(window["webpackJsonp"]=window["webpackJsonp"]||[]).push([["chunk-b068ba5e"],{"0ce5":function(e,c,n){"use strict";n.r(c);var t=function(){var e=this,c=e.$createElement,n=e._self._c||c;return n("div")},o=[],a=(n("7c56"),n("34a3"),n("7bc1"),{data:function(){return{}},created:function(){},mounted:function(){var e=String(window.location.href),c=e.split("?")[0];this.getCodeApi("".concat(c),"123")},methods:{getUrlKey:function(e){return decodeURIComponent((new RegExp("[?|&]"+e+"=([^&;]+?)(&|#|;|$)").exec(location.href)||[,""])[1].replace(/\+/g,"%20"))||null},getCodeApi:function(e,c){var n=encodeURIComponent(e),t="snsapi_base",o="wxa3160d6430e6eadb";o="wxfcbe1c0c36e2f97c";var a="https://open.weixin.qq.com/connect/oauth2/authorize?appid=".concat(o,"&redirect_uri=").concat(n,"&response_type=code&scope=").concat(t,"&state=").concat(c,"&connect_redirect=1#wechat_redirect");console.log(a),window.location.href=a}}}),i=a,r=(n("7271"),n("6691")),u=Object(r["a"])(i,t,o,!1,null,"624c2d7b",null);c["default"]=u.exports},7271:function(e,c,n){"use strict";var t=n("c44c"),o=n.n(t);o.a},c44c:function(e,c,n){}}]);