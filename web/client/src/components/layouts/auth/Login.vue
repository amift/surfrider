<template>
    <div class="auth-login text-left">
        <form method="post" v-on:submit.prevent="onSubmit">
            <div class="logo">
                <img alt="Icon" src="assets/media/icon.png" class="icon rounded-circle">
               <h2 class="title">QuickChat</h2>
            </div>
            <div class="errors"></div>
            <div class="form-group">
                <input required placeholder="Username" type="text" id="username" class="form-control">
            </div>
            <div class="form-group">
                <input required placeholder="Password" type="password" id="password" class="form-control">
            </div>

            <div class="form-group">
                <button type="submit" class="btn btn-light">Login <i class="fa fa-arrow-right"></i></button>
            </div>
            <div class="form-group">
                <button @click="$parent.toggleTab()" type="button" class="btn btn-dark">Register <i class="fa fa-user-plus"></i></button>
            </div>
        </form>
    </div>
</template>


<script>
export default {
    name : 'Login',
    methods: {
        onSubmit(){
            this.disableButton();
            this.$el.querySelector('.errors').innerHTML = "";
            setTimeout(
                ()=> this.$store.state.socket.emit('login', {
                    username: this.$el.querySelector('#username').value,
                    password: this.$el.querySelector('#password').value,
                }),
                1000
            );
        },
        enableButton(){
            this.$el.querySelector('button').removeAttribute('disabled');
        },
        disableButton(){
            this.$el.querySelector('button').setAttribute('disabled','disabled');
        },
        seterror(error){
            this.$el.querySelector('.errors').innerHTML = `<div class='alert alert-danger'>${error}</div>`;
        },
        setsuccess(error){
            this.$el.querySelector('.errors').innerHTML = `<div class='alert alert-danger'>${error}</div>`;
        }
    },
    created: function(){
        this.$store.state.socket.on('login', (data)=>{
            this.$el.querySelector('button').removeAttribute('disabled');

            if (data.error){
                this.seterror(data.error);
            }else{
                this.setsuccess('Account Successfully Registred');
            }
        });
    }
}
</script>

<style scoped>
    .auth-login,
    .auth-register{
        height: 100%;
        text-align: center;
        justify-content: center;
        align-items: center;
        display: flex;
    }
    input{
        min-height: var(--var-input-height);
        min-width: 35vw;
    }
    form{
        margin: auto;
    }

    .btn{
        width:100%;
        color: white;
        line-height: 37px;
        color: white !important;
    }

    .btn i{
        margin-right: 10px;
        float: right;
        font-size: 1rem;
    }
    .btn, .btn *{
        color: white !important;
        line-height: 37px;
    }

    /**.btn-light */
    .btn-light {
        background: var(--var-button-light-bg);
        border-color: var(--var-button-light-border);
    }
    .btn-light:hover{
        background: var(--var-button-light-bg-hover);
        border-color: var(--var-button-light-border-hover);
    }
    /**.btn-dark */
    .btn-dark {
        background: var(--var-button-dark-bg);
        border-color: var(--var-button-dark-border);
    }
    .btn-dark:hover{
        background: var(--var-button-dark-bg-hover);
        border-color: var(--var-button-dark-border-hover);
    }
    .btn-light.disabled, .btn-light:disabled,.btn-dark.disabled, .btn-dark:disabled{
        background-color: #32566c;
        border-color: #555b97;
    }
    .logo{
        text-align: center;
        margin-bottom: 30px;
    }

    .logo img{
        max-width: 100px;
    }
    .logo .title{
        font-size: 1.5rem;
    }

    @media (max-width: 750px) {
        input{
            min-width: 70vw;
        }
    }
    @media (min-width: 750px) and ( max-width: 1000px) {
        input{
            min-width: 60vw;
        }
    }
    @media (min-width: 1450px) {
        input{
            min-width: 25vw;
        }
    }
</style>