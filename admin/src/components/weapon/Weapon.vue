<template>
  <div class="container-fluid">
    <div class="row">
      <div class="col-xs-12 col-md-6">
        <!--新闻编辑-->
        <div class="panel panel-default">
          <div class="panel-heading">
            <h3 class="panel-title">添加武器</h3>
          </div>
          <div class="panel-body">
            <form>
              <div class="form-group">
                <label for="weaponname">武器名称</label>
                <input type="text" class="form-control" id="weaponname"
                       placeholder="请输入武器名称" v-model="weaponname">
              </div>
              <div class="form-group">
                <label for="weaponcategory">所属职业</label>
                <select type="" class="form-control" id="weaponcategory" v-model="category_id">
                  <option v-for="category in categories" v-bind:value="category.id">
                    {{category.category_name}}
                  </option>
                </select>
              </div>
              <div class="form-group">
                <label for="weaponavatar">武器图片</label>
                <input type="text" class="form-control" id="weaponavatar"
                       placeholder="请输入武器图片" v-model="weaponavatar">
              </div>
              <div class="form-group">
                <label for="weapondesc">武器描述</label>
                <textarea style="resize:none" rows="5" type="email" class="form-control"
                          id="weapondesc"
                          placeholder="请输入武器描述" v-model="weapondesc"/>
              </div>
              <button class="btn btn-primary" id="btn-submit" v-on:click="insertWeapon">提交武器
              </button>
            </form>
          </div>
        </div>
      </div>
      <div class="col-xs-12 col-md-6">
        <!--新闻列表-->
        <div class="panel panel-default">
          <div class="panel-heading">
            <span class="panel-title">武器列表</span>
            <select type="" v-model="select_category_id" @change="onCategorySelected($event)">
              <option value="-1" selected="selected">
                全部
              </option>
              <option v-for="category in categories" v-bind:value="category.id">
                {{category.category_name}}
              </option>
            </select>
          </div>
          <div class="panel-body">
            <!-- Table -->
            <table class="table" id="newstable">
              <thead>
              <tr>
                <th>id</th>
                <th>武器名称</th>
                <th>所属职业</th>
                <th>武器图片</th>
                <th>武器更新时间</th>
                <th>武器描述</th>
                <th>操作</th>
              </tr>
              </thead>
              <tbody>
              <tr v-for="(weapon,index) in weapons">
                <td>{{index + 1}}</td>
                <td>{{weapon.weapon_name}}</td>
                <td>{{weapon.category_name}}</td>
                <td>{{weapon.weapon_logo}}</td>
                <td>{{weapon.weapon_updated | filterDateStr}}</td>
                <td>{{weapon.weapon_desc}}</td>
                <td>
                  <button class="btn btn-primary btn-xs" @click="showModify(weapon)">修改</button>
                  <button class="btn btn-danger btn-xs" @click="show(weapon)">删除</button>
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
          确定删除“ {{deleteweapon.weapon_name}} ”这个武器？
        </p>
        <div class="bottom">
          <button type="button" class="btn btn-success" @click="hide">取消</button>
          <button type="button" class="btn btn-danger" @click="confirmDeleteWeapon">删除</button>
        </div>
      </div>
    </modal>
    <modal name="modify_confirm_dialog" :width="600" :height="480">
      <div class="panel panel-default">
        <div class="panel-heading">
          <h3 class="panel-title">修改武器</h3>
        </div>
        <div class="panel-body">
          <form>
            <div class="form-group">
              <label for="modifyweaponname">武器名称</label>
              <input type="text" class="form-control" id="modifyweaponname"
                     placeholder="请输入武器名称" v-model="modifyweapon.weapon_name">
            </div>
            <div class="form-group">
              <label for="modifyweaponcategory">所属职业</label>
              <select type="" class="form-control" id="modifyweaponcategory"
                      v-model="modifyweapon.weapon_cagory_id">
                <option v-for="category in categories" v-bind:value="category.id">
                  {{category.category_name}}
                </option>
              </select>
            </div>
            <div class="form-group">
              <label for="modifyweaponavatar">武器图片</label>
              <input type="text" class="form-control" id="modifyweaponavatar"
                     placeholder="请输入武器图片" v-model="modifyweapon.weapon_logo">
            </div>
            <div class="form-group">
              <label for="modifyweapondesc">武器描述</label>
              <textarea style="resize:none" rows="5" type="email" class="form-control"
                        id="modifyweapondesc"
                        placeholder="请输入武器描述" v-model="modifyweapon.weapon_desc"/>
            </div>
            <button class="btn btn-primary" v-on:click="hideModify">取消修改</button>
            <button class="btn btn-danger" v-on:click="updateWeapon">确认修改</button>
          </form>
        </div>
      </div>
    </modal>
  </div>
