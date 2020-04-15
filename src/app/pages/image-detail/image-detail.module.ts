import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { ImageDetailPage } from './image-detail';
import { ImageDetailPageRoutingModule } from './image-detail-routing.module';
import { IonicModule } from '@ionic/angular';

@NgModule({
	imports: [
		CommonModule,
		IonicModule,
		ImageDetailPageRoutingModule
	],
	declarations: [
		ImageDetailPage,
	]
})
export class ImageDetailModule { }
