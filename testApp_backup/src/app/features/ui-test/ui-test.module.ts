import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { UiTestRoutingModule } from './ui-test-routing.module';
import { UiTestAppComponent } from './ui-test-app/ui-test-app.component';

@NgModule({
  declarations: [UiTestAppComponent],
  imports: [
    CommonModule,
    UiTestRoutingModule
  ]
})
export class UiTestModule { }
