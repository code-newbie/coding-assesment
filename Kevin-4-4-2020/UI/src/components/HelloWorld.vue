<template>
  <div class="col-12 p-0">
    <div class="header col-sm-12" style="background-color: red; height: 50px;"> 
     
    </div>
    
    <div class="container">
      <div class="row">
        <div class="col-6" v-for="song in songs" v-bind:key="song.label" style="padding: 1px; background-color: #34495e;">
          <div class="col-12 p-0" style="background-color: black;">
            <div class="col-12 p-0">
              <b-img v-bind:src="song.image" alt="" style="width: 100%; min-height: 200px;" @click="imageClicked(song)">
              </b-img>
            </div>
            <div class="col-12" style="text-align: left;">
              <label class="songLabel" style="color: white;"><b>{{song.label}}</b></label>
              <br>
              <label class="songDesc" style="color: white;">{{song.description}}</label>
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
    item: {},
    songs: [
      {
        label: 'Taylor Swift',
        image: 'https://via.placeholder.com/300',
        description: 'TSNZ album'
      },
      {
        label: 'Beyonce',
        image: 'https://via.placeholder.com/300',
        description: '1st Album'
      },
      {
        label: 'Linkin park Swift',
        image: 'https://via.placeholder.com/300',
        description: 'One more light world Tour'
      },
      {
        label: 'Westlife',
        image: 'https://via.placeholder.com/300',
        description: 'Amazing'
      },{
        label: 'Taylor Swift',
        image: 'https://via.placeholder.com/300',
        description: 'TSNZ album'
      },
      {
        label: 'Beyonce',
        image: 'https://via.placeholder.com/300',
        description: '1st Album'
      },
      {
        label: 'Linkin park Swift',
        image: 'https://via.placeholder.com/300',
        description: 'One more light world Tour'
      },
      {
        label: 'Westlife',
        image: 'https://via.placeholder.com/300',
        description: 'Amazing'
      }
    ]
  }),
  methods : {
    imageClicked: function (song) {
      this.$store.commit("changeSong", song);
      this.$router.push('detailSong')
    }
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
  .songLabel {
    color: white;
    font-size: 12px;
  }
  .songDesc{
    color:white;
    font-size: 10px;
  }
</style>
