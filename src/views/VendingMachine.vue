<template>
    <section class="vending-machine">
        <div class="container">
            <div class="row">
                <div class="col-md-6 mx-auto">
                    <form @submit="checkForm" action="javascript:;">
                        <div class="form-group">
                            <label for="uang">Uang</label> 
                            <input class="form-control" id="uang" placeholder="Masukkan Uang" v-model="form.uang" type="number">
                        </div>
                        <div class="form-group">
                            <label for="exampleFormControlSelect1">Minuman</label> 
                            <select class="form-control" id="exampleFormControlSelect1" v-model="form.minum" placeholder="Pilih minuman">
                                <option disabled selected value="">Pilih Minuman</option>
                                <option v-for="item in items" :key="item" :value="item.drink">{{ item.drink }}</option>
                            </select>
                        </div>
                        <button class="btn btn-primary" type="submit">Submit</button>
                    </form>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6 mx-auto">
                    {{ items }}
                </div>
            </div>
        </div>
    </section>
</template>

<script>
    export default {
        name: 'VendingMachine',
        data(){
            return {
                pecahan: ['2000', '5000', '10000', '20000'],
                items : [
                    {
                        drink : "Aqua",
                        price : 5000,
                        stock : 2
                    },
                    {
                        drink : "Teh Botol",
                        price : 7000,
                        stock : 10
                    },
                    {
                        drink : "Pocari Sweet",
                        price : 10000,
                        stock : 10
                    },
                ],
                form : {
                    uang : null,
                    minum : ''
                }
            }
        },
        created(){
        },
        methods : {
            checkForm(){
                const {uang, minum} = this.form

                const check = this.pecahan.includes(uang)
                const check2 = this.items.find(v => v.drink === minum)
                if (check && check2.price == uang.toString()) {
                    const index = this.items.indexOf(check2);
                    if (this.items[index].stock != 0) {
                        this.items[index].stock = this.items[index].stock - 1
                    }
                }
            }
        }
    }
</script>

<style lang="scss">
</style>
