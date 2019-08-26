<template>
  <div class="home">
    <div class="mineBox">
      <div class="status">
        <div class="rate" v-if="!RotaryManual.noneRoom">
          <van-circle
            v-model="currentRate"
            :rate="RotaryManual.rate"
            layer-color="#ebedf0"
            size="80px"
            :speed="100"
            :stroke-width="60"
          >
            <div slots="default">
              <h5>{{RotaryManual.days}}天</h5>距离出科
            </div>
          </van-circle>
          <div class="bottom">
            {{RotaryManual.start}} 至
            {{RotaryManual.end}}
          </div>

          <h4>当前科室:{{RotaryManual.currentRoom}}</h4>
        </div>
        <div v-else class="noneIn">
          <p>姓名:{{UseInfor.基本信息.姓名}}</p>
          <p>工号:{{UseInfor.基本信息.工号}}</p>
          <p>当前状态:{{RotaryManual.stateName}}</p>
          <p v-if="RotaryManual.currentRoom" class="tips blink">
            请前往[
            <span>{{RotaryManual.currentRoom}}</span>]报到
          </p>
          <p>
            <van-button size="small" @click="showTask" type="primary">查看我的轮转计划</van-button>
          </p>
        </div>
      </div>
      <div class="task">
        <div class="item" v-for="item in taskStatistics" :key="item.name">
          <h5>{{item.name}}:{{item.text}}</h5>
          <van-progress :percentage="item.value" :show-pivot="false" />
        </div>
      </div>
    </div>
    <van-notice-bar
      left-icon="volume-o"
      color="red"
      background="#fff"
      class="notice"
      mode="link"
      :text="notes"
      @click="notesClick"
    ></van-notice-bar>
    <div class="subnav">
      <van-grid :border="true" :column-num="3" clickable>
        <van-grid-item v-for="item in subnav" :key="item.title" :to="item.path">
          <div slots="ico" :style="'background-color:'+item.color" class="gridIcon">
            <van-icon size="6vw" color="#fff" :name="item.ico" />
          </div>

          <p slots="text">{{item.title}}</p>
        </van-grid-item>
      </van-grid>
    </div>
    <van-popup v-model="taskVisiable" round position="bottom" :style="{ height: '85%' }">
      <div style="margin-top:20px;">
        <rotary-manual></rotary-manual>
      </div>
    </van-popup>
  </div>
</template>
<script>
import {
  NoticeBar,
  Grid,
  GridItem,
  Icon,
  Panel,
  Swipe,
  SwipeItem,
  Image,
  Circle,
  Progress,
  Popup
} from "vant";
import { GetMineTask } from "@/api/Statistics";
import { GetNotes } from "@/api/notes";
import DateTime from "@/components/DateTime.vue";

