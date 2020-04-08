import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';

const routes: Routes = [
  {
    path: '',
    loadChildren: './features/dashboard/dashboard.module#DashboardModule',
    data: { pageTitle: 'Dashboard' }
  },
  {
    path: 'uiTestApp',
    loadChildren: './features/ui-test/ui-test.module#UiTestModule',
    data: { pageTitle: 'UI Test' },
  },
  {
    path: 'arrayTestApp',
    loadChildren: './features/array-test/array-test.module#ArrayTestModule',
    data: { pageTitle: 'Array Test' }
  },
  {
    path: 'uiTestApp/openImage',
    loadChildren: './features/image-opener/image-opener.module#ImageOpenerModule',
    data: { pageTitle: 'Open Image' }
  }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
