<template>
  <div>
    <navbar path="/mine" />
    <div class="content">
      <rotary-manual></rotary-manual>
    </div>
  </div>
</template>

<script>
import { Icon, Cell, CellGroup } from "vant";
import navbar from "@/components/navbar.vue";
import RotaryManual from "@/components/RotaryManual";
export default {
  components: {
    Icon,
    Cell,
    CellGroup,
    navbar,
    RotaryManual
  },
  data() {
    return {};
  }
};
</script>

<style lang="less">
</style>
