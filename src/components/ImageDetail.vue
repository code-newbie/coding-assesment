<template>
  <div>
    <div class="row">
      <div class="col-md-3 col-6" v-for="(image, index) in images" :key="index">
        <img
          :src="image.url"
          :alt="image.title"
          class="max-width-image"
          @click="selectImage(image)"
        />
      </div>
    </div>

    <b-modal
      ref="modalDetail"
      title="Image Detail"
      size="xl"
      scrollable
      hide-footer
      @hidden="resetModal"
    >
      <div v-if="selectedImage">
        <img :src="selectedImage.url" class="max-width-image" />
        <p>{{selectedImage.title}}</p>
        <p>Artist: {{selectedImage.artist}}</p>
      </div>
    </b-modal>
  </div>
</template>

<script>
export default {
  name: "ImageDetail",
  data() {
    return {
      images: [
        {
          title: "Image 1",
          artist: "Artist 1",
          url: "img/img1.jpg"
        },
        {
          title: "Image 2",
          artist: "Artist 2",
          url: "img/img2.jpg"
        },
        {
          title: "Image 3",
          artist: "Artist 3",
          url: "img/img3.jpg"
        },
        {
          title: "Image 4",
          artist: "Artist 4",
          url: "img/img4.jpg"
        }
      ],
      selectedImage: null
    };
  },
  methods: {
    selectImage(image) {
      this.selectedImage = image;
      this.$refs.modalDetail.show();
    },
    resetModal() {
      this.selectedImage = null;
    }
  }
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
.max-width-image {
  max-width: 100%;
}

.row div {
  padding: 0px;
}
</style>
