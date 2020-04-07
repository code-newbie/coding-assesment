import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { ImageOpenerAppComponent } from './image-opener-app/image-opener-app.component';

const routes: Routes = [
  {
    path: '',
    component: ImageOpenerAppComponent
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class ImageOpenerRoutingModule { }
