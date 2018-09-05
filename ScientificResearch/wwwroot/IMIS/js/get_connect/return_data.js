//用户
var User = {
    userLogin: function (type, options, userLoginListener) {
        var url = Code.URL_POST_LOGIN;
        Connect_Http.httpDatas(type, url, options, function getBackListener(success, obj, strErro) {
            if (success) {
                userLoginListener(true, obj.data, '');

            } else {
                userLoginListener(false, '', strErro);

            }
        });
    },
    userChangePassword: function (type, options, userChangePasswordListener) {
        var url = Code.URL_POST_CHANGE_PASSWORD;
        Connect_Http.httpDatas(type, url, options, function getBackListener(success, obj, strErro) {
            if (success) {
                userChangePasswordListener(true, obj.data, '');

            } else {
                userChangePasswordListener(false, '', strErro);

            }
        });
    },
    getUsersList: function (type, options, getUsersListListener) {
        var url = Code.URL_GET_USERS_LIST;

        Connect_Http.httpDatas(type, url, options, function getBackListener(success, obj, strErro) {
            if (success) {
                getUsersListListener(true, obj.data, '')
            } else {
                getUsersListListener(false, '', strErro)
            }
        });
    },
    getPagingUsersList: function (type, options, getPagingUsersListListener) {
        var url = Code.URL_GET_PAGING_USERS_LIST;

        Connect_Http.httpDatas(type, url, options, function getBackListener(success, obj, strErro) {
            if (success) {
                getPagingUsersListListener(true, obj.data, '')
            } else {
                getPagingUsersListListener(false, '', strErro)
            }
        });
    },
    getEnableUsersList: function (type, options, getEnableUsersListListener) {
        var url = Code.URL_GET_PAGING_ENABLE_USERS_LIST;

        Connect_Http.httpDatas(type, url, options, function getBackListener(success, obj, strErro) {
            if (success) {
                getEnableUsersListListener(true, obj.data, '')
            } else {
                getEnableUsersListListener(false, '', strErro)
            }
        });
    },
    addOrEditUsers: function (type, options, addOrEditUsersListener) {
        var url = Code.URL_POST_ADD_OR_EDIT_USERS;

        Connect_Http.httpDatas(type, url, options, function getBackListener(success, obj, strErro) {
            if (success) {
                addOrEditUsersListener(true, obj, '')
            } else {
                addOrEditUsersListener(false, '', strErro)
            }
        });
    },
    enableUsers: function (type, id, enableDepartmentListener) {
        var url = Code.URL_POST_ENABLE_USERS;

        Connect_Http.httpDatas(type, url, id, function getBackListener(success, obj, strErro) {
            if (success) {
                enableDepartmentListener(true, obj, '')
            } else {
                enableDepartmentListener(false, '', strErro)
            }
        });
    },
    DisableUsers: function (type, id, DisableDepartmentListener) {
        var url = Code.URL_POST_DISABLE_USERS;

        Connect_Http.httpDatas(type, url, id, function getBackListener(success, obj, strErro) {
            if (success) {
                DisableDepartmentListener(true, obj, '')
            } else {
                DisableDepartmentListener(false, '', strErro)
            }
        });
    },
    getUsersDetails: function (type, id, getUsersDetailsListener) {
        var url = Code.URL_GET_USER_DETAILS;
        var postDat = {
            人员编号: id
        }

        Connect_Http.httpDatas(type, url, postDat, function getBackListener(success, obj, strErro) {
            if (success) {
                getUsersDetailsListener(true, obj.data, '')
            } else {
                getUsersDetailsListener(false, '', strErro)
            }
        });
    },
    getUsersDetailsAuxiliaryData: function (type, getUsersDetailsAuxiliaryDataListener) {
        var url = Code.URL_GET_USER_DETAILS_AUXILIARY_DATA;

        Connect_Http.httpDatas(type, url, '', function getBackListener(success, obj, strErro) {
            if (success) {
                getUsersDetailsAuxiliaryDataListener(true, obj.data, '')
            } else {
                getUsersDetailsAuxiliaryDataListener(false, '', strErro)
            }
        });
    },


}

//角色
var Role = {
    getRoleList: function (type, getRoleListListener) {
        var url = Code.URL_GET_ROLE_LIST;

        Connect_Http.httpDatas(type, url, '', function getBackListener(success, obj, strErro) {
            if (success) {
                getRoleListListener(true, obj.data, '')
            } else {
                getRoleListListener(false, '', strErro)
            }
        });
    },
    addRole: function (type, options, addRoleListener) {
        var url = Code.URL_POST_ADD_ROLE;

        Connect_Http.httpDatas(type, url, options, function getBackListener(success, obj, strErro) {
            if (success) {
                addRoleListener(true, obj, '')
            } else {
                addRoleListener(false, '', strErro)
            }
        });
    },
    editRole: function (type, options, editRoleListener) {
        var url = Code.URL_POST_ADD_ROLE;

        Connect_Http.httpDatas(type, url, options, function getBackListener(success, obj, strErro) {
            if (success) {
                editRoleListener(true, obj, '')
            } else {
                editRoleListener(false, '', strErro)
            }
        });
    },
    getRoleUsers: function (type, options, getRoleUsersListener) {
        var url = Code.URL_GET_ROLE_USERS;

        Connect_Http.httpDatas(type, url, options, function getBackListener(success, obj, strErro) {
            if (success) {
                getRoleUsersListener(true, obj.data, '')
            } else {
                getRoleUsersListener(false, '', strErro)
            }
        });
    },
    getRoleNotUsers: function (type, options, getRoleNotUsersListener) {
        var url = Code.URL_GET_ROLE_NOT_USERS;

        Connect_Http.httpDatas(type, url, options, function getBackListener(success, obj, strErro) {
            if (success) {
                getRoleNotUsersListener(true, obj.data, '')
            } else {
                getRoleNotUsersListener(false, '', strErro)
            }
        });
    },
    editRoleUsers: function (type, options, editRoleUsersListener) {
        var url = Code.URL_POST_EDIT_ROLE_USERS;

        Connect_Http.httpDatas(type, url, options, function getBackListener(success, obj, strErro) {
            if (success) {
                editRoleUsersListener(true, obj, '')
            } else {
                editRoleUsersListener(false, '', strErro)
            }
        });
    },
    addAndDelRoleUsers: function (type, options, addAndDelRoleUsersListener) {
        var url = Code.URL_POST_ADD_AND_DEL_ROLE_USERS;

        Connect_Http.httpDatas(type, url, options, function getBackListener(success, obj, strErro) {
            if (success) {
                addAndDelRoleUsersListener(true, obj, '')
            } else {
                addAndDelRoleUsersListener(false, '', strErro)
            }
        });
    },
    getRoleJurisdiction: function (type, number, getRoleJurisdictionListener) {
        var url = Code.URL_GET_ROLE_JURISDICTION;
        var postData = {
            角色编号: number
        }

        Connect_Http.httpDatas(type, url, postData, function getBackListener(success, obj, strErro) {
            if (success) {
                getRoleJurisdictionListener(true, obj.data, '')
            } else {
                getRoleJurisdictionListener(false, '', strErro)
            }
        });
    },
    editRoleJurisdiction: function (type, options, editRoleJurisdictionListener) {
        var url = Code.URL_POST_EDIT_ROLE_JURISDICTION;

        Connect_Http.httpDatas(type, url, options, function getBackListener(success, obj, strErro) {
            if (success) {
                editRoleJurisdictionListener(true, obj, '')
            } else {
                editRoleJurisdictionListener(false, '', strErro)
            }
        });
    },
}

//日志
var Log = {
    getLoginLog: function (type, options, getLoginLogListener) {
        var url = Code.URL_GET_LOGIN_LOG;
        Connect_Http.httpDatas(type, url, options, function getBackListener(success, obj, strErro) {
            if (success) {
                getLoginLogListener(true, obj.data, '');

            } else {
                getLoginLogListener(false, '', strErro);

            }
        });
    },
}

//部门
var Department = {
    getDepartmentList: function (type, name, getDepartmentListListener) {
        var url = Code.URL_GET_DEPARTMENT_LIST;
        var postData = {
            Like名称: name
        }

        Connect_Http.httpDatas(type, url, postData, function getBackListener(success, obj, strErro) {
            if (success) {
                getDepartmentListListener(true, obj.data, '')
            } else {
                getDepartmentListListener(false, '', strErro)
            }
        });
    },
    getEnableDepartmentList: function (type, name, getEnableDepartmentListListener) {
        var url = Code.URL_GET_ENABLE_DEPARTMENT_LIST;
        var postData = {
            Like名称: name
        }

        Connect_Http.httpDatas(type, url, postData, function getBackListener(success, obj, strErro) {
            if (success) {
                getEnableDepartmentListListener(true, obj.data, '')
            } else {
                getEnableDepartmentListListener(false, '', strErro)
            }
        });
    },
    addOrEditDepartment: function (type, options, addOrEditDepartmentListener) {
        var url = Code.URL_POST_ADD_OR_EDIT_DEPARTMENT;

        Connect_Http.httpDatas(type, url, options, function getBackListener(success, obj, strErro) {
            if (success) {
                addOrEditDepartmentListener(true, obj, '')
            } else {
                addOrEditDepartmentListener(false, '', strErro)
            }
        });
    },
    enableDepartment: function (type, id, enableDepartmentListener) {
        var url = Code.URL_POST_ENABLE_DEPARTMENT;

        Connect_Http.httpDatas(type, url, id, function getBackListener(success, obj, strErro) {
            if (success) {
                enableDepartmentListener(true, obj, '')
            } else {
                enableDepartmentListener(false, '', strErro)
            }
        });
    },
    DisableDepartment: function (type, id, DisableDepartmentListener) {
        var url = Code.URL_POST_DISABLE_DEPARTMENT;

        Connect_Http.httpDatas(type, url, id, function getBackListener(success, obj, strErro) {
            if (success) {
                DisableDepartmentListener(true, obj, '')
            } else {
                DisableDepartmentListener(false, '', strErro)
            }
        });
    },

}

