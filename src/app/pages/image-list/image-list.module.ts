import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { IonicModule } from '@ionic/angular';

import { ImageListPage } from './image-list';
import { ImageListPageRoutingModule } from './image-list-routing.module';

@NgModule({
	imports: [
		CommonModule,
		IonicModule,
		ImageListPageRoutingModule
	],
	declarations: [ImageListPage],
})
export class ImageListModule { }
