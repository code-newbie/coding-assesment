import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule, ReactiveFormsModule} from '@angular/forms';
import { DataImageRoutingModule } from './data-image-routing.module';
import { DataImageComponent } from './data-image.component';
// import { ValidatorService } from 'src/app/@core/control-message/validator.service';


@NgModule({
  declarations: [DataImageComponent],
  imports: [
    CommonModule,
    FormsModule,
    ReactiveFormsModule,
    DataImageRoutingModule
  ],
  providers: [
    // ValidatorService
  ],
  exports: [
    DataImageComponent
  ]
})
export class DataImageModule { }