//字典
var Dictionary = {
    getPagingDictionaryList: function (type, options, getPagingDictionaryListListener) {
        var url = Code.URL_GET_PAGING_CATEGORY_DICTIONARY;

        Connect_Http.httpDatas(type, url, options, function getBackListener(success, obj, strErro) {
            if (success) {
                getPagingDictionaryListListener(true, obj.data, '')
            } else {
                getPagingDictionaryListListener(false, '', strErro)
            }
        });
    },
    getDictionaryList: function (type, name, getDictionaryListListener) {
        var url = Code.URL_GET_CATEGORY_DICTIONARY;
        var postData = {
            分类: name
        }

        Connect_Http.httpDatas(type, url, postData, function getBackListener(success, obj, strErro) {
            if (success) {
                getDictionaryListListener(true, obj.data, '')
            } else {
                getDictionaryListListener(false, '', strErro)
            }
        });
    },
    addDictionary: function (type, options, addDictionaryListener) {
        var url = Code.URL_POST_ADD_DICTIONARY;

        Connect_Http.httpDatas(type, url, options, function getBackListener(success, obj, strErro) {
            if (success) {
                addDictionaryListener(true, obj, '')
            } else {
                addDictionaryListener(false, '', strErro)
            }
        });
    },
    editDictionary: function (type, options, editDictionaryListener) {
        var url = Code.URL_POST_EDIT_DICTIONARY;

        Connect_Http.httpDatas(type, url, options, function getBackListener(success, obj, strErro) {
            if (success) {
                editDictionaryListener(true, obj, '')
            } else {
                editDictionaryListener(false, '', strErro)
            }
        });
    },
    delDictionary: function (type, options, delDictionaryListener) {
        var url = Code.URL_POST_DEL_DICTIONARY;

        Connect_Http.httpDatas(type, url, options, function getBackListener(success, obj, strErro) {
            if (success) {
                delDictionaryListener(true, obj, '')
            } else {
                delDictionaryListener(false, '', strErro)
            }
        });
    },
    getPagingDictionaryChild: function (type, options, getPagingDictionaryChildListener) {
        var url = Code.URL_GET_PAGING_DICTIONARY_CHILD;

        Connect_Http.httpDatas(type, url, options, function getBackListener(success, obj, strErro) {
            if (success) {
                getPagingDictionaryChildListener(true, obj.data, '')
            } else {
                getPagingDictionaryChildListener(false, '', strErro)
            }
        });
    },
    getDictionaryChild: function (type, id, getDictionaryChildListener) {
        var url = Code.URL_GET_DICTIONARY_CHILD;

        var postData = {
            编号: id
        }

        Connect_Http.httpDatas(type, url, postData, function getBackListener(success, obj, strErro) {
            if (success) {
                getDictionaryChildListener(true, obj.data, '')
            } else {
                getDictionaryChildListener(false, '', strErro)
            }
        });
    }
}

//学科
var Subject = {
    getSubjectList: function (type, options, getSubjectListListener) {
        var url = Code.URL_GET_SUBJECT_LIST;

        Connect_Http.httpDatas(type, url, options, function getBackListener(success, obj, strErro) {
            if (success) {
                getSubjectListListener(true, obj.data, '')
            } else {
                getSubjectListListener(false, '', strErro)
            }
        });
    },
    addSubject: function (type, options, addSubjectListener) {
        var url = Code.URL_POST_ADD_SUBJECT;

        Connect_Http.httpDatas(type, url, options, function getBackListener(success, obj, strErro) {
            if (success) {
                addSubjectListener(true, obj, '')
            } else {
                addSubjectListener(false, '', strErro)
            }
        });
    },
    editSubject: function (type, options, editSubjectListener) {
        var url = Code.URL_POST_EDIT_SUBJECT;

        Connect_Http.httpDatas(type, url, options, function getBackListener(success, obj, strErro) {
            if (success) {
                editSubjectListener(true, obj, '')
            } else {
                editSubjectListener(false, '', strErro)
            }
        });
    },
    delSubject: function (type, options, delSubjectListener) {
        var url = Code.URL_POST_DEL_SUBJECT;

        Connect_Http.httpDatas(type, url, options, function getBackListener(success, obj, strErro) {
            if (success) {
                delSubjectListener(true, obj, '')
            } else {
                delSubjectListener(false, '', strErro)
            }
        });
    }
}

//国民行业代码
var IndustryCode = {
    getIndustryCodeList: function (type, options, getIndustryCodeListListener) {
        var url = Code.URL_GET_INDUSTRY_CODE_LIST;

        Connect_Http.httpDatas(type, url, options, function getBackListener(success, obj, strErro) {
            if (success) {
                getIndustryCodeListListener(true, obj.data, '')
            } else {
                getIndustryCodeListListener(false, '', strErro)
            }
        });
    },
    addIndustryCode: function (type, options, addIndustryCodeListener) {
        var url = Code.URL_POST_ADD_INDUSTRY_CODE;

        Connect_Http.httpDatas(type, url, options, function getBackListener(success, obj, strErro) {
            if (success) {
                addIndustryCodeListener(true, obj, '')
            } else {
                addIndustryCodeListener(false, '', strErro)
            }
        });
    },
    editIndustryCode: function (type, options, editIndustryCodeListener) {
        var url = Code.URL_POST_EDIT_INDUSTRY_CODE;

        Connect_Http.httpDatas(type, url, options, function getBackListener(success, obj, strErro) {
            if (success) {
                editIndustryCodeListener(true, obj, '')
            } else {
                editIndustryCodeListener(false, '', strErro)
            }
        });
    },
    delIndustryCode: function (type, options, delIndustryCodeListener) {
        var url = Code.URL_POST_DEL_INDUSTRY_CODE;

        Connect_Http.httpDatas(type, url, options, function getBackListener(success, obj, strErro) {
            if (success) {
                delIndustryCodeListener(true, obj, '')
            } else {
                delIndustryCodeListener(false, '', strErro)
            }
        });
    }
}

//合同买方性质
var ContractBuyer = {
    getContractBuyerList: function (type, options, getContractBuyerListListener) {
        var url = Code.URL_GET_CONTRACT_BUYER_LIST;

        Connect_Http.httpDatas(type, url, options, function getBackListener(success, obj, strErro) {
            if (success) {
                getContractBuyerListListener(true, obj.data, '')
            } else {
                getContractBuyerListListener(false, '', strErro)
            }
        });
    },
    addContractBuyer: function (type, options, addContractBuyerListener) {
        var url = Code.URL_POST_ADD_CONTRACT_BUYER;

        Connect_Http.httpDatas(type, url, options, function getBackListener(success, obj, strErro) {
            if (success) {
                addContractBuyerListener(true, obj, '')
            } else {
                addContractBuyerListener(false, '', strErro)
            }
        });
    },
    editContractBuyer: function (type, options, editContractBuyerListener) {
        var url = Code.URL_POST_EDIT_CONTRACT_BUYER;

        Connect_Http.httpDatas(type, url, options, function getBackListener(success, obj, strErro) {
            if (success) {
                editContractBuyerListener(true, obj, '')
            } else {
                editContractBuyerListener(false, '', strErro)
            }
        });
    },
    delContractBuyer: function (type, options, delContractBuyerListener) {
        var url = Code.URL_POST_DEL_CONTRACT_BUYER;

        Connect_Http.httpDatas(type, url, options, function getBackListener(success, obj, strErro) {
            if (success) {
                delContractBuyerListener(true, obj, '')
            } else {
                delContractBuyerListener(false, '', strErro)
            }
        });
    }
}

//技术领域
var TechnicalField = {
    getTechnicalFieldList: function (type, options, getTechnicalFieldListListener) {
        var url = Code.URL_GET_TECHNICAL_FIELD_LIST;

        Connect_Http.httpDatas(type, url, options, function getBackListener(success, obj, strErro) {
            if (success) {
                getTechnicalFieldListListener(true, obj.data, '')
            } else {
                getTechnicalFieldListListener(false, '', strErro)
            }
        });
    },
    addTechnicalField: function (type, options, addTechnicalFieldListener) {
        var url = Code.URL_POST_ADD_TECHNICAL_FIELD;

        Connect_Http.httpDatas(type, url, options, function getBackListener(success, obj, strErro) {
            if (success) {
                addTechnicalFieldListener(true, obj, '')
            } else {
                addTechnicalFieldListener(false, '', strErro)
            }
        });
    },
    editTechnicalField: function (type, options, editTechnicalFieldListener) {
        var url = Code.URL_POST_EDIT_TECHNICAL_FIELD;

        Connect_Http.httpDatas(type, url, options, function getBackListener(success, obj, strErro) {
            if (success) {
                editTechnicalFieldListener(true, obj, '')
            } else {
                editTechnicalFieldListener(false, '', strErro)
            }
        });
    },
    delTechnicalField: function (type, options, delTechnicalFieldListener) {
        var url = Code.URL_POST_DEL_TECHNICAL_FIELD;

        Connect_Http.httpDatas(type, url, options, function getBackListener(success, obj, strErro) {
            if (success) {
                delTechnicalFieldListener(true, obj, '')
            } else {
                delTechnicalFieldListener(false, '', strErro)
            }
        });
    }
}

//区域
var Area = {
    getAreaList: function (type, options, getAreaListListener) {
        var url = Code.URL_GET_AREA_LIST;

        Connect_Http.httpDatas(type, url, options, function getBackListener(success, obj, strErro) {
            if (success) {
                getAreaListListener(true, obj.data, '')
            } else {
                getAreaListListener(false, '', strErro)
            }
        });
    },
    addArea: function (type, options, addAreaListener) {
        var url = Code.URL_POST_ADD_AREA;

        Connect_Http.httpDatas(type, url, options, function getBackListener(success, obj, strErro) {
            if (success) {
                addAreaListener(true, obj, '')
            } else {
                addAreaListener(false, '', strErro)
            }
        });
    },
    editArea: function (type, options, editAreaListener) {
        var url = Code.URL_POST_EDIT_AREA;

        Connect_Http.httpDatas(type, url, options, function getBackListener(success, obj, strErro) {
            if (success) {
                editAreaListener(true, obj, '')
            } else {
                editAreaListener(false, '', strErro)
            }
        });
    },
    delArea: function (type, options, delAreaListener) {
        var url = Code.URL_POST_DEL_AREA;

        Connect_Http.httpDatas(type, url, options, function getBackListener(success, obj, strErro) {
            if (success) {
                delAreaListener(true, obj, '')
            } else {
                delAreaListener(false, '', strErro)
            }
        });
    }
}

//经费模版
var ExpenditureTemplate = {
    getTemplateList: function (type, options, getTemplateListListener) {
        var url = Code.URL_GET_EXPENDITURE_TEMPLATE_LIST;

        Connect_Http.httpDatas(type, url, options, function getBackListener(success, obj, strErro) {
            if (success) {
                getTemplateListListener(true, obj.data, '')
            } else {
                getTemplateListListener(false, '', strErro)
            }
        });
    },
    getTemplateTypesAndContent: function (type, id, getTemplateTypesAndContentListener) {
        var url = Code.URL_GET_EXPENDITURE_TEMPLATE_TYPES_AND_CONTENT;
        var postData = {
            经费模版编号: id
        }

        Connect_Http.httpDatas(type, url, postData, function getBackListener(success, obj, strErro) {
            if (success) {
                getTemplateTypesAndContentListener(true, obj.data, '')
            } else {
                getTemplateTypesAndContentListener(false, '', strErro)
            }
        });
    },
    addOrEditTemplate: function (type, options, addOrEditTemplateListener) {
        var url = Code.URL_POST_ADD_OR_EDIT_EXPENDITURE_TEMPLATE;

        Connect_Http.httpDatas(type, url, options, function getBackListener(success, obj, strErro) {
            if (success) {
                addOrEditTemplateListener(true, obj, '')
            } else {
                addOrEditTemplateListener(false, '', strErro)
            }
        });
    },
    delTemplate: function (type, options, delTemplateListener) {
        var url = Code.URL_POST_DEL_EXPENDITURE_TEMPLATE;

        Connect_Http.httpDatas(type, url, options, function getBackListener(success, obj, strErro) {
            if (success) {
                delTemplateListener(true, obj, '')
            } else {
                delTemplateListener(false, '', strErro)
            }
        });
    },
    getExpenditureType: function (type, options, getExpenditureTypeListener) {
        var url = Code.URL_GET_EXPENDITURE_TYPE_LIST;

        Connect_Http.httpDatas(type, url, options, function getBackListener(success, obj, strErro) {
            if (success) {
                getExpenditureTypeListener(true, obj.data, '')
            } else {
                getExpenditureTypeListener(false, '', strErro)
            }
        });
    },
    addOrEditExpenditureType: function (type, options, addOrEditExpenditureTypeListener) {
        var url = Code.URL_POST_ADD_OR_EDIT_EXPENDITURE_TYPE;

        Connect_Http.httpDatas(type, url, options, function getBackListener(success, obj, strErro) {
            if (success) {
                addOrEditExpenditureTypeListener(true, obj, '')
            } else {
                addOrEditExpenditureTypeListener(false, '', strErro)
            }
        });
    },
    delExpenditureType: function (type, options, delExpenditureTypeListener) {
        var url = Code.URL_POST_DEL_EXPENDITURE_TYPE;

        Connect_Http.httpDatas(type, url, options, function getBackListener(success, obj, strErro) {
            if (success) {
                delExpenditureTypeListener(true, obj, '')
            } else {
                delExpenditureTypeListener(false, '', strErro)
            }
        });
    },
    getExpenditureTypeDetail: function (type, id, getExpenditureTypeDetailListener) {
        var url = Code.URL_GET_EXPENDITURE_TYPE_DETAIL;
        var postData = {
            经费模版项目支出类型编号: id
        }

        Connect_Http.httpDatas(type, url, postData, function getBackListener(success, obj, strErro) {
            if (success) {
                getExpenditureTypeDetailListener(true, obj.data, '')
            } else {
                getExpenditureTypeDetailListener(false, '', strErro)
            }
        });
    },
}

