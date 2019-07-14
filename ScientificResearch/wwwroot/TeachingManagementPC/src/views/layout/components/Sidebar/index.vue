<template>
  <div class="has-logo">
    <logo :collapse="isCollapse"/>
    <el-scrollbar wrap-class="scrollbar-wrapper">
      <el-menu
        :default-active="$route.path"
        :collapse="isCollapse"
        :background-color="variables.menuBg"
        :text-color="variables.menuText"
        :active-text-color="variables.menuActiveText"
        :collapse-transition="false"
        mode="vertical"
      >
        <SidebarItem v-for="(item,index) in list" :key="item.菜单.编号" :item="item" :index="index.toString()"
                     :base-path="item.菜单.PC端组件名"></SidebarItem>
      </el-menu>
    </el-scrollbar>
  </div>
</template>

<script>
  import { mapGetters } from 'vuex';
  import Logo from './Logo';
  import variables from '@/styles/variables.scss';
  import SidebarItem from './SidebarItem';
  import { URL_USER } from '@/assets/js/connect/ConSysUrl';

  export default {
    components: { SidebarItem, Logo },
    computed: {
      ...mapGetters([
        'sidebar'
      ]),
      routes() {
        return this.$router.options.routes;
      },
      variables() {
        return variables;
      },
      isCollapse() {
        return !this.sidebar.opened;
      }
    },
    data() {
      return {
        list: []
      };
    },
    mounted() {
      this.getList();
    },
    methods: {
      getList: async function() {
        let data = await this.$http.myGet(URL_USER.GET_MENU_LIST, '');
        if (data && data.length > 0) {
          let item = {
            菜单: {
              PC端组件名: '',
              名称: '首页',
              图标: 'home'
            },
            子级菜单: []
          };
          data.unshift(item);
          this.list = data;
        } else {
          this.list = [];
        }
      }
    }
  };
</script>
