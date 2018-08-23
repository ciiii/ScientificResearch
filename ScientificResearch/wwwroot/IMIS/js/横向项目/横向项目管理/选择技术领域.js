$(function () {
    window.choiceVm = null;
    avalon.ready(function () {
        window.choiceVm = avalon.define({
            $id: 'choiceRoot',
            one: dAddVm.model.技术领域,
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
                TechnicalField.getTechnicalFieldList('get', data, function getTechnicalFieldListListener(success, obj, strErro) {
                    if (success) {
                        choiceVm.two = obj;
                        choiceVm.three = [];
                        choiceVm.four = [];
                    } else {
                        console.info('获取技术领域二层列表失败！');
                        console.info(strErro);
                    }
                });
                choiceVm.currentIndexA = index;
            },
            changeB: function (id,index) {
                var data = {
                    上级编号: id
                }
                TechnicalField.getTechnicalFieldList('get', data, function getTechnicalFieldListListener(success, obj, strErro) {
                    if (success) {
                        choiceVm.three = obj;
                    } else {
                        console.info('获取国技术领域三层列表失败！');
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
                dAddVm.info.基本资料.技术领域 = choiceVm.name;
                $('.modal-choice').modal('hide');
            }
        })
        $('.modal-choice .modal-body,.modal-choice .item').mCustomScrollbar({
            theme: 'dark-3',
        });
        avalon.scan(document.body);
    });
});