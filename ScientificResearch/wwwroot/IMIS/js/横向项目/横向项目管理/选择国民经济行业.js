$(function () {
    window.choiceVm = null;
    avalon.ready(function () {
        window.choiceVm = avalon.define({
            $id: 'choiceRoot',
            one: dAddVm.model.国民经济行业,
            two: [],
            three: [],
            four: [],
            name: '',
            currentIndexA: '',
            currentIndexB: '',
            currentIndexC: '',
            currentIndexD: '',
            changeA: function (id,index) {
                var data = {
                    上级编号: id
                }
                IndustryCode.getIndustryCodeList('get', data, function getIndustryCodeListListener(success, obj, strErro) {
                    if (success) {
                        choiceVm.two = obj;
                        choiceVm.three = [];
                        choiceVm.four = [];
                    } else {
                        console.info('获取国民代码二层列表失败！');
                        console.info(strErro);
                    }
                });
                choiceVm.currentIndexA = index;
            },
            changeB: function (id,index) {
                var data = {
                    上级编号: id
                }
                IndustryCode.getIndustryCodeList('get', data, function getIndustryCodeListListener(success, obj, strErro) {
                    if (success) {
                        choiceVm.three = obj;
                        choiceVm.four = [];
                    } else {
                        console.info('获取国民代码三层列表失败！');
                        console.info(strErro);
                    }
                });
                choiceVm.currentIndexB = index;
            },
            changeC: function (id,index) {
                var data = {
                    上级编号: id
                }
                IndustryCode.getIndustryCodeList('get', data, function getIndustryCodeListListener(success, obj, strErro) {
                    if (success) {
                        choiceVm.four = obj;
                    } else {
                        console.info('获取国民代码四层列表失败！');
                        console.info(strErro);
                    }
                });
                choiceVm.currentIndexC = index;
            },
            changeD:function (index) {
                choiceVm.currentIndexD = index;
            },
            getClassA:function (index) {
                if(choiceVm.currentIndexA === index){
                    return 'active';
                }
            },
            getClassB:function (index) {
                if(choiceVm.currentIndexB === index){
                    return 'active';
                }
            },
            getClassC:function (index) {
                if(choiceVm.currentIndexC === index){
                    return 'active';
                }
            },
            getClassD:function (index) {
                if(choiceVm.currentIndexD === index){
                    return 'active';
                }
            },
            clickChoice: function (index, el) {
                choiceVm.name = el.名称;
            },
            confirm: function () {
                dAddVm.info.基本资料.技术服务的国民经济行业 = choiceVm.name;
                $('.modal-choice').modal('hide');
            }
        })
        $('.modal-choice .modal-body,.modal-choice .item').mCustomScrollbar({
            theme: 'dark-3',
        });
        avalon.scan(document.body);
    });
});