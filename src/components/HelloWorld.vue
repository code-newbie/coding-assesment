<template >
  <v-container>
    <v-row class="text-center">
      <v-col v-for="(item, index) in items" :key="item.name" cols="12" sm="4">
        <v-card
          elevation="18"
          class="pa-2"
          outlined
          tile
          :color="item.color"
          :img="item.src"
          height="240px"
          width="280px"
          @click="showItem(item, index)"
        >
          <v-card-title>
            {{ item.name }}
          </v-card-title>
        </v-card>
      </v-col>
    </v-row>

    <!-- modal -->
    <v-dialog v-model="dialog" width="500">
      <v-card :color="itemDetail.color">
        <v-card-title class="text-h5 grey lighten-2">
          {{ itemDetail.name }}
        </v-card-title>
        <v-img
          :lazy-src="itemDetail.src"
          max-height="200"
          max-width="250"
          :src="itemDetail.src"
        ></v-img>
        <v-card-text>
          Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do
          eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad
          minim veniam, quis nostrud exercitation ullamco laboris nisi ut
          aliquip ex ea commodo consequat. Duis aute irure dolor in
          reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla
          pariatur. Excepteur sint occaecat cupidatat non proident, sunt in
          culpa qui officia deserunt mollit anim id est laborum.
        </v-card-text>

        <v-divider></v-divider>

        <v-card-actions>
          <label v-if="itemDetail.stock != 0"
            >stock : {{ itemDetail.stock }}</label
          >
          <label class="red--text" v-if="itemDetail.stock == 0"
            >out of stock</label
          >
          <v-spacer></v-spacer>
          <v-btn
            color="primary"
            elevation="4"
            icon
            @click="buy(itemDetail, idx)"
            :disabled="outofstock(idx)"
          >
            Buy
          </v-btn>
          <v-spacer></v-spacer>

          <v-btn color="accent" text @click="dialog = false"> Close </v-btn>
        </v-card-actions>
      </v-card>
    </v-dialog>
  </v-container>
</template>

<script>
export default {
  name: "HelloWorld",
  data: () => ({
    items: initialItems(),
    dialog: false,
    itemDetail: "",
    idx: -1,
  }),
  methods: {
    showItem(item, idx) {
      this.dialog = true;
      this.itemDetail = item;
      this.idx = idx;
    },
    buy(item, idx) {
      this.items[idx].stock -= 1;
      this.itemDetail.stock = this.items[idx].stock;
    },
    outofstock() {
      if (this.itemDetail.stock == 0) {
        return true;
      } else {
        return false;
      }
    },
  },
};

function initialItems() {
  return [
    {
      name: "Aqua",
      price: 5000,
      stock: 5,
      color: "white",
      src: require("@/assets/aqua.jpg"),
    },
    {
      name: "Teh Botol",
      price: 7000,
      stock: 5,
      color: "orange",
      src: require("@/assets/teh botol.jpeg"),
    },
    {
      name: "Pocari Sweat",
      price: 10000,
      stock: 5,
      color: "blue",
      src: require("@/assets/pocari sweat.jpg"),
    },
  ];
}
</script>
