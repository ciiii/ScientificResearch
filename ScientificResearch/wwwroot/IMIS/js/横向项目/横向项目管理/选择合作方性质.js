$(function () {
    window.choiceVm = null;
    avalon.ready(function () {
        window.choiceVm = avalon.define({
            $id: 'choiceRoot',
            one: dAddVm.model.合同买方性质,
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
                ContractBuyer.getContractBuyerList('get', data, function getContractBuyerListListener(success, obj, strErro) {
                    if (success) {
                        choiceVm.two = obj;
                        choiceVm.three = [];
                        choiceVm.four = [];
                    } else {
                        console.info('获取合作方性质二层列表失败！');
                        console.info(strErro);
                    }
                });
                choiceVm.currentIndexA = index;
            },
            changeB: function (id,index) {
                var data = {
                    上级编号: id
                }
                ContractBuyer.getContractBuyerList('get', data, function getContractBuyerListListener(success, obj, strErro) {
                    if (success) {
                        choiceVm.three = obj;
                    } else {
                        console.info('获取合作方性质三层列表失败！');
                        console.info(strErro);
                    }
                });
                choiceVm.currentIndexB = index;
            },
            changeC:function (index) {
                choiceVm.currentIndexC = index;
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
            clickChoice: function (index, el) {
                choiceVm.name = el.名称;
            },
            confirm: function () {
                dAddVm.info.基本资料.合作方性质 = choiceVm.name;
                $('.modal-choice').modal('hide');
            }
        })
        $('.modal-choice .modal-body,.modal-choice .item').mCustomScrollbar({
            theme: 'dark-3',
        });
        avalon.scan(document.body);
    });
});