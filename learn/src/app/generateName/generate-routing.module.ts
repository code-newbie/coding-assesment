import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { GenerateComponent } from './generateContainer/generate.component';
import { UIComponent } from './UI/ui.component';
import { PageComponent } from './page/page.component';

const routes: Routes = [
  {
    path: 'soalNomor17',
    component: GenerateComponent
  },
  {
    path: 'soalNomor14',
    component: UIComponent
  },
  {
    path: 'soalNomor14/view',
    component: PageComponent
  },
];


@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class GenerateRoutingModule { }