//项目分类
var ProjectType = {
    getProjectTypeList: function (type, options, getProjectTypeListListener) {
        var url = Code.URL_GET_PROJECT_TYPE_LIST;

        Connect_Http.httpDatas(type, url, options, function getBackListener(success, obj, strErro) {
            if (success) {
                getProjectTypeListListener(true, obj.data, '')
            } else {
                getProjectTypeListListener(false, '', strErro)
            }
        });
    },
    getProjectType: function (type, id, getProjectTypeListListener) {
        var url = Code.URL_GET_PROJECT_TYPE_LIST;
        var postData = {
            上级编号: id
        }

        Connect_Http.httpDatas(type, url, postData, function getBackListener(success, obj, strErro) {
            if (success) {
                getProjectTypeListListener(true, obj.data, '')
            } else {
                getProjectTypeListListener(false, '', strErro)
            }
        });
    },
    addOrEditProjectType: function (type, options, addOrEditProjectTypeListener) {
        var url = Code.URL_POST_ADD_OR_EDIT_PROJECT_TYPE;

        Connect_Http.httpDatas(type, url, options, function getBackListener(success, obj, strErro) {
            if (success) {
                addOrEditProjectTypeListener(true, obj, '')
            } else {
                addOrEditProjectTypeListener(false, '', strErro)
            }
        });
    },
    delProjectType: function (type, options, delProjectTypeListener) {
        var url = Code.URL_POST_DEL_PROJECT_TYPE;

        Connect_Http.httpDatas(type, url, options, function getBackListener(success, obj, strErro) {
            if (success) {
                delProjectTypeListener(true, obj, '')
            } else {
                delProjectTypeListener(false, '', strErro)
            }
        });
    },
}

//期刊
var Periodical = {
    getPeriodicalList: function (type, options, getPeriodicalListListener) {
        var url = Code.URL_GET_PERIODICAL_LIST;

        Connect_Http.httpDatas(type, url, options, function getBackListener(success, obj, strErro) {
            if (success) {
                getPeriodicalListListener(true, obj.data, '')
            } else {
                getPeriodicalListListener(false, '', strErro)
            }
        });
    },
    addOrEditPeriodical: function (type, options, addOrEditPeriodicalListener) {
        var url = Code.URL_POST_ADD_OR_EDIT_PERIODICAL;

        Connect_Http.httpDatas(type, url, options, function getBackListener(success, obj, strErro) {
            if (success) {
                addOrEditPeriodicalListener(true, obj, '')
            } else {
                addOrEditPeriodicalListener(false, '', strErro)
            }
        });
    },
    delPeriodical: function (type, options, delPeriodicalListener) {
        var url = Code.URL_POST_DEL_PERIODICAL;

        Connect_Http.httpDatas(type, url, options, function getBackListener(success, obj, strErro) {
            if (success) {
                delPeriodicalListener(true, obj, '')
            } else {
                delPeriodicalListener(false, '', strErro)
            }
        });
    },
    getPeriodicalSeries: function (type, classify, getPeriodicalSeriesListener) {
        var url = Code.URL_GET_CATEGORY_DICTIONARY;
        var postData = {
            分类: classify
        }

        Connect_Http.httpDatas(type, url, postData, function getBackListener(success, obj, strErro) {
            if (success) {
                getPeriodicalSeriesListener(true, obj.data, '')
            } else {
                getPeriodicalSeriesListener(false, '', strErro)
            }
        });
    }
}

//学术任职
var Learning = {
    getPagingLearning: function (type, options, getPagingLearningListener) {
        var url = Code.URL_GET_PAGING_LEARNING;

        Connect_Http.httpDatas(type, url, options, function getBackListener(success, obj, strErro) {
            if (success) {
                getPagingLearningListener(true, obj.data, '')
            } else {
                getPagingLearningListener(false, '', strErro)
            }
        });
    },
    getLearningDetails: function (type, id, getLearningDetailsListener) {
        var url = Code.URL_GET_LEARNING_DETAILS;
        var postData = {
            任职编号: id
        }

        Connect_Http.httpDatas(type, url, postData, function getBackListener(success, obj, strErro) {
            if (success) {
                getLearningDetailsListener(true, obj.data, '')
            } else {
                getLearningDetailsListener(false, '', strErro)
            }
        });
    },
    addLearningUser: function (type, options, addLearningUserUserListener) {
        var url = Code.URL_POST_ADD_LEARNING_USER;

        Connect_Http.httpDatas(type, url, options, function getBackListener(success, obj, strErro) {
            if (success) {
                addLearningUserUserListener(true, obj, '')
            } else {
                addLearningUserUserListener(false, '', strErro)
            }
        });
    },
    editLearningUser: function (type, options, editLearningUserUserListener) {
        var url = Code.URL_POST_EDIT_LEARNING_USER;

        Connect_Http.httpDatas(type, url, options, function getBackListener(success, obj, strErro) {
            if (success) {
                editLearningUserUserListener(true, obj, '')
            } else {
                editLearningUserUserListener(false, '', strErro)
            }
        });
    },
    uploadLearningFile: function (type, options, uploadLearningFileListener) {
        var url = Code.URL_POST_EDIT_LEARNING_USER;

        Connect_Http.httpDatas(type, url, options, function getBackListener(success, obj, strErro) {
            if (success) {
                uploadLearningFileListener(true, obj, '')
            } else {
                uploadLearningFileListener(false, '', strErro)
            }
        });
    }
}

//专家人员
var ExpertTalents = {
    getExpertTalentshUsers: function (type, options, getExpertTalentshUsersListener) {
        var url = Code.URL_GET_PAGING_EXPERTALENTS_USER;

        Connect_Http.httpDatas(type, url, options, function getBackListener(success, obj, strErro) {
            if (success) {
                getExpertTalentshUsersListener(true, obj.data, '')
            } else {
                getExpertTalentshUsersListener(false, '', strErro)
            }
        });
    },
    addExpertTalentsUsers: function (type, options, addExpertTalentsUsersListener) {
        var url = Code.URL_POST_ADD_EXPERTALENTS_USER;

        Connect_Http.httpDatas(type, url, options, function getBackListener(success, obj, strErro) {
            if (success) {
                addExpertTalentsUsersListener(true, obj, '')
            } else {
                addExpertTalentsUsersListener(false, '', strErro)
            }
        });
    },
    haveAddExpertTalentsUsers: function (type, options, haveAddExpertTalentsUsersListener) {
        var url = Code.URL_POST_HAVE_ADD_EXPERTALENTS_USER;

        Connect_Http.httpDatas(type, url, options, function getBackListener(success, obj, strErro) {
            if (success) {
                haveAddExpertTalentsUsersListener(true, obj, '')
            } else {
                haveAddExpertTalentsUsersListener(false, '', strErro)
            }
        });
    },
    delExpertTalentsUsers: function (type, options, delExpertTalentsUsersListener) {
        var url = Code.URL_POST_DEL_EXPERTALENTS_USER;

        Connect_Http.httpDatas(type, url, options, function getBackListener(success, obj, strErro) {
            if (success) {
                delExpertTalentsUsersListener(true, obj, '')
            } else {
                delExpertTalentsUsersListener(false, '', strErro)
            }

        });
    },
}

//科研
var ScientificResearch = {
    getScientificResearchDetails: function (type, id, getScientificResearchDetailsListener) {
        var url = Code.URL_GET_SCIENTIFICRESARCH_DETAILS;
        var postData = {
            当前登录人编号: id
        }

        Connect_Http.httpDatas(type, url, postData, function getBackListener(success, obj, strErro) {
            if (success) {
                getScientificResearchDetailsListener(true, obj.data, '')
            } else {
                getScientificResearchDetailsListener(false, '', strErro)
            }
        });
    },
    getScientificResearchUsers: function (type, options, getScientificResearchUsersListener) {
        var url = Code.URL_GET_PAGING_SCIENTIFICRESARCH_USER;

        Connect_Http.httpDatas(type, url, options, function getBackListener(success, obj, strErro) {
            if (success) {
                getScientificResearchUsersListener(true, obj.data, '')
            } else {
                getScientificResearchUsersListener(false, '', strErro)
            }
        });
    },
    addScientificResearchUsers: function (type, options, addScientificResearchUsersListener) {
        var url = Code.URL_POST_ADD_SCIENTIFICRESARCH_USER;

        Connect_Http.httpDatas(type, url, options, function getBackListener(success, obj, strErro) {
            if (success) {
                addScientificResearchUsersListener(true, obj, '')
            } else {
                addScientificResearchUsersListener(false, '', strErro)
            }
        });
    },
    haveAddScientificResearchUsers: function (type, options, haveAddScientificResearchUsersListener) {
        var url = Code.URL_POST_HAVE_ADD_SCIENTIFICRESARCH_USER;

        Connect_Http.httpDatas(type, url, options, function getBackListener(success, obj, strErro) {
            if (success) {
                haveAddScientificResearchUsersListener(true, obj, '')
            } else {
                haveAddScientificResearchUsersListener(false, '', strErro)
            }
        });
    },
    delScientificResearchUsers: function (type, options, delScientificResearchUsersListener) {
        var url = Code.URL_POST_DEL_SCIENTIFICRESARCH_USER;

        Connect_Http.httpDatas(type, url, options, function getBackListener(success, obj, strErro) {
            if (success) {
                delScientificResearchUsersListener(true, obj, '')
            } else {
                delScientificResearchUsersListener(false, '', strErro)
            }
        });
    },
    getScientificResearchUntreated: function (type, options, getScientificResearchUntreatedListener) {
        var url = Code.URL_GET_SCIENTIFICRESARCH_UNTREATED;

        Connect_Http.httpDatas(type, url, options, function getBackListener(success, obj, strErro) {
            if (success) {
                getScientificResearchUntreatedListener(true, obj.data, '')
            } else {
                getScientificResearchUntreatedListener(false, '', strErro)
            }
        });
    },
}