</template>

<script type="text/ecmascript-6">
  export default{
    data(){
      return {
        weaponname: '',
        category_id: -1,
        select_category_id: -1,
        weaponavatar: '',
        weapondesc: '',
        categories: [],
        weapons: [],
        deleteweapon: {},
        modifyweapon: {}
      };
    },
    created(){
      this.queryCategories();
      this.queryweapons();
    },
    methods: {
      insertWeapon: function (event) {
        if (!this.weaponname || !this.category_id === -1 || !this.weaponavatar || !this.weapondesc) {
          this.$popup({
            message: '参数不能为空',
            color: '#ee2126',
            backgroundColor: 'rgba(255, 255, 255, 0.8)',
            delay: 5
          });
        } else {
          this.$http.post('http://localhost:3000/admin/addweapons', {
            weaponname: this.weaponname,
            weaponcategoryid: this.category_id,
            weaponavatar: this.weaponavatar,
            weapondesc: this.weapondesc
          }).then(response => {
            var someData = response.body;
            if (someData && someData.code === 1) {
              this.weaponname = '';
              this.weaponavatar = '';
              this.weapondesc = '';
              this.queryweapons();
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
      queryCategories: function () {
        this.$http.get('http://localhost:3000/admin/querycategories').then((response) => {
          response = response.body;
          if (response.code === 1) {
            console.log(response);
            this.categories = response.data;
          }
        });
      },
      queryweapons: function () {
        if (parseInt(this.select_category_id) === -1) {
          this.$http.get('http://localhost:3000/admin/queryweapons').then((response) => {
            response = response.body;
            if (response.code === 1) {
              console.log(response);
              this.weapons = response.data;
            }
          });
        } else {
          this.$http.get('http://localhost:3000/admin/queryweaponsbycategoryid?categoryid=' + this.select_category_id).then((response) => {
            response = response.body;
            if (response.code === 1) {
              console.log(response);
              this.weapons = response.data;
            }
          });
        }
      },
      show (weapon) {
        this.deleteweapon = weapon;
        this.$modal.show('delete_confirm_dialog');
      },
      showModify(weapon){
        this.modifyweapon = this.clone(weapon);
        this.$modal.show('modify_confirm_dialog');
      },
      hide () {
        this.$modal.hide('delete_confirm_dialog');
      },
      hideModify () {
        this.$modal.hide('modify_confirm_dialog');
      },
      updateWeapon(){
        if (!this.modifyweapon.weapon_name || !this.modifyweapon.weapon_cagory_id || !this.modifyweapon.weapon_logo || !this.modifyweapon.weapon_desc) {
          this.$popup({
            message: '参数不能为空',
            color: '#ee2126',
            backgroundColor: 'rgba(255, 255, 255, 0.8)',
            delay: 5
          });
        } else {
          this.$http.post('http://localhost:3000/admin/updateweapon', {
            weaponid: this.modifyweapon.id,
            weaponname: this.modifyweapon.weapon_name,
            weaponcategoryid: this.modifyweapon.weapon_cagory_id,
            weaponavatar: this.modifyweapon.weapon_logo,
            weapondesc: this.modifyweapon.weapon_desc
          }).then((response) => {
            response = response.body;
            if (response.code === 1) {
              this.hideModify();
              this.queryweapons();
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
      confirmDeleteWeapon(){
        if (!this.deleteweapon || !this.deleteweapon.id) {
          this.$popup({
            message: '未选中删除的武器',
            color: '#ee2126',
            backgroundColor: 'rgba(255, 255, 255, 0.8)',
            delay: 5
          });
        } else {
          this.$http.get('http://localhost:3000/admin/deleteweapons?weaponid=' + this.deleteweapon.id).then((response) => {
            response = response.body;
            if (response.code === 1) {
              this.$popup({
                message: response.msg,
                color: '#000000',
                backgroundColor: 'rgba(255, 255, 255, 0.8)',
                delay: 5
              });
              this.queryweapons();
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
      onCategorySelected(event){
        this.queryweapons();
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
