<template>
  <div id="app">
    <Vendingmachine/>
  </div>
</template>

<script>
import Vendingmachine from './components/VendingMachine.vue'

export default {
  name: 'App',
  components: {
    Vendingmachine
  }
}
</script>

<style lang ="scss" src="./App.scss"></style>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
</style>