//工作流程
var WorkFlow = {
    WorkFlowTotalList: function (type, options, WorkFlowTotalListListener) {
        var url = Code.URL_GET_WORKFLOW_TOTAL_LIST;

        Connect_Http.httpDatas(type, url, options, function getBackListener(success, obj, strErro) {
            if (success) {
                WorkFlowTotalListListener(true, obj.data, '')
            } else {
                WorkFlowTotalListListener(false, '', strErro)
            }

        });
    },
    WorkFlowList: function (type, id, WorkFlowListListener) {
        var url = Code.URL_GET_WORKFLOW_LIST;
        var postData = {
            办事流程编号: id
        }

        Connect_Http.httpDatas(type, url, postData, function getBackListener(success, obj, strErro) {
            if (success) {
                WorkFlowListListener(true, obj.data, '')
            } else {
                WorkFlowListListener(false, '', strErro)
            }

        });
    },
    WorkFlow: function (type, options, WorkFlowListener) {
        var url = Code.URL_POST_WORKFLOW;

        Connect_Http.httpDatas(type, url, options, function getBackListener(success, obj, strErro) {
            if (success) {
                WorkFlowListener(true, obj, '')
            } else {
                WorkFlowListener(false, '', strErro)
            }

        });
    },
    WorkFlowAssignor: function (type, options, WorkFlowAssignorListener) {
        var url = Code.URL_POST_WORKFLOW_ASSIGNOR;

        Connect_Http.httpDatas(type, url, options, function getBackListener(success, obj, strErro) {
            if (success) {
                WorkFlowAssignorListener(true, obj, '')
            } else {
                WorkFlowAssignorListener(false, '', strErro)
            }

        });
    }
}

//通知公告
var Notice = {
    getUserNoticeList: function (type, options, getUserNoticeListListener) {
        var url = Code.URL_GET_PAGING_USER_NOTICE_LIST;

        Connect_Http.httpDatas(type, url, options, function getBackListener(success, obj, strErro) {
            if (success) {
                getUserNoticeListListener(true, obj.data, '')
            } else {
                getUserNoticeListListener(false, '', strErro)
            }
        });
    },
    getNoticeList: function (type, options, getNoticeListListener) {
        var url = Code.URL_GET_PAGING_NOTICE_LIST;

        Connect_Http.httpDatas(type, url, options, function getBackListener(success, obj, strErro) {
            if (success) {
                getNoticeListListener(true, obj.data, '')
            } else {
                getNoticeListListener(false, '', strErro)
            }
        });
    },
    getNoticeDetails: function (type, id, getNoticeDetailsListener) {
        var url = Code.URL_GET_NOTICE_DETAILS;
        var postData = {
            编号: id,
            是否已接收: true
        }

        Connect_Http.httpDatas(type, url, postData, function getBackListener(success, obj, strErro) {
            if (success) {
                getNoticeDetailsListener(true, obj.data, '')
            } else {
                getNoticeDetailsListener(false, '', strErro)
            }
        });
    },
    enableOrDisableNotice: function (type, options, enableOrDisableNoticeListener) {
        var url = Code.URL_POST_ENABLE_OR_DISABLE_NOTICE;

        Connect_Http.httpDatas(type, url, options, function getBackListener(success, obj, strErro) {
            if (success) {
                enableOrDisableNoticeListener(true, obj, '')
            } else {
                enableOrDisableNoticeListener(false, '', strErro)
            }

        });
    },
    addNotice: function (type, options, addNoticeListener) {
        var url = Code.URL_POST_ADD_NOTICE;

        Connect_Http.httpDatas(type, url, options, function getBackListener(success, obj, strErro) {
            if (success) {
                addNoticeListener(true, obj, '')
            } else {
                addNoticeListener(false, '', strErro)
            }

        });
    },
}

//下载中心
var Download = {
    getDownloadList: function (type, options, getDownloadListListener) {
        var url = Code.URL_GET_DOWNLOAD_CENTER;

        Connect_Http.httpDatas(type, url, options, function getBackListener(success, obj, strErro) {
            if (success) {
                getDownloadListListener(true, obj.data, '')
            } else {
                getDownloadListListener(false, '', strErro)
            }
        });
    },
    getEnableDownloadList: function (type, options, getEnableDownloadListListener) {
        var url = Code.URL_GET_ENABLE_DOWNLOAD_CENTER;

        Connect_Http.httpDatas(type, url, options, function getBackListener(success, obj, strErro) {
            if (success) {
                getEnableDownloadListListener(true, obj.data, '')
            } else {
                getEnableDownloadListListener(false, '', strErro)
            }
        });
    },
    addOrEditDownload: function (type, options, addOrEditDownloadListener) {
        var url = Code.URL_POST_ADD_OR_DOWNLOAD;

        Connect_Http.httpDatas(type, url, options, function getBackListener(success, obj, strErro) {
            if (success) {
                addOrEditDownloadListener(true, obj, '')
            } else {
                addOrEditDownloadListener(false, '', strErro)
            }

        });
    },
    enableOrDisableDownload: function (type, options, enableOrDisableDownloadListener) {
        var url = Code.URL_POST_ENABLE_OR_DISABLE_DOWNLOAD;

        Connect_Http.httpDatas(type, url, options, function getBackListener(success, obj, strErro) {
            if (success) {
                enableOrDisableDownloadListener(true, obj, '')
            } else {
                enableOrDisableDownloadListener(false, '', strErro)
            }

        });
    },
}

//讲座
var Lecture = {
    getHostLectureList: function (type, options, getHostLectureListListener) {
        var url = Code.URL_GET_HOST_LECTURE_LIST;

        Connect_Http.httpDatas(type, url, options, function getBackListener(success, obj, strErro) {
            if (success) {
                getHostLectureListListener(true, obj.data, '')
            } else {
                getHostLectureListListener(false, '', strErro)
            }
        });
    },
    getHostLectureDetails: function (type, id, getHostLectureDetailsListener) {
        var url = Code.URL_GET_HOST_LECTURE_DETAILS;
        var postData = {
            主办讲座编号: id
        }

        Connect_Http.httpDatas(type, url, postData, function getBackListener(success, obj, strErro) {
            if (success) {
                getHostLectureDetailsListener(true, obj.data, '')
            } else {
                getHostLectureDetailsListener(false, '', strErro)
            }
        });

    },
    addHostLecture: function (type, options, addHostLectureListener) {
        var url = Code.URL_POST_ADD_HOST_LECTURE;

        Connect_Http.httpDatas(type, url, options, function getBackListener(success, obj, strErro) {
            if (success) {
                addHostLectureListener(true, obj, '')
            } else {
                addHostLectureListener(false, '', strErro)
            }

        });
    },
    editHostLecture: function (type, options, editHostLectureListener) {
        var url = Code.URL_POST_EDIT_HOST_LECTURE;

        Connect_Http.httpDatas(type, url, options, function getBackListener(success, obj, strErro) {
            if (success) {
                editHostLectureListener(true, obj, '')
            } else {
                editHostLectureListener(false, '', strErro)
            }

        });
    },
    getFeedbackLecture: function (type, options, getFeedbackLectureListener) {
        var url = Code.URL_GET_FEEDBACK_LECTURE;

        Connect_Http.httpDatas(type, url, options, function getBackListener(success, obj, strErro) {
            if (success) {
                getFeedbackLectureListener(true, obj.data, '')
            } else {
                getFeedbackLectureListener(false, '', strErro)
            }
        });
    },
    getLectureFeedbackDetails: function (type, id, getLectureFeedbackDetailsListener) {
        var url = Code.URL_GET_LECTURE_FEEDBACK_DETAILS;
        var postData = {
            讲座反馈编号: id
        }

        Connect_Http.httpDatas(type, url, postData, function getBackListener(success, obj, strErro) {
            if (success) {
                getLectureFeedbackDetailsListener(true, obj.data, '')
            } else {
                getLectureFeedbackDetailsListener(false, '', strErro)
            }
        });

    },
    addLectureFeedback: function (type, options, addLectureFeedbackListener) {
        var url = Code.URL_POST_ADD_LECTURE_FEEDBACK;

        Connect_Http.httpDatas(type, url, options, function getBackListener(success, obj, strErro) {
            if (success) {
                addLectureFeedbackListener(true, obj, '')
            } else {
                addLectureFeedbackListener(false, '', strErro)
            }

        });
    },
    editLectureFeedback: function (type, options, editLectureFeedbackListener) {
        var url = Code.URL_POST_EDIT_LECTURE_FEEDBACK;

        Connect_Http.httpDatas(type, url, options, function getBackListener(success, obj, strErro) {
            if (success) {
                editLectureFeedbackListener(true, obj, '')
            } else {
                editLectureFeedbackListener(false, '', strErro)
            }

        });
    },
}

//会议
var Meeting = {
    getMeetingList: function (type, options, getMeetingListListener) {
        var url = Code.URL_GET_MEETING_LIST;

        Connect_Http.httpDatas(type, url, options, function getBackListener(success, obj, strErro) {
            if (success) {
                getMeetingListListener(true, obj.data, '')
            } else {
                getMeetingListListener(false, '', strErro)
            }
        });
    },
    getMeetingDetails: function (type, id, getMeetingDetailsListener) {
        var url = Code.URL_GET_MEETING_DETAILS;
        var postData = {
            参加会议编号: id
        }

        Connect_Http.httpDatas(type, url, postData, function getBackListener(success, obj, strErro) {
            if (success) {
                getMeetingDetailsListener(true, obj.data, '')
            } else {
                getMeetingDetailsListener(false, '', strErro)
            }
        });

    },
    addMeeting: function (type, options, addMeetingListener) {
        var url = Code.URL_POST_ADD_MEETING;

        Connect_Http.httpDatas(type, url, options, function getBackListener(success, obj, strErro) {
            if (success) {
                addMeetingListener(true, obj, '')
            } else {
                addMeetingListener(false, '', strErro)
            }

        });
    },
    editMeeting: function (type, options, editMeetingListener) {
        var url = Code.URL_POST_EDIT_MEETING;

        Connect_Http.httpDatas(type, url, options, function getBackListener(success, obj, strErro) {
            if (success) {
                editMeetingListener(true, obj, '')
            } else {
                editMeetingListener(false, '', strErro)
            }

        });
    },
    getMeetingFeedbackList: function (type, options, getMeetingFeedbackListListener) {
        var url = Code.URL_GET_MEETING_FEEDBACK_LIST;

        Connect_Http.httpDatas(type, url, options, function getBackListener(success, obj, strErro) {
            if (success) {
                getMeetingFeedbackListListener(true, obj.data, '')
            } else {
                getMeetingFeedbackListListener(false, '', strErro)
            }
        });
    },
    getMeetingFeedbackDetails: function (type, id, getMeetingFeedbackDetailsListener) {
        var url = Code.URL_GET_MEETING_FEEDBACK_DETAILS;
        var postData = {
            参加会议反馈编号: id
        }

        Connect_Http.httpDatas(type, url, postData, function getBackListener(success, obj, strErro) {
            if (success) {
                getMeetingFeedbackDetailsListener(true, obj.data, '')
            } else {
                getMeetingFeedbackDetailsListener(false, '', strErro)
            }
        });

    },
    addMeetingFeedback: function (type, options, addMeetingFeedbackListener) {
        var url = Code.URL_POST_ADD_MEETING_FEEDBACK;

        Connect_Http.httpDatas(type, url, options, function getBackListener(success, obj, strErro) {
            if (success) {
                addMeetingFeedbackListener(true, obj, '')
            } else {
                addMeetingFeedbackListener(false, '', strErro)
            }

        });
    },
    editMeetingFeedback: function (type, options, editMeetingFeedbackListener) {
        var url = Code.URL_POST_EDIT_MEETING_FEEDBACK;

        Connect_Http.httpDatas(type, url, options, function getBackListener(success, obj, strErro) {
            if (success) {
                editMeetingFeedbackListener(true, obj, '')
            } else {
                editMeetingFeedbackListener(false, '', strErro)
            }

        });
    }
}

