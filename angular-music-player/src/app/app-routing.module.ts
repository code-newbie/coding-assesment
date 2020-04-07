import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
const routes: Routes = [
  {
    path: 'admKementerianForm',
    loadChildren: './detail/detail.module#DetailModule',
    data: { pageTitle: 'Kementerian' }
  },
  ];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
