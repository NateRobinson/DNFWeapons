<template>
  <div class="container-fluid">
    <div class="row">
      <div class="col-xs-12 col-md-6">
        <!--职业编辑-->
        <div class="panel panel-default">
          <div class="panel-heading">
            <h3 class="panel-title">添加职业</h3>
          </div>
          <div class="panel-body">
            <div>
              <div class="form-group">
                <label for="name">职业名称</label>
                <input type="text" class="form-control" id="name"
                       placeholder="请输入职业名称" v-model="categoryname" required>
              </div>
              <div class="form-group">
                <label for="categorylogo">职业头像</label>
                <input type="text" class="form-control" id="categorylogo"
                       placeholder="请输入头像link" v-model="avatar" required>
              </div>
              <div class="form-group">
                <label for="description">职业介绍</label>
                <textarea style="resize:none" rows="5" class="form-control" id="description"
                          placeholder="请输入职业职业介绍" v-model="categorydesc" required/>
              </div>
              <button class="btn btn-primary" id="btn-submit" v-on:click="addCategroy">添加职业</button>
            </div>
          </div>
        </div>
      </div>
      <div class="col-xs-12 col-md-6">
        <!--新闻列表-->
        <div class="panel panel-default">
          <div class="panel-heading">
            <h3 class="panel-title">职业列表</h3>
          </div>
          <div class="panel-body">
            <!-- Table -->
            <table class="table" id="newstable">
              <thead>
              <tr>
                <th>id</th>
                <th>职业名称</th>
                <th>职业头像</th>
                <th>更新时间</th>
                <th>职业介绍</th>
                <th>操作</th>
              </tr>
              </thead>
              <tbody>
              <tr v-for="(category,index) in categories">
                <td>{{index + 1}}</td>
                <td>{{category.category_name}}</td>
                <td>{{category.category_logo}}</td>
                <td>{{category.category_updated | filterDateStr}}</td>
                <td>{{category.categorydesc}}</td>
                <td>
                  <button class="btn btn-primary btn-xs" @click="showModify(category)">修改</button>
                  <button class="btn btn-danger btn-xs" @click="show(category)">删除</button>
                </td>
              </tr>
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>
    <modal name="delete_confirm_dialog" :width="400"
           :height="300">
      <div class="delete_container">
        <p class="top">
          确定删除“ {{deleteCategory.category_name}} ”这个职业？删除前请清空该职业的武器列表。
        </p>
        <div class="bottom">
          <button type="button" class="btn btn-success" @click="hide">取消</button>
          <button type="button" class="btn btn-danger" @click="confirmDeleteCategory">删除</button>
        </div>
      </div>
    </modal>
    <modal name="modify_confirm_dialog" :width="600" :height="407">
      <div class="panel panel-default">
        <div class="panel-heading">
          <h3 class="panel-title">修改职业</h3>
        </div>
        <div class="panel-body">
          <div>
            <div class="form-group">
              <label for="modifyname">职业名称</label>
              <input type="text" class="form-control" id="modifyname"
                     placeholder="请输入职业名称" v-model="modifyCategory.category_name" required>
            </div>
            <div class="form-group">
              <label for="modifycategorylogo">职业头像</label>
              <input type="text" class="form-control" id="modifycategorylogo"
                     placeholder="请输入头像link"
                     v-model="modifyCategory.category_logo" required>
            </div>
            <div class="form-group">
              <label for="modifydescription">职业介绍</label>
              <textarea style="resize:none" rows="5" class="form-control" id="modifydescription"
                        placeholder="请输入职业职业介绍" v-model="modifyCategory.categorydesc" required/>
            </div>
            <button class="btn btn-primary" v-on:click="hideModify">取消修改</button>
            <button class="btn btn-danger" v-on:click="updateCategory">确认修改</button>
          </div>
        </div>
      </div>
    </modal>
  </div>
</template>

