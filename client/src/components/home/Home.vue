<template>
  <div class="home" style="height:100%;">
    <view-box ref="viewBox" body-padding-top="46px" body-padding-bottom="55px">
      <x-header slot="header" style="width:100%;position:absolute;left:0;top:0;z-index:100;"
                :left-options="{showBack: false}">{{title}}
      </x-header>
      <router-view></router-view>
      <tabbar slot="bottom">
        <tabbar-item selected @on-item-click="onItemClick">
          <span slot="label">武器</span>
        </tabbar-item>
        <tabbar-item @on-item-click="onItemClick">
          <span slot="label">职业</span>
        </tabbar-item>
        <tabbar-item @on-item-click="onItemClick">
          <span slot="label">关于</span>
        </tabbar-item>
      </tabbar>
    </view-box>
  </div>
</template>

<script type="text/ecmascript-6">
  import { Tabbar, TabbarItem, XHeader, ViewBox } from 'vux';
  export default{
    components: {
      Tabbar,
      TabbarItem,
      XHeader,
      ViewBox
    },
    data(){
      return {
        title: '武器'
      };
    },
    created(){
      this.$store.state.currentCategoryId = this.$route.query.categoryId;
      console.log('home=>' + this.$store.state.currentCategoryId);
    },
    methods: {
      onItemClick: function (index) {
        if (index === 0) {
          this.title = '武器';
          this.$router.push('/home/weapon');
        } else if (index === 1) {
          this.title = '职业';
          this.$router.push('/home/category');
        } else if (index === 2) {
          this.title = '关于';
          this.$router.push('/home/about');
        }
      }
    }
  };
</script>

<style lang="stylus" rel="stylesheet/stylus">

</style>
