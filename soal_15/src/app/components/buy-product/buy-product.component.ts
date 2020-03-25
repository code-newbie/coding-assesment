import { Component, OnInit } from '@angular/core';
import {Product} from '../../product';
import {DataService} from '../../services/data.service';
import {FormControl, FormGroup} from '@angular/forms';
import {Location} from '@angular/common';
import {MatSnackBar} from '@angular/material/snack-bar';

@Component({
  selector: 'app-buy-product',
  templateUrl: './buy-product.component.html',
  styleUrls: ['./buy-product.component.scss']
})
export class BuyProductComponent implements OnInit {
  products: Product[] = [];
  product: Product;
  productForm = new FormGroup({
    product: new FormControl(''),
    cash: new FormControl(''),
    amount: new FormControl(''),
    quantity: new FormControl('')
  });
  displayData: boolean;
  idtoUpdate = 1;
  CASH = [2000, 5000, 10000, 20000];
  fetchId = 1;

  constructor(
    private dataService: DataService,
    private location: Location,
    private _snackBar: MatSnackBar) { }
  ngOnInit(): void {
    this.getProducts();
  }
  goBack(): void {
    this.location.back();
  }

  getProducts(): void {
    this.dataService.getProducts()
      .subscribe(data => this.products = data);
  }
  onSelectProduct(selected): void {
    this.fetchId = selected.value;
    this.idtoUpdate = selected.value;
    this.dataService.getProduct(this.idtoUpdate).subscribe(data => {
      this.product = data;
    });
  }
  validateBuyProduct(): void {
    this.dataService.getProduct(this.idtoUpdate).subscribe(data => { this.product = data; });
    const quantity = this.productForm.value.quantity;
    const totalCash = this.productForm.value.cash * this.productForm.value.amount;
    if (quantity > this.product.quantity) {
      console.log('Product Stock Not enough!');
    } else if (quantity <= this.product.quantity) {
      this.product.quantity = this.product.quantity - quantity;
      const totalPrice = quantity * this.product.price;
      const change = totalCash - totalPrice;
      console.log('Please Take Your Change! \n  RP. ' + change);
      this.openSnackBar('Please Take Your Change! \n Rp. ' + change, 'OK');
      this.dataService.updateProduct(this.product).subscribe(() => this.goBack());
    }
  }
  openSnackBar(message: string, action: string) {
    this._snackBar.open(message, action, {
      duration: 2000,
    });
  }
}