<script type="text/ecmascript-6">
  export default{
    data(){
      return {
        categoryname: '',
        avatar: '',
        categorydesc: '',
        categories: [],
        deleteCategory: {},
        modifyCategory: {}
      };
    },
    created(){
      this.queryCategories();
    },
    methods: {
      addCategroy: function (event) {
        if (!this.categoryname || !this.avatar || !this.categorydesc) {
          this.$popup({
            message: '参数不能为空',
            color: '#ee2126',
            backgroundColor: 'rgba(255, 255, 255, 0.8)',
            delay: 5
          });
        } else {
          this.$http.post('http://localhost:3000/admin/addcategory', {
            categoryname: this.categoryname,
            categorylogo: this.avatar,
            categorydesc: this.categorydesc
          }).then(response => {
            var someData = response.body;
            if (someData && someData.code === 1) {
              this.categoryname = '';
              this.avatar = '';
              this.categorydesc = '';
              this.queryCategories();
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
      },
      updateCategory(){
        if (!this.modifyCategory.category_name || !this.modifyCategory.category_logo || !this.modifyCategory.categorydesc) {
          this.$popup({
            message: '参数不能为空',
            color: '#ee2126',
            backgroundColor: 'rgba(255, 255, 255, 0.8)',
            delay: 5
          });
        } else {
          this.$http.post('http://localhost:3000/admin/updatecategory', {
            categoryid: this.modifyCategory.id,
            categoryname: this.modifyCategory.category_name,
            categorylogo: this.modifyCategory.category_logo,
            categorydesc: this.modifyCategory.categorydesc
          }).then((response) => {
            response = response.body;
            if (response.code === 1) {
              this.hideModify();
              this.queryCategories();
            } else {
              this.$popup({
                message: response.msg,
                color: '#ee2126',
                backgroundColor: 'rgba(255, 255, 255, 0.8)',
                delay: 5
              });
            }
          });
        }
      },
      queryCategories: function () {
        this.$http.get('http://localhost:3000/admin/querycategories').then((response) => {
          response = response.body;
          if (response.code === 1) {
            this.categories = response.data;
          }
        });
      },
      show (category) {
        this.deleteCategory = category;
        this.$modal.show('delete_confirm_dialog');
      },
      showModify(category){
        this.modifyCategory = this.clone(category);
        this.$modal.show('modify_confirm_dialog');
      },
      hide () {
        this.$modal.hide('delete_confirm_dialog');
      },
      hideModify () {
        this.$modal.hide('modify_confirm_dialog');
      },
      confirmDeleteCategory(){
        if (!this.deleteCategory || !this.deleteCategory.id) {
          this.$popup({
            message: '未选中删除的职业',
            color: '#ee2126',
            backgroundColor: 'rgba(255, 255, 255, 0.8)',
            delay: 5
          });
        } else {
          this.$http.get('http://localhost:3000/admin/deletecategory?categoryid=' + this.deleteCategory.id).then((response) => {
            response = response.body;
            if (response.code === 1) {
              console.log(response);
              this.$popup({
                message: response.msg,
                color: '#000000',
                backgroundColor: 'rgba(255, 255, 255, 0.8)',
                delay: 5
              });
              this.queryCategories();
              this.hide();
            } else {
              this.$popup({
                message: response.msg,
                color: '#ee2126',
                backgroundColor: 'rgba(255, 255, 255, 0.8)',
                delay: 5
              });
            }
          });
        }
      },
      clone(obj){
        var o;
        if (typeof obj === 'object') {
          if (obj === null) {
            o = null;
          } else {
            if (obj instanceof Array) {
              o = [];
              for (var i = 0, len = obj.length; i < len; i++) {
                o.push(this.clone(obj[i]));
              }
            } else {
              o = {};
              for (var j in obj) {
                o[j] = this.clone(obj[j]);
              }
            }
          }
        } else {
          o = obj;
        }
        return o;
      }
    },
    filters: {
      filterDateStr: function (val) {
        var oDate = new Date(val);
        return oDate.getFullYear() + '/' + (oDate.getMonth() + 1) + '/' + oDate.getDate();
      }
    }
  };
</script>

<style lang="stylus" rel="stylesheet/stylus">
  #newstable tbody {
    td {
      max-width: 90px;
      text-overflow: ellipsis;
      overflow: hidden;
      white-space: nowrap;
    }
    .btn-danger {
      margin-left: 8px;
    }
  }

  .delete_container {
    width: 400px;
    height: 300px;
    .top {
      margin-top 50px;
      text-align center;
      font-size 20px;
      height: 150px;
      width: 100%;
      padding 10px;
    }
    .bottom {
      box-sizing border-box;
      height 100px;
      width 100%;
      text-align: center;
      .btn {
        width: 100px;
        height: 40px;
        margin-top: 30px;
      }
    }
  }
</style>
