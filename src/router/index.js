import { createRouter, createWebHistory } from 'vue-router'

import Gallery from "../views/Gallery";
import VendingMachine from "../views/VendingMachine";

const routes = [
  // { path: '/', name: 'Home', component: Home },
  { path: '/', name: 'Gallery', component: Gallery },
  { path: '/vending-machine', name: 'VendingMachine', component: VendingMachine },
]

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes
})

export default router
