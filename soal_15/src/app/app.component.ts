import {Component, OnInit} from '@angular/core';
import {Product} from './product';
import {DataService} from './services/data.service';
import {delay, map} from 'rxjs/operators';
import {Subscription} from "rxjs";
import {MessageService} from "./services/message.service";

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss']
})
export class AppComponent implements OnInit {
  title = 'vending';
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
