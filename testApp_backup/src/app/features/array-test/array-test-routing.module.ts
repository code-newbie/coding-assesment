import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { ArrayTestAppComponent } from './array-test-app/array-test-app.component';

const routes: Routes = [
  {
    path: '',
    component: ArrayTestAppComponent
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class ArrayTestRoutingModule { }
