(window["webpackJsonp"]=window["webpackJsonp"]||[]).push([["chunk-54a97ed3"],{2219:function(s,t,i){},"70d1":function(s,t,i){"use strict";var a=i("2219"),n=i.n(a);n.a},8169:function(s,t,i){"use strict";i.d(t,"b",function(){return a}),i.d(t,"a",function(){return n});i("28a5"),i("6b54"),i("a481"),i("c5f6");function a(s){if(!s)return"￥0.00";var t=0|Number(s),i=t.toString().replace(/(\d)(?=(?:\d{3})+$)/g,"$1,"),a=".00";s=String(s);var n=s.split(".");return 2==n.length?(a=n[1].toString(),1==a.length?"￥"+i+"."+a+"0 元":"￥"+i+"."+a+" 元"):"￥"+i+a+" 元"}function n(s){if(null!=s){var t=String(s);return t.split("\\")[1]}}},bff9:function(s,t,i){"use strict";i.r(t);var a=function(){var s=this,t=s.$createElement,i=s._self._c||t;return i("section",[i("van-tabs",{staticClass:"popup",attrs:{swipeable:""},model:{value:s.active,callback:function(t){s.active=t},expression:"active"}},[i("van-tab",{attrs:{title:"基本信息"}},[i("ul",{staticClass:"servicel"},[i("h4",[s._v("合同基本信息")]),i("li",[i("span",[s._v("合同名称")]),i("span",[i("p",[s._v(s._s(this.detailslList.合同名称))])])]),i("li",[i("span",[s._v("合同编号")]),i("span",[s._v(s._s(this.detailslList.合同编号))])]),i("li",[i("span",[s._v("项目分类")]),i("span",[s._v(s._s(this.detailslList.项目分类))])]),i("li",[i("span",[s._v("项目类型")]),i("span",[s._v(s._s(this.detailslList.项目类型))])]),i("li",[i("span",[s._v("建立时间")]),i("span",[s._v(s._s(s.startTime(this.detailslList.建立时间)))])]),i("li",[i("span",[s._v("是否为第一承建单位")]),i("span",[s._v(s._s(s.conversionState(this.detailslList.是否为第一承建单位)))])]),i("li",[i("span",[s._v("项目负责人")]),i("span",[s._v(s._s(this.detailslList.项目负责人姓名))])]),i("li",[i("span",[s._v("项目归属部门")]),i("span",[s._v(s._s(this.detailslList.项目归属部门))])]),i("li",[i("span",[s._v("单位名称")]),i("span",[s._v(s._s(this.detailslList.单位名称))])]),i("li",[i("span",[s._v("邮政编码")]),i("span",[s._v(s._s(this.detailslList.邮政编码))])]),i("li",[i("span",[s._v("法定代表人")]),i("span",[s._v(s._s(this.detailslList.法定代表人))])]),i("li",[i("span",[s._v("经费本编号")]),i("span",[s._v(s._s(this.detailslList.经费本编号))])]),i("li",[i("span",[s._v("联系人")]),i("span",[s._v(s._s(this.detailslList.联系人))])]),i("li",[i("span",[s._v("联系人电话")]),i("span",[s._v(s._s(this.detailslList.联系人电话))])]),i("li",[i("span",[s._v("通讯地址")]),i("span",[s._v(s._s(this.detailslList.通讯地址))])]),i("li",[i("span",[s._v("档案编号")]),i("span",[s._v(s._s(this.detailslList.档案编号))])]),i("li",[i("span",[s._v("财务简称")]),i("span",[s._v(s._s(this.detailslList.财务简称))])]),i("li",[i("span",[s._v("课题来源")]),i("span",[s._v(s._s(this.detailslList.课题来源))])]),i("h4",[s._v("合同文件")]),i("li",[s._v("合同文件：")]),i("li",[i("a",{attrs:{href:this.detailslList.合同文件路径}},[s._v(s._s(s.Interception(this.detailslList.合同文件路径)))])])])]),i("van-tab",{attrs:{title:"合作方信息"}},[i("ul",{staticClass:"servicel"},[i("h4",[s._v("合作方信息")]),i("li",[i("span",[s._v("类型")]),i("span",[s._v(s._s(this.detailslList.合作方关系))])]),i("li",[i("span",[s._v("类型")]),i("span",[s._v(s._s(this.detailslList.合作方契约关系))])]),i("li",[i("span",[s._v("名称")]),i("span",[s._v(s._s(this.detailslList.合作方单位名称))])]),i("li",[i("span",[s._v("法定代表人")]),i("span",[s._v(s._s(this.detailslList.合作方法定代表人))])]),i("li",[i("span",[s._v("项目类型")]),i("span",[s._v(s._s(this.detailslList.项目类型))])]),i("li",[i("span",[s._v("单位联系人")]),i("span",[s._v(s._s(this.detailslList.合作方单位联系人))])]),i("li",[i("span",[s._v("联系电话")]),i("span",[s._v(s._s(this.detailslList.合作方联系电话))])]),i("li",[i("span",[s._v("邮箱")]),i("span",[s._v(s._s(this.detailslList.合作方邮箱))])]),i("li",[i("span",[s._v("邮政编码")]),i("span",[s._v(s._s(this.detailslList.合作方邮政编码))])]),i("li",[i("span",[s._v("合作方所在行政区域")]),i("span",[s._v(s._s(this.detailslList.合作方所在省)+" "+s._s(this.detailslList.合作方所在市)+" "+s._s(this.detailslList.合作方所在地区))])]),i("li",[i("span",[s._v("法人代码")]),i("span",[s._v(s._s(this.detailslList.合作方法人或组织机构代码))])])])]),i("van-tab",{attrs:{title:"合同信息"}},[i("ul",{staticClass:"servicel"},[i("h4",[s._v("合同详情信息")]),i("li",[i("span",[s._v("合同金额")]),i("span",[s._v(s._s(s.NumFormat(this.detailslList.合同金额)))])]),i("li",[i("span",[s._v("签订时间")]),i("span",[s._v(s._s(s.startTime(this.detailslList.签订时间)))])]),i("li",[i("span",[s._v("付款方式")]),i("span",[s._v(s._s(this.detailslList.付款方式))])]),i("li",[i("span",[s._v("合作方式")]),i("span",[s._v(s._s(this.detailslList.合作方式))])]),i("li",[i("span",[s._v("合同开始时间")]),i("span",[s._v(s._s(s.startTime(this.detailslList.合同开始时间)))])]),i("li",[i("span",[s._v("合同结束时间")]),i("span",[s._v(s._s(s.startTime(this.detailslList.合同结束时间)))])]),i("li",[i("span",[s._v("研究类型")]),i("span",[s._v(s._s(this.detailslList.研究类型))])]),i("li",[i("span",[s._v("技术领域")]),i("span",[s._v(s._s(this.detailslList.技术领域))])]),i("li",[i("span",[s._v("合同类型")]),i("span",[s._v(s._s(this.detailslList.合同类型))])]),i("li",[i("span",[s._v("技术合同类型")]),i("span",[s._v(s._s(this.detailslList.技术合同类型))])]),i("li",[i("span",[s._v("是否申请技术合同认定")]),i("span",[s._v(s._s(s.conversionState(this.detailslList.是否申请技术合同认定)))])]),i("li",[i("span",[s._v("备注")]),i("span",[s._v(s._s(this.detailslList.备注))])]),i("h4",[s._v("技术合同认定登记信息")]),i("li",[i("span",[s._v("合同技术交易额")]),i("span",[s._v(s._s(s.NumFormat(this.detailslList.合同技术交易额)))])]),i("li",[i("span",[s._v("知识产权")]),i("span",[s._v(s._s(this.detailslList.知识产权))])]),i("li",[i("span",[s._v("计划来源")]),i("span",[s._v(s._s(this.detailslList.计划来源))])]),i("li",[i("span",[s._v("合作方所属国民经济行业")]),i("span",[s._v(s._s(this.detailslList.合作方所属国民经济行业))])]),i("li",[i("span",[s._v("技术服务的国民经济行业")]),i("span",[s._v(s._s(this.detailslList.技术服务的国民经济行业))])]),i("li",[i("span",[s._v("合同的社会经济目标")]),i("span",[s._v(s._s(this.detailslList.合同的社会经济目标))])]),i("li",[i("span",[s._v("合作方性质")]),i("span",[s._v(s._s(this.detailslList.合作方性质))])]),i("li",[i("span",[s._v("是否高新性质")]),i("span",[s._v(s._s(s.conversionState(this.detailslList.是否高新性质)))])]),i("h4",[s._v("合同认定登记承诺书")]),i("li",[s._v("登记承诺书：")]),i("li",[i("a",{attrs:{href:this.detailslList.合同认定登记承诺书路径,download:""}},[s._v(s._s(s.Interception(this.detailslList.合同认定登记承诺书路径)))])])])]),i("van-tab",{attrs:{title:"财务信息"}},[i("h3",[s._v("项目预算")]),i("div",{staticClass:"total"},[i("span",[s._v("经费预算合计：")]),i("span",[s._v(s._s(s.NumFormat(this.total)))])]),s._l(s.authorInformation,function(t,a){return i("ul",{key:a,staticClass:"servicel"},[i("li",[i("span",[s._v("项目支出类型")]),i("span",[s._v(s._s(t.项目支出类型))])]),i("li",[i("span",[s._v("预算科目")]),i("span",[s._v(s._s(t.财务科目))])]),i("li",[i("span",[s._v("预算金额（元）")]),i("span",[s._v(s._s(s.NumFormat(t.批准经费)))])]),i("li",[i("span",[s._v("编制依据")]),i("span",[s._v(s._s(t.编制依据))])])])})],2),i("van-tab",{attrs:{title:"参与人信息"}},s._l(s.relatedProjects,function(t,a){return i("ul",{key:a,staticClass:"servicel"},[i("h4",[s._v("参与人信息")]),i("li",[i("span",[s._v("参与人姓名")]),i("span",[s._v(s._s(t.姓名))])]),i("li",[i("span",[s._v("部门名称")]),i("span",[s._v(s._s(t.部门名称))])]),i("li",[i("span",[s._v("工作量占比(%)")]),i("span",[s._v(s._s(t.工作量占比))])]),i("li",[i("span",[s._v("建立时间")]),i("span",[s._v(s._s(s.startTime(t.建立时间)))])]),i("li",[i("span",[s._v("备注")]),i("span",[s._v(s._s(t.备注))])])])}),0),i("van-tab",{attrs:{title:"审核记录"}},[i("h3",[s._v("审核记录")]),s._l(s.auditRecords,function(t,a){return i("ul",{key:a,staticClass:"audit"},[i("li",[i("span",[s._v("步骤名称")]),i("span",[s._v(s._s(t.名称))])]),i("li",[i("span",[s._v("处理人")]),i("span",[s._v(s._s(t.姓名))])]),i("li",[i("span",[s._v("部门名称")]),i("span",[s._v(s._s(t.部门名称))])]),i("li",{staticClass:"state"},[i("span",[s._v("状态")]),i("span",{style:{color:t.状态说明==s.flag?"#31BD5D":"#FF976A"}},[s._v(s._s(t.状态说明))])]),i("li",[i("span",[s._v("执行时间")]),i("span",[i("span",[i("i",{directives:[{name:"show",rawName:"v-show",value:s.condition,expression:"condition"}],staticClass:"icon iconfont icon-shijian1"}),s._v("\n              "+s._s(s.startTime(t.执行时间))+"\n            ")])])]),i("li",[i("span",[s._v("备注")]),i("span",[s._v(s._s(t.备注))])])])})],2),i("ReturnTop"),i("ReturnBtn")],1)],1)},n=[],l=(i("ac6a"),i("8169")),_={data:function(){return{active:0,detailslList:[],relatedProjects:[],authorInformation:[],auditRecords:[],flag:"审核通过",total:null,condition:!0,state:"待审核"}},mounted:function(){this.goDetails()},methods:{goDetails:function(){var s=this,t={"横向项目编号":this.$route.params.item};this.$http.getXDetails(t).then(function(t){s.detailslList=t.data.基本信息,s.authorInformation=t.data.财务信息,s.relatedProjects=t.data.参与人信息,s.auditRecords=t.data.审核记录,s.authorInformation.forEach(function(t,i){s.total+=t.批准经费})})},startTime:function(s){return null!=s?s.slice(0,10):"待定"},NumFormat:function(s){return Object(l["b"])(s)},Interception:function(s){return Object(l["a"])(s)},conversionState:function(s){return 1==s?"是":0==s?"否":" "}}},e=_,v=(i("70d1"),i("2877")),p=Object(v["a"])(e,a,n,!1,null,"bb8dae6e",null);t["default"]=p.exports}}]);