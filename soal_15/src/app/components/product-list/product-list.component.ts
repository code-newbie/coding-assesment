import { Component, OnInit } from '@angular/core';
import {Product} from '../../product';
import {Subscription} from 'rxjs';
import {DataService} from '../../services/data.service';
import {MessageService} from '../../services/message.service';

@Component({
  selector: 'app-product-list',
  templateUrl: './product-list.component.html',
  styleUrls: ['./product-list.component.scss']
})
export class ProductListComponent implements OnInit {
  products: Product[] = [];
  displayedColumns: string[] = ['id', 'name', 'price', 'quantity'];
  subscription: Subscription;
  constructor(private dataService: DataService, private messageService: MessageService) {
  }
  ngOnInit() {
    this.getProducts();
  }
  getProducts(): void {
    this.dataService.getProducts()
      .subscribe(data => this.products = data);
  }
}
