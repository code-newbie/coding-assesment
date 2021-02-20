<template>
    <section class="gallery">
        <div class="container">
            <div class="row">
                <div class="col-md-4 col-6" v-for="mock in data" :key="mock">
                    <div class="wap">
                        <a data-fancybox="gallery" :href="mock.full" :data-caption="mock.title">
                            <img :src="mock.thumb" :alt="mock.alt">
                        </a>
                        <div class="text">
                            <div class="text-left">
                                <h4>{{ mock.title }}</h4>
                                <h5 class="small">{{ format_date(mock.date) }}</h5>
                            </div>
                            <div>
                                <ion-icon name="star-outline" size="small"></ion-icon>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</template>

<script>
    // import { ApiUrl, client_id } from "@/env.js";
    // import axios from 'axios'

    import moment from 'moment';
    import { api } from "../../mixins/api.js";

    export default {
        name: 'Gallery',
        mixins : [api],
        data(){
            return {
                data : null,
                // mocks : [
                //     {
                //         full : 'https://images.unsplash.com/photo-1613803745799-ba6c10aace85?crop=entropy&cs=srgb&fm=jpg&ixid=MXwyMDg0OTB8MHwxfGFsbHw0fHx8fHx8Mnw&ixlib=rb-1.2.1&q=85',
                //         thumb : 'https://images.unsplash.com/photo-1613803745799-ba6c10aace85?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MXwyMDg0OTB8MHwxfGFsbHw0fHx8fHx8Mnw&ixlib=rb-1.2.1&q=80&w=200"',
                //         title : 'What Can you see?I can see you',
                //         alt : 'man in black crew neck shirt holding magnifying glass',
                //         date : '2021-02-18T23:50:09-05:00',
                //     },
                //     {
                //         full : 'https://images.unsplash.com/photo-1613803745799-ba6c10aace85?crop=entropy&cs=srgb&fm=jpg&ixid=MXwyMDg0OTB8MHwxfGFsbHw0fHx8fHx8Mnw&ixlib=rb-1.2.1&q=85',
                //         thumb : 'https://images.unsplash.com/photo-1613803745799-ba6c10aace85?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MXwyMDg0OTB8MHwxfGFsbHw0fHx8fHx8Mnw&ixlib=rb-1.2.1&q=80&w=200"',
                //         title : 'What Can you see?I can see you',
                //         alt : 'man in black crew neck shirt holding magnifying glass',
                //         date : '2021-02-18T23:50:09-05:00',
                //     },
                //     {
                //         full : 'https://images.unsplash.com/photo-1613803745799-ba6c10aace85?crop=entropy&cs=srgb&fm=jpg&ixid=MXwyMDg0OTB8MHwxfGFsbHw0fHx8fHx8Mnw&ixlib=rb-1.2.1&q=85',
                //         thumb : 'https://images.unsplash.com/photo-1613803745799-ba6c10aace85?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MXwyMDg0OTB8MHwxfGFsbHw0fHx8fHx8Mnw&ixlib=rb-1.2.1&q=80&w=200"',
                //         title : 'What Can you see?I can see you',
                //         alt : 'man in black crew neck shirt holding magnifying glass',
                //         date : '2021-02-18T23:50:09-05:00',
                //     },
                //     {
                //         full : 'https://images.unsplash.com/photo-1613803745799-ba6c10aace85?crop=entropy&cs=srgb&fm=jpg&ixid=MXwyMDg0OTB8MHwxfGFsbHw0fHx8fHx8Mnw&ixlib=rb-1.2.1&q=85',
                //         thumb : 'https://images.unsplash.com/photo-1613803745799-ba6c10aace85?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MXwyMDg0OTB8MHwxfGFsbHw0fHx8fHx8Mnw&ixlib=rb-1.2.1&q=80&w=200"',
                //         title : 'What Can you see?I can see you',
                //         alt : 'man in black crew neck shirt holding magnifying glass',
                //         date : '2021-02-18T23:50:09-05:00',
                //     },
                //     {
                //         full : 'https://images.unsplash.com/photo-1613803745799-ba6c10aace85?crop=entropy&cs=srgb&fm=jpg&ixid=MXwyMDg0OTB8MHwxfGFsbHw0fHx8fHx8Mnw&ixlib=rb-1.2.1&q=85',
                //         thumb : 'https://images.unsplash.com/photo-1613803745799-ba6c10aace85?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MXwyMDg0OTB8MHwxfGFsbHw0fHx8fHx8Mnw&ixlib=rb-1.2.1&q=80&w=200"',
                //         title : 'What Can you see?I can see you',
                //         alt : 'man in black crew neck shirt holding magnifying glass',
                //         date : '2021-02-18T23:50:09-05:00',
                //     },
                //     {
                //         full : 'https://images.unsplash.com/photo-1613803745799-ba6c10aace85?crop=entropy&cs=srgb&fm=jpg&ixid=MXwyMDg0OTB8MHwxfGFsbHw0fHx8fHx8Mnw&ixlib=rb-1.2.1&q=85',
                //         thumb : 'https://images.unsplash.com/photo-1613803745799-ba6c10aace85?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MXwyMDg0OTB8MHwxfGFsbHw0fHx8fHx8Mnw&ixlib=rb-1.2.1&q=80&w=200"',
                //         title : 'What Can you see?I can see you',
                //         alt : 'man in black crew neck shirt holding magnifying glass',
                //         date : '2021-02-18T23:50:09-05:00',
                //     },
                //     {
                //         full : 'https://images.unsplash.com/photo-1613803745799-ba6c10aace85?crop=entropy&cs=srgb&fm=jpg&ixid=MXwyMDg0OTB8MHwxfGFsbHw0fHx8fHx8Mnw&ixlib=rb-1.2.1&q=85',
                //         thumb : 'https://images.unsplash.com/photo-1613803745799-ba6c10aace85?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MXwyMDg0OTB8MHwxfGFsbHw0fHx8fHx8Mnw&ixlib=rb-1.2.1&q=80&w=200"',
                //         title : 'What Can you see?I can see you',
                //         alt : 'man in black crew neck shirt holding magnifying glass',
                //         date : '2021-02-18T23:50:09-05:00',
                //     },
                // ]
            }
        },


        // mounted(){
        //     this.getData('photos');
        // },
        // methods : {
        //     getData(param){
        //         axios
        //         .get(ApiUrl + param + `?client_id=${client_id}`)
        //         .then(response => {
        //             return response.data
        //         })
        //         .then(res => {
        //             console.log(res);
        //             this.data = res
        //         })
        //     },
        // }

        
        async created(){
            let data = await api.methods.getDataAsync('photos');
            this.data = data.map(v => {
                return {
                    full : v.urls.full,
                    thumb : v.urls.thumb,
                    title : (v.description ?? 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Suscipit voluptatibus ducimus accusamus deleniti maxime, reprehenderit repudiandae? Facere beatae similique et, qui vel consequuntur laboriosam ab suscipit, delectus labore asperiores minima.'),
                    alt : v.alt_description,
                    date : v.created_at,
                }
            })
        },
        methods: {
            format_date(value){
                if (value) {
                    // return moment(String(value)).format('YYYYMMDD')
                    return moment(String(value)).format('DD-MMM-YYYY')
                }
            },
        }
    }
</script>

<style lang="scss">
    section.gallery {
        img {
            width: 100%;
            object-fit: cover;
            height: 400px;
        }
        .wap {
            margin-bottom: 30px;
        }
        .text {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color: #4c4c4c;
            padding: 15px;
            color: white;
        }
        h4 {
            display: -webkit-box;
            -webkit-box-orient: vertical;
            -webkit-line-clamp: 2;
            overflow: hidden;
            height: 56px;
        }
    }
</style>
