(window["webpackJsonp"]=window["webpackJsonp"]||[]).push([["chunk-5c74ab28"],{"6ce6":function(t,n,e){"use strict";function o(t,n){var e;n=n||200;return function(){var o=this,i=arguments;e&&clearTimeout(e),e=setTimeout(function(){e=null,t.apply(o,i)},n)}}e.d(n,"a",function(){return o})},"9d64":function(t,n,e){t.exports=e.p+"img/logo.f2242cca.png"},a21f:function(t,n,e){var o=e("584a"),i=o.JSON||(o.JSON={stringify:JSON.stringify});t.exports=function(t){return i.stringify.apply(i,arguments)}},bf8f:function(t,n,e){},dd7b:function(t,n,e){"use strict";e.r(n);var o=function(){var t=this,n=t.$createElement,o=t._self._c||n;return o("section",{staticClass:"box"},[o("img",{staticClass:"img",attrs:{src:e("9d64"),alt:"logo图片"}}),o("form",{attrs:{action:"/",onsubmit:"return false"}},[o("div",{staticClass:"input"},[o("input",{directives:[{name:"model",rawName:"v-model",value:t.DbKey,expression:"DbKey"}],attrs:{type:"text",placeholder:"医院",readonly:""},domProps:{value:t.DbKey},on:{click:t.hospital,input:function(n){n.target.composing||(t.DbKey=n.target.value)}}}),o("input",{directives:[{name:"model",rawName:"v-model",value:t.工号,expression:"工号"}],attrs:{type:"text",placeholder:"工号",maxlength:t.max,minlength:t.min,prop:"工号"},domProps:{value:t.工号},on:{input:function(n){n.target.composing||(t.工号=n.target.value)}}}),o("input",{directives:[{name:"model",rawName:"v-model",value:t.密码,expression:"密码"}],attrs:{type:"password",placeholder:"密码",maxlength:t.max,minlength:t.min,prop:"密码"},domProps:{value:t.密码},on:{input:function(n){n.target.composing||(t.密码=n.target.value)}}})]),o("div",{staticClass:"btn",on:{click:t.bind}},[o("span",[t._v("登 录")])])]),o("van-popup",{attrs:{position:"bottom",overlay:"","close-on-click-overlay":""},model:{value:t.show,callback:function(n){t.show=n},expression:"show"}},[o("van-picker",{attrs:{"show-toolbar":"",title:"医院列表",columns:t.columns},on:{cancel:t.onCancel,confirm:t.onConfirm}})],1)],1)},i=[],a=e("f499"),s=e.n(a),l=(e("3b2b"),e("a481"),e("6ce6")),c={name:"login",data:function(){return{max:20,min:3,"工号":null,"密码":null,DbKey:null,columns:[],show:!1}},mounted:function(){var t=this;this.$http.getHospitalList().then(function(n){t.columns=n.data}).catch(function(t){console.log(t)})},methods:{getUrlKey:function(t){return decodeURIComponent((new RegExp("[?|&]"+t+"=([^&;]+?)(&|#|;|$)").exec(location.href)||[,""])[1].replace(/\+/g,"%20"))||null},bind:Object(l["a"])(function(){var t=this;if(null!=this.工号&&null!=this.密码)if(this.工号.length<4)this.$notify("工号长度不能少于【4】位");else if(null!=this.密码)if(this.密码.length<3)this.$notify("密码长度不能少于【3】位");else{var n=this.getUrlKey("code");n?this.$http.BindOpenId(n,this.工号,this.密码,this.DbKey).then(function(n){n.data?(localStorage.personnel=s()(n.data.人员),localStorage.token="".concat(n.data.token_type," ").concat(n.data.access_token),localStorage.flag=!1,console.log(localStorage.token,"localStorage.token``````````"),t.$router.push("/")):t.$notify(n.error)}):this.$notify("登录失败，请绑定！")}else this.$notify("密码长度不能少于【3】位");else this.$notify("工号 密码 不能为空！")},500),hospital:function(){this.show=!0},onConfirm:function(t,n){this.DbKey=t,this.show=!1},onCancel:function(){this.show=!1}}},r=c,u=(e("fc95"),e("2877")),p=Object(u["a"])(r,o,i,!1,null,"42868460",null);p.options.__file="login.vue";n["default"]=p.exports},f499:function(t,n,e){t.exports=e("a21f")},fc95:function(t,n,e){"use strict";var o=e("bf8f"),i=e.n(o);i.a}}]);