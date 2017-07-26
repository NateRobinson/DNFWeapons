<template>
  <div class="jumbotron">
    <h1>DNF职业武器管理系统</h1>
    <p>
      此系统使用了
      <mark>vue</mark>
      ，
      <mark>vuex</mark>
      ，
      <mark>vue-resourse</mark>
      ，
      <mark>vue-router</mark>
      全家桶，并结合
      <mark>bootstrap v3</mark>
      样式，访问由
      <mark>express</mark>
      编写的server实现DNF职业武器编辑管理功能.
    </p>
    <div class="login_form">
      <div class="form-group">
        <label for="exampleInputAccount">管理员账号</label>
        <input type="text" class="form-control" id="exampleInputAccount" placeholder="管理员账号"
               v-model="username">
      </div>
      <div class="form-group">
        <label for="exampleInputPassword">管理员密码</label>
        <input type="password" class="form-control" id="exampleInputPassword"
               placeholder="Password" v-model="password">
      </div>
      <button type="button" class="btn btn-success" v-on:click="login">登录</button>
    </div>
  </div>
</template>

<script type="text/ecmascript-6">
  export default {
    data(){
      return {
        password: '',
        username: ''
      };
    },
    methods: {
      login: function (event) {
        if (!this.password || !this.username) {
          this.$popup({
            message: '账号或密码不能为空',
            color: '#ee2126',
            backgroundColor: 'rgba(255, 255, 255, 0.8)',
            delay: 5
          });
        } else {
          // GET /someUrl
          this.$http.post('http://localhost:3000/admin/login', {
            username: this.username,
            password: this.password
          }).then(response => {
            var someData = response.body;
            if (someData && someData.code === 1) {
              // after login success , save the state in vuex
              sessionStorage.setItem('isLogin', true);
              this.$router.replace('/home');
            } else {
              this.$popup({
                message: someData.msg,
                color: '#ee2126',
                backgroundColor: 'rgba(255, 255, 255, 0.8)',
                delay: 5
              });
            }
          }, response => {
          });
        }
      }
    }
  };
</script>

<style lang="stylus" rel="stylesheet/stylus">
  .jumbotron {
    background-color: #fff;
    padding-left 40px;
    padding-right 40px;
    .login_form {
      margin-top: 40px
      width: 400px;
    }
  }
</style>
