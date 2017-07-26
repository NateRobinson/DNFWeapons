<template>
  <div class="login">
    <x-header :left-options="{showBack: false}">登录</x-header>
    <group>
      <x-input title="Username" v-model="username"></x-input>
      <x-input title="Password" v-model="password" type="password"></x-input>
    </group>
    <box gap="10px 10px">
      <x-button class="login_btn" plain type="primary" style="border-radius:99px;"
                action-type="button" @click.native="doLogin">登录
      </x-button>
    </box>
  </div>
</template>

<script type="text/ecmascript-6">
  import { XInput, Group, XHeader, XButton, Box } from 'vux';
  export default {
    data(){
      return {
        username: '',
        password: ''
      };
    },
    components: {
      XInput,
      Group,
      XHeader,
      XButton,
      Box
    },
    methods: {
      doLogin: function () {
        if (!this.password || !this.username) {
          this.$popup({
            message: '账号或密码不能为空',
            color: '#ee2126',
            backgroundColor: 'rgba(255, 255, 255, 0.8)',
            delay: 5
          });
        } else {
          // GET /someUrl
          this.$http.post('http://localhost:3000/client/login', {
            username: this.username,
            password: this.password
          }).then(response => {
            var someData = response.body;
            if (someData && someData.code === 1) {
              // after login success , save the state in vuex
              sessionStorage.setItem('isLogin', true);
              this.$router.replace('/select');
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
  .login {
    .login_btn {
      margin-top 20px;
    }
  }
</style>
