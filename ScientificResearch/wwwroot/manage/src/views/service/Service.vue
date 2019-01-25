<template>
    <div class="page-news page-common">
        <div class="main wrapper">
            <h4 class="title">服务列表 Services</h4>
            <el-button type="primary" class="btn-add" @click="btnAdd"><i
                    class="el-icon-circle-plus-outline"></i> 添加服务
            </el-button>

            <el-table class="tableone" border :data="tableData" stripe :header-cell-style="{'text-align':'center'}">
                <el-table-column label="序号" type="index" show-overflow-tooltip width="50"
                                 align="center"></el-table-column>
                <el-table-column prop="名称" label="名称"></el-table-column>
                <el-table-column prop="编号" label="编号" align="center" width="100"></el-table-column>
                <el-table-column prop="备注" label="备注"></el-table-column>
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
                        <el-button type="text" size="small" @click="btnEdit(scope.row)">编辑</el-button>
                    </template>
                </el-table-column>
            </el-table>
        </div>
        <el-dialog :title="title" :visible.sync="isAddDialog" width="30%"  v-if='isAddDialog'>
            <AddService ref="child" @myEvent="getMyEvent" :data="item" :isAddDialog="isAddDialog"
                         :isAdd="isAdd"></AddService>
        </el-dialog>
    </div>
</template>
<script>
    import {Service} from "@/assets/js/connect/ReturnData";
    import AddService from "@/views/service/AddService"

    export default {
        name: 'Service',
        components: {
            AddService,
        },
        data() {
            return {
                tableData: [],
                total: '',
                title: '添加服务',
                isAdd: true,
                isAddDialog: false,
                item: {}
            }
        },

        mounted() {
            this.getService();
        },

        methods: {
            getService: async function () {
                Service.getServiceList('get', '', (success, strErro, obj) => {
                    if (success) {
                        this.tableData = obj.data;
                        this.total = obj.data.length;
                    }
                });
            },
            getMyEvent(val) {
                this.getService();
                this.isAddDialog = val;
            },
            btnAdd() {
                this.title = '添加服务';
                this.isAdd = true;
                this.isAddDialog = true;
            },
            btnEdit(data) {
                this.title = '修改服务';
                this.isAdd = false;
                this.item = data;
                this.isAddDialog = true;
            },
            disableService: async function (el) {
                let data = {
                    编号: el.编号
                }
                Service.disableService('post', data, (success, strErro, obj) => {
                    if (success) {
                        this.$message.success('禁用成功！');
                    } else {
                        el.是否启用 = !el.是否启用;
                    }
                })
            },
            enableService: async function (el) {
                let data = {
                    编号: el.编号
                }
                Service.enableService('post', data, (success, strErro, obj) => {
                    if (success) {
                        this.$message.success('启用成功！');
                    } else {
                        el.是否启用 = !el.是否启用;
                    }
                })
            },
            switchChange(el) {
                let title = '启用';
                if (el.是否启用) {
                    title = '启用';
                } else {
                    title = '禁用';
                }
                this.enableDisableService(title, el);
            },
            enableDisableService(title, el) {
                this.$confirm('您确定要【' + title + '】此服务吗', '提示', {
                    confirmButtonText: '确定',
                    cancelButtonText: '取消',
                    type: 'warning'
                }).then(() => {
                    if (el.是否启用) {
                        this.enableService(el);
                    } else {
                        this.disableService(el);
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
