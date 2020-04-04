<template>
  <div class="col-12 p-0">
   
    
    <div class="container">
      <div class="row">
        <div class="col-12 p-0">
            <img v-bind:src="song.image" alt="" style="width: 100%;">
        </div>
        <div class="col-12" style="text-align: left; background-color: #16a085;">
            <div class="row">
              <div class="col-8 pl-2"> 
                <label class="songLabel" style="color: white;"><b>{{song.label}}</b></label>
                <br>
                <label class="songDesc" style="color: white;">{{song.description}}</label>
              </div>
              <div class="col-4" style="position:relative;">
                <div style="border-radius: 50%; background-color:#2ecc71; width:50px; height: 50px; position:absolute; top:-30px;">

                </div>
              </div>
            </div>
        </div>
        <div class="col-12" style="background-color: #bdc3c7; min-height: 50px;">
            <div class="row">
                <div class="col-3">

                </div>
                <div class="col-5">
                    <label>Some Text</label>
                </div>
                <div class="col-4">
                    <label>Some Text</label>
                </div>
            </div>
        </div>
      </div>
    </div>
    
  </div>
</template>

<script>

export default {
  name: 'HelloWorld',
  data :() => ({
    song: {},
    
  }),
  methods : {
    imageClicked: function (song) {
      this.$store.commit("changeSong", song);
    }
  },
  mounted () {
      this.song = this.$store.state.song  
  }
}

</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
  .songLabel {
    color: black;
    font-size: 18px;
  }
  .songDesc{
    color:white;
    font-size: 12px;
  }
</style>
