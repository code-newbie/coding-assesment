import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';

import { ImageDetailPage } from './image-detail';

const routes: Routes = [
	{
		path: '',
		component: ImageDetailPage
	}
];

@NgModule({
	imports: [RouterModule.forChild(routes)],
	exports: [RouterModule]
})
export class ImageDetailPageRoutingModule { }