import { mapActions } from "vuex";
import RotaryManual from "@/components/RotaryManual";
export default {
  components: {
    [NoticeBar.name]: NoticeBar,
    [Grid.name]: Grid,
    [GridItem.name]: GridItem,
    [Icon.name]: Icon,
    [Panel.name]: Panel,
    [Swipe.name]: Swipe,
    [SwipeItem.name]: SwipeItem,
    [Image.name]: Image,
    [Circle.name]: Circle,
    [Progress.name]: Progress,
    [Popup.name]: Popup,

    DateTime,
    RotaryManual
  },
  data() {
    return {
      notes: "",
      taskVisiable: false,
      subnav: [
        {
          title: "轮转手册",
          path: "/rotaryManual",
          ico: "shrink",
          color: "#04B8F5"
        },
        {
          title: "请假申请",
          path: "/leave",
          ico: "failure",
          color: "#36C877"
        },
        {
          title: "360°评价",
          path: "/360Evaluate",
          ico: "star",
          color: "#F5920D"
        },
        {
          title: "教学活动",
          path: "/activities",
          ico: "point-gift",
          color: "#A94490"
        },
        {
          title: "出科申请",
          path: "/outDepartment",
          ico: "share",
          color: "#DB3A40"
        },
        {
          title: "结业申请",
          path: "/graduation",
          ico: "completed",
          color: "#74B8F5"
        },
        {
          title: "我的管床病人",
          path: "/myPatient",
          ico: "friends-o",
          color: "#784490"
        }
        // {
        //   title: "待办事宜",
        //   path: "/do",
        //   ico: "todo-list-o",
        //   color: "#A94490"
        // }
      ],

      form: {
        typeName: "",
        name: "",
        start: new Date().DateAdd("d", -30).format("yyyy-MM-dd"),
        end: new Date().format("yyyy-MM-dd"),
        code: ""
      },
      RotaryManual: {
        days: 0,
        start: "",
        rate: 0,
        end: "",
        currentRoom: "",
        stateName: "",
        noneRoom: false
      },
      currentRate: 60,
      UseInfor: {},
      data: [],
      loading: false,
      taskStatistics: {}
    };
  },
  mounted() {
    let _this = this;

    _this.getUserInfo().then(data => {
      this.UseInfor = data.data;
      if (this.UseInfor.培训情况) {
        localStorage.setItem(
          "TrainingSituation",
          JSON.stringify(this.UseInfor.培训情况)
        );
      }
      _this.RotaryManual.stateName = this.UseInfor.培训情况.状态;
      if (this.UseInfor.轮转) {
        localStorage.setItem(
          "RotaryManual",
          JSON.stringify(this.UseInfor.轮转)
        );

        this.UseInfor.轮转.forEach(item => {
          if (
            item.轮转基本信息.编号 == _this.UseInfor.培训情况.当前教学轮转编号
          ) {
            _this.RotaryManual.days = Math.floor(
              new Date().DateDiff(item.轮转基本信息.计划出科日期.ToDate())
            );
            _this.RotaryManual.currentRoom = item.轮转基本信息.本院科室名称;
            _this.RotaryManual.start = item.轮转基本信息.实际入科日期.format(
              "yyyy-MM-dd"
            );
            _this.RotaryManual.end = item.轮转基本信息.计划出科日期.format(
              "yyyy-MM-dd"
            );
            let ToatalDays = _this.RotaryManual.start
              .ToDate()
              .DateDiff(_this.RotaryManual.end.ToDate());
            _this.RotaryManual.rate =
              ((ToatalDays-_this.RotaryManual.days )/ ToatalDays) * 100;
              
          }
        });
        if (!_this.RotaryManual.currentRoom) {
          this.UseInfor.轮转.forEach(item => {
            if (
              item.轮转基本信息.状态 == "未入科" &&
              !_this.RotaryManual.currentRoom
            ) {
              _this.RotaryManual.currentRoom = item.轮转基本信息.本院科室名称;
              _this.RotaryManual.noneRoom = true;
            }
          });
        }
      }
    });
    GetNotes({ index: 1, size: 6 }).then(res => {
      let data = res.data.data.list;
      data.forEach((item, index) => {
        _this.notes += index + 1 + "、" + item.通知名称 + "     ";
      });
      _this.notesShow = true;
    });
    this.GetStatisticsInfo();
  },
  watch: {
    form: {
      handler() {},
      deep: true
    }
  },
  methods: {
    ...mapActions(["getUserInfo"]),
    notesClick() {
      this.$router.push("/message");
    },
    showTask() {
      this.taskVisiable = true;
    },
    GetStatisticsInfo() {
      let _this = this;
      _this.loading = false;
      GetMineTask().then(res => {
        let data = res.data.data;
        _this.taskStatistics = [
          {
            name: "医技",
            value:
              data.规定医技类任务数量 == 0
                ? 100
                : (data.已完成医技类任务数量 / data.规定医技类任务数量) * 100,
            text: data.已完成医技类任务数量 + "/" + data.规定医技类任务数量
          },
          {
            name: "技能",
            value:
              data.规定技能类任务数量 == 0
                ? 100
                : (data.已完成技能类任务数量 / data.规定技能类任务数量) * 100,
            text: data.已完成技能类任务数量 + "/" + data.规定技能类任务数量
          },
          {
            name: "疾病",
            value:
              data.规定疾病类任务数量 == 0
                ? 100
                : (data.已完成疾病类任务数量 / data.规定疾病类任务数量) * 100,
            text: data.已完成疾病类任务数量 + "/" + data.规定疾病类任务数量
          },
          {
            name: "病房",
            value:
              data.规定病房类任务数量 == 0
                ? 100
                : (data.已完成病房类任务数量 / data.规定病房类任务数量) * 100,
            text: data.已完成病房类任务数量 + "/" + data.规定病房类任务数量
          },
          {
            name: "门诊",
            value:
              data.规定门诊类任务数量 == 0
                ? 100
                : (data.已完成门诊类任务数量 / data.规定门诊类任务数量) * 100,
            text: data.已完成门诊类任务数量 + "/" + data.规定门诊类任务数量
          }
        ];
        _this.loading = true;
      });
    }
  }
};
</script>
<style lang="less">
.home {
  margin-bottom: 50px;
  .mineBox {
    padding: 5px 10px;
    background: -moz-linear-gradient(left 30deg, rgb(137, 207, 240), #58e1eb);
    background: -webkit-gradient(
      linear,
      0 0,
      100% 100%,
      from(rgb(137, 207, 240)),
      to(#58e1eb)
    );
    background: -o-linear-gradient(30deg, rgb(137, 207, 240), #58e1eb);
    color: rgb(4, 91, 190);
    clear: both;
    .status {
      width: 50%;
      float: left;
      height: 100%;
      text-align: center;
      .noneIn {
        margin-top: 24px;
        font-size: 14px;
        text-align: left;
        p {
          margin: 5px 0px;
        }
        .tips {
          font-weight: bold;
          color: red;
          margin: 10px 0px 20px;
        }
      }
      .rate {
        text-align: center;
        margin-top: 24px;
        h5 {
          margin-top: 25px;
          font-size: 20px;
        }
        font-size: 14px;
        .bottom {
          margin: 0px 10px;
          margin-top: 20px;
          font-size: 11px;
          padding-bottom: 10px;
          border-bottom: 1px rgb(4, 91, 190) solid;
          margin-bottom: 10px;
        }
      }
    }
    .task {
      width: 50%;
      height: 100%;
      margin-left: 50%;
      border-left: 1px #f8f8f8 solid;
      .item {
        padding: 4px 20px;
        h5 {
          margin: 4px 0px;
        }
      }
    }
    height: 240px;
  }
  .Rotation {
    background: #fff;
  }
  #Rotation {
    background: #fff;
    margin: 0px auto;
    div {
      margin: 0px auto;
    }
  }
  .banner {
    height: 180px;
    background: #fff;
  }
  .count {
    font-size: 14px;
    padding: 5px 0px;
    margin: 10px 0px 15px;
    .header {
      border-bottom: 1px #ebedf0 solid;
    }
  }
  .notice {
    margin: 0px auto 10px;
  }
  .subnav {
    background-color: #fff;
    .gridIcon {
      border-radius: 40px;
      width: 40px;
      height: 40px;
      text-align: center;
      line-height: 50px;
    }
  }
}
/* 定义keyframe动画，命名为blink */
@keyframes blink {
  0% {
    opacity: 1;
  }
  100% {
    opacity: 0;
  }
}
/* 添加兼容性前缀 */
@-webkit-keyframes blink {
  0% {
    opacity: 1;
  }
  100% {
    opacity: 0;
  }
}
@-moz-keyframes blink {
  0% {
    opacity: 1;
  }
  100% {
    opacity: 0;
  }
}
@-ms-keyframes blink {
  0% {
    opacity: 1;
  }
  100% {
    opacity: 0;
  }
}
@-o-keyframes blink {
  0% {
    opacity: 1;
  }
  100% {
    opacity: 0;
  }
}
/* 定义blink类*/
.blink {
  color: red;
  animation: blink 1s linear infinite;
  /* 其它浏览器兼容性前缀 */
  -webkit-animation: blink 1s linear infinite;
  -moz-animation: blink 1s linear infinite;
  -ms-animation: blink 1s linear infinite;
  -o-animation: blink 1s linear infinite;
}
</style>


