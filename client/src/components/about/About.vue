<template>
  <div class="category">
    <div class="avatar">
      <img src="../../assets/head.png">
    </div>
    <card>
      <div slot="content" class="card-padding">
        <div>
          <span style="font-size:16px;line-height:1.2;font-weight:bold;">顾学武</span>
          <span style="font-size: 12px;">--web前端工程师实战班2班</span>
        </div>
        <p style="font-size:14px;line-height:1.2;margin-top: 10px;color:#999;">客户端使用了vue全家桶进行开发，在大前端课程学习完毕之后，自己自学vue官方文档并用此次毕设加以实践，巩固了整个前端知识的同时也加深了自己对完整项目的宏观把控能力。</p>
      </div>
    </card>
  </div>
</template>

<script type="text/ecmascript-6">
  import { Flexbox, FlexboxItem, Blur, Card } from 'vux';
  export default{
    components: {
      Flexbox,
      FlexboxItem,
      Blur,
      Card
    },
    data () {
      return {
        images: [
          'https://o3e85j0cv.qnssl.com/tulips-1083572__340.jpg',
          'https://o3e85j0cv.qnssl.com/waterway-107810__340.jpg',
          'https://o3e85j0cv.qnssl.com/hot-chocolate-1068703__340.jpg'
        ],
        url: 'https://o3e85j0cv.qnssl.com/tulips-1083572__340.jpg'
      };
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
