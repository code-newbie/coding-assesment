<template>
  <div class="container">
    <div class="row">
      <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-6">
          <router-link to="/MusicDetail"><img class="img" alt="music one" src="../assets/image/pic-1.jpg"></router-link>
          <p class="text-bold">Tak Ada Yang Abadi</p>
          <p class="text">NOAH</p>
          <span class="fa fa-star checked"></span>
          <span class="fa fa-star checked"></span>
          <span class="fa fa-star checked"></span>
          <span class="fa fa-star"></span>
          <span class="fa fa-star"></span>
      </div>
      <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-6">
          <router-link to="/MusicDetail"><img class="img" alt="music one" src="../assets/image/pic-2.jpg"></router-link>
          <p class="text-bold">Jika Engkau</p>
          <p class="text">NOAH</p>
          <span class="fa fa-star checked"></span>
          <span class="fa fa-star checked"></span>
          <span class="fa fa-star checked"></span>
          <span class="fa fa-star checked"></span>
          <span class="fa fa-star"></span>
      </div>
      <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-6">
          <router-link to="/MusicDetail"><img class="img" alt="music one" src="../assets/image/pic-3.jpg"></router-link>
          <p class="text-bold">One More Night</p>
          <p class="text">Maroon 5</p>
          <span class="fa fa-star checked"></span>
          <span class="fa fa-star checked"></span>
          <span class="fa fa-star"></span>
          <span class="fa fa-star"></span>
          <span class="fa fa-star"></span>
      </div>
      <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-6">
          <router-link to="/MusicDetail"><img class="img" alt="music one" src="../assets/image/pic-4.jpg"></router-link>
          <p class="text-bold">Nothing Last Forever</p>
          <p class="text">Maroon 5</p>
          <span class="fa fa-star checked"></span>
          <span class="fa fa-star"></span>
          <span class="fa fa-star"></span>
          <span class="fa fa-star"></span>
          <span class="fa fa-star"></span>
      </div>
    </div>
  </div>
</template>

<style lang="less">
  .img {
    width: 350px;
    margin: 10px;
  }

  .checked {
    color: orange;
  }

  .text-bold {
    font-size: 20px;
    font-weight: bold;
  }

  .text {
    font-size: 18px;
  }

  @media only screen and (max-width: 1200px) and (min-width: 900px)  {
    .img {
      width: 250px;
      margin: 10px;
    }

    .text-bold {
      font-size:15px;
      font-weight: bold;
    }

    .text {
      font-size:15px;
    }
  }

  @media only screen and (max-width: 900px) and (min-width: 700px)  {
    .img {
      width: 200px;
      margin-bottom: 10px;
    }

    .text-bold {
      font-size:15px;
      font-weight: bold;
    }

    .text {
      font-size:15px;
    }
  }

  @media only screen and (max-width: 700px) and (min-width: 600px)  {
    .img {
      width: 200px;
      margin: 10px;
    }

    .text-bold {
      font-size:15px;
      font-weight: bold;
    }

    .text {
      font-size:15px;
    }
  }

  @media only screen and (max-width: 600px) and (min-width: 300px)  {
    .img {
      width: 150px;
      margin: 10px;
    }

    .text-bold {
      font-size:12px;
      font-weight: bold;
    }

    .text {
      font-size:12px;
    }
  }
</style>
