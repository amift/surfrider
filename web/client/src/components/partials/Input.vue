<template >
    <div class="inputs">
        <div class="box">
            <div class="row">
                <div class="icon">
                    <button class="btn btn-attachement"><i class="fa fa-image"></i></button>
                </div>
                <div class="input">
                    <textarea class="form-control" name="message" id="message" rows="1"></textarea>
                </div>
                <div class="button">
                    <button class="btn btn-info">
                        Send <i class="fa fa-arrow-right"></i>
                    </button>
                </div>
            </div>
        </div>
    </div>
</template>


<script>
export default {
    name : 'Input'
}
</script>



<style scoped>
.inputs {
    height: 100%;
}
.inputs .box {
    height: 80%;
    margin-left: 17px;
    margin-right: 17px;
    margin-top: 17px;
    padding-left: 30px;
    padding-top: 15px;
    padding-right: 30px;
}

.inputs .row{
    border-radius: var(--var-box-raduis);
    box-shadow: 1px 1px 10px rgba(25,25,25,0.09);
    padding: 30px !important;
    background: white;
}

.btn {
    background: var(--var-button-bg);
    color: var(--var-button-color);
    border-radius: calc(var(--var-box-raduis) * 0.6);
    width: 100%;
    min-height: var(--var-input-height);
}

.btn .fa{
    font-size: 1rem;
    margin-left: 10px;
}

.icon {
    margin-left: 10px;
    width: 60px;
    line-height: 50px;
    text-align: left;
}
.input {
    margin-left: 10px;
    width: calc(100% - 60px - 200px - 30px);
}
.input textarea{
    min-height: var(--var-input-height);
}
.button{
    margin-left: 10px;
    width: 200px;
}

.btn-attachement{
    background: transparent;
    color: var(--var-button-file-color);
    margin: unset;
}
.btn-attachement .fa{
    font-size: 1.8rem;
}
</style>