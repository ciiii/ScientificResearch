$(function () {
    window.choiceVm = null;
    avalon.ready(function () {
        window.choiceVm = avalon.define({
            $id: 'choiceRoot',
            req: {
                Index: 1,
                Size: 10,
                Like项目中文名称: '',
                Like负责人姓名: '',
                分类名称: '',
                OrderType: false
            },
            title: '',
            name: '',
            number: '',
            total: '',
            model: [],
            arr: [],
            allchecked: false,
            LikeValue: '',
            loaded: false,
            query: function () {
                choiceVm.loaded = false;
                $.support.cors = true;
                ProjectEstablish.getYProjectEstablishList('get', choiceVm.req.$model, function getYProjectEstablishListListener(success, obj, strErro) {
                    if (success) {
                        choiceVm.loaded = true;
                        choiceVm.total = obj.total;
                        if (obj == null || obj.list.length == 0) {
                            $('.modal-choice .pager').hide();
                            choiceVm.model = [];
                            return;
                        } else {
                            obj = obj.list;
                            for (var i = 0; i < obj.length; i++) {
                                obj[i].checked = false;
                            }
                            choiceVm.model = obj;
                            $('.modal-choice .pager').show();
                        }
                        $('.modal-choice .pager').mamPager({
                            pageSize: choiceVm.req.Size,                           //页大小
                            pageIndex: choiceVm.req.Index,                     //当前页
                            recordTotal: choiceVm.total,                      //数据总数
                            type: 1,
                            prevText: "&laquo;",                       //上一页显示内容
                            nextText: "&raquo;",
                            noData: "暂无数据",
                            pageChange: function (index) {
                                choiceVm.req.Index = index;
                                choiceVm.loaded = false;
                                choiceVm.query();
                            }
                        });
                        $('.modal-add .bs-tooltip').tooltip();
                    } else {
                        console.info('获取横向项目列表列表失败！');
                        console.info(strErro);
                    }
                });
            },
            getProjectType: function () {
                ProjectType.getProjectType('get', 0, function getProjectTypeListListener(success, obj, strErro) {
                    if (success) {
                        choiceVm.ProjectType = obj;
                    } else {
                        console.info('获取项目分类失败！');
                        console.info(strErro);
                    }
                })
            },
            search: function () {
                choiceVm.req.Index = 1;
                choiceVm.req.Like项目中文名称 = choiceVm.title;
                choiceVm.req.Like负责人姓名 = choiceVm.name;
                choiceVm.query();
            },
            changeType: function () {
                choiceVm.req.分类名称 = $('.choiceRoot .projectType').val();
                choiceVm.search();
            },
            submit: function () {
                if (event.keyCode == 13) {
                    choiceVm.search();
                }
            },
            checkAll: function (e) {
                var checked = e.target.checked

                choiceVm.model.forEach(function (el) {
                    el.checked = checked
                })
            },
            checkOne: function (e) {
                var checked = e.target.checked
                if (checked === false) {
                    choiceVm.allchecked = false
                } else {
                    choiceVm.allchecked = choiceVm.model.every(function (el) {
                        return el.checked
                    });
                }
            },
            batchChoice: function () {
                choiceVm.arr = [];
                for (var i = 0; i < choiceVm.model.length; i++) {
                    if (choiceVm.model[i].checked) {
                        var data = {
                            项目名称: choiceVm.model[i].项目中文名称,
                            项目编号: choiceVm.model[i].项目编号,
                            项目类型名称: '纵向项目',
                        }
                        dAddVm.projectList.push(data);
                        choiceVm.arr.push(data);
                    }
                }
                choiceVm.isRepeat(dAddVm.projectList);
                if (choiceVm.arr.length > 0) {
                    $('.modal-choice').modal('hide');
                } else {
                    $.oaNotify.error('请先勾选！');
                }
                console.info(dAddVm.projectList);
            },
            isRepeat: function (newArr) {
                for (var i = newArr.length - 1; i >= 0; i--) {
                    var targetNode = newArr[i];
                    for (var j = 0; j < i; j++) {
                        if (targetNode.项目编号 == newArr[j].项目编号 && targetNode.项目类型名称 == newArr[j].项目类型名称) {
                            newArr.splice(i, 1);
                            break;
                        }
                    }
                }
            },
            isRepeatNumber: function (newArr) {
                for (var i = newArr.length - 1; i >= 0; i--) {
                    var targetNode = newArr[i];
                    for (var j = 0; j < i; j++) {
                        if (targetNode == newArr[j]) {
                            newArr.splice(i, 1);
                            break;
                        }
                    }
                }
            },
            clickChoice: function (el) {
                var data = {
                    项目名称: el.项目中文名称,
                    项目编号: el.项目编号,
                    项目类型名称: '纵向项目'
                }
                $('.modal-choice').modal('hide');

                dAddVm.projectList.push(data);
                choiceVm.isRepeat(dAddVm.projectList);
                console.info(dAddVm.projectList);
            }
        })
        $('.modal-choice .modal-body').mCustomScrollbar({
            theme: 'dark-3',
        });
        choiceVm.query();
        choiceVm.getProjectType();
        avalon.scan(document.body);
    });
});