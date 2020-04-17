<template>
  <div id="app">
    <b-card no-body>
      <b-tabs pills card fill>
        <b-tab title="Phone Transform" active>
          <phone-transform />
        </b-tab>
        <b-tab title="Image Detail">
          <image-detail />
        </b-tab>
      </b-tabs>
    </b-card>
  </div>
</template>

<script>
import PhoneTransform from "./components/PhoneTransform.vue";
import ImageDetail from "./components/ImageDetail.vue"

export default {
  name: "App",
  components: {
    PhoneTransform,
    ImageDetail
  }
};
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
}
</style>
