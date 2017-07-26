import Vue from 'vue';
import VueUp from 'vueup';// 弹出提醒层
import Router from 'vue-router';
import vmodal from 'vue-js-modal';
import VueResource from 'vue-resource';
import Home from '@/components/home/Home';
import Login from '@/components/login/Login';
import Category from '@/components/category/Category';
import Weapon from '@/components/weapon/Weapon';

Vue.use(VueUp);
Vue.use(Router);
Vue.use(VueResource);
Vue.use(vmodal);

export default new Router({
  linkActiveClass: 'active',
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
      path: '/home',
      name: 'Home',
      component: Home,
      children: [
        {
          path: '',
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
        }
      ]
    }
  ]
});
