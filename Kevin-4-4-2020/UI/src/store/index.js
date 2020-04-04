// store/index.js
 
import Vue from "vue";
import Vuex from "vuex";
 
Vue.use(Vuex);
 
export default new Vuex.Store({
 state: {
     song : {
         label : '',
         description : '',
         image : ''
     }
 },
 getters: {},
 mutations: {
    changeSong (state, payload) {       
        state.song.label = payload.label
        state.song.description = payload.description
        state.song.image = payload.image      
      }
 },
 actions: {}
});