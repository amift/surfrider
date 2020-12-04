<template>
    <div class="appchat">
      <div class="row">
        <sidebar />
        <chat />
      </div>
    </div>
</template>

<script>
  import Chat from '../components/layouts/Chat.vue'
  import SidebarVue from '../components/layouts/Sidebar.vue'

  export default {
    name :'Inbox',
    components: {
      'sidebar': SidebarVue,
      'chat': Chat
    },
    data() {
      return {
        isConnected: false,
        socketMessage: ''
      }
    },
    created: function(){
      this.$store.state.socket.on('init', ()=>{
        
      });
    }
  }
</script>


<style >
  * {
    font-family: 'Montserrat';
  }
  .appchat *{
    font-size: 1rem;
  }
</style>
<style scoped>
  .appchat {
    padding: 0;
  }
  .appchat > .row{
    padding:0 ;
    margin: 0
  }
</style>
