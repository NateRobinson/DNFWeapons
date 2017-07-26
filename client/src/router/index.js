import Vue from 'vue';
import VueUp from 'vueup';// 弹出提醒层
import Router from 'vue-router';
import VueResource from 'vue-resource';
import Login from '@/components/login/Login';
import CategorySelect from '@/components/categoryselect/CategorySelect';
import Home from '@/components/home/Home';
import Weapon from '@/components/weapon/Weapon';
import Category from '@/components/category/Category';
import About from '@/components/about/About';

Vue.use(VueUp);
Vue.use(Router);
Vue.use(VueResource);

export default new Router({
  routes: [
    {
      path: '/',
      name: 'Login',
      component: Login
    },
    {
      path: '/login',
      name: 'Login',
      component: Login
    },
    {
      path: '/select',
      name: 'CategorySelect',
      component: CategorySelect,
      meta: {requiresAuth: true},
      beforeEnter: (to, from, next) => {
        if (to.matched.some(record => record.meta.requiresAuth)) {
          // this route requires auth, check if logged in
          // if not, redirect to login page.
          if (!sessionStorage.getItem('isLogin')) {
            next({
              path: '/login'
            });
          } else {
            next();
          }
        } else {
          next(); // 确保一定要调用 next()
        }
      }
    },
    {
      path: '/home',
      name: 'Home',
      component: Home,
      children: [
        {
          path: '',
          component: Weapon,
          meta: {requiresAuth: true},
          beforeEnter: (to, from, next) => {
            if (to.matched.some(record => record.meta.requiresAuth)) {
              // this route requires auth, check if logged in
              // if not, redirect to login page.
              if (!sessionStorage.getItem('isLogin')) {
                next({
                  path: '/login'
                });
              } else {
                next();
              }
            } else {
              next(); // 确保一定要调用 next()
            }
          }
        },
        {
          path: 'weapon',
          component: Weapon,
          meta: {requiresAuth: true},
          beforeEnter: (to, from, next) => {
            if (to.matched.some(record => record.meta.requiresAuth)) {
              // this route requires auth, check if logged in
              // if not, redirect to login page.
              if (!sessionStorage.getItem('isLogin')) {
                next({
                  path: '/login'
                });
              } else {
                next();
              }
            } else {
              next(); // 确保一定要调用 next()
            }
          }
        },
        {
          path: 'category',
          component: Category,
          meta: {requiresAuth: true},
          beforeEnter: (to, from, next) => {
            if (to.matched.some(record => record.meta.requiresAuth)) {
              // this route requires auth, check if logged in
              // if not, redirect to login page.
              if (!sessionStorage.getItem('isLogin')) {
                next({
                  path: '/login'
                });
              } else {
                next();
              }
            } else {
              next(); // 确保一定要调用 next()
            }
          }
        },
        {
          path: 'about',
          component: About,
          meta: {requiresAuth: true},
          beforeEnter: (to, from, next) => {
            if (to.matched.some(record => record.meta.requiresAuth)) {
              // this route requires auth, check if logged in
              // if not, redirect to login page.
              if (!sessionStorage.getItem('isLogin')) {
                next({
                  path: '/login'
                });
              } else {
                next();
              }
            } else {
              next(); // 确保一定要调用 next()
            }
          }
        }
      ]
    }
  ]
});
