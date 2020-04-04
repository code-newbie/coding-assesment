import Vue from 'vue'
import VueRouter from 'vue-router'
import HelloWorld from '../components/HelloWorld.vue'
import DetailSong from '../components/detailSong.vue'

Vue.use(VueRouter)

const routes = [
  {
    path: '/',
    name: 'Home',
    component: HelloWorld
  },
  {
    path: '/detailSong',
    name: 'DetailSong',
    component: DetailSong
  }
]

const router = new VueRouter({
  routes
})

export default router
