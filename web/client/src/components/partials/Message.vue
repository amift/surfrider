<template >
    <div class="message">
        <div class="my msg d-flex" v-if="ismine">
            <div>
                <p class="content">{{ getMessage() }}</p>
                <p class="time">{{ getTime() }}</p>
            </div>
            <div>
                <img :src="getAvatar()" alt="Avatar" class="avatar rounded-circle">
                <div :class="online ? '':'offline'" class="online fa fa-circle text-success"></div>
            </div>
        </div>
        <div class="msg d-flex" v-else>
            <div>
                <img :src="getAvatar()" alt="Avatar" class="avatar rounded-circle">
                <div :class="online ? '':'offline'" class="online fa fa-circle text-success"></div>
            </div>
            <div>
                <p class="content">{{ getMessage() }}</p>
                <p class="time">{{ getTime() }}</p>
            </div>
        </div>
        <div class="clearfix"></div>
    </div>
</template>


<script>
import { timeSince, trimText } from '../../common/functions.js';

export default {
    name : 'Message',
    props: {
        "ismine" : { 
            type: String
        },
        "avatar": {
            type: String
        },
        "online" : { 
            type: String
        },

        "time" : { 
            type: Number
        },

        "message" : { 
            type: String
        },
    },
    methods: {
        getTime : function(){
            return timeSince(this.time) + " ago";
        },
        getMessage : function(){
            return trimText(this.message);
        },
        getAvatar : function(){
            return this.avatar || "assets/media/avatar.jpg";
        }
    }
}
</script>



<style scoped>
.msg{
    padding: 17px;
    max-width: 50vw;
    margin-left: 20px;
    margin-right: 20px;
}
.time{
    font-size: 0.7rem;
    margin-left: 20px;
    margin-top: -10px;
}
.online{
    border: 2px white solid;
    position: unset;
    border-radius: 50px;
    font-size: 0.5rem;
    margin-left: 60px;
    margin-top: -19px;
    display: flex;
}
.offline {
    color: red !important;
}
.content{
    padding: 10px;
    font-size: 1rem;
    box-shadow: 2px 2px 2px rgba(0, 0, 0, 0.03);
}

.my{
    float: right;
}
.avatar{
    margin-left: 10px;
    width: 60px;
    height: 60px;
}

.content{
    margin-left: 10px;
    border-radius: var(--var-box-raduis);
    color: var(--var-rcmessage-color);
    background: var(--var-rcmessage-bg);
    padding-top: 15px;
    padding-bottom: 15px;
    padding-left: 20px; 
    padding-right: 16px; 
}
.my .content{
    border-radius: var(--var-box-raduis);
    color: var(--var-mymessage-color);
    background: var(--var-mymessage-bg);
}

.my 
.time{
    font-size: 0.7rem;
    float: right;
    margin-right: 20px;
}

@media(max-width: 1000px){
    .msg{
        max-width: 100vw;
        
        margin-left: 2px;
        margin-right: 2px;
    }
}
</style>