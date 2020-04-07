import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { DataImageComponent } from './data-image.component';


const routes: Routes = [{
  path: '',
  component: DataImageComponent,
}];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class DataImageRoutingModule { }