//论文
var Paper = {
    getPaperList: function (type, options, getPaperListListener) {
        var url = Code.URL_GET_PAPER_LIST;

        Connect_Http.httpDatas(type, url, options, function getBackListener(success, obj, strErro) {
            if (success) {
                getPaperListListener(true, obj.data, '')
            } else {
                getPaperListListener(false, '', strErro)
            }
        });
    },
    getPaperDetails: function (type, id, getPaperDetailsListener) {
        var url = Code.URL_GET_PAPER_DETAILS;
        var postData = {
            论文编号: id
        }

        Connect_Http.httpDatas(type, url, postData, function getBackListener(success, obj, strErro) {
            if (success) {
                getPaperDetailsListener(true, obj.data, '')
            } else {
                getPaperDetailsListener(false, '', strErro)
            }
        });
    },
    getPaperAuxiliaryData: function (type, getPaperAuxiliaryDataListener) {
        var url = Code.URL_GET_PAPER_AUXILIARY_DATA;

        Connect_Http.httpDatas(type, url, '', function getBackListener(success, obj, strErro) {
            if (success) {
                getPaperAuxiliaryDataListener(true, obj.data, '')
            } else {
                getPaperAuxiliaryDataListener(false, '', strErro)
            }
        });

    },
    addPaper: function (type, options, addPaperListener) {
        var url = Code.URL_POST_ADD_PAPER;

        Connect_Http.httpDatas(type, url, options, function getBackListener(success, obj, strErro) {
            if (success) {
                addPaperListener(true, obj, '')
            } else {
                addPaperListener(false, '', strErro)
            }

        });
    },
    editPaper: function (type, options, editPaperListener) {
        var url = Code.URL_POST_EDIT_PAPER;

        Connect_Http.httpDatas(type, url, options, function getBackListener(success, obj, strErro) {
            if (success) {
                editPaperListener(true, obj, '')
            } else {
                editPaperListener(false, '', strErro)
            }

        });
    },
    delPaper: function (type, options, delPaperListener) {
        var url = Code.URL_POST_DEL_PAPER;

        Connect_Http.httpDatas(type, url, options, function getBackListener(success, obj, strErro) {
            if (success) {
                delPaperListener(true, obj, '')
            } else {
                delPaperListener(false, '', strErro)
            }

        });
    },
    getReceivePaperList: function (type, options, getReceivePaperListListener) {
        var url = Code.URL_GET_RECEIVE_PAPER_LIST;

        Connect_Http.httpDatas(type, url, options, function getBackListener(success, obj, strErro) {
            if (success) {
                getReceivePaperListListener(true, obj.data, '')
            } else {
                getReceivePaperListListener(false, '', strErro)
            }
        });
    },
}

//成果
var Fruit = {
    getFruitList: function (type, options, getFruitListListener) {
        var url = Code.URL_GET_ALL_FRUIT_LIST;

        Connect_Http.httpDatas(type, url, options, function getBackListener(success, obj, strErro) {
            if (success) {
                getFruitListListener(true, obj.data, '')
            } else {
                getFruitListListener(false, '', strErro)
            }
        });
    },
}

//著作
var Work = {
    getWorkList: function (type, options, getWorkListListener) {
        var url = Code.URL_GET_WORK_LIST;

        Connect_Http.httpDatas(type, url, options, function getBackListener(success, obj, strErro) {
            if (success) {
                getWorkListListener(true, obj.data, '')
            } else {
                getWorkListListener(false, '', strErro)
            }
        });
    },
    getWorkDetails: function (type, id, getWorkDetailsListener) {
        var url = Code.URL_GET_WORK_DETAILS;
        var postData = {
            著作编号: id
        }

        Connect_Http.httpDatas(type, url, postData, function getBackListener(success, obj, strErro) {
            if (success) {
                getWorkDetailsListener(true, obj.data, '')
            } else {
                getWorkDetailsListener(false, '', strErro)
            }
        });
    },
    getWorkAuxiliaryData: function (type, getWorkAuxiliaryDataListener) {
        var url = Code.URL_GET_WORK_AUXILIARY_DATA;

        Connect_Http.httpDatas(type, url, '', function getBackListener(success, obj, strErro) {
            if (success) {
                getWorkAuxiliaryDataListener(true, obj.data, '')
            } else {
                getWorkAuxiliaryDataListener(false, '', strErro)
            }
        });
    },
    addWork: function (type, options, addWorkListener) {
        var url = Code.URL_POST_ADD_WORK;

        Connect_Http.httpDatas(type, url, options, function getBackListener(success, obj, strErro) {
            if (success) {
                addWorkListener(true, obj, '')
            } else {
                addWorkListener(false, '', strErro)
            }
        });
    },
    editWork: function (type, options, editWorkListener) {
        var url = Code.URL_POST_EDIT_WORK;

        Connect_Http.httpDatas(type, url, options, function getBackListener(success, obj, strErro) {
            if (success) {
                editWorkListener(true, obj, '')
            } else {
                editWorkListener(false, '', strErro)
            }
        });
    },

}
//专利
var Patent = {
    getPatentList: function (type, options, getPatentListListener) {
        var url = Code.URL_GET_PATENT_LIST;

        Connect_Http.httpDatas(type, url, options, function getBackListener(success, obj, strErro) {
            if (success) {
                getPatentListListener(true, obj.data, '')
            } else {
                getPatentListListener(false, '', strErro)
            }
        });
    },
    getPatentDetails: function (type, id, getPatentDetailsListener) {
        var url = Code.URL_GET_PATENT_DETAILS;
        var postData = {
            专利编号: id
        }

        Connect_Http.httpDatas(type, url, postData, function getBackListener(success, obj, strErro) {
            if (success) {
                getPatentDetailsListener(true, obj.data, '')
            } else {
                getPatentDetailsListener(false, '', strErro)
            }
        });
    },
    getPatentAuxiliaryData: function (type, getPatentAuxiliaryDataListener) {
        var url = Code.URL_GET_PATENT_AUXILIARY_DATA;

        Connect_Http.httpDatas(type, url, '', function getBackListener(success, obj, strErro) {
            if (success) {
                getPatentAuxiliaryDataListener(true, obj.data, '')
            } else {
                getPatentAuxiliaryDataListener(false, '', strErro)
            }
        });
    },
    addPatent: function (type, options, addPatentListener) {
        var url = Code.URL_POST_ADD_PATENT;

        Connect_Http.httpDatas(type, url, options, function getBackListener(success, obj, strErro) {
            if (success) {
                addPatentListener(true, obj, '')
            } else {
                addPatentListener(false, '', strErro)
            }
        });
    },
    editPatent: function (type, options, editPatentListener) {
        var url = Code.URL_POST_EDIT_PATENT;

        Connect_Http.httpDatas(type, url, options, function getBackListener(success, obj, strErro) {
            if (success) {
                editPatentListener(true, obj, '')
            } else {
                editPatentListener(false, '', strErro)
            }
        });
    },
}

//获奖
var Award = {
    getAwardList: function (type, options, getAwardListListener) {
        var url = Code.URL_GET_AWARD_LIST;

        Connect_Http.httpDatas(type, url, options, function getBackListener(success, obj, strErro) {
            if (success) {
                getAwardListListener(true, obj.data, '')
            } else {
                getAwardListListener(false, '', strErro)
            }
        });
    },
    getAwardDetails: function (type, id, getAwardDetailsListener) {
        var url = Code.URL_GET_AWARD_DETAILS;
        var postData = {
            获奖编号: id
        }

        Connect_Http.httpDatas(type, url, postData, function getBackListener(success, obj, strErro) {
            if (success) {
                getAwardDetailsListener(true, obj.data, '')
            } else {
                getAwardDetailsListener(false, '', strErro)
            }
        });
    },
    getAwardAuxiliaryData: function (type, getAwardAuxiliaryDataListener) {
        var url = Code.URL_GET_AWARD_AUXILIARY_DATA;

        Connect_Http.httpDatas(type, url, '', function getBackListener(success, obj, strErro) {
            if (success) {
                getAwardAuxiliaryDataListener(true, obj.data, '')
            } else {
                getAwardAuxiliaryDataListener(false, '', strErro)
            }
        });
    },
    addAward: function (type, options, addAwardListener) {
        var url = Code.URL_POST_ADD_AWARD;

        Connect_Http.httpDatas(type, url, options, function getBackListener(success, obj, strErro) {
            if (success) {
                addAwardListener(true, obj, '')
            } else {
                addAwardListener(false, '', strErro)
            }
        });
    },
    editAward: function (type, options, editAwardListener) {
        var url = Code.URL_POST_EDIT_AWARD;

        Connect_Http.httpDatas(type, url, options, function getBackListener(success, obj, strErro) {
            if (success) {
                editAwardListener(true, obj, '')
            } else {
                editAwardListener(false, '', strErro)
            }
        });
    },
}

