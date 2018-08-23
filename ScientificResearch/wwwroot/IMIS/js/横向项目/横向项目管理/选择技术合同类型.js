$(function () {
    window.choiceVm = null;
    avalon.ready(function () {
        window.choiceVm = avalon.define({
            $id: 'choiceRoot',
            one: dAddVm.model.合同类型,
            two: [],
            name: '',
            currentIndexA: '',
            currentIndexB: '',
            changeA: function (id,index) {
                Dictionary.getDictionaryChild('get', id, function getDictionaryChildListener(success, obj, strErro) {
                    if (success) {
                        choiceVm.two = obj;
                    } else {
                        console.info('获取技术合同类型二层列表失败！');
                        console.info(strErro);
                    }
                });
                choiceVm.currentIndexA = index;
            },
            changeB:function (index) {
                choiceVm.currentIndexB = index;
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
            clickChoice: function (index, el) {
                choiceVm.name = el.值;
            },
            confirm: function () {
                dAddVm.info.基本资料.技术合同类型 = choiceVm.name;
                $('.modal-choice').modal('hide');
            }
        })
        $('.modal-choice .modal-body,.modal-choice .item').mCustomScrollbar({
            theme: 'dark-3',
        });
        avalon.scan(document.body);
    });
});