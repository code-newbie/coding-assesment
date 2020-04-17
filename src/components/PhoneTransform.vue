<template>
  <div>
    <div class="row">
      <div class="col-md-6">
        <b-form-input v-model="phoneNumber"></b-form-input>
      </div>
      <div class="col-md-6 text-left">Result: {{transformedNumber}}</div>
    </div>
  </div>
</template>

<script>
export default {
  name: "PhoneTransform",
  data() {
    return {
      phoneNumber: ""
    };
  },
  computed: {
    transformedNumber() {
      let result = this.phoneNumber.substring(this.phoneNumber.indexOf(" "));
      if (result) {
        return result.replace(/\D/g, "");
      }
      return this.phoneNumber.replace(/\D/g, "");
    }
  }
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
</style>
