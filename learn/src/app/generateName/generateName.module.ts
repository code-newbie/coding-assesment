import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { GenerateRoutingModule } from './generate-routing.module';
import { GenerateComponent } from './generateContainer/generate.component';
import { FormsModule } from '@angular/forms';
import { UIComponent } from './UI/ui.component';
import { PageComponent } from './page/page.component';

@NgModule({
  declarations: [GenerateComponent, UIComponent, PageComponent],
  imports: [
    CommonModule,
    GenerateRoutingModule,
    FormsModule
  ],
})
export class GenerateNameModule { }
