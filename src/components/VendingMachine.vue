<template>
  <div>
    <b-container fluid>
        <b-row>
            <b-col v-for="product in products" :key="product.id">
               <h3>{{ product.title }}</h3>
               <img :alt="product.title" :src="product.thumbnail" @click="selectProduct(product)"/>
               <h3 v-bind:class="{ 'text-danger': showRead(product.currentstatus)}"> {{ product.currentstatus }} </h3>
            </b-col>
        </b-row>
    </b-container>
    <b-modal v-model="showModal" @cancel="closeModal" size="lg">
        <b-container fluid>
            <b-row>
                <b-col>
                    <h4>{{ selectedProduct.title }}</h4>
                    <img :alt="selectedProduct.title" :src="selectedProduct.thumbnail"/>
                    <h4>Price : {{ selectedProduct.price }} | Stock: {{ selectedProduct.stock }} | Please insert your cash</h4>
                </b-col>
            </b-row>
            <b-row>
                <b-col v-for="cash in cashes" :key="cash.id">
                    <p>
                        <button class="btn btn-primary" @click="insertCash(cash)">
                            Insert Cash : {{ cash.text }}
                        </button>
                    </p>
                </b-col>
            </b-row>
            <b-row>
                <b-col>
                    <h4>
                        Inserted Cash : {{ insertedCash }}
                    </h4>
                </b-col>
            </b-row>
            <b-row>
                <b-col>
                    <button class="btn btn-primary" @click="purchase" :disabled='isDisabled'>
                            Purchase
                    </button>
                </b-col>
            </b-row>
            <b-row>
                <b-col>
                    <h4> your change : {{ changeAmount }} </h4>
                </b-col>
            </b-row>
        </b-container>
        <div slot="modal-footer" class="w-100">
            <button class="btn btn-dark float-right" @click="closeModal">
                Close
             </button>
        </div>
    </b-modal>
  </div>
</template>

<script src=".\Vendingmachine.js">