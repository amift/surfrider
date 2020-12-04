<template>
    <div class="contact">
        <img src="assets/media/avatar.jpg" class="avatar rounded-circle" alt="Avatar">
        <h3 class="username">Henry Body</h3>
    </div>
</template>

<script>
export default {
    name :'Contact'
}
</script>

<style scoped>
.contact{
    padding-top: 10px;
    padding-bottom: 3px;
    padding-right: 10px;

    margin-bottom: 10px;
    display: flex;
}
.avatar{
    margin-left: 10px;
    width: 60px;
    height: 60px;
}

.username{
    line-height: 60px;
    vertical-align:middle;
    margin-left: 10px;
    font-size: 1rem !important;
    color: var(--var-username-color)
}

.active{
    background: var(--var-hover-color);
    border-radius: var(--var-box-raduis);
}
.contact:hover{
    background: var(--var-hover-color);
    border-radius: var(--var-box-raduis);
}
</style>