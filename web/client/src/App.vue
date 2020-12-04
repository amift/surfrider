<template>
 <router-view />
</template>

<script>

export default {
  name: 'App',


  created: function(){
    this.$store.state.socket.on("connect_error", () => {
      this.$store.state.socket.connect();
    });
    this.$store.state.socket.on("connect", () => {
      this.auth();
    });
    
    this.$store.state.socket.on('auth', (data)=>{
      if (!data.error){
        console.log('Logging Success');
        localStorage.setItem('token', data.token);
        this.$store.state.logged = true;
        this.$store.state.user = data.user;
        this.$router.push('/inbox');
      }else{
        console.log('Auth required');
        localStorage.removeItem('token');
        this.$store.state.user = {};
        this.$store.state.logged = false;
        this.$router.push('/auth');
      }
    });
  },
  methods: {
    auth(){
      this.$store.state.socket.emit('auth', {
        token : localStorage.getItem('token')
      });
    }
  }
}
</script>

<style>
  @import url('https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css');
  @import url('https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700;800;900&display=swap');
  @import './assets/styles/variables.css';
</style>


<style >
#app{
  height: 100vh;
}
* {
  font-family: 'Montserrat';
}
</style>