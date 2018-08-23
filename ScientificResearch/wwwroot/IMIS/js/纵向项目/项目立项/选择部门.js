$(function () {
    window.choiceVm = null;
    var departmentTree = null;
    var node;
    avalon.ready(function () {
        window.choiceVm = avalon.define({
            $id: 'choiceRoot',
            total: '',
            arr: [],
            name: '',
            loaded: false,
            departmentName: '',
            query: function () {
                var setting = {
                    data: {
                        key: {
                            name: '名称'
                        },
                        simpleData: {
                            enable: true,
                            idKey: 'id',
                            pIdKey: 'pId',
                            rootPId: 0
                        },
                    },
                    check: {
                        enable: true,
                    },
                    callback: {
                        onClick: onClick
                    }
                };
                var nodes = [];
                Department.getEnableDepartmentList('get', choiceVm.name, function getEnableDepartmentListListener(success, obj, strErro) {
                    if (success) {
                        nodes = obj;
                        if (nodes != null) {
                            for (var i = 0, l = nodes.length; i < l; i++) {
                                nodes[i].id = nodes[i].编号;
                                nodes[i].pId = nodes[i].上级部门编号;
                                nodes[i].name = nodes[i].名称.replace(/\.n/g, '.');
                            }
                            departmentTree = $.fn.zTree.init($('.departmentTree'), setting, nodes);
                        }
                    } else {
                        console.in('获取部门数据失败！' + strErro)
                    }
                });

                function onClick(e, treeId, treeNode) {
                    departmentTree.checkNode(treeNode, !treeNode.checked, true);
                }
            },
            search: function () {
                if(choiceVm.name==''){
                    departmentTree.checkAllNodes(false);
                }else{
                    departmentTree.checkAllNodes(false);
                    var nodes = departmentTree.getNodesByParamFuzzy('name', choiceVm.name, null);
                    departmentTree.selectNode(nodes[0]);
                    for (var i = 0; i < nodes.length; i++) {
                        departmentTree.checkNode(nodes[i], !nodes[i].checked, true);
                    }
                }
            },
            submit: function () {
                if (event.keyCode == 13) {
                    choiceVm.search();
                }
            },
            batchChoice: function () {
                node = departmentTree.getCheckedNodes(true);
                var arr = [];
                for (var i in node) {
                    arr.push(node[i].名称);
                }
                dAddVm.info.基本资料.成果归属部门 = arr.join();
                dAddVm.info.基本资料.项目归属部门 = arr.join();
                debugger;
                $('.modal-choice').modal('hide');
            }
        })
        $('.modal-choice .modal-body').mCustomScrollbar({
            theme: 'dark-3',
        });
        choiceVm.query();
        avalon.scan(document.body);
    });
});