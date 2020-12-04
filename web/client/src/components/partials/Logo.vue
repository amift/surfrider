<template>
  <div class="col-12 text-center mt-2 mb-2">
      <div class="logobox">
        <div class="row">
            <img alt="Icon" src="assets/media/icon.png" class="icon  rounded-sm">
            <h2 class="title">SurfRider</h2>
        </div>
      </div>
  </div>
</template>

<script>
export default {
    name: 'Logo'
}
</script>

<style >
.logobox .row{
    align-items: center;
    height: 60px;
}
.logobox .icon {
    vertical-align:middle;
}
.logobox .icon{
    width: 60px;
}
.logobox .title{
    max-width: 80px;
    color: var(--var-logo-color);
    font-weight: 700;
}
</style>