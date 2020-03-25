import { Injectable } from '@angular/core';
import {InMemoryDbService} from 'angular-in-memory-web-api';
import {Product} from '../product';

@Injectable({
  providedIn: 'root'
})
export class ProductService implements InMemoryDbService{
  createDb() {
    const products: Product[] = [
      { id: 1, name: 'Aqua', price: 5000, quantity: 10 },
      { id: 2, name: 'Teh Botol', price: 7000, quantity: 5 },
      { id: 3, name: 'Pocari Sweat', price: 10000, quantity: 8 }
    ];
    return {products};
  }
}