//纵向项目-项目申报
var Declare = {
    getYSRDeclareList: function (type, options, getgetYSRDeclareListListener) {
        var url = Code.URL_GET_Y_SR_DECLARE_LIST;

        Connect_Http.httpDatas(type, url, options, function getBackListener(success, obj, strErro) {
            if (success) {
                getgetYSRDeclareListListener(true, obj.data, '')
            } else {
                getgetYSRDeclareListListener(false, '', strErro)
            }
        });
    },
    getYSubjectDeclareList: function (type, options, getYSubjectDeclareListListener) {
        var url = Code.URL_GET_Y_SUBJECT_DECLARE_LIST;

        Connect_Http.httpDatas(type, url, options, function getBackListener(success, obj, strErro) {
            if (success) {
                getYSubjectDeclareListListener(true, obj.data, '')
            } else {
                getYSubjectDeclareListListener(false, '', strErro)
            }
        });
    },
    getYPersonnelDeclareList: function (type, options, getYPersonnelDeclareListListener) {
        var url = Code.URL_GET_Y_PERSONNEL_DECLARE_LIST;

        Connect_Http.httpDatas(type, url, options, function getBackListener(success, obj, strErro) {
            if (success) {
                getYPersonnelDeclareListListener(true, obj.data, '')
            } else {
                getYPersonnelDeclareListListener(false, '', strErro)
            }
        });
    },
    getYDeclareDetails: function (type, id, getYDeclareDetailsListener) {
        var url = Code.URL_GET_Y_DECLARE_DETAILS;
        var postData = {
            纵向项目申报编号: id
        }
        Connect_Http.httpDatas(type, url, postData, function getBackListener(success, obj, strErro) {
            if (success) {
                getYDeclareDetailsListener(true, obj.data, '')
            } else {
                getYDeclareDetailsListener(false, '', strErro)
            }
        });
    },
    getYDeclareAuxiliaryData: function (type, getYDeclareAuxiliaryDataListener) {
        var url = Code.URL_GET_Y_DECLARE_AUXILIARY_DATA;

        Connect_Http.httpDatas(type, url, '', function getBackListener(success, obj, strErro) {
            if (success) {
                getYDeclareAuxiliaryDataListener(true, obj.data, '')
            } else {
                getYDeclareAuxiliaryDataListener(false, '', strErro)
            }
        });
    },
    addYSRDeclare: function (type, options, addYSRDeclareListener) {
        var url = Code.URL_POST_ADD_Y_SR_DECLARE;

        Connect_Http.httpDatas(type, url, options, function getBackListener(success, obj, strErro) {
            if (success) {
                addYSRDeclareListener(true, obj, '')
            } else {
                addYSRDeclareListener(false, '', strErro)
            }
        });
    },
    addYSubjectDeclare: function (type, options, addYSubjectDeclareListener) {
        var url = Code.URL_POST_ADD_Y_SUBJECT_DECLARE;

        Connect_Http.httpDatas(type, url, options, function getBackListener(success, obj, strErro) {
            if (success) {
                addYSubjectDeclareListener(true, obj, '')
            } else {
                addYSubjectDeclareListener(false, '', strErro)
            }
        });
    },
    addYPersonnelDeclare: function (type, options, addYPersonnelDeclareListener) {
        var url = Code.URL_POST_ADD_Y_PERSONNEL_DECLARE;

        Connect_Http.httpDatas(type, url, options, function getBackListener(success, obj, strErro) {
            if (success) {
                addYPersonnelDeclareListener(true, obj, '')
            } else {
                addYPersonnelDeclareListener(false, '', strErro)
            }
        });
    },
    editYDeclare: function (type, options, editYDeclareListener) {
        var url = Code.URL_POST_EDIT_Y_DECLARE;

        Connect_Http.httpDatas(type, url, options, function getBackListener(success, obj, strErro) {
            if (success) {
                editYDeclareListener(true, obj, '')
            } else {
                editYDeclareListener(false, '', strErro)
            }
        });
    },
    expertReview: function (type, options, expertReviewListener) {
        var url = Code.URL_POST_EXPERT_REVIEW;

        Connect_Http.httpDatas(type, url, options, function getBackListener(success, obj, strErro) {
            if (success) {
                expertReviewListener(true, obj, '')
            } else {
                expertReviewListener(false, '', strErro)
            }
        });
    },
    getYSRCanDeclareList: function (type, options, getgetYSRCanDeclareListListener) {
        var url = Code.URL_GET_Y_SR_CAN_DECLARE_LIST;

        Connect_Http.httpDatas(type, url, options, function getBackListener(success, obj, strErro) {
            if (success) {
                getgetYSRCanDeclareListListener(true, obj.data, '')
            } else {
                getgetYSRCanDeclareListListener(false, '', strErro)
            }
        });
    },
    getYCanSubjectDeclareList: function (type, options, getYCanSubjectDeclareListListener) {
        var url = Code.URL_POST_ADD_Y_CAN_SUBJECT_DECLARE;

        Connect_Http.httpDatas(type, url, options, function getBackListener(success, obj, strErro) {
            if (success) {
                getYCanSubjectDeclareListListener(true, obj.data, '')
            } else {
                getYCanSubjectDeclareListListener(false, '', strErro)
            }
        });
    },
    getYCanPersonnelDeclareList: function (type, options, getYCanPersonnelDeclareListListener) {
        var url = Code.URL_POST_ADD_Y_CAN_PERSONNEL_DECLARE;

        Connect_Http.httpDatas(type, url, options, function getBackListener(success, obj, strErro) {
            if (success) {
                getYCanPersonnelDeclareListListener(true, obj.data, '')
            } else {
                getYCanPersonnelDeclareListListener(false, '', strErro)
            }
        });
    },
    getYCanDeclareDetails: function (type, id, getYCanDeclareDetailsListener) {
        var url = Code.URL_GET_Y_CAN_DECLARE_DETAILS;
        var postData = {
            纵向项目申报编号: id
        }
        Connect_Http.httpDatas(type, url, postData, function getBackListener(success, obj, strErro) {
            if (success) {
                getYCanDeclareDetailsListener(true, obj.data, '')
            } else {
                getYCanDeclareDetailsListener(false, '', strErro)
            }
        });
    },
    addYCanDeclare: function (type, options, addYCanDeclareListener) {
        var url = Code.URL_POST_ADD_Y_CAN_DECLARE;

        Connect_Http.httpDatas(type, url, options, function getBackListener(success, obj, strErro) {
            if (success) {
                addYCanDeclareListener(true, obj, '')
            } else {
                addYCanDeclareListener(false, '', strErro)
            }
        });
    },
}

//纵向项目-项目立项
var ProjectEstablish = {
    getYProjectEstablishList: function (type, options, getYProjectEstablishListListener) {
        var url = Code.URL_GET_Y_PROJECT_ESTABLISH_LIST;

        Connect_Http.httpDatas(type, url, options, function getBackListener(success, obj, strErro) {
            if (success) {
                getYProjectEstablishListListener(true, obj.data, '')
            } else {
                getYProjectEstablishListListener(false, '', strErro)
            }
        });
    },
    getYSRProjectEstablishList: function (type, options, getgetYSRProjectEstablishListListener) {
        var url = Code.URL_GET_Y_SR_PROJECT_ESTABLISH_LIST;

        Connect_Http.httpDatas(type, url, options, function getBackListener(success, obj, strErro) {
            if (success) {
                getgetYSRProjectEstablishListListener(true, obj.data, '')
            } else {
                getgetYSRProjectEstablishListListener(false, '', strErro)
            }
        });
    },
    getYSubjectProjectEstablishList: function (type, options, getYSubjectProjectEstablishListener) {
        var url = Code.URL_GET_Y_SUBJECT_PROJECT_ESTABLISH;

        Connect_Http.httpDatas(type, url, options, function getBackListener(success, obj, strErro) {
            if (success) {
                getYSubjectProjectEstablishListener(true, obj.data, '')
            } else {
                getYSubjectProjectEstablishListener(false, '', strErro)
            }
        });
    },
    getYPersonnelProjectEstablishList: function (type, options, getYPersonnelProjectEstablishListListener) {
        var url = Code.URL_GET_Y_PERSONNEL_PROJECT_ESTABLISH;

        Connect_Http.httpDatas(type, url, options, function getBackListener(success, obj, strErro) {
            if (success) {
                getYPersonnelProjectEstablishListListener(true, obj.data, '')
            } else {
                getYPersonnelProjectEstablishListListener(false, '', strErro)
            }
        });
    },
    getYProjectEstablishDetails: function (type, id, getYProjectEstablishDetailsListener) {
        var url = Code.URL_GET_Y_PROJECT_ESTABLISH_DETAILS;
        var postData = {
            纵向项目立项编号: id
        }
        Connect_Http.httpDatas(type, url, postData, function getBackListener(success, obj, strErro) {
            if (success) {
                getYProjectEstablishDetailsListener(true, obj.data, '')
            } else {
                getYProjectEstablishDetailsListener(false, '', strErro)
            }
        });
    },
    getYProjectAuxiliaryData: function (type, getYProjectAuxiliaryDataListener) {
        var url = Code.URL_GET_Y_PROJECT_AUXILIARY_DATA;

        Connect_Http.httpDatas(type, url, '', function getBackListener(success, obj, strErro) {
            if (success) {
                getYProjectAuxiliaryDataListener(true, obj.data, '')
            } else {
                getYProjectAuxiliaryDataListener(false, '', strErro)
            }
        });
    },
    addYSRProjectEstablish: function (type, options, addYSRProjectEstablishListener) {
        var url = Code.URL_POST_ADD_Y_SR_PROJECT_ESTABLISH;

        Connect_Http.httpDatas(type, url, options, function getBackListener(success, obj, strErro) {
            if (success) {
                addYSRProjectEstablishListener(true, obj, '')
            } else {
                addYSRProjectEstablishListener(false, '', strErro)
            }
        });
    },
    addYSubjectProjectEstablish: function (type, options, addYSubjectProjectEstablishListener) {
        var url = Code.URL_POST_ADD_Y_SUBJECT_PROJECT_ESTABLISH;

        Connect_Http.httpDatas(type, url, options, function getBackListener(success, obj, strErro) {
            if (success) {
                addYSubjectProjectEstablishListener(true, obj, '')
            } else {
                addYSubjectProjectEstablishListener(false, '', strErro)
            }
        });
    },
    addYPersonnelProjectEstablish: function (type, options, addYPersonnelProjectEstablishListener) {
        var url = Code.URL_POST_ADD_Y_PERSONNEL_PROJECT_ESTABLISH;

        Connect_Http.httpDatas(type, url, options, function getBackListener(success, obj, strErro) {
            if (success) {
                addYPersonnelProjectEstablishListener(true, obj, '')
            } else {
                addYPersonnelProjectEstablishListener(false, '', strErro)
            }
        });
    },
    editYProjectEstablish: function (type, options, editYProjectEstablishListener) {
        var url = Code.URL_POST_EDIT_Y_PROJECT_ESTABLISH;

        Connect_Http.httpDatas(type, url, options, function getBackListener(success, obj, strErro) {
            if (success) {
                editYProjectEstablishListener(true, obj, '')
            } else {
                editYProjectEstablishListener(false, '', strErro)
            }
        });
    },
}

