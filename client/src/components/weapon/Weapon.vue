<template>
  <div class="weapon">
    <ul>
      <li v-for="item in list" class="item">
        <div class="item_container">
          <div class="item_left">
            <img :src="item.src">
          </div>
          <div class="item_right">
            <p class="title">{{item.title}}</p>
            <p class="desc">{{item.desc}}</p>
          </div>
        </div>
        <hr style="height:1px;border:none;border-top:1px dashed #0066CC;"/>
      </li>
    </ul>
  </div>
</template>

<script type="text/ecmascript-6">
  export default{
    created(){
      this.getCategoryById();
      this.queryweapons();
    },
    data () {
      return {
        type: '1',
        list: [],
        footer: {},
        header: '',
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
            this.category = response.data;
            this.header = this.category.category_name + '的武器列表';
          }
        });
      },
      queryweapons: function () {
        this.$http.get('http://localhost:3000/admin/queryweaponsbycategoryid?categoryid=' + this.$store.state.currentCategoryId).then((response) => {
          response = response.body;
          if (response.code === 1) {
            console.log(response);
            var weapons = response.data;
            this.list = [];
            for (var i = 0; i < weapons.length; i++) {
              this.list.push(
                {
                  src: weapons[i].weapon_logo,
                  title: weapons[i].weapon_name,
                  desc: weapons[i].weapon_desc
                });
            }
          }
        });
      }
    }
  };
</script>

<style lang="stylus" rel="stylesheet/stylus">
  .item {
    display: block;
    height: 100px;
    width: 100%;
    .item_container {
      box-sizing border-box;
      padding 8px;
      width: 100%;
      height: 100%;
      display: flex;
      flex-direction row;
      .item_left {
        box-sizing border-box;
        width: 100px;
        height: 100%;
        background #d5dd16;
        img {
          width: 100px;
          height: 100%;
          background-repeat no-repeat;
        }
      }
      .item_right {
        overflow: hidden;
        margin-left: 4px;
        height: 100%;
        flex 1;
        .title {
          color: #000;
        }
        .desc {
          font-size: 12px;
          color: #808080;
        }
      }
    }
  }
</style>
