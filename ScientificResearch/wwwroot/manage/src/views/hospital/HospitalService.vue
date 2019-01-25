<template>
    <div class="hospital-service">
        <el-form ref="form" :model="form" label-width="100px" size="small">
            <el-form-item label="医院名称">
                <p></p>
            </el-form-item>
            <el-form-item label="服务">
                <el-checkbox-group v-model="hospitalService">
                    <el-checkbox name="service" v-for="el in serviceList" :key="el.编号" :disabled="!el.是否启用">{{el.名称}}
                        <el-input v-model="form.链接地址" :disabled="!el.是否启用"></el-input>
                    </el-checkbox>
                </el-checkbox-group>
            </el-form-item>
            <el-form-item label="链接地址" prop="链接地址">
                <el-input v-model="form.链接地址"></el-input>
            </el-form-item>
        </el-form>
        <div slot="footer" class="dialog-footer">
            <el-button @click="cancelHandler">取 消</el-button>
            <el-button type="primary" @click="confirmHandler">确 定</el-button>
        </div>
    </div>
</template>
<script>
    import {Hospital, Service} from "@/assets/js/connect/ReturnData";

    export default {
        name: 'HospitalService',
        props: ['data'],
        data() {
            return {
                serviceList: [],
                hospitalService: [],
                item: {},
                form: {
                    编号: 0,
                    医院编号: 0,
                    服务编号: 0,
                    链接地址: '',
                }
            }
        },

        mounted() {
            this.item = this.data;
            this.getHospitalService();
            this.getService();
        },

        methods: {
            getHospitalService: async function () {
                let name
                if (localStorage.myUserInfo) {
                    name = JSON.parse(localStorage.getItem('myUserInfo')).人员.DbKey;
                }
                Hospital.getHospitalService('get', name, (success, strErro, obj) => {
                    if (success) {
                        this.hospitalService = obj.data;
                    }
                })
            },
            getService: async function () {
                Service.getServiceList('get', '', (success, strErro, obj) => {
                    if (success) {
                        obj = obj.data;
                        // for (let index of obj.keys()) {
                        //     obj.
                        // }
                        this.serviceList = obj;

                    }
                });
            },
            cancelHandler() {
                this.$emit('myEvent', false);
            },
            confirmHandler() {
                Hospital.addOrEditHospitalService('post', this.form, (success, strErro, obj) => {
                    if (success) {
                        this.$message.success('提交成功！');
                        this.$emit('myEvent', false);
                    }
                });
            }
        }
    }
</script>
<style lang="less" type='text/less'>
    .hospital-service {
        .el-checkbox + .el-checkbox {
            margin-left: 0;
        }

        .el-input {
            display: block;
        }
    }
</style>
<style lang="less" type='text/less' scoped>
    @import '../../assets/less/News';
</style>