//纵向项目-在研项目
var ResearchProject = {
    getYProjectMiddleInspection: function (type, options, getYProjectMiddleInspectionListener) {
        var url = Code.URL_GET_Y_PROJECT_MIDDLE_INSPECTION;

        Connect_Http.httpDatas(type, url, options, function getBackListener(success, obj, strErro) {
            if (success) {
                getYProjectMiddleInspectionListener(true, obj.data, '')
            } else {
                getYProjectMiddleInspectionListener(false, '', strErro)
            }
        });
    },
    getYProjectMiddleInspectionDetails: function (type, id, getYProjectMiddleInspectionDetailsListener) {
        var url = Code.URL_GET_Y_PROJECT_MIDDLE_INSPECTION_DETAILS;
        var postData = {
            纵向项目中检编号: id
        }
        Connect_Http.httpDatas(type, url, postData, function getBackListener(success, obj, strErro) {
            if (success) {
                getYProjectMiddleInspectionDetailsListener(true, obj.data, '')
            } else {
                getYProjectMiddleInspectionDetailsListener(false, '', strErro)
            }
        });
    },
    addYProjectMiddleInspection: function (type, options, addYProjectMiddleInspectionListener) {
        var url = Code.URL_POST_ADD_Y_PROJECT_MIDDLE_INSPECTION;

        Connect_Http.httpDatas(type, url, options, function getBackListener(success, obj, strErro) {
            if (success) {
                addYProjectMiddleInspectionListener(true, obj, '')
            } else {
                addYProjectMiddleInspectionListener(false, '', strErro)
            }
        });
    },
    editYProjectMiddleInspection: function (type, options, editProjectMiddleInspectionListener) {
        var url = Code.URL_POST_EDIT_Y_PROJECT_MIDDLE_INSPECTION;

        Connect_Http.httpDatas(type, url, options, function getBackListener(success, obj, strErro) {
            if (success) {
                editProjectMiddleInspectionListener(true, obj, '')
            } else {
                editProjectMiddleInspectionListener(false, '', strErro)
            }
        });
    },
    getYProjectAlterationList: function (type, options, getYProjectAlterationListListener) {
        var url = Code.URL_GET_Y_PROJECT_ALTERATION_LIST;

        Connect_Http.httpDatas(type, url, options, function getBackListener(success, obj, strErro) {
            if (success) {
                getYProjectAlterationListListener(true, obj.data, '')
            } else {
                getYProjectAlterationListListener(false, '', strErro)
            }
        });
    },
    getYProjectAlterationDetails: function (type, id, getYProjectAlterationDetailsListener) {
        var url = Code.URL_GET_Y_PROJECT_ALTERATION_DETAILS;
        var postData = {
            纵向项目变更编号: id,
        }
        Connect_Http.httpDatas(type, url, postData, function getBackListener(success, obj, strErro) {
            if (success) {
                getYProjectAlterationDetailsListener(true, obj.data, '')
            } else {
                getYProjectAlterationDetailsListener(false, '', strErro)
            }
        });
    },
    addYProjectAlteration: function (type, options, addYProjectAlterationListener) {
        var url = Code.URL_POST_ADD_Y_PROJECT_ALTERATION;

        Connect_Http.httpDatas(type, url, options, function getBackListener(success, obj, strErro) {
            if (success) {
                addYProjectAlterationListener(true, obj, '')
            } else {
                addYProjectAlterationListener(false, '', strErro)
            }
        });
    },
    editYProjectAlteration: function (type, options, editProjectAlterationListener) {
        var url = Code.URL_POST_EDIT_Y_PROJECT_ALTERATION;

        Connect_Http.httpDatas(type, url, options, function getBackListener(success, obj, strErro) {
            if (success) {
                editProjectAlterationListener(true, obj, '')
            } else {
                editProjectAlterationListener(false, '', strErro)
            }
        });
    },
    auditYProjectAlteration: function (type, options, auditYProjectAlterationListener) {
        var url = Code.URL_POST_AUDIT_Y_PROJECT_ALTERATION;

        Connect_Http.httpDatas(type, url, options, function getBackListener(success, obj, strErro) {
            if (success) {
                auditYProjectAlterationListener(true, obj, '')
            } else {
                auditYProjectAlterationListener(false, '', strErro)
            }
        });
    },
    getYProjectConclusionList: function (type, options, getYProjectConclusionListListener) {
        var url = Code.URL_GET_Y_PROJECT_CONCLUSION_LIST;

        Connect_Http.httpDatas(type, url, options, function getBackListener(success, obj, strErro) {
            if (success) {
                getYProjectConclusionListListener(true, obj.data, '')
            } else {
                getYProjectConclusionListListener(false, '', strErro)
            }
        });
    },
    getYProjectConclusionDetails: function (type, id, getYProjectConclusionDetailsListener) {
        var url = Code.URL_GET_Y_PROJECT_CONCLUSION_DETAILS;
        var postData = {
            纵向项目结题编号: id
        }
        Connect_Http.httpDatas(type, url, postData, function getBackListener(success, obj, strErro) {
            if (success) {
                getYProjectConclusionDetailsListener(true, obj.data, '')
            } else {
                getYProjectConclusionDetailsListener(false, '', strErro)
            }
        });
    },
    addYProjectConclusion: function (type, options, addYProjectConclusionListener) {
        var url = Code.URL_POST_ADD_Y_PROJECT_CONCLUSION;

        Connect_Http.httpDatas(type, url, options, function getBackListener(success, obj, strErro) {
            if (success) {
                addYProjectConclusionListener(true, obj, '')
            } else {
                addYProjectConclusionListener(false, '', strErro)
            }
        });
    },
    editYProjectConclusion: function (type, options, editProjectConclusionListener) {
        var url = Code.URL_POST_EDIT_Y_PROJECT_CONCLUSION;

        Connect_Http.httpDatas(type, url, options, function getBackListener(success, obj, strErro) {
            if (success) {
                editProjectConclusionListener(true, obj, '')
            } else {
                editProjectConclusionListener(false, '', strErro)
            }
        });
    },
}

//横向项目
var XProject = {
    getXProjectList: function (type, options, getXProjectListListener) {
        var url = Code.URL_GET_X_PROJECT_LIST;

        Connect_Http.httpDatas(type, url, options, function getBackListener(success, obj, strErro) {
            if (success) {
                getXProjectListListener(true, obj.data, '')
            } else {
                getXProjectListListener(false, '', strErro)
            }
        });
    },
    getXProjectDetails: function (type, id, getXProjectDetailsListener) {
        var url = Code.URL_GET_X_PROJECT_DETAILS;
        var postData = {
            横向项目编号: id,
        }
        Connect_Http.httpDatas(type, url, postData, function getBackListener(success, obj, strErro) {
            if (success) {
                getXProjectDetailsListener(true, obj.data, '')
            } else {
                getXProjectDetailsListener(false, '', strErro)
            }
        });
    },
    getXProjectAuxiliaryData: function (type, getXProjectAuxiliaryDataListener) {
        var url = Code.URL_GET_X_PROJECT_AUXILIARY_DATA;

        Connect_Http.httpDatas(type, url, '', function getBackListener(success, obj, strErro) {
            if (success) {
                getXProjectAuxiliaryDataListener(true, obj.data, '')
            } else {
                getXProjectAuxiliaryDataListener(false, '', strErro)
            }
        });
    },
    addXProject: function (type, options, addXProjectListener) {
        var url = Code.URL_POST_ADD_X_PROJECT;

        Connect_Http.httpDatas(type, url, options, function getBackListener(success, obj, strErro) {
            if (success) {
                addXProjectListener(true, obj, '')
            } else {
                addXProjectListener(false, '', strErro)
            }
        });
    },
    editXProject: function (type, options, editXProjectListener) {
        var url = Code.URL_POST_EDIT_X_PROJECT;

        Connect_Http.httpDatas(type, url, options, function getBackListener(success, obj, strErro) {
            if (success) {
                editXProjectListener(true, obj, '')
            } else {
                editXProjectListener(false, '', strErro)
            }
        });
    },
    getXProjectAlterationList: function (type, options, getXProjectAlterationListListener) {
        var url = Code.URL_GET_X_PROJECT_ALTERATION_LIST;

        Connect_Http.httpDatas(type, url, options, function getBackListener(success, obj, strErro) {
            if (success) {
                getXProjectAlterationListListener(true, obj.data, '')
            } else {
                getXProjectAlterationListListener(false, '', strErro)
            }
        });
    },
    getXProjectAlterationDetails: function (type, id, getXProjectAlterationDetailsListener) {
        var url = Code.URL_GET_X_PROJECT_ALTERATION_DETAILS;
        var postData = {
            横向项目变更编号: id,
        }
        Connect_Http.httpDatas(type, url, postData, function getBackListener(success, obj, strErro) {
            if (success) {
                getXProjectAlterationDetailsListener(true, obj.data, '')
            } else {
                getXProjectAlterationDetailsListener(false, '', strErro)
            }
        });
    },
    addXProjectAlteration: function (type, options, addXProjectAlterationListener) {
        var url = Code.URL_POST_ADD_X_PROJECT_ALTERATION;

        Connect_Http.httpDatas(type, url, options, function getBackListener(success, obj, strErro) {
            if (success) {
                addXProjectAlterationListener(true, obj, '')
            } else {
                addXProjectAlterationListener(false, '', strErro)
            }
        });
    },
    editXProjectAlteration: function (type, options, editXProjectAlterationListener) {
        var url = Code.URL_POST_EDIT_X_PROJECT_ALTERATION;

        Connect_Http.httpDatas(type, url, options, function getBackListener(success, obj, strErro) {
            if (success) {
                editXProjectAlterationListener(true, obj, '')
            } else {
                editXProjectAlterationListener(false, '', strErro)
            }
        });
    },
    auditXProjectAlteration: function (type, options, auditXProjectAlterationListener) {
        var url = Code.URL_POST_AUDIT_X_PROJECT_ALTERATION;

        Connect_Http.httpDatas(type, url, options, function getBackListener(success, obj, strErro) {
            if (success) {
                auditXProjectAlterationListener(true, obj, '')
            } else {
                auditXProjectAlterationListener(false, '', strErro)
            }
        });
    },
    getXProjectConclusionList: function (type, options, getXProjectConclusionListListener) {
        var url = Code.URL_GET_X_PROJECT_CONCLUSION_LIST;

        Connect_Http.httpDatas(type, url, options, function getBackListener(success, obj, strErro) {
            if (success) {
                getXProjectConclusionListListener(true, obj.data, '')
            } else {
                getXProjectConclusionListListener(false, '', strErro)
            }
        });
    },
    getXProjectConclusionDetails: function (type, id, getXProjectConclusionDetailsListener) {
        var url = Code.URL_GET_X_PROJECT_CONCLUSION_DETAILS;
        var postData = {
            横向项目结题编号: id
        }
        Connect_Http.httpDatas(type, url, postData, function getBackListener(success, obj, strErro) {
            if (success) {
                getXProjectConclusionDetailsListener(true, obj.data, '')
            } else {
                getXProjectConclusionDetailsListener(false, '', strErro)
            }
        });
    },
    addXProjectConclusion: function (type, options, addXProjectConclusionListener) {
        var url = Code.URL_POST_ADD_X_PROJECT_CONCLUSION;

        Connect_Http.httpDatas(type, url, options, function getBackListener(success, obj, strErro) {
            if (success) {
                addXProjectConclusionListener(true, obj, '')
            } else {
                addXProjectConclusionListener(false, '', strErro)
            }
        });
    },
    editXProjectConclusion: function (type, options, editXProjectConclusionListener) {
        var url = Code.URL_POST_EDIT_X_PROJECT_CONCLUSION;

        Connect_Http.httpDatas(type, url, options, function getBackListener(success, obj, strErro) {
            if (success) {
                editXProjectConclusionListener(true, obj, '')
            } else {
                editXProjectConclusionListener(false, '', strErro)
            }
        });
    },
}

