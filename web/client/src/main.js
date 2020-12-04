import '@babel/polyfill'
import 'mutationobserver-shim'
import { createApp } from 'vue'
import App from './App.vue'
import router from './router'
import store from "./store"
import 'bootstrap/dist/css/bootstrap.css'
import 'bootstrap-vue/dist/bootstrap-vue.css'
import { sync } from 'vuex-router-sync'

sync(store, router)

const appVue = createApp(App)
    .use(router)
    .use(store);

// mount
appVue.mount('#app');