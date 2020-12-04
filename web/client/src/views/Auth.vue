<template>
  <div class="appauth row">
    <div v-if="auth == 'login'" class="col h-100"><auth-login /></div>
    <div v-if="auth == 'register'" class="col h-100"><auth-register /></div>
  </div>
</template>



<script>
import Login from '../components/layouts/auth/Login.vue';
import Register from '../components/layouts/auth/Register.vue';

export default {
  name :'Auth',
  state: {
    auth : 'login',
  },
  components: {
    'auth-login': Login,
    'auth-register': Register,
  },
  data : function () {
    return {
      auth: this.$store.state.auth,
    }
  },
  methods : {
    toggleTab  : function(){
      this.auth = this.auth == 'login' ? 'register' : 'login';
    }
  }
}
</script>
<style>
    .errors *{
        font-size:1rem !important;
    }
</style>

<style scoped>

  .appauth{
    height: 100%;
    margin: 0 !important;
    padding: 0 !important;
  }
  .appauth *{
    font-size: 1.3rem;
  }
  .appauth > .row{
    padding:0 ;
    margin: 0
  }
</style>