//经费到账
var FundsIncoming = {
    getYFundsIncomingTotalList: function (type, options, getYFundsIncomingTotalListListener) {
        var url = Code.URL_GET_Y_FUNDS_INCOMING_TOTAL_LIST;

        Connect_Http.httpDatas(type, url, options, function getBackListener(success, obj, strErro) {
            if (success) {
                getYFundsIncomingTotalListListener(true, obj.data, '')
            } else {
                getYFundsIncomingTotalListListener(false, '', strErro)
            }
        });
    },
    getYFundsIncomingPagingList: function (type, options, getYFundsIncomingPagingListListener) {
        var url = Code.URL_GET_Y_FUNDS_INCOMING_PAGING_LIST;

        Connect_Http.httpDatas(type, url, options, function getBackListener(success, obj, strErro) {
            if (success) {
                getYFundsIncomingPagingListListener(true, obj.data, '')
            } else {
                getYFundsIncomingPagingListListener(false, '', strErro)
            }
        });
    },
    getYFundsIncomingList: function (type, id, getYFundsIncomingListListener) {
        var url = Code.URL_GET_Y_FUNDS_INCOMING_LIST;
        var postData = {
            纵向项目立项编号: id
        }

        Connect_Http.httpDatas(type, url, postData, function getBackListener(success, obj, strErro) {
            if (success) {
                getYFundsIncomingListListener(true, obj.data, '')
            } else {
                getYFundsIncomingListListener(false, '', strErro)
            }
        });
    },
    getYFundsIncomingDetails: function (type, id, getYFundsIncomingDetailsListener) {
        var url = Code.URL_GET_Y_FUNDS_INCOMING_DETAILS;
        var postData = {
            纵向项目到账编号: id
        }

        Connect_Http.httpDatas(type, url, postData, function getBackListener(success, obj, strErro) {
            if (success) {
                getYFundsIncomingDetailsListener(true, obj.data, '')
            } else {
                getYFundsIncomingDetailsListener(false, '', strErro)
            }
        });
    },
    addYFundsIncoming: function (type, options, addYFundsIncomingListener) {
        var url = Code.URL_POST_ADD_Y_FUNDS_INCOMING;

        Connect_Http.httpDatas(type, url, options, function getBackListener(success, obj, strErro) {
            if (success) {
                addYFundsIncomingListener(true, obj, '')
            } else {
                addYFundsIncomingListener(false, '', strErro)
            }
        });
    },
    editYFundsIncoming: function (type, options, editYFundsIncomingListener) {
        var url = Code.URL_POST_EDIT_Y_FUNDS_INCOMING;

        Connect_Http.httpDatas(type, url, options, function getBackListener(success, obj, strErro) {
            if (success) {
                editYFundsIncomingListener(true, obj, '')
            } else {
                editYFundsIncomingListener(false, '', strErro)
            }
        });
    },
    getXFundsIncomingTotalList: function (type, options, getXFundsIncomingTotalListListener) {
        var url = Code.URL_GET_X_FUNDS_INCOMING_TOTAL_LIST;

        Connect_Http.httpDatas(type, url, options, function getBackListener(success, obj, strErro) {
            if (success) {
                getXFundsIncomingTotalListListener(true, obj.data, '')
            } else {
                getXFundsIncomingTotalListListener(false, '', strErro)
            }
        });
    },
    getXFundsIncomingPagingList: function (type, options, getXFundsIncomingPagingListListener) {
        var url = Code.URL_GET_X_FUNDS_INCOMING_PAGING_LIST;

        Connect_Http.httpDatas(type, url, options, function getBackListener(success, obj, strErro) {
            if (success) {
                getXFundsIncomingPagingListListener(true, obj.data, '')
            } else {
                getXFundsIncomingPagingListListener(false, '', strErro)
            }
        });
    },
    getXFundsIncomingList: function (type, id, getXFundsIncomingListListener) {
        var url = Code.URL_GET_X_FUNDS_INCOMING_LIST;
        var postData = {
            横向项目编号: id
        }

        Connect_Http.httpDatas(type, url, postData, function getBackListener(success, obj, strErro) {
            if (success) {
                getXFundsIncomingListListener(true, obj.data, '')
            } else {
                getXFundsIncomingListListener(false, '', strErro)
            }
        });
    },
    getXFundsIncomingDetails: function (type, id, getXFundsIncomingDetailsListener) {
        var url = Code.URL_GET_X_FUNDS_INCOMING_DETAILS;
        var postData = {
            横向项目到账编号: id
        }

        Connect_Http.httpDatas(type, url, postData, function getBackListener(success, obj, strErro) {
            if (success) {
                getXFundsIncomingDetailsListener(true, obj.data, '')
            } else {
                getXFundsIncomingDetailsListener(false, '', strErro)
            }
        });
    },
    addXFundsIncoming: function (type, options, addXFundsIncomingListener) {
        var url = Code.URL_POST_ADD_X_FUNDS_INCOMING;

        Connect_Http.httpDatas(type, url, options, function getBackListener(success, obj, strErro) {
            if (success) {
                addXFundsIncomingListener(true, obj, '')
            } else {
                addXFundsIncomingListener(false, '', strErro)
            }
        });
    },
    editXFundsIncoming: function (type, options, editXFundsIncomingListener) {
        var url = Code.URL_POST_EDIT_X_FUNDS_INCOMING;

        Connect_Http.httpDatas(type, url, options, function getBackListener(success, obj, strErro) {
            if (success) {
                editXFundsIncomingListener(true, obj, '')
            } else {
                editXFundsIncomingListener(false, '', strErro)
            }
        });
    },

}

//经费报销
var FundsReimbursement = {
    getYFundsReimbursementTotalList: function (type, options, getYFundsReimbursementTotalListListener) {
        var url = Code.URL_GET_Y_FUNDS_REIMBURSEMENT_TOTAL_LIST;

        Connect_Http.httpDatas(type, url, options, function getBackListener(success, obj, strErro) {
            if (success) {
                getYFundsReimbursementTotalListListener(true, obj.data, '')
            } else {
                getYFundsReimbursementTotalListListener(false, '', strErro)
            }
        });
    },
    getYFundsReimbursementList: function (type, id, getYFundsReimbursementListListener) {
        var url = Code.URL_GET_Y_FUNDS_REIMBURSEMENT_LIST;
        var postData = {
            纵向项目立项编号: id
        }

        Connect_Http.httpDatas(type, url, postData, function getBackListener(success, obj, strErro) {
            if (success) {
                getYFundsReimbursementListListener(true, obj.data, '')
            } else {
                getYFundsReimbursementListListener(false, '', strErro)
            }
        });
    },
    getFundsReimbursementDetails: function (type, id, getFundsReimbursementDetailsListener) {
        var url = Code.URL_GET_FUNDS_REIMBURSEMENT_DETAILS;
        var postData = {
            报销编号: id
        }

        Connect_Http.httpDatas(type, url, postData, function getBackListener(success, obj, strErro) {
            if (success) {
                getFundsReimbursementDetailsListener(true, obj.data, '')
            } else {
                getFundsReimbursementDetailsListener(false, '', strErro)
            }
        });
    },
    getYFundsReimbursementDetails: function (type, id, getYFundsReimbursementDetailsListener) {
        var url = Code.URL_GET_Y_FUNDS_REIMBURSEMENT_DETAILS;
        var postData = {
            纵向项目立项编号: id
        }

        Connect_Http.httpDatas(type, url, postData, function getBackListener(success, obj, strErro) {
            if (success) {
                getYFundsReimbursementDetailsListener(true, obj.data, '')
            } else {
                getYFundsReimbursementDetailsListener(false, '', strErro)
            }
        });
    },
    addYFundsReimbursement: function (type, options, addYFundsReimbursementListener) {
        var url = Code.URL_POST_ADD_Y_FUNDS_REIMBURSEMENT;

        Connect_Http.httpDatas(type, url, options, function getBackListener(success, obj, strErro) {
            if (success) {
                addYFundsReimbursementListener(true, obj, '')
            } else {
                addYFundsReimbursementListener(false, '', strErro)
            }
        });
    },
    editFundsReimbursement: function (type, options, editFundsReimbursementListener) {
        var url = Code.URL_POST_EDIT_FUNDS_REIMBURSEMENT;

        Connect_Http.httpDatas(type, url, options, function getBackListener(success, obj, strErro) {
            if (success) {
                editFundsReimbursementListener(true, obj, '')
            } else {
                editFundsReimbursementListener(false, '', strErro)
            }
        });
    },
    getXFundsReimbursementTotalList: function (type, options, getXFundsReimbursementTotalListListener) {
        var url = Code.URL_GET_X_FUNDS_REIMBURSEMENT_TOTAL_LIST;

        Connect_Http.httpDatas(type, url, options, function getBackListener(success, obj, strErro) {
            if (success) {
                getXFundsReimbursementTotalListListener(true, obj.data, '')
            } else {
                getXFundsReimbursementTotalListListener(false, '', strErro)
            }
        });
    },
    getXFundsReimbursementList: function (type, id, getXFundsReimbursementListListener) {
        var url = Code.URL_GET_X_FUNDS_REIMBURSEMENT_LIST;
        var postData = {
            横向项目编号: id
        }

        Connect_Http.httpDatas(type, url, postData, function getBackListener(success, obj, strErro) {
            if (success) {
                getXFundsReimbursementListListener(true, obj.data, '')
            } else {
                getXFundsReimbursementListListener(false, '', strErro)
            }
        });
    },
    getXFundsReimbursementDetails: function (type, id, getXFundsReimbursementDetailsListener) {
        var url = Code.URL_GET_X_FUNDS_REIMBURSEMENT_DETAILS;
        var postData = {
            横向项目编号: id
        }

        Connect_Http.httpDatas(type, url, postData, function getBackListener(success, obj, strErro) {
            if (success) {
                getXFundsReimbursementDetailsListener(true, obj.data, '')
            } else {
                getXFundsReimbursementDetailsListener(false, '', strErro)
            }
        });
    },
    addXFundsReimbursement: function (type, options, addXFundsReimbursementListener) {
        var url = Code.URL_POST_ADD_X_FUNDS_REIMBURSEMENT;

        Connect_Http.httpDatas(type, url, options, function getBackListener(success, obj, strErro) {
            if (success) {
                addXFundsReimbursementListener(true, obj, '')
            } else {
                addXFundsReimbursementListener(false, '', strErro)
            }
        });
    },
    getMeetingFundsReimbursementTotalList: function (type, options, getMeetingFundsReimbursementTotalListListener) {
        var url = Code.URL_GET_MEETING_FUNDS_REIMBURSEMENT_TOTAL_LIST;

        Connect_Http.httpDatas(type, url, options, function getBackListener(success, obj, strErro) {
            if (success) {
                getMeetingFundsReimbursementTotalListListener(true, obj.data, '')
            } else {
                getMeetingFundsReimbursementTotalListListener(false, '', strErro)
            }
        });
    },
    getMeetingFundsReimbursementList: function (type, id, getMeetingFundsReimbursementListListener) {
        var url = Code.URL_GET_MEETING_FUNDS_REIMBURSEMENT_LIST;
        var postData = {
            参加会议编号: id
        }

        Connect_Http.httpDatas(type, url, postData, function getBackListener(success, obj, strErro) {
            if (success) {
                getMeetingFundsReimbursementListListener(true, obj.data, '')
            } else {
                getMeetingFundsReimbursementListListener(false, '', strErro)
            }
        });
    },
    getMeetingFundsReimbursementDetails: function (type, id, getMeetingFundsReimbursementDetailsListener) {
        var url = Code.URL_GET_MEETING_FUNDS_REIMBURSEMENT_DETAILS;
        var postData = {
            参加会议编号: id
        }

        Connect_Http.httpDatas(type, url, postData, function getBackListener(success, obj, strErro) {
            if (success) {
                getMeetingFundsReimbursementDetailsListener(true, obj.data, '')
            } else {
                getMeetingFundsReimbursementDetailsListener(false, '', strErro)
            }
        });
    },
    addMeetingFundsReimbursement: function (type, options, addMeetingFundsReimbursementListener) {
        var url = Code.URL_POST_ADD_MEETING_FUNDS_REIMBURSEMENT;

        Connect_Http.httpDatas(type, url, options, function getBackListener(success, obj, strErro) {
            if (success) {
                addMeetingFundsReimbursementListener(true, obj, '')
            } else {
                addMeetingFundsReimbursementListener(false, '', strErro)
            }
        });
    },
    editMeetingFundsReimbursement: function (type, options, editMeetingFundsReimbursementListener) {
        var url = Code.URL_POST_EDIT_MEETING_FUNDS_REIMBURSEMENT;

        Connect_Http.httpDatas(type, url, options, function getBackListener(success, obj, strErro) {
            if (success) {
                editMeetingFundsReimbursementListener(true, obj, '')
            } else {
                editMeetingFundsReimbursementListener(false, '', strErro)
            }
        });
    },
}


