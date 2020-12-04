<template>
  <div class="col-12 text-center mt-2 mb-2 pt-4">
      <div class="contacts">
            <h4 class="title">Online Contacts</h4><div class="counter">2</div>
            <div class="clearfix"></div>
            <div class="list">
                <contact-box />
            </div>        
      </div>
  </div>
</template>

<script>
import Contact from '../partials/Contact.vue';

export default {
    name: 'Contacts',
    components:{
        'contact-box': Contact
    }
}
</script>

<style scoped>
.contacts {
    vertical-align:middle;
}
.contacts .title{
    float: left;
}
.contacts .counter{
    float: right;
    font-size: 0.6em;
    background : rgba(25,25,25,0.10);
    font-weight: bold;
    width: 25px;
    height: 25px;
    text-align: center;
    line-height: 25px;
    border-radius: 20px;
}
</style>