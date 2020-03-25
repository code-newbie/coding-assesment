import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import {DetailComponent} from './components/detail/detail.component';
import {HomeComponent} from './components/home/home.component';


const routes: Routes = [
  { path: '', component: HomeComponent },
  { path: 'item/:id', component: DetailComponent },
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
