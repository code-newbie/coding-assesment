import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { ImageOpenerRoutingModule } from './image-opener-routing.module';
import { ImageOpenerAppComponent } from './image-opener-app/image-opener-app.component';

@NgModule({
  declarations: [ImageOpenerAppComponent],
  imports: [
    CommonModule,
    ImageOpenerRoutingModule
  ]
})
export class ImageOpenerModule { }
