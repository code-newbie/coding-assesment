import axios from 'axios'
import { ApiUrl, client_id } from "../env.js";

export const api = {
    methods: {
        getData(param){
            axios
            .get(ApiUrl + param + `?client_id=${client_id}`)
            .then(response => {
                console.log('status', response);
                return response.data
            })
            .then(res => {
                return res
            })
        },
        async getDataAsync(req){
            const response = await fetch(ApiUrl + req + `${`?client_id=${client_id}`}`, {
                method: 'GET',
            });
            return await response.json();
        },
    },
}