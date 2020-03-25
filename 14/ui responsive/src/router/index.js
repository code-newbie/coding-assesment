import Vue from 'vue'
import VueRouter from 'vue-router'
import Music from '../views/Music.vue'

Vue.use(VueRouter)

const routes = [
  {
    path: '/',
    name: 'Music',
    component: Music
  },
  {
    path: '/MusicDetail',
    name: 'MusicDetail',
    component: () => import('../views/MusicDetail.vue')
  }
]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

export default router
