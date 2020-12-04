<template>
  <div id="chat" class="col-md-9">
    <div class="boxchat" >
        <chat-messages />        
        <chat-input />        
    </div>
  </div>
</template>

<script>
import ChatMessages from './ChatMessages.vue';
import Input from '../partials/Input.vue';

export default {
    name: 'Chat',
    components: {
        'chat-messages': ChatMessages,
        'chat-input': Input
    }
}

</script>

<style scoped>
    .boxchat{
        border-radius: var(--var-box-raduis);
        background: var(--var-box-bg);
        margin-top: 2.5vh;
        height: 95vh;
    }
    .boxchat .messages{
        border-radius: var(--var-box-raduis) var(--var-box-raduis) 0px 0px;
        height: 76vh;
    }
    .boxchat .inputs{
        border-radius: 0px 0px var(--var-box-raduis) var(--var-box-raduis);
        height: 19vh;
    }
</style>