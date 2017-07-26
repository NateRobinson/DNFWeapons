<template>
  <div class="home_container">
    <nav class="navbar navbar-default navbar-fixed-top" style="position: relative">
      <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
          <span class="navbar-brand">DNF职业武器管理系统</span>
        </div>
      </div><!-- /.container-fluid -->
    </nav>
    <ul class="nav nav-tabs">
      <li role="presentation" v-bind:class="{ active: isCategory }"><a
        v-on:click="goCategory">职业管理</a>
      </li>
      <li role="presentation" v-bind:class="{ active: !isCategory }"><a
        v-on:click="goWeapons">武器管理</a>
      </li>
    </ul>
    <router-view></router-view>
  </div>
</template>

<script type="text/ecmascript-6">
  export default {
    data(){
      return {
        isCategory: true
      };
    },
    methods: {
      goCategory: function (event) {
        this.isCategory = true;
        this.$router.push('/home/category');
      },
      goWeapons: function (event) {
        this.isCategory = false;
        this.$router.push('/home/weapon');
      }
    }
  };
</script>

<style lang="stylus" rel="stylesheet/stylus">
  .home_container {
    .navbar {
      margin-bottom 0px;
    }
    .nav-tabs {
      margin-bottom 20px;
    }
  }

</style>
