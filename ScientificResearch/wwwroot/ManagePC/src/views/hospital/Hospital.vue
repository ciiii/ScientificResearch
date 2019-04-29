<template>
    <div class="hospital page-common">
        <div class="main wrapper">
            <h4 class="title" ref="title">医院 Hospital</h4>
            <el-button type="primary" class="btn-add" @click="btnAdd">
                <i class="el-icon-circle-plus-outline"></i> 添加医院
            </el-button>
            <el-table class="tableone" border :data="tableData" stripe
                      :header-cell-style="{'text-align':'center'}">
                <el-table-column label="序号" type="index" show-overflow-tooltip width="50"
                                 align="center"></el-table-column>
                <el-table-column prop="名称" label="名称"></el-table-column>
                <el-table-column prop="代码" label="代码" align="center"></el-table-column>
                <el-table-column prop="联系人" label="联系人" align="center"></el-table-column>
                <el-table-column prop="联系电话" label="联系电话" align="center"></el-table-column>
                <el-table-column prop="地址" label="地址" align="center"></el-table-column>
                <el-table-column label="是否启用" property="是否启用" align="center">
                    <template slot-scope="scope">
                        <el-switch class="switch"
                                   style="display: block"
                                   v-model="scope.row.是否启用"
                                   active-color="#13ce66"
                                   inactive-color="#ff4949"
                                   @change="switchChange(scope.row)"
                                   active-text="启用">
                        </el-switch>
                    </template>
                </el-table-column>
                <el-table-column label="操作" align="center" width="100">
                    <template slot-scope="scope">
                        <el-button type="text" size="small" @click="btnService(scope.row)">服务</el-button>
                        <el-button type="text" size="small" @click="btnEdit(scope.row)">编辑
                        </el-button>
                    </template>
                </el-table-column>
            </el-table>
        </div>
        <el-dialog :title="title" :visible.sync="isAddDialog" width="30%" v-if='isAddDialog' :close-on-click-modal="false">
            <div v-if="!isService">
                <AddHospital ref="child" @myEvent="getMyEvent" :item="item" :isAdd="isAdd"></AddHospital>
            </div>
            <div v-else>
                <HospitalService ref="child" @myEvent="getMyEvent" :item="item" ></HospitalService>
            </div>
        </el-dialog>
    </div>
</template>
<script>
    import {URL_HOSPITAL} from "@/assets/js/connect/ConSysUrl";
    import AddHospital from "@/components/hospital/AddHospital";
    import HospitalService from "@/components/hospital/HospitalService";

    export default {
        name: 'Hospital',
        components: {
            AddHospital,
            HospitalService
        },
        data() {
            return {
                tableData: [],
                total: '',
                title: '添加医院',
                isAdd: true,
                isAddDialog: false,
                item: {},
                isService: false,
            }
        },
        mounted() {
            this.getHospital();
        },
        methods: {
            getHospital: async function () {
                this.tableData = await this.$http.myGet(URL_HOSPITAL.GET_HOSPITAL_ALL, '');
            },
            getMyEvent(val) {
                this.getHospital();
                this.isAddDialog = val;
            },
            btnAdd() {
                this.title = '添加医院';
                this.isAdd = true;
                this.isService = false;
                this.isAddDialog = true;

            },
            btnEdit(data) {
                this.title = '修改医院';
                this.isAdd = false;
                this.item = data;
                this.isService = false;
                this.isAddDialog = true;
            },
            btnService(data) {
                this.title = '服务订购';
                this.isService = true;
                this.item = data;
                this.isAddDialog = true;
            },
            disableHospital: async function (el) {
                let data = {
                    编号: el.编号
                }
                await this.$http.myPost(URL_HOSPITAL.POST_DISABLE_HOSPITA, data);
                this.$message.success('禁用成功！');
            },
            enableHospital: async function (el) {
                let data = {
                    编号: el.编号
                }
                await this.$http.myPost(URL_HOSPITAL.POST_ENABLE_HOSPITA, data);
                this.$message.success('启用成功！');
            },
            switchChange(el) {
                let title = '启用';
                if (el.是否启用) {
                    title = '启用';
                } else {
                    title = '禁用';
                }
                this.enableDisableHospita(title, el);
            },
            enableDisableHospita(title, el) {
                this.$confirm('您确定要【' + title + '】此医院吗', '提示', {
                    confirmButtonText: '确定',
                    cancelButtonText: '取消',
                    type: 'warning'
                }).then(() => {
                    if (el.是否启用) {
                        this.enableHospital(el);
                    } else {
                        this.disableHospital(el);
                    }
                }).catch(() => {
                    el.是否启用 = !el.是否启用;
                });
            }

        }
    }
</script>
<style lang="less" type='text/less' scoped>
    .el-switch {
        height: 23px;
    }
</style>
