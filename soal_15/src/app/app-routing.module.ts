import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import {AddProductComponent} from './components/add-product/add-product.component';
import {BuyProductComponent} from "./components/buy-product/buy-product.component";
import {ProductListComponent} from "./components/product-list/product-list.component";


const routes: Routes = [
  { path: '', redirectTo: '/list-product', pathMatch: 'full' },
  { path: 'list-product', component: ProductListComponent },
  { path: 'add-product', component: AddProductComponent },
  { path: 'buy-product', component: BuyProductComponent },
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
