<template>
  <div class="menu-wrapper">
    <template
      v-if="hasOneShowingChild(item.子级菜单,item) && (!onlyOneChild.子级菜单||onlyOneChild.noShowingChildren)">
      <!--<app-link :to="item.菜单.PC端组件名">-->
      <el-menu-item :index="index" :class="isNest(item.子级菜单)" @click="openPage(item.菜单.PC端组件名)">
        <item :meta="getMeta(item)"/>
      </el-menu-item>
      <!--</app-link>-->
    </template>

    <el-submenu v-else ref="subMenu" :index="index" popper-append-to-body>
      <template slot="title">
        <item :meta="getMeta(item)"/>
      </template>
      <sidebar-item
        v-for="(child,childIndex) in item.子级菜单"
        :is-nest="true"
        :item="child"
        :key="child.菜单.名称"
        :index="index+'-'+childIndex"
        :base-path="resolvePath(child.菜单.PC端组件名)"
        class="nest-menu"/>
    </el-submenu>
  </div>
</template>

<script>
  import path from 'path';
  import { isExternal } from '@/utils/validate';
  import { getObjArr } from '@/assets/js/Common';
  import Item from './Item';
  import AppLink from './Link';

  export default {
    name: 'SidebarItem',
    components: { Item, AppLink },
    props: {
      item: {
        type: Object,
        required: true
      },
      basePath: {
        type: String,
        default: ''
      },
      index: {
        type: String,
        default: ''
      }
    },
    data() {
      // To fix https://github.com/PanJiaChen/vue-admin-template/issues/237
      // TODO: refactor with render function
      this.onlyOneChild = null;
      return {
        newItem: {}
      };
    },
    mounted() {

    },
    methods: {
      getMeta(item) {
        let mate = {
          title: item.菜单.名称,
          icon: item.菜单.图标
        };
        return mate;
      },
      openPage(url) {
        if (localStorage.getItem('userInfo')) {
          if (getObjArr('userInfo').人员.编号 != sessionStorage.mUserId) {
            this.$router.push({ path: '/' });
          } else {
            this.$router.push({ path: ('/' + url) });
          }
        }
      },
      isNest(children) {
        if (children && children != []) {
          return '';
        } else {
          return 'submenu-title-noDropdown';
        }
      },
      hasOneShowingChild(children = [], parent) {
        const showingChildren = children.filter(item => {
          // Temp set(will be used if only has one showing child)
          this.onlyOneChild = item;
          return true;
        });

        // When there is only one child router, the child router is displayed by default
        if (showingChildren.length === 1) {
          return true;
        }

        // Show parent if there are no child router to display
        if (showingChildren.length === 0) {
          this.onlyOneChild = { ...parent, path: '', noShowingChildren: true };
          return true;
        }

        return false;
      },
      resolvePath(routePath) {
        if (isExternal(routePath)) {
          return routePath;
        }
        return path.resolve(this.basePath, routePath);
      }
    }
  };
</script>
