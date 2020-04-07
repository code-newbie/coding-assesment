import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { ArrayTestRoutingModule } from './array-test-routing.module';
import { ArrayTestAppComponent } from './array-test-app/array-test-app.component';
import { ReactiveFormsModule, FormsModule } from '@angular/forms';

@NgModule({
  declarations: [ArrayTestAppComponent],
  imports: [
    CommonModule,
    ArrayTestRoutingModule,
    FormsModule,
    ReactiveFormsModule
  ]
})
export class ArrayTestModule { }
