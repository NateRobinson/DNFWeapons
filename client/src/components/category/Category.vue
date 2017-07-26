<template>
  <div class="category">
    <div class="avatar">
      <img :src="category.category_logo">
    </div>
    <card>
      <div slot="content" class="card-padding">
        <p style="font-size:16px;font-weight:bold;">{{category.category_name}}</p>
        <p style="font-size:14px;line-height:1.2;color:#999;">{{category.categorydesc}}</p>
      </div>
    </card>
    <box gap="10px 10px">
      <x-button type="primary" @click.native="goCategorySelect">更换职业</x-button>
    </box>
  </div>
</template>

<script type="text/ecmascript-6">
  import { Flexbox, FlexboxItem, Blur, Card, XButton, Box } from 'vux';
  export default{
    components: {
      Flexbox,
      FlexboxItem,
      Blur,
      Card,
      XButton,
      Box
    },
    created(){
      console.log('category=>' + this.$store.state.currentCategoryId);
      this.getCategoryById();
    },
    data () {
      return {
        images: [
          'https://o3e85j0cv.qnssl.com/tulips-1083572__340.jpg',
          'https://o3e85j0cv.qnssl.com/waterway-107810__340.jpg',
          'https://o3e85j0cv.qnssl.com/hot-chocolate-1068703__340.jpg'
        ],
        url: 'https://o3e85j0cv.qnssl.com/tulips-1083572__340.jpg',
        category: {}
      };
    },
    methods: {
      goCategorySelect: function () {
        this.$router.replace('/select');
      },
      getCategoryById: function () {
        this.$http.get('http://localhost:3000/admin/querycategorybyid?categoryid=' + this.$store.state.currentCategoryId).then((response) => {
          response = response.body;
          if (response.code === 1) {
            console.log(response.data);
            this.category = response.data;
          }
        });
      }
    }
  };
</script>

<style lang="stylus" rel="stylesheet/stylus">
  .category {
    width: 100%;
    .card-padding {
      padding: 15px;
    }
    .avatar {
      margin 40px auto;
      position: relative;
      border: 4px solid #ececec;
      width: 100px;
      height: 100px;
      border-radius: 50%;
      overflow hidden;
      img {
        width: 100%;
        height: 100%;
        position: absolute;
        object-fit: cover;
      }
    }
  }
</style>
