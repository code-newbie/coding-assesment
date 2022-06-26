<template>
  <html>
    <body>
        <h1>Vending Machine</h1>
        <div style="display: flex; justify-content:center; margin: auto; flex-wrap: wrap;">
          <div style="width: calc(100% - 500px); display: flex; ">
              <div v-for="item of itemList" :key="item.id"
                style="border: solid 1px #9E9E9E; border-radius: 8px; padding 5px; width: calc(30% - 10px); margin: 0 5px; height: 250px">
                <div style="height: calc(100% - 85px)">
                  <img src="../assets/aqua.jpg" style="width: 100%; height: 100%"/>
                </div>
                <div style="height: 85px; padding: 0 5px 5px">
                  <div>
                    {{item.name}}
                  </div>
                  <div>
                    Stock : {{item.stock}}
                  </div>
                  <div>Rp. {{item.price}}</div>
                  <div>
                    <button @click="buyItem(item)">
                      Buy Item
                    </button>
                  </div>
                </div>
              </div>
          </div>
          <div style="width: 500px">
            <div style="display: flex; align-items:center;
            width: 500px; margin: auto; flex-wrap: wrap;">

              <div style="min-width: calc(100% - 150px); margin: 20px 0">
                <select v-model="moneyToInput" id="amountMoney" style="width: calc(100% - 20px); margin: 10px; height: 30px;">
                  <option value="">Select Amount Money</option>
                  <option value="2000">Rp. 2,000</option>
                  <option value="5000">Rp. 5,000</option>
                  <option value="10000">Rp. 10,000</option>
                  <option value="20000">Rp. 20,000</option>
                </select>
              </div>
              <div style="min-width: 150px; margin: 20px 0">
                <button @click="addingBalance" style="background-color: green; width: 150px; outline: none; border: solid 1px green; border-radius: 8px; height: 30px; color: white">
                    Input Money
                </button>
              </div>

              <div style="min-width: 210px; margin: 20px 0">
                  <span>Current Balance : </span>
              </div>
              <div style="min-width: calc(100% - 210px); margin: 20px 0">
                  Rp. <span id="theBalance">0</span>
              </div>
            </div>
          </div>
        </div>
    </body>
</html>
</template>

<script>
export default {
  data(){
    return {
      moneyToInput: "",
      itemList: [{
        id: 1,
        name: 'Aqua',
        url: './assets/aqua.jpg',
        stock: 11,
        price: '5,000'
      }, {
        id: 2,
        name: 'Teh Botol',
        url: './assets/teh-botol.jpg',
        stock: 1,
        price: '7,000'
      }, {
        id: 3,
        name: 'Pocari Sweat',
        url: './assets/pocari.jfif',
        stock: 15,
        price: '10,000'
      }]
    }
  },
  methods: {
    addingBalance: () => {
      let theMoney = parseInt(document.getElementById('amountMoney').value||'0');
      let theBalance = parseInt(document.getElementById('theBalance').innerHTML.replace(/,/g, ''));
      let theSum = theBalance + theMoney;
      console.log(theMoney, theBalance, theSum);
      document.getElementById('theBalance').innerHTML = theSum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
      document.getElementById('amountMoney').value = '';
    },
    buyItem: (item) => {
      let itemPrice = item.price, itemStock = item.stock;
      if(!itemStock){
        alert('Out of Stock!');
      }else{
        let theBalance = parseInt((document.getElementById('theBalance').innerHTML).replace(/,/g, ''));
        let thePrice = parseInt(itemPrice.replace(/,/g, ''));
        if(thePrice>theBalance){
          alert('Insufficient Balance!');
        }else{
          alert('Please take your item');
          document.getElementById('amountMoney').value = '';
          document.getElementById('theBalance').innerHTML = '0';
          item.stock--;
        }
      }
    }
  },
  name: 'HelloWorld',
  props: {
    msg: String
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
h3 {
  margin: 40px 0 0;
}
ul {
  list-style-type: none;
  padding: 0;
}
li {
  display: inline-block;
  margin: 0 10px;
}
a {
  color: #42b983;
}
</style>
