<template>
    <div class="hospital-service">
        <el-form label-width="100px" size="small">
            <el-form-item label="医院名称：">
                <span>{{item.名称}}</span>
            </el-form-item>
            <el-form-item label="服务：">
                <el-checkbox-group v-model="checkedList">
                    <el-checkbox name="service" v-for="el in serviceList" :label="el.服务编号" :key="el.服务编号"
                                 :disabled="!el.是否启用" @change="handleCheckedChanges(el, $event)">{{el.服务名称}}
                        <div v-show="el.是否启用 && el.isChecked">
                            <el-input v-model="el.电脑链接地址" maxLength="500">
                                <template slot="prepend">电脑链接地址</template>
                            </el-input>
                            <el-input v-model="el.手机链接地址" maxLength="500">
                                <template slot="prepend">手机链接地址</template>
                            </el-input>
                            <el-input v-model="el.登录账号" maxLength="50"
                                      @keydown.native="account($event,el)" placeholder="只能为中文、字母、数字">
                                <template slot="prepend">登录账号</template>
                            </el-input>
                            <el-input v-model="el.登录密码" class="passwordInput" :type="el.pwType" maxLength="50">
                                <template slot="prepend">登录密码</template>
                            </el-input>
                            <a href="#" class="bgImg" @click="changeType(el)" v-show="el.登录密码">
                                <i v-if="el.pwType=='text'" class="icon iconfont icon-in_zhengyan"></i>
                                <i v-else class="icon iconfont icon-biyan1"></i>
                            </a>
                        </div>
                    </el-checkbox>
                </el-checkbox-group>
            </el-form-item>
        </el-form>
        <div slot="footer" class="dialog-footer">
            <el-button @click="cancelHandler">取 消</el-button>
            <el-button type="primary" @click="confirmHandler">确 定</el-button>
        </div>
    </div>
</template>
<script>
    import {URL_HOSPITAL, URL_SERVICE} from "../../assets/js/connect/ConSysUrl";
    import {matchingProperty, _debounce} from "../../assets/js/Common";

    export default {
        name: 'HospitalService',
        props: ['item'],
        data() {
            return {
                serviceList: [],
                hospitalService: [],
                checkedList: [],
            }
        },
        mounted() {
            this.getHospitalService();
        },
        methods: {
            account: _debounce(function (e, el) {
                el.登录账号 = el.登录账号.replace(/[^\w\u4E00-\u9FA5]/g, '');
            }, 300),
            changeType(el) {
                el.pwType = el.pwType === 'password' ? 'text' : 'password';
            },
            getHospitalService: async function () {
                let postData = {
                    医院编号: this.item.编号,
                }
                let data = await this.$http.myGet(URL_HOSPITAL.GET_HOSPITAL_SERVICE, postData);
                for (let elem  of data.values()) {
                    this.checkedList.push(elem.服务编号);
                }
                this.hospitalService = data;
                this.getService();
            },
            getService: async function () {
                let data = await this.$http.myGet(URL_SERVICE.GET_SERVICE_ALL, '');
                for (let elem  of data.values()) {
                    let item = {
                        编号: 0,
                        医院编号: this.item.编号,
                        医院名称: this.item.名称,
                        服务编号: elem.编号,
                        服务名称: elem.名称,
                        电脑链接地址: '',
                        手机链接地址: '',
                        是否启用: elem.是否启用,
                        登录账号: elem.登录账号,
                        登录密码: elem.登录密码,
                        pwType: 'password',
                        isChecked: false
                    }
                    this.hospitalService.forEach(function (el) {
                        if (item.服务编号 == el.服务编号) {
                            item = matchingProperty(item, el);
                            item.isChecked = true;
                            return false;
                        }
                    });
                    this.serviceList.push(item);
                }
            },
            handleCheckedChanges(el, state) {
                if (state) {
                    el.isChecked = true;
                } else {
                    el.isChecked = false;
                }
            },
            cancelHandler() {
                this.$emit('myEvent', false);
            },
            confirmHandler: _debounce(function () {
                let list = [];
                let isNext = true;
                for (let item  of this.serviceList.values()) {
                    if (item.isChecked) {
                        let data = {
                            编号: item.编号,
                            医院编号: item.医院编号,
                            服务编号: item.服务编号,
                            电脑链接地址: item.电脑链接地址,
                            手机链接地址: item.手机链接地址,
                            登录账号: item.登录账号,
                            登录密码: item.登录密码,
                        }
                        if (item.电脑链接地址 == '' || item.手机链接地址 == '') {

                            isNext = false;
                            this.$message.error('【电脑链接地址】或【手机链接地址】不能为空！');
                            break;
                        }
                        list.push(data);
                    }
                }
                if (isNext) {
                    let postData = {
                        Id: this.item.编号,
                        List: list
                    }
                    this.addOrEditHospitalService(postData);
                }
            }, 300),
            addOrEditHospitalService: async function (data) {
                await this.$http.myPost(URL_HOSPITAL.POST_ADD_OR_EDIT_HOSPITAL_SERVICE, data);
                this.$message.success('提交成功！');
                this.$emit('myEvent', false);
            }
        }
    }
</script>
<style lang="less" type='text/less'>
    @import '../../assets/less/Variable';

    .hospital-service {
        .el-checkbox__label {
            margin-left: 10px;
        }

        .el-checkbox + .el-checkbox {
            margin-left: 0;
            position: relative;
        }

        .el-checkbox {
            margin-bottom: 10px;
            width: 95%;
            position: relative;
        }

        .el-input {
            display: table;
            margin-bottom: 5px;
        }

        .el-checkbox__input {
            position: absolute;
            left: 0;
            top: 7px;
        }

        .el-input-group__append, .el-input-group__prepend {
            padding: 0 10px;
        }

        span.el-checkbox__label {
            width: 95%;
        }

        .passwordInput .el-input__inner {
            padding: 0 35px 0 15px;
        }

        .bgImg {
            position: absolute;
            bottom: 8px;
            right: 5%;
            color: @colorActive;
        }
    }
</style>
<style lang="less" type='text/less' scoped>
    @import '../../assets/less/News';
</style>
