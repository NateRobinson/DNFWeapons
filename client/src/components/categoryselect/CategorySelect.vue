<template>
  <div>
    <x-header :left-options="{showBack: false}">选择职业</x-header>
    <group>
      <cell-box v-for="category in categories" :key="category.id" @click.native="goHome(category.id)">
        {{category.category_name}}
      </cell-box>
    </group>
  </div>
</template>

<script type="text/ecmascript-6">
  import { CellBox, Group, XHeader } from 'vux';
  export default{
    data(){
      return {
        categories: []
      };
    },
    components: {
      CellBox,
      Group,
      XHeader
    },
    created(){
      this.getCategories();
    },
    methods: {
      goHome: function (categoryId) {
        this.$router.replace({
          path: '/home', query: {categoryId: categoryId}
        });
      },
      getCategories: function () {
        this.$http.get('http://localhost:3000/admin/querycategories').then((response) => {
          response = response.body;
          if (response.code === 1) {
            console.log(response);
            this.categories = response.data;
          }
        });
      }
    }
  };
</script>

<style lang="stylus" rel="stylesheet/stylus">

</style>
