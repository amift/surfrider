<template>
  <div class="col-12 text-center mt-2 mb-2">
      <div class="userbox">
        <img alt="Avatar"  v-bind:src="avatar" class="avatar rounded-circle">

        <h2 class="username">
            {{ username }} 
            <small>
                <!-- <i class="fa fa-cog mr-2" ></i> -->
                <i @click="logout" class="fa fa-power-off" ></i>
            </small>
        </h2>
        <p class="about">
            {{ about }}
        </p>
      </div>
  </div>
</template>

<script>
export default {
    name: 'UserBox',
    props:['username','about','avatar'],

    methods: { 
        logout(){
            this.$store.dispatch('logout');
        }
    }
}
</script>

<style scoped>
    .userbox{
        background: var(--var-box-bg);
        border: solid 1px rgba(25,25,25,0.15);
        border-radius: var(--var-box-raduis);
        padding-top: 30px;
        padding-bottom: 30px;
    }
    .avatar{
        text-align: center;
        width: 110px;
        height: 110px;
    }
    .username{
        margin-top: 15px;
        font-size: 1.5rem;
        font-weight: 600;
    }
    .username .fa{
        font-size: 1.3rem;
    }

    .about{
        font-size: 1rem;
        font-weight: 500;
        color: var(--var-username-color);
    }
</style>