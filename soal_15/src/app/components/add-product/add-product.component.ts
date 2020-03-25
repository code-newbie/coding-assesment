import { Component, OnInit } from '@angular/core';
import {DataService} from '../../services/data.service';
import {Product} from '../../product';
import {FormControl, FormGroup} from "@angular/forms";
import { Location } from '@angular/common';
import {AppComponent} from "../../app.component";

@Component({
  selector: 'app-add-product',
  templateUrl: './add-product.component.html',
  styleUrls: ['./add-product.component.scss']
})
export class AddProductComponent implements OnInit {
  product: Product;
  products: Product[] = [];
  productForm = new FormGroup({
    name: new FormControl(''),
    price: new FormControl(''),
    quantity: new FormControl('')
  });
  dataSource: AppComponent;

  constructor(private dataService: DataService, private location: Location) { }

  ngOnInit(): void {
  }
  addProduct(): void {
    this.dataService.addProduct(this.productForm.value).subscribe(() => this.goBack());
  }
  goBack(): void {
    this.location.back();
  }
}
