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
                <el-table-column prop="备注" label="说明">
                    <template slot-scope="scope">
                        <p class="explain">{{scope.row.备注}}</p>
                    </template>
                </el-table-column>
                <el-table-column label="是否启用" property="是否启用" align="center" width="150">
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
                        <el-button type="text" size="small" @click="btnDetails(scope.row)">详情</el-button>
                    </template>
                </el-table-column>
            </el-table>
        </div>
        <el-dialog :title="title" :visible.sync="isAddDialog" width="30%" v-if='isAddDialog' :close-on-click-modal="false">
            <div v-if="isDetails">
                <ServiceDetails ref="child" @myEvent="closeDialog" :item="item"></ServiceDetails>
            </div>
            <div v-else>
                <AddService ref="child" @myEvent="getMyEvent" :item="item" :isAddDialog="isAddDialog"
                            :isAdd="isAdd"></AddService>
            </div>

        </el-dialog>
    </div>
</template>
<script>
    import {URL_SERVICE} from "@/assets/js/connect/ConSysUrl";
    import AddService from "@/components/service/AddService"
    import ServiceDetails from "@/components/service/ServiceDetails"

    export default {
        name: 'Service',
        components: {
            AddService,
            ServiceDetails
        },
        data() {
            return {
                tableData: [],
                total: '',
                title: '添加服务',
                isAdd: true,
                isAddDialog: false,
                isDetails: false,
                item: {}
            }
        },
        mounted() {
            this.getService();
        },
        methods: {
            getService: async function () {
                this.tableData = await this.$http.myGet(URL_SERVICE.GET_SERVICE_ALL, '');
                this.total = this.tableData.length;
            },
            getMyEvent(val) {
                this.getService();
                this.closeDialog(val);
            },
            closeDialog(val) {
                this.isAddDialog = val;
            },
            btnAdd() {
                this.title = '添加服务';
                this.isAdd = true;
                this.isAddDialog = true;
                this.isDetails = false;
            },
            btnEdit(data) {
                this.title = '修改服务';
                this.isAdd = false;
                this.item = data;
                this.isAddDialog = true;
                this.isDetails = false;
            },
            btnDetails(data) {
                this.title = '服务详情';
                this.isDetails = true;
                this.item = data;
                this.isAddDialog = true;
            },
            disableService: async function (el) {
                let data = {
                    编号: el.编号
                }
                await this.$http.myPost(URL_SERVICE.POST_DISABLE_SERVICE, data);
                this.$message.success('禁用成功！');
            },
            enableService: async function (el) {
                let data = {
                    编号: el.编号
                }
                await this.$http.myPost(URL_SERVICE.POST_ENABLE_SERVICE, data);
                this.$message.success('启用成功！');
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

    .el-table td p {
        display: -webkit-box !important;
        overflow: hidden;
        text-overflow: ellipsis;
        word-break: break-all;
        -webkit-box-orient: vertical;
        -webkit-line-clamp: 3;
        margin: 0;
    }
</style>
