<template>
    <div class="container">
        <div class="row body-color">
            <div class="col-md-12">
                <div class="col-md-12">
                    <img class="img-detail" alt="music one" src="../assets/image/pic-1.jpg">
                </div>
                 <div class="col-md-12 center bg-text">
                    <h5 class="text-detail"><b>Lorem Ipsum</b></h5>
                    <p class="text-detail">Lorem</p>
                </div>
                <div class="row center bg-icon">
                    <div class="col-md-4 col-4">
                        <img class="img-sound" alt="music one" src="../assets/image/next.png">
                    </div>
                    <div class="col-md-4 col-4">
                        <img class="img-sound" alt="music one" src="../assets/image/icon-play.png">
                    </div>
                    <div class="col-md-4 col-4">
                        <img class="img-sound" alt="music one" src="../assets/image/next.png">
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<style lang="less">
    .img-detail {
        width: 350px;
        margin: 10px;
        margin-bottom:0px;
    }
    .center {
        margin: auto;
        width: 50%;
        border: 3px solid #757575;
        padding: 10px;
    }
    .img-sound {
        width:50px;
        margin-bottom:0px;
        padding-left: 0px;
    }
    .bg-text {
        background-color:#757575;
        width: 350px;
    }
    .bg-icon {
        background-color:#E0E0E0;
        width: 350px;
    }
    .text-detail {
        text-align: left;
        color: #fff;
    }

    @media only screen and (max-width: 900px) and (min-width: 700px)  {
        .img-detail {
            width: 300px;
            margin: 10px;
            margin-bottom:0px;
        }
        .bg-text {
            background-color:#757575;
            width: 300px;
        }
        .bg-icon {
            background-color:#E0E0E0;
            width: 300px;
        }
        .img-sound {
            width:40px;
            margin-bottom:0px;
            padding-left: 0px;
        }
    }

    @media only screen and (max-width: 700px) and (min-width: 600px)  {
        .img-detail {
            width: 250px;
            margin: 10px;
            margin-bottom:0px;
        }
        .bg-text {
            background-color:#757575;
            width: 250px;
        }
        .bg-icon {
            background-color:#E0E0E0;
            width: 250px;
        }
        .img-sound {
            width:25px;
            margin-bottom:0px;
            padding-left: 0px;
        }
    }

    @media only screen and (max-width: 600px) and (min-width: 300px)  {
        .img-detail {
            width: 250px;
            margin: 10px;
            margin-bottom:0px;
        }
        .bg-text {
            background-color:#757575;
            width: 250px;
        }
        .bg-icon {
            background-color:#E0E0E0;
            width: 250px;
        }
        .img-sound {
            width:25px;
            margin-bottom:0px;
            padding-left: 0px;
        }
    }
</style>
