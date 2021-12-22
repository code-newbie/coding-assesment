export default {
    name: "vendingmachine",
    data() {
        return {
            products: [
                { id: 1, title: "Aqua", price: 5000, stock: 5, thumbnail: "media/img/aqua.png", currentstatus: "Available"}
                ,{ id: 2, title: "Teh Botol", price: 7000, stock: 2, thumbnail:"media/img/tehbotol.png", currentstatus: "Available" }
                ,{ id: 3, title: "Pocari Sweat", price: 10000, stock: 1, thumbnail:"media/img/pocari.png", currentstatus: "Available" }
            ],
            cashes:[
                {id:1, text: "2000", value: 2000}
                ,{id:2, text: "5000", value: 5000}
                ,{id:3, text: "10000", value: 10000}
                ,{id:4, text: "20000", value: 20000}
            ],
            showModal: false,
            selectedProduct: {},
            insertedCash: 0,
            changeAmount: 0,
            isDisabled: true
        }
    },
    methods: {
        selectProduct: function (product) {
            if(product.currentstatus == "EMPTY"){
                this.showModal = false;    
            }
            else{
                this.showModal = true;
            }

            this.selectedProduct = product;
            this.insertedCash = 0;
            this.changeAmount = 0;
            this.isDisabled = true;
        },
        closeModal() {
            this.showModal = false;
        },
        insertCash: function(cash){
            this.insertedCash += cash.value;

            if(this.insertedCash >= this.selectedProduct.price)
            {
                this.isDisabled = false;
            }
        },
        purchase(){
            this.changeAmount = this.insertedCash - this.selectedProduct.price;
            this.isDisabled = true;
            this.insertedCash = 0;

            var item = this.products.find(x => x.id == this.selectedProduct.id);

            if(item){
                item.stock -= 1;

                if(item.stock == 0){
                    item.currentstatus = "EMPTY";
                    this.showModal = false;
                }
            }
        },
        showRead: function(txt){
            if(txt == "EMPTY"){
                return true;
            }
            else{
                return false;
            }
        }
    }
}
