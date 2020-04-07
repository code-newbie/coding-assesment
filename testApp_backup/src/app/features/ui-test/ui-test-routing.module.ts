import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { UiTestAppComponent } from './ui-test-app/ui-test-app.component';

const routes: Routes = [
  {
    path: '',
    component: UiTestAppComponent
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class UiTestRoutingModule { }
