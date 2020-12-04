import { createRouter, createWebHashHistory } from 'vue-router'
import Inbox from '../views/Inbox.vue'
import Auth from '../views/Auth.vue'
import store from '../store';

const routes = [
  {
    path: '/inbox',
    name: 'inbox',
    component: Inbox
  },
  {
    path: '/auth',
    name: 'auth',
    component: Auth
  },
];

const router = createRouter({
  history: createWebHashHistory(),
  routes
});

router.beforeEach((to, from, next) => {
  if (to.name !== 'auth' && !store.getters.isAuthenticated) next({ name: 'auth' })

  next()
})

export default router
